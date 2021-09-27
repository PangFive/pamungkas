@extends('templates/main')
@section('css')
<style type="text/css">
  .hide-border-top{
    border-top: rgba(255, 255, 255, 0) !important;
}
</style>
<link rel="stylesheet" href="{{ asset('css/dashboard/style.css') }}">
<link rel="stylesheet" href="{{ asset('assets/vendors/iconfonts/font-awesome/css/font-awesome.min.css') }}">

@endsection
@section('active')
    active
@endsection
@section('page-title')
    Penetapan Tujuan
@endsection
@section('content')
<div class="row page-title-header">
    <div class="col-12">
        <ul class="nav nav-custom nav-justified mb-2 justify-content-center">
            <li class="nav-item">
                <a href="{{ route('penetapan') }}" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2 active"> 
                    <span class="d-none d-sm-inline">Input Data</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="{{ route('penetapan.penilaian') }}" class="nav-link rounded-0 pt-2 pb-2">
                    <span class="d-none d-sm-inline">Penilaian</span>
                </a>
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="row col-12 page-title-header d-flex justify-content-between pr-0">
        <div class="col-11">
            <button class="btn-custom ml-3" data-toggle="modal" data-target="#tambahSasaran">
              + Sasaran
            </button>
        </div>
        <div class="mr-4">
          <button class="btn-custom" id="deleteAllSelectedSasaran">
            <i class="fa fa-trash" style="font-size: 20px" aria-hidden="true"></i>
          </button>
      </div>
    </div>
    @if (auth()->user()->role == 'superadmin' || auth()->user()->role == 'admin')
    <div class="row modal-group">
        <div class="modal fade" id="tambahSasaran" tabindex="-1" role="dialog" aria-labelledby="tambahSasaranLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <form name="tambah_sasaran" action="{{ route('penetapan.addsasaran') }}" method="POST">
                @csrf
                <div class="modal-header">
                  <h5 class="modal-title" id="tambahRespondenLabel">Tambah Sasaran</h5>
                  <button type="button" class="close close-btn" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <div class="form-group row">
                    <div class="col-12">
                        <div class="form-group">
                            <label>Sasaran Program</label>
                            <select class="form-control" name="sasaran_program">
                              <option value="">-- Pilih Satker --</option>
                              @foreach ($sasaran_program as $sasaran_program)
                              <option value="{{$sasaran_program->id}}">{{$sasaran_program->kode_sasaran}} - {{$sasaran_program->sasaran_program}}</option>
                              @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Sasaran</label>
                            <textarea type="text" class="form-control" name="sasaran" placeholder="Masukkan sasaran kegiatan atau aktivitas"></textarea>
                        </div>
                        <div class="form-group">
                            <label>IKK</label>
                            <textarea type="text" class="form-control" name="ikk" placeholder="Masukkan IKK"></textarea>
                        </div>
                        <div class="row m-0 p-0">
                            <div class="form-group col-6 pl-0">
                                <label>Target</label>
                                <input type="number" class="form-control" name="target" placeholder="Masukkan target">
                            </div>
                            <div class="form-group col-6 pr-0">
                                <label>Satuan Target</label>
                                <input type="text" class="form-control" name="satuan" placeholder="Masukkan satuan">
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
        <div class="modal fade" id="editSasaran" tabindex="-1" role="dialog" aria-labelledby="editSasaranLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <form name="edit_sasaran" action="{{ route('penetapan.editsasaran') }}" method="POST">
                @csrf
                <div class="modal-header">
                  <h5 class="modal-title" id="tambahRespondenLabel">Edit Sasaran</h5>
                  <button type="button" class="close close-btn" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <div class="form-group row">
                    <div class="col-12">
                        <div class="form-group">
                            <label>Sasaran</label>
                            <input type="text" name="edit_sasaran_id" hidden>
                            <textarea type="text" class="form-control" name="edit_sasaran" placeholder="Masukkan sasaran kegiatan atau aktivitas"></textarea>
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

      <div class="row modal-group">
        <div class="modal fade" id="tambahOutput" tabindex="-1" role="dialog" aria-labelledby="tambahOutputLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <form name="tambah_output" action="{{ route('penetapan.addoutput') }}" method="POST">
                @csrf
                <div class="modal-header">
                  <h5 class="modal-title" id="tambahRespondenLabel">Tambah IKK dan Target Output</h5>
                  <button type="button" class="close close-btn" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <div class="form-group row">
                    <div class="col-12">
                        <div class="form-group">
                            <label>Sasaran</label>
                            <input type="text" name="sasaran_id" hidden>
                            <textarea type="text" class="form-control" name="sasaran_output" disabled></textarea>
                        </div>
                        <div class="form-group">
                            <label>IKK</label>
                            <textarea type="text" class="form-control" name="ikk" placeholder="Masukkan IKK"></textarea>
                        </div>
                        <div class="row m-0 p-0">
                            <div class="form-group col-6 pl-0">
                                <label>Target</label>
                                <input type="number" class="form-control" name="target" placeholder="Masukkan target">
                            </div>
                            <div class="form-group col-6 pr-0">
                                <label>Satuan Target</label>
                                <input type="text" class="form-control" name="satuan" placeholder="Masukkan satuan">
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
              <form name="edit_output" action="{{ route('penetapan.editoutput') }}" method="POST">
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
                            <textarea type="text" class="form-control" name="edit_ikk" placeholder="Masukkan IKK"></textarea>
                        </div>
                        <div class="row m-0 p-0">
                            <div class="form-group col-6 pl-0">
                                <label>Target</label>
                                <input type="number" class="form-control" name="edit_target" placeholder="Masukkan target">
                            </div>
                            <div class="form-group col-6 pr-0">
                                <label>Satuan Target</label>
                                <input type="text" class="form-control" name="edit_satuan" placeholder="Masukkan satuan">
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
                        <th class="align-top">
                          <input type="checkbox" id="chkCheckAll">
                        </th>
                        <th> Sasaran </th>
                        <th> IKK </th>
                        <th> Target </th>
                        <th>  </th>
                        <th>  </th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php 
                      $number = 1;
                      $check_data = count($data);
                      ?>
                      @foreach($data as $data)
                      <tr>
                        <td class="align-top" width="2%">
                          <input type="checkbox" name='ids' class="checkBoxClass mt-1" value="{{ $data->id }}">
                        </td>
                        <td class="align-top" width="34%">
                          <a href="" class="btn-edit-sasaran" data-toggle="modal" data-target="#editSasaran" data-edit="{{ $data->id }}"><h6 class="mb-2">Sasaran {{ $number }}</h6></a>
                          <div style="white-space: normal;">{{ $data->sasaran }}</div>
                        </td>
                        <?php 
                        $number_ikk = 1
                        ?>
                        @foreach($data->ikkTarget as $data_ikk)
                        @if ($number_ikk <> 1)                        
                        <tr>
                          <td class="align-top {{ $number_ikk <> 1 ? 'hide-border-top' : '' }}" width="2%"></td>
                          <td class="align-top {{ $number_ikk <> 1 ? 'hide-border-top' : '' }}" width="34%"></td>
                        @endif
                          <td class="align-top {{ $number_ikk <> 1 ? 'hide-border-top' : '' }}" width="34%">
                            <h6 class="mb-2">IKK {{ $number_ikk }}</h6>
                            <div style="white-space: normal;">{{ $data_ikk->ikk }}</div>
                          </td>
                          <td class="align-top {{ $number_ikk <> 1 ? 'hide-border-top' : '' }}" width="16%">
                            <h6 class="mb-2">Target {{ $number_ikk }}</h6>
                            <div style="white-space: normal;">{{ $data_ikk->target }} {{ $data_ikk->satuan }}</div>
                          </td>
                          <td class="align-top {{ $number_ikk <> 1 ? 'hide-border-top' : '' }}" width="9%">
                              <button class="btn-output btn-custom" data-toggle="modal" data-target="#tambahOutput" data-sasaran="{{ $data_ikk->sasaran_id }}">
                                  + Output
                              </button>
                          </td>
                          <td class="align-top {{ $number_ikk <> 1 ? 'hide-border-top' : '' }}" width="5%">
                            <div class="d-flex justify-content-start">
                              <button type="button" class="btn-edit-output btn btn-secondary pl-2 pr-2 mr-3" data-toggle="modal" data-target="#editOutput" data-edit="{{ $data_ikk->id }}">
                                <strong><i class="fa fa-pencil m-0" aria-hidden="true"></i></strong>
                              </button>
                              @if ($number_ikk <> 1)                  
                        
                              <button type="button" class="btn-delete btn btn-secondary pl-2 pr-2" data-token="{{ csrf_token() }}" data-delete="{{ $data_ikk->id }}">
                                <strong><span aria-hidden="true">&times;</span></strong>
                              </button>
                              @endif
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
                  @if ($check_data == 0)
                      <div class="alert mt-4 col-12 b-radius alert-warning text-center">
                          <h5>Tidak ada data</h5>
                      </div>
                  @endif
            </div>
        </div>
        </div>
    </div>
    <div class="d-flex col-12 justify-content-end" style="margin-top: 1.7em">
      <a href="{{ route('penetapan.penilaian') }}" type="button" class="btn btn-filter-custom" style="margin-right: 0.8em">Penilaian <i class="fa fa-chevron-right"></i></a>
    </div>
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
    url: "{{ url('/penetapan/addoutput') }}/" + data_sasaran,
    success:function(response)
    {
      $('input[name=sasaran_id]').val(response.data.id);
      $('textarea[name=sasaran_output]').val(response.data.sasaran);        
      validator.resetForm();
    }
  });
});

