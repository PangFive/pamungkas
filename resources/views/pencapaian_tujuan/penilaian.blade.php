@extends('templates/main')
@section('css')
<style type="text/css">
  .hide-border-top{
    border-top: rgba(255, 255, 255, 0) !important;
}
</style>
<link rel="stylesheet" href="{{ asset('css/transaction/style.css') }}">
<link rel="stylesheet" href="{{ asset('css/dashboard/style.css') }}">
<link rel="stylesheet" href="{{ asset('assets/vendors/iconfonts/font-awesome/css/font-awesome.min.css') }}">

@endsection
@section('active')
    active
@endsection
@section('page-title')
    Pencapaian Tujuan
@endsection
@section('content')
<div class="row page-title-header">
    <div class="col-12">
        <ul class="nav nav-custom nav-justified mb-2 justify-content-center">
            <li class="nav-item">
                <a href="{{ route('pencapaian') }}"  class="nav-link rounded-0 pt-2 pb-2"> 
                    <span class="d-none d-sm-inline">Input Data</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="{{ route('pencapaian.penilaian') }}" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2 active">
                    <span class="d-none d-sm-inline">Penilaian</span>
                </a>
            </li>
        </ul>
    </div>
</div>
    @if (auth()->user()->role == 'superadmin' || auth()->user()->role == 'admin')
    <div class="row modal-group">
      <div class="modal fade" id="tambahOutput" tabindex="-1" role="dialog" aria-labelledby="tambahOutputLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <form name="tambah_output" action="{{ route('pencapaian.addrealisasi') }}" method="POST">
              @csrf
              <div class="modal-header">
                <h5 class="modal-title" id="tambahRespondenLabel">Tambah Realisasi</h5>
                <button type="button" class="close close-btn" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="form-group row">
                  <div class="col-12">
                      <div class="form-group">
                          <label>Sasaran</label>
                          <input type="text" name="add_output_id" hidden>
                          <textarea type="text" class="form-control" name="sasaran_output" disabled></textarea>
                      </div>
                      <div class="form-group">
                          <label>IKK</label>
                          <textarea type="text" class="form-control" name="ikk" placeholder="Masukkan IKK" disabled></textarea>
                      </div>
                      <div class="row m-0 p-0">
                          <div class="form-group col-6 pl-0">
                              <label>Target</label>
                              <input type="number" class="form-control" name="target" placeholder="Masukkan target" disabled>
                          </div>
                          <div class="form-group col-6 pr-0">
                              <label>Satuan Target</label>
                              <input type="text" class="form-control" name="satuan" placeholder="Masukkan satuan" disabled>
                          </div>
                      </div>
                      <div class="row m-0 p-0">
                        <div class="form-group col-6 pl-0">
                            <label>Realisasi</label>
                            <input type="number" class="form-control" name="realisasi" placeholder="Masukkan realisasi">
                        </div>
                        <div class="form-group col-6 pr-0">
                            <label>Satuan Target</label>
                            <input type="text" class="form-control" name="satuan" placeholder="" disabled>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-simpan"><i class="mdi mdi-content-save"></i> Tambah</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="row modal-group">
      <div class="modal fade" id="editOutput" tabindex="-1" role="dialog" aria-labelledby="editOutputLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <form name="edit_output" action="{{ route('pencapaian.editoutputrealisasi') }}" method="POST">
              @csrf
              <div class="modal-header">
                <h5 class="modal-title" id="tambahRespondenLabel">Edit IKK dan Target Output</h5>
                <button type="button" class="close close-btn" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="form-group row">
                  <div class="col-12">
                      <div class="form-group">
                          <label>Sasaran</label>
                          <input type="text" name="edit_id" hidden>
                          <textarea type="text" class="form-control" name="edit_sasaran_output" disabled></textarea>
                      </div>
                      <div class="form-group">
                          <label>IKK</label>
                          <textarea type="text" class="form-control" name="edit_ikk" placeholder="Masukkan IKK" disabled></textarea>
                      </div>
                      <div class="row m-0 p-0">
                          <div class="form-group col-6 pl-0">
                              <label>Target</label>
                              <input type="number" class="form-control" name="edit_target" placeholder="Masukkan target" disabled>
                          </div>
                          <div class="form-group col-6 pr-0">
                              <label>Satuan Target</label>
                              <input type="text" class="form-control" name="edit_satuan" placeholder="Masukkan satuan" disabled>
                          </div>
                      </div>
                      <div class="row m-0 p-0">
                        <div class="form-group col-6 pl-0">
                            <label>Realisasi</label>
                            <input type="number" class="form-control" name="edit_realisasi" placeholder="Masukkan realisasi">
                        </div>
                        <div class="form-group col-6 pr-0">
                            <label>Satuan Realisasi</label>
                            <input type="text" class="form-control" name="edit_satuan" placeholder="" disabled>
                        </div>
                      </div>
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
                <table class="table">
                    <thead class="head-table">
                      <tr>
                        
                        <th> Sasaran </th>
                        <th> IKK </th>
                        <th> Target </th>
                        <th>  </th>
                      </tr>
                    </thead>
                    <tbody>
                    
                      <?php 
                      $number = 1;
                      $m = "mb-3";
                      ?>
                      @foreach($data as $data)
                      <tr>
                        <td class="align-top" width="41%">
                          <div class="d-flex align-items-start flex-column" style="height: 100%;">
                            <div class="mb-auto">
                              <input type="hidden" name="sasaran_id[{{$data->id}}]" value="{{$data->id}}">
                              <h6 class="mb-2">Sasaran {{ $number }}</h6>
                              <div class="mb-4" style="white-space: normal;">{{ $data->sasaran }}</div>
                            </div>
                            <div class="d-flex justify-content-between {{ $m }}">
                              
                            </div>
                          </div>
                        </td>
                        <?php 
                        $number_ikk = 1
                        ?>
                        @foreach($data->ikkTarget as $data_ikk)
                        @if ($number_ikk <> 1)                        
                        <tr>     
                          <td class="align-top {{ $number_ikk <> 1 ? 'hide-border-top' : '' }}" width="41%"></td>
                        @endif
                          <td class="align-top {{ $number_ikk <> 1 ? 'hide-border-top' : '' }}" width="25%">
                            <input type="hidden" name="output_id[{{$data_ikk->id}}]" value="{{$data_ikk->id}}">
                            <input type="hidden" name="sasaran_id_output[{{$data_ikk->id}}]" value="{{$data->id}}">
                            <div class="d-flex align-items-start flex-column style="height: 100%;">
                              <div class="mb-auto">
                                <h6 class="mb-2">IKK {{ $number_ikk }}</h6>
                                <div class="mb-4" style="white-space: normal;">{{ $data_ikk->ikk }}</div>
                              </div>
                              <div class="p-0 {{ $m }}" style="width: 100%">
                                <div class="p-3 card-body payment-1">
                                  <h6 class="card-title">Realisasi</h6>
                                  <p class="card-text text-muted font-weight-bolder">{{ $data_ikk->realisasi_ikk_target_count == 0 ? "Belum ada realisasi" : $data_ikk->realisasiIkkTarget->realisasi." ".$data_ikk->satuan}} </p>
                                </div>
                              </div>
                            </div>                              
                          </td>
                          <td class="align-top {{ $number_ikk <> 1 ? 'hide-border-top' : '' }}" width="25%">
                            <div class="d-flex align-items-start flex-column" style="height: 100%;">
                              <div class="mb-auto">
                                <h6 class="mb-2">Target {{ $number_ikk }}</h6>
                                <div class="mb-4" style="white-space: normal;">{{ $data_ikk->target }} {{ $data_ikk->satuan }}</div>
                              </div>
                              <div class="p-0 {{ $m }}" style="width: 100%">
                                <div class="p-3 card-body payment-1">
                                  <h6 class="card-title">Persentase</h6>
                                  <p class="card-text text-muted font-weight-bolder">{{ $data_ikk->realisasi_ikk_target_count == 0 ? "0%" : (round($data_ikk->realisasiIkkTarget->realisasi/$data_ikk->target*100,2))."%"}}</p>
                                </div>
                              </div>
                            </div>
                          </td>
                          <td class="align-top col-1 {{ $number_ikk <> 1 ? 'hide-border-top' : '' }}" width="9%">
                            <div class="d-flex justify-content-between">
                              <button class="btn-output btn-custom mr-3" data-toggle="modal" data-target="#tambahOutput" data-sasaran="{{ $data_ikk->id }}">
                                  + Realisasi
                              </button>
                              <div class="d-flex justify-content-start">
                                <button type="button" class="btn-edit-output btn btn-secondary pl-2 pr-2" data-toggle="modal" data-target="#editOutput" data-edit="{{ $data_ikk->id }}">
                                  <strong><i class="fa fa-pencil m-0" aria-hidden="true"></i></strong>
                                </button>
                              </div>
                            </div>
                          </td>
                          
                          
                        @if ($number_ikk <> 1)
                          </tr>
                        @endif
      
                        <?php 
                        $number_ikk ++;
                        ?>
                        @endforeach  
                      </tr>
                      <?php 
                      $number ++;
                      ?>
                      @endforeach                
                    </tbody>
                  </table>
            </div>
        </div>
        </div>
    </div>
    <div class="d-flex col-12 justify-content-end" style="margin-top: 1.7em">
      <button  type="button" class="btn btn-filter-custom" style="margin-right: 0.8em">Kirim<i class="fa fa-chevron-right"></i></button>
    </div>
