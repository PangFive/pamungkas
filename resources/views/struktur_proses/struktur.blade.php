@extends('templates/main')
@section('css')
<link rel="stylesheet" href="{{ asset('css/dashboard/style.css') }}">
<link rel="stylesheet" href="{{ asset('assets/vendors/iconfonts/font-awesome/css/font-awesome.min.css') }}">
@endsection
@section('active')
    active
@endsection
@section('page-title')
    Struktur dan Proses
@endsection
@section('content')
<div class="row page-title-header">
    <div class="col-12">
        <ul class="nav nav-custom nav-justified mb-2 justify-content-center">
            <li class="nav-item">
                <a href="{{ url('/struktur') }}" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2 active"> 
                    <span class="d-none d-sm-inline">Responden</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="{{ url('/struktur/kuesioner') }}" class="nav-link rounded-0 pt-2 pb-2">
                    <span class="d-none d-sm-inline">Penilaian</span>
                </a>
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="row page-title-header">
        <div class="col-12">
            <button class="btn-custom ml-3" data-toggle="modal" data-target="#tambahResponden">
              + Responden
            </button>
        </div>
    </div>
    @if (auth()->user()->role == 'superadmin' || auth()->user()->role == 'admin')
    <div class="row modal-group">
        <div class="modal fade" id="tambahResponden" tabindex="-1" role="dialog" aria-labelledby="tambahRespondenLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <form name="tambah_responden" action="{{ url('/struktur/responden/add') }}" method="POST">
                @csrf
                <div class="modal-header">
                  <h5 class="modal-title" id="tambahRespondenLabel">Tambah Responden</h5>
                  <button type="button" class="close close-btn" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <div class="form-group row">
                    <div class="col-12">
                        <div class="form-group">
                            <label>Nama Responden</label>
                            <select class="form-control form-control-lg" name="user">
                              <option value="">-- Pilih Responden --</option>
                              @foreach ($users as $user)
                                <option value="{{$user->id}}">{{$user->nama}}</option>
                              @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Jenis Kuesioner</label>
                            <select class="form-control form-control-lg" name="kuesioner">
                              <option value="">-- Pilih Kuesioner --</option>
                              @foreach ($tipe_kuesioner as $kuesioner)
                                <option value="{{$kuesioner->id}}">{{$kuesioner->tipe_kuesioner}} - {{$kuesioner->uraian_tipe_kuesioner}}</option>
                              @endforeach
                            </select>
                        </div>
                        @if (auth()->user()->role == 'superadmin')
                        <div class="form-group">
                            <label>Satker</label>
                            <select class="form-control form-control-lg" name="satker">
                              <option value="">-- Pilih Satker --</option>
                              @foreach ($satkers as $satker)
                                <option value="{{$satker->id}}">{{$satker->nama_satker}}</option>
                              @endforeach
                            </select>
                        </div>
                        @endif

                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" class="btn btn-simpan"><i class="mdi mdi-content-save"></i> Simpan</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    @endif
    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card b-radius card-noborder">
        <div class="card-body">
            <div class="row">
                <table class="table table-striped">
                    <thead class="head-table">
                      <tr>
                        <th> No </th>
                        <th> User </th>
                        <th> Nama </th>
                        <th> Email </th>
                        <th> Jenis Kuesioner </th>
                        <th> </th>
                      </tr>
                    </thead>
                    <tbody>
                      @foreach ($respondens as $key => $responden)
                      <tr>
                        <td width="8%"> {{$respondens->firstItem() + $key}} </td>
                        <td class="py-1" width="8%">
                          <img src="{{ asset('pictures/' . $responden->user->foto) }}" alt="image">
                        </td>
                        <td width="25%" style="white-space: normal;">{{$responden->user->nama}}</td>
                        <td width="16%" style="white-space: normal;">
                          {{$responden->user->email}}
                        </td>
                        <td width="41%">
                          <div class="row">
                            <p class="col-1 m-0">{{$responden->kuesioner->tipe_kuesioner}} - </p>
                            <p class="col-11 m-0" style="white-space: normal;">{{$responden->kuesioner->uraian_tipe_kuesioner}}</p>
                          </div>
                        </td>
                        <td width="1%">
                          <button type="button" class="btn-delete btn btn-secondary pl-2 pr-2" data-token="{{ csrf_token() }}" data-delete="{{ $responden->id }}">
                            <strong><span aria-hidden="true">&times;</span></strong>
                          </button>
                        </td>
                      </tr>
                      @endforeach
                      
                    </tbody>
                  </table>
            </div>
            
        </div>
        </div>
    </div>
    
    <div class="d-flex col-12 justify-content-between" style="margin-top: 1.7em">
      <div>
        {{ $respondens->links('vendor.pagination.simple-bootstrap-4') }}
      </div>
      <div>
      <a href="{{ url('/struktur/kuesioner') }}" type="button" class="btn btn-filter-custom" style="margin-right: 0.8em">Penilaian <i class="fa fa-chevron-right"></i></a>
      </div>
    </div>
</div>



@endsection


@section('script')
<script src="{{ asset('js/dashboard/script.js') }}"></script>
<script src="{{ asset('plugins/js/Chart.min.js') }}"></script>
<script src="{{ asset('plugins/js/ChartRadius.js') }}"></script>
<script type="text/javascript">

@if ($message = Session::get('add_responden_success'))
  swal(
      "Berhasil!",
      "{{ $message }}",
      "success"
  );
@endif

@if ($message = Session::get('add_responden_exist'))
  swal(
      "Gagal!",
      "{{ $message }}",
      "error"
  );
@endif

@if ($message = Session::get('add_responden_kosong'))
  swal(
      "Gagal!",
      "{{ $message }}",
      "error"
  );
@endif

@if ($message = Session::get('add_responden_no_access'))
  swal(
      "Gagal!",
      "{{ $message }}",
      "error"
  );
@endif

@if (auth()->user()->role == 'superadmin' || auth()->user()->role == 'admin')
  
// delete responden
$(document).on('click', '.btn-delete', function(e){
  e.preventDefault();
  var data_delete = $(this).attr('data-delete');
  var data_token = $(this).attr('data-token');
  swal({
    title: "Apa Anda Yakin?",
    text: "Respon den akan terhapus, klik oke untuk melanjutkan",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  })
  .then((willDelete) => {
    if (willDelete) {
      
      $.ajax({
        url:'{{ route("struktur.deleteresponden") }}',
        type:'DELETE',
        data:{
          ids:data_delete,
          _token:data_token
        },
        success:function(data){
          swal(
            {
              title: "Berhasil",
              text: "IKK dan Target berhasil dihapus",
              icon: "success",
            }).then(
              $('tbody').html(data)
            )
        }
      })
    }
  });
});
@endif

</script>
@endsection