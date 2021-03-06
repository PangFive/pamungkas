<?php

namespace App\Http\Controllers;

use Session;
use Carbon\Carbon;
use App\Models\Program;
use App\Models\Sasaran;
use App\Models\IkkTarget;
use Illuminate\Http\Request;
use App\Models\JawabanOutput;
use App\Models\JawabanSasaran;
use App\Models\RealisasiOutput;

class TujuanController extends Controller
{
    public function viewPencapaian()
    {
        $user_login = auth()->user()->id;
        $user_satker = auth()->user()->id_satker;
        $tahun_now = date('Y')-1;

        $data = Sasaran::where('tahun',$tahun_now)->where('satker_id',$user_satker)->with('ikkTarget')->get();
        $sasaran_program = Program::all();

        return view('pencapaian_tujuan.pencapaian', compact('data','sasaran_program'));
        // return $data;
        
    }

    public function penilaianPencapaian()
    {

        $user_login = auth()->user()->id;
        $user_satker = auth()->user()->id_satker;
        $tahun_now = date('Y')-1;

        $data = Sasaran::where('tahun',$tahun_now)->where('satker_id',$user_satker)->with(['ikkTarget' => function($q){
            $q->with('realisasiIkkTarget')->withCount('realisasiIkkTarget');}])->get();
        

        return view('pencapaian_tujuan.penilaian', compact('data'));
        // return $data;
    }

    public function addSasaran(Request $req)
    {

        $user_login = auth()->user()->id;
        $user_satker = auth()->user()->id_satker;
        $tahun_now = date('Y')-1;

        $sasaran = new Sasaran;
        $sasaran->tahun = $tahun_now;
        $sasaran->satker_id = $user_satker;
        $sasaran->users_id = $user_login;
        $sasaran->sasaran_program_id = $req->sasaran_program;
        $sasaran->sasaran = $req->sasaran;
        $sasaran->save();

       if(!empty($sasaran->id)){
        $ikk = new IkkTarget;
        $ikk->tahun = $tahun_now;
        $ikk->satker_id = $user_satker;
        $ikk->users_id = $user_login;
        $ikk->sasaran_id = $sasaran->id;
        $ikk->ikk = $req->ikk;
        $ikk->target = $req->target;
        $ikk->satuan = $req->satuan;
        $ikk->save();
       }

       Session::flash('berhasil_input', 'Sasaran dan IKK berhasil disimpan');

       return redirect(route('pencapaian'));
    }

    public function addOutput(Request $req)
    {
        $user_login = auth()->user()->id;
        $user_satker = auth()->user()->id_satker;
        $tahun_now = date('Y')-1;

       if(!empty($req->sasaran_id)){
        $ikk = new IkkTarget;
        $ikk->tahun = $tahun_now;
        $ikk->satker_id = $user_satker;
        $ikk->users_id = $user_login;
        $ikk->sasaran_id = $req->sasaran_id;
        $ikk->ikk = $req->ikk;
        $ikk->target = $req->target;
        $ikk->satuan = $req->satuan;
        $ikk->save();
       }

       Session::flash('berhasil_input', 'IKK dan Target Output berhasil ditambahkan');

       return back();

    }


    public function addRealisasi(Request $req)
    {
        $user_login = auth()->user()->id;
        $user_satker = auth()->user()->id_satker;
        $tahun_now = date('Y')-1;

        $cek_realisasi = RealisasiOutput::where('ikk_target_id',$req->add_output_id)->count();
    
        if($cek_realisasi == 0){

            if(!empty($req->realisasi)){
                $ikk = new RealisasiOutput;
                $ikk->tahun = $tahun_now;
                $ikk->satker_id = $user_satker;
                $ikk->users_id = $user_login;
                $ikk->ikk_target_id = $req->add_output_id;
                $ikk->realisasi = $req->realisasi;
                $ikk->save();
                
                Session::flash('berhasil_input', 'IKK dan Target Output berhasil ditambahkan');
            }else{
                Session::flash('gagal_input', 'Anda tidak menginputkan realisasi');
            }  
        }else{
            Session::flash('gagal_input', 'Anda telah menginput realisasi');
        }

       return back();

    }

    public function getSasaran($sasaran_id)
    {
        
        $data = Sasaran::find($sasaran_id);

        return response()->json(['data' => $data]);
       
    }

    public function getSasaranPenilaian($sasaran_id)
    {
        
        $data = IkkTarget::where('id',$sasaran_id)->with('sasaran')->first();

        return response()->json(['data' => $data]);
       
    }