// edit Output
$(document).on('click', '.btn-edit-output', function(){
  
  var data_edit = $(this).data('edit');
  $.ajax({
    method: "GET",
    url: "{{ url('/penetapan/editoutput') }}/" + data_edit,
    success:function(response)
    {
    
      $('input[name=edit_id]').val(response.data.id);
      $('textarea[name=edit_sasaran_output]').val(response.data.sasaran.sasaran);
      $('textarea[name=edit_ikk]').val(response.data.ikk);
      $('input[name=edit_target]').val(response.data.target);
      $('input[name=edit_satuan]').val(response.data.satuan);
      validator.resetForm();
    }
  });
});

// edit Sasaran
$(document).on('click', '.btn-edit-sasaran', function(){
  
  var data_edit = $(this).data('edit');
  $.ajax({
    method: "GET",
    url: "{{ url('/penetapan/editsasaran') }}/" + data_edit,
    success:function(response)
    {
      $('input[name=edit_sasaran_id]').val(response.data.id);
      $('textarea[name=edit_sasaran]').val(response.data.sasaran);
      validator.resetForm();
    }
  });
});

// delete output
$(document).on('click', '.btn-delete', function(e){
  e.preventDefault();
  var data_delete = $(this).attr('data-delete');
  var data_token = $(this).attr('data-token');
  swal({
    title: "Apa Anda Yakin?",
    text: "IKK dan Target akan terhapus, klik oke untuk melanjutkan",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  })
  .then((willDelete) => {
    if (willDelete) {
      
      $.ajax({
        url:'{{ route("penetapan.deleteoutput") }}',
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

$(document).on('click', '#chkCheckAll', function(){
      $('.checkBoxClass').prop('checked',$(this).prop('checked'));
});

$(document).on('click', '#deleteAllSelectedSasaran', function(e){
  e.preventDefault();
  var allids = [];
  $('input:checkbox[name=ids]:checked').each(function(){
    allids.push($(this).val())
  });
  if(allids == ""){
    swal("Gagal!",
    "Kamu belum memilih sasaran yang akan dihapus",
    "error");
  } else {
    swal({
      title: "Apa Anda Yakin?",
      text: "Sasaran akan terhapus, klik oke untuk melanjutkan",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        $.ajax({
          url:'{{ route("penetapan.deletesasaran") }}',
          type:'DELETE',
          data:{
            ids:allids,
            _token:$('input[name=_token]').val()
          },
          success:function(data){
            swal(
              {
                title: "Berhasil",
                text: "Sasaran berhasil dihapus",
                icon: "success",
              }).then(
                $('tbody').html(data)
              )
          }
        })
      }
    });
  };
});

</script>
@endsection