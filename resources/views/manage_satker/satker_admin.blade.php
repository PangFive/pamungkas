@extends('templates/main')
@section('css')
<link rel="stylesheet" href="{{ asset('css/manage_account/new_account/style.css') }}">
@endsection
@section('content')
<div class="row page-title-header">
  <div class="col-12">
    <div class="page-header d-flex justify-content-start align-items-center">
      <div class="quick-link-wrapper d-md-flex flex-md-wrap">
        <ul class="quick-links">
          <li><a href="{{ url('satker') }}">Informasi Satker</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="row">
	<div class="col-12">
		<div class="card card-noborder b-radius">
			<div class="card-body">
				<form action="{{ url('/satker/update') }}" method="post" enctype="multipart/form-data" id="update_form" name="update_form">
				  @csrf
				  <div class="form-group row">
				    <label class="col-12 font-weight-bold col-form-label">Foto Satker</label>
					<p class="col text-muted">Foto ini akan tampil pada halaman dashboard anda</p>
				    <div class="col-12 d-flex flex-row align-items-center mt-2 mb-2">
				    	<img src="{{ asset('pictures/'.$satker->foto) }}" class="default-img mr-4" id="preview-foto">
				    	<div class="btn-action">
				    		<input type="file" name="foto" id="foto" hidden="">
				    		<input type="text" name="id" value="{{ $satker->id }}" id="id" hidden="">
                            <input type="text" name="nama_foto" hidden>
				    		<button class="btn btn-sm upload-btn mr-1" type="button">Upload Foto</button>
				    		<button class="btn btn-sm delete-btn" type="button">Hapus</button>
				    	</div>
				    </div>
				  </div>
				  <div class="form-group row">
				  	<label class="col-12 font-weight-bold col-form-label">Nama Satker <span class="text-danger">*</span></label>
				  	<div class="col-12">
				  		<input type="text" value="{{ $satker->nama_satker }}" class="form-control" name="nama_satker" placeholder="Masukkan Nama Satker">
				  	</div>
				  	<div class="col-12 error-notice" id="nama_error"></div>
				  </div>
				  <div class="form-group row">
					<label class="col-12 font-weight-bold col-form-label">Nickname Satker <span class="text-danger">*</span></label>
					<div class="col-12">
						<input type="text" value="{{ $satker->nickname_satker }}" class="form-control" name="nickname_satker" placeholder="Masukkan Nickname Satker">
					</div>
					<div class="col-12 error-notice" id="nama_error"></div>
				</div>
				  <div class="form-group row">
				  	<label class="col-12 font-weight-bold col-form-label">Eselon I <span class="text-danger">*</span></label>
				  	<div class="col-12">
				  		<input type="text" value="{{ $satker->kementrian }}" class="form-control" name="kementrian" placeholder="Masukkan Unit Eselon I">
				  	</div>
				  	<div class="col-12 error-notice" id="email_error"></div>
				  </div>
				  <div class="form-group row">
				  	<label class="col-12 font-weight-bold col-form-label">Alamat Satker <span class="text-danger">*</span></label>
				  	<div class="col-12">
				  		<textarea type="text" class="form-control" name="alamat_satker" placeholder="Masukkan Alamat Satker">{{ $satker->alamat_satker }}</textarea>
				  	</div>
				  	<div class="col-12 error-notice" id="username_error"></div>
				  </div>
				  <div class="form-group row">
				  	<label class="col-12 font-weight-bold col-form-label">Kontak Satker <span class="text-danger">*</span></label>
				  	<div class="col-12">
				  		<input type="text" value="{{ $satker->email_satker }}" class="form-control" name="email_satker" placeholder="Masukkan Password">
				  	</div>
				  	<div class="col-12 error-notice" id="email_satker"></div>
				  </div>
				  <div class="row mt-5">
				  	<div class="col-12 d-flex justify-content-end">
				  		<button class="btn simpan-btn btn-sm need-alert" type="submit"><i class="mdi mdi-content-save"></i> Simpan</button>
				  	</div>
				  </div>
				</form>
			</div>
		</div>
	</div>
</div>
@endsection
@section('script')
<script src="{{ asset('js/manage_satker/new_satker/script.js') }}"></script>
<script type="text/javascript">
    @if ($message = Session::get('update_success'))
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

	@if ($message = Session::get('username_error'))
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

	$(document).on('click', '.delete-btn', function(){
		$("#preview-foto").attr("src", "{{ asset('pictures') }}/default.jpg");
        $('input[name=nama_foto]').val('default.jpg');
	});

    $('.need-alert').on('click', function (event) {
    event.preventDefault();
    swal({
        title: "Apa Anda Yakin?",
        text: "Data satker akan diubah, klik oke untuk melanjutkan",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then(function () {
        $('#update_form').submit();
    }).catch(swal.noop);
    })
</script>
@endsection