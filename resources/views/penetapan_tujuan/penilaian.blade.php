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
                <a href="{{ route('penetapan') }}"  class="nav-link rounded-0 pt-2 pb-2"> 
                    <span class="d-none d-sm-inline">Input Data</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="{{ route('penetapan.penilaian') }}" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2 active">
                    <span class="d-none d-sm-inline">Penilaian</span>
                </a>
            </li>
        </ul>
    </div>
</div>

  <form method="POST" action="{{ route('penetapan.penilaian.create') }}" name="create_penilaian_penetapan_tujuan" enctype="multipart/form-data">
    @csrf
    @if (auth()->user()->role == 'superadmin' || auth()->user()->role == 'admin')
    
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
                      </tr>
                    </thead>
                    <tbody>
                    
                      <?php 
                      $number = 1;
                      $m = "mb-3";
                      ?>
                      @foreach($data as $data)
                      <tr>
                        <td width="40%" class="align-top">
                          <div class="d-flex align-items-start flex-column" style="height: 100%;">
                            <div class="mb-auto">
                              <input type="hidden" name="sasaran_id[{{$data->id}}]" value="{{$data->id}}">
                              <h6 class="mb-2">Sasaran {{ $number }}</h6>
                              <div class="mb-4" style="white-space: normal;">{{ $data->sasaran }}</div>
                            </div>
                            <div class="d-flex justify-content-between {{ $m }}">
                              <div class="p-0 col-6 mr-4">
                                <div class="ml-0" style="white-space: normal;"><strong>Apakah Sasaran {{ $number }} Sudah Tepat?</strong></div>
                                <div class="form-radio ml-1 mt-2 p-0">
                                  <label class="form-check-label">
                                  <input {{ ($data->jawabanSasaran != null) ? (($data->jawabanSasaran->j_sasaran_t === 1) ? 'checked' :'') :'' }} required type="radio" class="form-check-input" name="jawaban_sasaran_t[{{$data->id}}]" id="jawaban_sasaran_t[{{$data->id}}]" value="1"> Ya <i class="input-helper"></i></label>
                                </div>
                                <div class="form-radio ml-1 mt-2 p-0">
                                  <label class="form-check-label">
                                  <input {{ ($data->jawabanSasaran != null) ? (($data->jawabanSasaran->j_sasaran_t === 0) ? 'checked' :'') :'' }} required type="radio" class="form-check-input" name="jawaban_sasaran_t[{{$data->id}}]" id="jawaban_sasaran_t[{{$data->id}}]" value="0"> Tidak <i class="input-helper"></i></label>
                                </div>
                              </div>
                              <div class="p-0 col-6">
                                <div class="ml-0" style="white-space: normal;"><strong>Apakah Sasaran {{ $number }} Sudah Baik?</strong></div>
                                <div class="form-radio ml-1 mt-2 p-0">
                                  <label class="form-check-label">
                                  <input {{ ($data->jawabanSasaran != null) ? (($data->jawabanSasaran->j_sasaran_b === 1) ? 'checked' :'') :'' }} required type="radio" class="form-check-input" name="jawaban_sasaran_b[{{$data->id}}]" id="jawaban_sasaran_b[{{$data->id}}]" value="1"> Ya <i class="input-helper"></i></label>
                                </div>
                                <div class="form-radio ml-1 mt-2 p-0">
                                  <label class="form-check-label">
                                  <input {{ ($data->jawabanSasaran != null) ? (($data->jawabanSasaran->j_sasaran_b === 0) ? 'checked' :'') :'' }} required type="radio" class="form-check-input" name="jawaban_sasaran_b[{{$data->id}}]" id="jawaban_sasaran_b[{{$data->id}}]" value="0"> Tidak <i class="input-helper"></i></label>
                                </div>
                              </div>
                            </div>
                          </div>
                        </td>
                        <?php 
                        $number_ikk = 1
                        ?>
                        @foreach($data->ikkTarget as $data_ikk)
                        @if ($number_ikk <> 1)                        
                        <tr>     
                          <td width="40%" class="align-top {{ $number_ikk <> 1 ? 'hide-border-top' : '' }}"></td>
                        @endif
                          <td width="40%" class="align-top {{ $number_ikk <> 1 ? 'hide-border-top' : '' }}">
                            <input type="hidden" name="output_id[{{$data_ikk->id}}]" value="{{$data_ikk->id}}">
                            <input type="hidden" name="sasaran_id_output[{{$data_ikk->id}}]" value="{{$data->id}}">
                            <div class="d-flex align-items-start flex-column {{ $number_ikk <> 1 ? 'hide-border-top' : '' }}" style="height: 100%;">
                              <div class="mb-auto">
                                <h6 class="mb-2">IKK {{ $number_ikk }}</h6>
                                <div class="mb-4" style="white-space: normal;">{{ $data_ikk->ikk }}</div>
                              </div>
                              <div class="p-0 {{ $m }}">
                                <div class="ml-0" style="white-space: normal;"><strong>Apakah IKK {{ $number_ikk }} Sudah Tepat?</strong></div>
                                <div class="form-radio ml-1 mt-2 p-0">
                                  <label class="form-check-label">
                                  <input {{ ($data_ikk->jawabanIkkTarget != null) ? (($data_ikk->jawabanIkkTarget->j_ikk === 1) ? 'checked' :'') :'' }} required type="radio" class="form-check-input" name="jawaban_ikk[{{ $data_ikk->id }}]" id="jawaban_ikk[{{ $data_ikk->id }}]" value="1"> Ya <i class="input-helper"></i></label>
                                </div>
                                <div class="form-radio ml-1 mt-2 p-0">
                                  <label class="form-check-label">
                                  <input {{ ($data_ikk->jawabanIkkTarget != null) ? (($data_ikk->jawabanIkkTarget->j_ikk === 0) ? 'checked' :'') :'' }} required type="radio" class="form-check-input" name="jawaban_ikk[{{ $data_ikk->id }}]" id="jawaban_ikk[{{ $data_ikk->id }}]" value="0"> Tidak <i class="input-helper"></i></label>
                                </div>
                              </div>
                            </div>                              
                          </td>
                          <td width="20%" class="align-top {{ $number_ikk <> 1 ? 'hide-border-top' : '' }}">
                            <div class="d-flex align-items-start flex-column" style="height: 100%;">
                              <div class="mb-auto">
                                <h6 class="mb-2">Target {{ $number_ikk }}</h6>
                                <div class="mb-4" style="white-space: normal;">{{ $data_ikk->target }} {{ $data_ikk->satuan }}</div>
                              </div>
                              <div class="p-0 {{ $m }}">
                                <div class="ml-0" style="white-space: normal;"><strong>Apakah Target {{ $number_ikk }} Sudah Tepat?</strong></div>
                                <div class="form-radio ml-1 mt-2 p-0">
                                  <label class="form-check-label">
                                  <input {{ ($data_ikk->jawabanIkkTarget != null) ? (($data_ikk->jawabanIkkTarget->j_target === 1) ? 'checked' :'') :'' }} required type="radio" class="form-check-input" name="jawaban_target[{{ $data_ikk->id }}]" id="jawaban_target[{{ $data_ikk->id }}]" value="1"> Ya <i class="input-helper"></i></label>
                                </div>
                                <div class="form-radio ml-1 mt-2 p-0">
                                  <label class="form-check-label">
                                  <input {{ ($data_ikk->jawabanIkkTarget != null) ? (($data_ikk->jawabanIkkTarget->j_target === 0) ? 'checked' :'') :'' }} required type="radio" class="form-check-input" name="jawaban_target[{{ $data_ikk->id }}]" id="jawaban_target[{{ $data_ikk->id }}]" value="0"> Tidak <i class="input-helper"></i></label>
                                </div>
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
      <button  type="submit" class="btn btn-filter-custom" style="margin-right: 0.8em">Kirim<i class="fa fa-chevron-right"></i></button>
    </div>
  </form>



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
      console.log(response)
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
          console.log(data);
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