@endsection


@section('script')
<script src="{{ asset('js/dashboard/script.js') }}"></script>
<script src="{{ asset('plugins/js/Chart.min.js') }}"></script>
<script src="{{ asset('plugins/js/ChartRadius.js') }}"></script>
<script type="text/javascript">

@if ($message = Session::get('berhasil_input'))
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

@if ($message = Session::get('gagal_input'))
  swal(
      "Gagal!",
      "{{ $message }}",
      "error"
  );
@endif

@if ($message = Session::get('delete_success'))
  swal(
      "Berhasil!",
      "{{ $message }}",
      "success"
  );
@endif  

// tambah output
$(document).on('click', '.btn-output', function(){
  
  var data_sasaran = $(this).data('sasaran');
  $.ajax({
    method: "GET",
    url: "{{ url('/pencapaian/getsasaranpenilaian') }}/" + data_sasaran,
    success:function(response)
    {
      console.log(response);
      $('input[name=add_output_id]').val(response.data.id);
      $('textarea[name=sasaran_output]').val(response.data.sasaran.sasaran);
      $('textarea[name=ikk]').val(response.data.ikk);  
      $('input[name=target]').val(response.data.target);
      $('input[name=satuan]').val(response.data.satuan);         
      validator.resetForm();
    }
  });
});

// edit Output
$(document).on('click', '.btn-edit-output', function(){
  
  var data_edit = $(this).data('edit');
  $.ajax({
    method: "GET",
    url: "{{ url('/pencapaian/editoutputpenilaian') }}/" + data_edit,
    success:function(response)
    {
      $('input[name=edit_id]').val(response.data.realisasi_ikk_target.id);
      $('textarea[name=edit_sasaran_output]').val(response.data.sasaran.sasaran);
      $('textarea[name=edit_ikk]').val(response.data.ikk);
      $('input[name=edit_target]').val(response.data.target);
      $('input[name=edit_satuan]').val(response.data.satuan);
      $('input[name=edit_realisasi]').val(response.data.realisasi_ikk_target.realisasi);
      validator.resetForm();
    }
  });
});


</script>
@endsection