    public function editSasaran(Request $req)
    {
        $sasaran = Sasaran::find($req->edit_sasaran_id);
        $sasaran->sasaran = $req->edit_sasaran;
        $sasaran->save();

        Session::flash('berhasil_input', 'Sasaran berhasil diubah');
        return back();
    }

    public function getOutput($id)
    {
        $data = IkkTarget::where('id',$id)->with('sasaran')->first();
                
        return response()->json(['data' => $data]);
       
    }

    public function getOutputPenilaian($id)
    {
        $data = IkkTarget::where('id',$id)->with('sasaran')->with('realisasiIkkTarget')->first();
                
        return response()->json(['data' => $data]);
       
    }

    public function editOutput(Request $req)
    {
        $ikk = IkkTarget::find($req->edit_id);
        $ikk->ikk = $req->edit_ikk;
        $ikk->target = $req->edit_target;
        $ikk->satuan = $req->edit_satuan;
        $ikk->save();

        Session::flash('berhasil_input', 'Ikk dan Target berhasil diubah');
        return back();
    }

    public function editOutputRealisasi(Request $req)
    {
        $ikk = RealisasiOutput::find($req->edit_id);
        $ikk->realisasi = $req->edit_realisasi;
        $ikk->save();

        Session::flash('berhasil_input', 'Realisasi berhasil diubah');
        return back();
    }

    public function deleteOutput(Request $id)
    {
        $user_login = auth()->user()->id;
        $user_satker = auth()->user()->id_satker;
        $tahun_now = date('Y')-1;

        $ids = $id->ids;
        IkkTarget::destroy($ids);

        $data = Sasaran::where('tahun',$tahun_now)->where('satker_id',$user_satker)->with('ikkTarget')->get();

        return response()->view('penetapan_tujuan.table', compact('data'))->setStatusCode(200);
    }

    public function deleteSasaran(Request $id)
    {
        $user_login = auth()->user()->id;
        $user_satker = auth()->user()->id_satker;
        $tahun_now = date('Y')-1;

        $ids = $id->ids;

        Sasaran::destroy($ids);

        $data = Sasaran::where('tahun',$tahun_now)->where('satker_id',$user_satker)->with('ikkTarget')->get();

        return response()->view('penetapan_tujuan.table', compact('data'))->setStatusCode(200);
    }

    public function penilaianCreate(Request $req)
    {
        $user_login = auth()->user()->id;
        $user_satker = auth()->user()->id_satker;
        $tahun_now = date('Y')-1;

        
        foreach($req->sasaran_id as $sasaran)
        {

            $cek_sasaran = JawabanSasaran::where('sasaran_id',$sasaran)->count();

            if($cek_sasaran == 0){
                $j_sasaran = new JawabanSasaran();
                $j_sasaran->tahun = $tahun_now;
                $j_sasaran->satker_id = $user_satker;
                $j_sasaran->users_id = $user_login;
                $j_sasaran->sasaran_id = $sasaran;
            }else{
                $j_sasaran = JawabanSasaran::where('sasaran_id',$sasaran)->first();
            }

            
            $j_sasaran->j_sasaran_t = $req->jawaban_sasaran_t[$sasaran];
            $j_sasaran->j_sasaran_b = $req->jawaban_sasaran_b[$sasaran];
        
            
            if($req->jawaban_sasaran_t[$sasaran] <> "" && $req->jawaban_sasaran_b[$sasaran] <> ""){
                $j_sasaran->save();
            }

            foreach($req->output_id as $output)
            {
                if($req->sasaran_id_output[$output] == $sasaran)
                {

                    $cek_output = JawabanOutput::where('ikk_target_id',$output)->count();

                    if($cek_output == 0){
                        $j_output = new JawabanOutput();
                        $j_output->tahun = $tahun_now;
                        $j_output->satker_id = $user_satker;
                        $j_output->users_id = $user_login;
                        $j_output->sasaran_id = $req->sasaran_id_output[$output];
                        $j_output->ikk_target_id = $output;
                        $j_output->j_sasaran_id = $j_sasaran->id;
                    }else{
                        $j_output = JawabanOutput::where('ikk_target_id',$output)->first();
                    }

                    $j_output->j_ikk = $req->jawaban_ikk[$output];
                    $j_output->j_target = $req->jawaban_target[$output];

                    if($req->jawaban_ikk[$output] <> "" && $req->jawaban_target[$output] <> ""){
                        $j_output->save();
                    }

                }
                
            }
        }

        if($j_output->id){
            Session::flash('berhasil_input', 'Penilaian penetapan tujuan berhasil disimpan');
        }
        
        return back();
    }
}
