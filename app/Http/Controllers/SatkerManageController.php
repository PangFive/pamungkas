<?php

namespace App\Http\Controllers;

use Auth;
use Session;
use Image;
use App\Models\User;
use App\Models\Acces;
use App\Models\Satker;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class SatkerManageController extends Controller
{
    // Show View Satker
    public function viewSatker()
    {
        $id_account = Auth::id();
        $role_account = Auth::user()->role;
        $satker_account = Auth::user()->id_satker;
        $check_access = Acces::where('user', $id_account)->first();

        if($role_account == "superadmin"){
            
            $satkers = Satker::all();
                        
            return view('manage_satker.satker', ['satkers' => $satkers]);  
            
        }elseif($role_account == "admin"){
            $satker = Satker::where('id',$satker_account)->first();

            return view('manage_satker.satker_admin', ['satker' => $satker]);
        }else{
            return back();
        }

    }

    // Show View New Satker
    public function viewNewSatker()
    {
        
        $id_account = Auth::id();
        $check_access = Acces::where('user', $id_account)
        ->first();
        if($check_access->kelola_akun == 1){

        	return view('manage_satker.new_satker');
        }else{
            return back();
        }
    }

    // Create New Satker
    public function createSatker(Request $req)
    {
        $id_account = Auth::id();
        $check_access = Acces::where('user', $id_account)->first();
        $id_account = Auth::id();
        $role_account = Auth::user()->role;
        $satker_account = Auth::user()->id_satker;
        $check_access = Acces::where('user', $id_account)->first();

        if($req->foto != '' && $check_access->kelola_akun == 1 && $role_account=="superadmin"){
           
            $satker = new Satker;
            $satker->nama_satker = $req->nama_satker;
            $satker->kementrian = $req->kementrian;
            $satker->alamat_satker = $req->alamat_satker;
            $satker->email_satker = $req->email_satker;
            $satker->nickname_satker = $req->nickname_satker;

            $foto = $req->file('foto');
            $satker->foto = $foto->getClientOriginalName();
            $foto_resize = Image::make($foto);
            $y = $foto_resize->height();
            $x = $foto_resize->width();
            $size = 800;
            $foto_resize->resize($size, $size*$y/$x)->save(public_path('pictures/'.$foto->getClientOriginalName()));
            
            $satker->save();

            Session::flash('create_success', 'Satker baru berhasil dibuat');

            return redirect('/satker');
        }elseif($req->foto == '' && $check_access->kelola_akun == 1 && $role_account=="superadmin"){

            if($req->nama_foto == '')
                {
                    $satker = new Satker;
                    $satker->nama_satker = $req->nama_satker;
                    $satker->kementrian = $req->kementrian;
                    $satker->alamat_satker = $req->alamat_satker;
                    $satker->email_satker = $req->email_satker;
                    $satker->nickname_satker = $req->nickname_satker;
                    $satker->foto = 'default.jpg';
                    $satker->save();

                    Session::flash('create_success', 'Satker baru berhasil dibuat');

                    return redirect('/satker');
                }else{
                    $satker = new Satker;
                    $satker->nama_satker = $req->nama_satker;
                    $satker->kementrian = $req->kementrian;
                    $satker->alamat_satker = $req->alamat_satker;
                    $satker->nickname_satker = $req->nickname_satker;
                    $satker->email_satker = $req->email_satker;
                    $satker->save();

                    Session::flash('create_success', 'Satker baru berhasil dibuat');

                    return redirect('/satker');
                }

        }else{
            return back();
        }
    }

    // Edit Satker
    public function editSatker($id)
    {
        $id_account = Auth::id();
        $role_account = Auth::user()->role;
        $satker_account = Auth::user()->id_satker;
        $check_access = Acces::where('user', $id_account)->first();

        if($check_access->kelola_akun == 1 && $role_account == "superadmin"){
            $satker = Satker::find($id);
            return response()->json(['satker' => $satker]);
        }else{
            return back();
        }
    }

    // Update Satker
    public function updateSatker(Request $req)
    {
        $id_account = Auth::id();
        $check_access = Acces::where('user', $id_account)->first();
        $id_account = Auth::id();
        $role_account = Auth::user()->role;
        $satker_account = Auth::user()->id_satker;
        $check_access = Acces::where('user', $id_account)->first();

        if($req->foto != '' && $check_access->kelola_akun == 1 && ($role_account == "superadmin" || $role_account=="admin")){
           
            $satker = Satker::find($req->id);
            $satker->nama_satker = $req->nama_satker;
            $satker->kementrian = $req->kementrian;
            $satker->alamat_satker = $req->alamat_satker;
            $satker->email_satker = $req->email_satker;
            $satker->nickname_satker = $req->nickname_satker;

            $foto = $req->file('foto');
            $satker->foto = $foto->getClientOriginalName();
            $foto_resize = Image::make($foto);
            $y = $foto_resize->height();
            $x = $foto_resize->width();
            $size = 800;
            $foto_resize->resize($size, $size*$y/$x)->save(public_path('pictures/'.$foto->getClientOriginalName()));
            
            $satker->save();

            Session::flash('update_success', 'Satker berhasil diubah');

            return redirect('/satker');
        }elseif($req->foto == '' && $check_access->kelola_akun == 1 && ($role_account == "superadmin" || $role_account=="admin")){

            if($req->nama_foto == 'default.jpg')
                {
                    $satker = Satker::find($req->id);
                    $satker->nama_satker = $req->nama_satker;
                    $satker->kementrian = $req->kementrian;
                    $satker->alamat_satker = $req->alamat_satker;
                    $satker->email_satker = $req->email_satker;
                    $satker->nickname_satker = $req->nickname_satker;
                    $satker->foto = $req->nama_foto;
                    $satker->save();

                    Session::flash('update_success', 'Satker berhasil diubah');

                    return redirect('/satker');
                }else{
                    $satker = Satker::find($req->id);
                    $satker->nama_satker = $req->nama_satker;
                    $satker->kementrian = $req->kementrian;
                    $satker->alamat_satker = $req->alamat_satker;
                    $satker->email_satker = $req->email_satker;
                    $satker->nickname_satker = $req->nickname_satker;
                    $satker->save();

                    Session::flash('update_success', 'Satker berhasil diubah');

                    return redirect('/satker');
                }

        }else{
            return back();
        }
    }

    // Delete Satker
    public function deleteSatker($id)
    {
        $id_account = Auth::id();
        $check_access = Acces::where('user', $id_account)
        ->first();
        if($check_access->kelola_akun == 1){
            Satker::destroy($id);

            Session::flash('delete_success', 'Satker berhasil dihapus');

            return back();
        }else{
            return back();
        }

    }
}
