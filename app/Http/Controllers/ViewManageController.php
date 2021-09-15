<?php

namespace App\Http\Controllers;

use Session;
use Carbon\Carbon;
use App\Models\Market;
use App\Models\Sasaran;
use App\Models\IkkTarget;
use App\Models\Transaction;
use Illuminate\Http\Request;
use App\Models\JawabanOutput;
use App\Models\JawabanSasaran;
use App\Models\Mapping_responden;
use App\Models\RealisasiOutput;
use App\Models\JawabanStrukturProses;
use App\Models\Satker;
use App\Models\User;

class ViewManageController extends Controller
{
    // Show View Dashboard
    public function viewDashboard()
    {
    	$kd_transaction = Transaction::select('kode_transaksi')
    	->latest()
    	->take(5)
    	->get();
        $transactions = Transaction::all();
        $array = array();
        foreach ($transactions as $no => $transaction) {
            array_push($array, $transactions[$no]->created_at->toDateString());
        }
        $dates = array_unique($array);
        rsort($dates);

        $arr_ammount = count($dates);
        $incomes_data = array();
        if($arr_ammount > 7){
            for ($i = 0; $i < 7; $i++) {
                array_push($incomes_data, $dates[$i]);
            }
        }elseif($arr_ammount > 0){
            for ($i = 0; $i < $arr_ammount; $i++) {
                array_push($incomes_data, $dates[$i]);
            }
        }
        $incomes = array_reverse($incomes_data);
        $kode_transaksi_dis = Transaction::select('kode_transaksi')
        ->distinct()
        ->get();
        $kode_transaksi_dis_daily = Transaction::whereDate('created_at', Carbon::now())
        ->select('kode_transaksi')
        ->distinct()
        ->get();
        $all_incomes = 0;
        $incomes_daily = 0;
        foreach ($kode_transaksi_dis as $kode) {
            $transaksi = Transaction::where('kode_transaksi', $kode->kode_transaksi)->first();
            $all_incomes += $transaksi->total;
        }
        foreach ($kode_transaksi_dis_daily as $kode) {
            $transaksi_daily = Transaction::where('kode_transaksi', $kode->kode_transaksi)->first();
            $incomes_daily += $transaksi_daily->total;
        }
        $customers_daily = count($kode_transaksi_dis_daily);
        $min_date = Transaction::min('created_at');
        $max_date = Transaction::max('created_at');
        $market = Market::first();

        $role_login = auth()->user()->role;
        $user_login = auth()->user()->id;
        $user_satker = auth()->user()->id_satker;
        $tahun_now = date('Y');
        $tahun_lalu = date('Y')-1;

        //jumlah satker
        $jumlahsatker = Satker::select('id')->count();
        $satkers = Satker::get();

        //status struktur & proses
        $responden = Mapping_responden::all('satker_id','kuesioner_id');
        $jawabanSP = JawabanStrukturProses::all('satker_id','jawaban');


        $data_sasaran = Sasaran::where('tahun',$tahun_now)->where('satker_id',$user_satker)->get();
        $data_sasaran_t = JawabanSasaran::where('tahun',$tahun_now)->where('satker_id',$user_satker)->whereNotNull('j_sasaran_t')->get();
        $data_sasaran_b = JawabanSasaran::where('tahun',$tahun_now)->where('satker_id',$user_satker)->whereNotNull('j_sasaran_b')->get();
        $data_sasaran_n = JawabanSasaran::where('tahun',$tahun_now)->where('satker_id',$user_satker)->whereNotNull('j_sasaran_t')->WhereNotNull('j_sasaran_b')->get();
        $data_ikk_target = IkkTarget::where('tahun',$tahun_now)->where('satker_id',$user_satker)->get();
        $data_ikk_target_j_ikk = JawabanOutput::where('tahun',$tahun_now)->where('satker_id',$user_satker)->whereNotNull('j_ikk')->get();
        $data_ikk_target_j_target = JawabanOutput::where('tahun',$tahun_now)->where('satker_id',$user_satker)->whereNotNull('j_target')->get();

        $data_ikk_target_lalu = IkkTarget::where('tahun',$tahun_lalu)->where('satker_id',$user_satker)->get();
        $data_ikk_target_realisasi = RealisasiOutput::where('tahun',$tahun_lalu)->where('satker_id',$user_satker)->whereNotNull('realisasi')->get();

        $sasaran = count($data_sasaran);
        $sasaran_t = count($data_sasaran_t);
        $sasaran_b = count($data_sasaran_b);
        $sasaran_n = count($data_sasaran_n);
        $ikk_target = count($data_ikk_target);
        $ikk_target_j_ikk = count($data_ikk_target_j_ikk);
        $ikk_target_j_target = count($data_ikk_target_j_target);

        $ikk_target_lalu = count($data_ikk_target_lalu);
        $ikk_target_realisasi = count($data_ikk_target_realisasi);

        $penetapan = round(($sasaran_t+$sasaran_b+$ikk_target_j_ikk+$ikk_target_j_target)/($sasaran*2+$ikk_target*2)*100,0);
        $penilaian = round($ikk_target_realisasi/$ikk_target_lalu*100);

        // Atensi
        $a_sasaran = $sasaran-$sasaran_n;
        $a_ikk = $ikk_target-$ikk_target_j_ikk;
        $a_target = $ikk_target-$ikk_target_j_target;

        // Struktur Proses

        $level_capaian = function ($q) use($tahun_now,$user_satker){
            return JawabanStrukturProses::where('tahun',$tahun_now)->where('satker_id',$user_satker)->where('unsur_id',$q)->select('jawaban')->get();
        };

        $s_p_1 = round($level_capaian(1)->avg('jawaban'),2);
        $s_p_2 = round($level_capaian(2)->avg('jawaban'),2);
        $s_p_3 = round($level_capaian(3)->avg('jawaban'),2);
        $s_p_4 = round($level_capaian(4)->avg('jawaban'),2);
        $s_p_5 = round($level_capaian(5)->avg('jawaban'),2);

        $user= User::where('id_satker',$user_satker)->with(['mappings' => function($q){
            $q->withCount('jawaban');
        }])->get();

        $responden_belum_isi = [];
        foreach ($user as $jawaban){
            if($jawaban->mappings != '[]'){
                $data = function() use($jawaban){
                  foreach ($jawaban->mappings as $mapping){
                        $hasil[]=$mapping->jawaban_count;
                    }
                    return $hasil;
                };

                if (in_array(0,$data())){
                    $responden_belum_isi[]=1;
                }

                $total_responden[]=['pengisian' => $data()];
            }
        }

        $res_belum = count($responden_belum_isi);

        if($role_login=="superadmin"){
            return view('dashboard', compact('kd_transaction', 'incomes', 'incomes_daily', 'customers_daily', 'all_incomes', 'min_date', 'max_date', 'market','jumlahsatker','satkers','responden','responden_t4','jawabanSP'));
        }else{
            return view('dashboard_satker',compact('tahun_now','penetapan','penilaian', 'a_sasaran','a_ikk','a_target','s_p_1','s_p_2','s_p_3','s_p_4','s_p_5','res_belum'));
            // return count($responden_belum_isi);
        }

    }

