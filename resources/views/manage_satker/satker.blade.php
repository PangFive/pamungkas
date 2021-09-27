@extends('templates/main')
@section('css')
<link rel="stylesheet" href="{{ asset('css/manage_account/account/style.css') }}">
@endsection
@section('content')
<div class="row page-title-header">
  <div class="col-12">
    <div class="page-header d-flex justify-content-between align-items-center">
      <h4 class="page-title">Daftar Satker</h4>
      <div class="d-flex justify-content-start">
        <div class="dropdown dropdown-search">
          <button class="btn btn-icons btn-inverse-primary btn-filter shadow-sm ml-2" type="button" id="dropdownMenuIconButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="mdi mdi-magnify"></i>
          </button>
          <div class="dropdown-menu search-dropdown" aria-labelledby="dropdownMenuIconButton1">
            <div class="row">
              <div class="col-11">
                <input type="text" class="form-control" name="search" placeholder="Cari Satker">
              </div>
            </div>
          </div>
        </div>
	      <a href="{{ url('/satker/new') }}" class="btn btn-icons btn-inverse-primary btn-new ml-2">
	      	<i class="mdi mdi-plus"></i>
	      </a>
      </div>
    </div>
  </div>
</div>
<div class="row modal-group">
  <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <form action="{{ url('/satker/update') }}" method="post" enctype="multipart/form-data" name="update_form">
          <div class="modal-header">
            <h5 class="modal-title" id="editModalLabel">Edit Satker</h5>
            <button type="button" class="close close-btn" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              @csrf
              <div class="row">
                <div class="col-12 text-center">
                  <img src="{{ asset('pictures/default.jpg') }}" class="img-edit">
                </div>
                <div class="col-12 text-center mt-2">
                  <input type="file" name="foto" hidden>
                  <input type="text" name="nama_foto" hidden>
                  <button type="button" class="btn btn-primary font-weight-bold btn-upload">Ubah</button>
                  <button type="button" class="btn btn-delete-img">Hapus</button>
                </div>
                <div class="col-12" hidden="">
                  <input type="text" name="id">
                </div>
              </div>
              <div class="form-group row mt-4">
                <label class="col-3 col-form-label font-weight-bold">Nama Satker</label>
                <div class="col-9">
                  <input type="text" class="form-control" name="nama_satker">
                </div>
                <div class="col-9 offset-3 error-notice" id="nama_satker_error"></div>
              </div>
              <div class="form-group row mt-4">
                <label class="col-3 col-form-label font-weight-bold">Nickname Satker</label>
                <div class="col-9">
                  <input type="text" class="form-control" name="nickname_satker">
                </div>
                <div class="col-9 offset-3 error-notice" id="nickname_satker_error"></div>
              </div>
              <div class="form-group row">
                <label class="col-3 col-form-label font-weight-bold">Eselon I</label>
                <div class="col-9">
                  <input type="text" class="form-control" name="kementrian">
                </div>
                <div class="col-9 offset-3 error-notice" id="kementrian_error"></div>
              </div>
              <div class="form-group row">
                <label class="col-3 col-form-label font-weight-bold">Alamat</label>
                <div class="col-9">
                  <textarea type="text" class="form-control" name="alamat_satker"></textarea>
                </div>
                <div class="col-9 offset-3 error-notice" id="email_error"></div>
              </div>
              <div class="form-group row">
                <label class="col-3 col-form-label font-weight-bold">Kontak</label>
                <div class="col-9">
                  <input type="text" class="form-control" name="email_satker">
                </div>
                <div class="col-9 offset-3 error-notice" id="email_error"></div>
              </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-update"><i class="mdi mdi-content-save"></i> Simpan</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-md-12 grid-margin">
    <div class="card card-noborder b-radius">
      <div class="card-body">
        <div class="row">
        	<div class="col-12 table-responsive">
        		<table class="table table-custom">
              <thead>
                <tr>
                  <th>Nama Satker</th>
                  <th>Eselon I</th>
                  <th>Alamat</th>
                  <th>Kontak</th>
                </tr>
              </thead>
              <tbody>
              	@foreach($satkers as $satker)
                <tr>
                  <td width="25%">
                  	<img src="{{ asset('pictures/' . $satker->foto) }}">
                  	<span class="ml-2">{{ $satker->nama_satker }}</span>
                  </td>
                  <td width="25%" class="text-wrap">{{ $satker->kementrian }}</td>
                  <td width="25%" class="text-wrap">{{ $satker->alamat_satker }}</td>
                  <td width="16%" class="text-wrap">{{ $satker->email_satker }}</td>
                  <td width="9%">
                  	<button type="button" class="btn btn-edit btn-icons btn-rounded btn-secondary" data-toggle="modal" data-target="#editModal" data-edit="{{ $satker->id }}">
                        <i class="mdi mdi-pencil"></i>
                    </button>
                    <button type="button" data-delete="{{ $satker->id }}" class="btn btn-icons btn-rounded btn-secondary ml-1 btn-delete">
                        <i class="mdi mdi-close"></i>
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
  </div>
