<?php

namespace App\Http\Controllers;

use App\Models\JawabanStrukturProses;
use App\Models\Mapping_responden;
use App\Models\RefFormSKriteria;
use App\Models\RefFormSUnsur;
use App\Models\Satker;
use App\Models\User;
use App\Models\Tipe_kuesioner;
use Session;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Symfony\Component\VarDumper\Cloner\Data;

class StrukturProsesController extends Controller
{
    public function viewStruktur()
    {
        $satker_login = auth()->user()->id_satker;
        $role_login = auth()->user()->role;
        $id_login = auth()->user()->id;
        $satkers = Satker::all();
        $tipe_kuesioner = Tipe_kuesioner::all();
        
        if($role_login=="superadmin"){
            $users = User::where('role','responden')->orderBy('nama', 'asc')->get();
            $responden = Mapping_responden::with('user','kuesioner')->orderBy('users_id','asc')->orderBy('kuesioner_id','asc')->simplePaginate(10);
        }
        elseif($role_login=="admin"){
            $users = User::where('role','responden')->where('id_satker',$satker_login)->orderBy('nama', 'asc')->get();
            $responden = Mapping_responden::where('satker_id',$satker_login)->with('user','kuesioner')->orderBy('users_id','asc')->orderBy('kuesioner_id','asc')->simplePaginate(10);
        }else{
            $users = User::where('role','responden')->where('id_satker',$satker_login)->orderBy('nama', 'asc')->get();
            $responden = Mapping_responden::where('satker_id',$satker_login)->where('users_id',$id_login)->with('user','kuesioner')->orderBy('users_id','asc')->orderBy('kuesioner_id','asc')->simplePaginate(10);
        }

 
        return view('struktur_proses.struktur',['users'=>$users,'tipe_kuesioner'=>$tipe_kuesioner, 'respondens'=>$responden, 'satkers' => $satkers]);
    }

    public function tambahResponden(Request $req)
    {
        $users_id = $req->user;
        $kuesioner_id = $req->kuesioner;
        $cek_mapping = Mapping_responden::where('users_id',$users_id)->where('kuesioner_id',$kuesioner_id)->count();
        $tahun_now = date('Y');

        $role_login = auth()->user()->role;
        $satker_login = auth()->user()->id_satker;

        if($role_login=='superadmin'){
            $satker = $req->satker;
        } else {
            $satker = $satker_login;
        }

        if($role_login=='superadmin' || $role_login=='admin')
        {
            if($req->user == '' || $req->kuesioner == '')
            {
                Session::flash('add_responden_kosong', 'Responden dan kuesioner tidak boleh kosong');
            } 
            elseif ($cek_mapping == 0) {
                
                $responden = new Mapping_responden;
                $responden->users_id = $req->user;
                $responden->kuesioner_id = $req->kuesioner;
                $responden->satker_id = $satker;
                $responden->tahun = $tahun_now;
                $responden->save();

                Session::flash('add_responden_success', 'Responden berhasil ditambahkan');
            }
            else {
                Session::flash('add_responden_exist', 'Responden sudah pernah diberi akses kuesioner');
            }
        } else {
            Session::flash('add_responden_no_access', 'Anda tidak memiliki akses untuk menambahkan responden');
        }

        return redirect('/struktur');
    }

    public function deleteResponden(Request $id)
    {
   
        $satker_login = auth()->user()->id_satker;
        $role_login = auth()->user()->role;
        $id_login = auth()->user()->id;
        
        $ids = $id->ids;
        if($role_login == "superadmin" || $role_login == "admin"){
            Mapping_responden::destroy($ids);
        }

        if($role_login=="superadmin"){
            
            $responden = Mapping_responden::with('user','kuesioner')->orderBy('users_id','asc')->orderBy('kuesioner_id','asc')->simplePaginate(10);
        }
        elseif($role_login=="admin"){
            
            $responden = Mapping_responden::where('satker_id',$satker_login)->with('user','kuesioner')->orderBy('users_id','asc')->orderBy('kuesioner_id','asc')->simplePaginate(10);
        }else{
            
            $responden = Mapping_responden::where('satker_id',$satker_login)->where('users_id',$id_login)->with('user','kuesioner')->orderBy('users_id','asc')->orderBy('kuesioner_id','asc')->simplePaginate(10);
        }

        return response()->view('struktur_proses.table_struktur',['respondens'=>$responden])->setStatusCode(200);

    }

    public function viewPenilaian()
    {
        $user_login = auth()->user()->id;
        $kuesioner = Mapping_responden::with('kuesioner')->withCount('jawaban')->where('users_id',$user_login)->orderBy('kuesioner_id','asc')->get();

        return view('struktur_proses.penilaian',['mappings'=>$kuesioner]);
        // return $kuesioner;
        
    }

    public function formKuesioner($id_mapping,$tipe_kuesioner)
    {
        $user_login = auth()->user()->id;
        $cek_dis = Mapping_responden::where('id',$id_mapping)->where('kuesioner_id',$tipe_kuesioner)->where('users_id',$user_login)->count();
        $row_tipe = 't'.$tipe_kuesioner;
        $cek_inputan = JawabanStrukturProses::where('mapping_id',$id_mapping)->where('tipe_kuesioner',$row_tipe)->count();
        $cek_form_ref = RefFormSKriteria::where($row_tipe,1)->count();
        if (($cek_inputan-$cek_form_ref)==0){
            Session::flash('exist_input', 'Anda telah menginput kuesioner T'.$tipe_kuesioner);
            
            return redirect('/struktur/kuesioner');
        }

        if ($cek_dis){
            $tipe = 1;
            
            $mapping_id = $id_mapping;

            $form_data = RefFormSUnsur::with(['subUnsur' => function ($q) use($tipe, $row_tipe) { 
                $q->with(['parameter' => function ($q) use($tipe, $row_tipe) { 
                    $q->where($row_tipe,$tipe)->with('kriteria');}]);
                }])->get();
            return view('struktur_proses.kuesioner',['form_data'=>$form_data,'tipe'=>$row_tipe,'mapping_id'=>$mapping_id]);
            // return $form_data;
        } else {
            Session::flash('no_access', 'Anda tidak memiliki akses untuk ini');
            
            return redirect('/struktur/kuesioner');
        }

    }
    public function createKuesioner(Request $req)
    {
        $user_login = auth()->user()->id;
        $user_satker = auth()->user()->id_satker;
        $tahun_now = date('Y');
      
        foreach($req->kriteria_id as $kriteria) {
            $jawaban = new JawabanStrukturProses();
            $jawaban->tahun = $tahun_now;
            $jawaban->satker_id = $user_satker;
            $jawaban->users_id = $user_login;
            $jawaban->unsur_id = $req->unsur_id[$kriteria];
            $jawaban->sub_unsur_id = $req->sub_unsur_id[$kriteria];
            $jawaban->parameter_id = $req->parameter_id[$kriteria];
            $jawaban->kriteria_id = $req->kriteria_id[$kriteria];
            $jawaban->jawaban = $req->jawaban[$kriteria];
            $jawaban->mapping_id = $req->mapping_id[$kriteria];
            $jawaban->tipe_kuesioner = $req->tipe_kuesioner[$kriteria];
        
            if(!empty($req->jawaban[$kriteria])){
                $jawaban->save();
            }
           
        }

        Session::flash('berhasil_input', 'Keusioner berhasil disimpan');
        
        return redirect('/struktur/kuesioner');


    }

}