    // Filter Chart Dashboard
    public function filterChartDashboard($filter)
    {
        if($filter == 'pemasukan'){
            $supplies = Transaction::all();
            $array = array();
            foreach ($supplies as $no => $supply) {
                array_push($array, $supplies[$no]->created_at->toDateString());
            }
            $dates = array_unique($array);
            rsort($dates);
            $arr_ammount = count($dates);
            $incomes_data = array();
            if($arr_ammount > 7){
                for ($i = 0; $i < 7; $i++) {
                    array_push($incomes_data, $dates[$i]);
                }
            }elseif($arr_ammount > 0){
                for ($i = 0; $i < $arr_ammount; $i++) {
                    array_push($incomes_data, $dates[$i]);
                }
            }
            $incomes = array_reverse($incomes_data);
            $total = array();
            foreach ($incomes as $no => $income) {
                array_push($total, Transaction::whereDate('created_at', $income)->sum('total'));
            }

            return response()->json([
                'incomes' => $incomes,
                'total' => $total
            ]);
        }else{
            $supplies = Transaction::all();
            $array = array();
            foreach ($supplies as $no => $supply) {
                array_push($array, $supplies[$no]->created_at->toDateString());
            }
            $dates = array_unique($array);
            rsort($dates);
            $arr_ammount = count($dates);
            $customer_data = array();
            if($arr_ammount > 7){
                for ($i = 0; $i < 7; $i++) {
                    array_push($customer_data, $dates[$i]);
                }
            }elseif($arr_ammount > 0){
                for ($i = 0; $i < $arr_ammount; $i++) {
                    array_push($customer_data, $dates[$i]);
                }
            }
            $customers = array_reverse($customer_data);
            $jumlah = array();
            foreach ($customers as $no => $customer) {
                array_push($jumlah, Transaction::whereDate('created_at', $customer)->count());
            }

            return response()->json([
                'customers' => $customers,
                'jumlah' => $jumlah
            ]);
        }
    }

    // Update Market
    public function updateMarket(Request $req)
    {
        $market = Market::first();
        $market->nama_toko = $req->nama_toko;
        $market->no_telp = $req->no_telp;
        $market->alamat = $req->alamat;
        $market->save();

        Session::flash('update_success', 'Pengaturan berhasil diubah');

        return back();
    }
}