</div>
@endsection
@section('script')
<script src="{{ asset('js/manage_satker/satker/script.js') }}"></script>
<script type="text/javascript">
  @if ($message = Session::get('create_success'))
    swal(
        "Berhasil!",
        "{{ $message }}",
        "success"
    );
  @endif

  @if ($message = Session::get('update_success'))
    swal(
        "Berhasil!",
        "{{ $message }}",
        "success"
    );
  @endif

  @if ($message = Session::get('delete_success'))
    swal(
        "Berhasil!",
        "{{ $message }}",
        "success"
    );
  @endif

  @if ($message = Session::get('both_error'))
    swal(
    "",
    "{{ $message }}",
    "error"
    );
  @endif

  @if ($message = Session::get('email_error'))
    swal(
    "",
    "{{ $message }}",
    "error"
    );
  @endif

  @if ($message = Session::get('username_error'))
    swal(
    "",
    "{{ $message }}",
    "error"
    );
  @endif

  $(document).on('click', '.filter-btn', function(e){
    e.preventDefault();
    var data_filter = $(this).attr('data-filter');
    $.ajax({
      method: "GET",
      url: "{{ url('/account/filter') }}/" + data_filter,
      success:function(data)
      {
        $('tbody').html(data);
      }
    });
  });

  $(document).on('click', '.btn-edit', function(){
    var data_edit = $(this).attr('data-edit');
    $.ajax({
      method: "GET",
      url: "{{ url('/satker/edit') }}/" + data_edit,
      success:function(response)
      {
        $('.img-edit').attr("src", "{{ asset('pictures') }}/" + response.satker.foto);
        $('input[name=id]').val(response.satker.id);
        $('input[name=nama_satker]').val(response.satker.nama_satker);
        $('input[name=nickname_satker]').val(response.satker.nickname_satker);
        $('input[name=kementrian]').val(response.satker.kementrian);
        $('textarea[name=alamat_satker]').val(response.satker.alamat_satker);
        $('input[name=email_satker]').val(response.satker.email_satker);
        validator.resetForm();
      }
    });
  });

  $(document).on('click', '.btn-delete', function(e){
    e.preventDefault();
    var data_delete = $(this).attr('data-delete');
    swal({
      title: "Apa Anda Yakin?",
      text: "Data satker akan terhapus, klik oke untuk melanjutkan",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        window.open("{{ url('/satker/delete') }}/" + data_delete, "_self");
      }
    });
  });

  $(document).on('click', '.btn-delete-img', function(){
    $(".img-edit").attr("src", "{{ asset('pictures') }}/default.jpg");
    $('input[name=nama_foto]').val('default.jpg');
  });
</script>
@endsection