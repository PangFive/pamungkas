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
          <li><a href="{{ url('satker') }}">Daftar Satker</a></li>
          <li><a href="{{ url('satker/new') }}">Satker Baru</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="row">
	<div class="col-12">
		<div class="card card-noborder b-radius">
			<div class="card-body">
				<form action="{{ url('satker/create') }}" method="post" name="create_form" enctype="multipart/form-data">
				  @csrf
				  <div class="form-group row">
				    <label class="col-12 font-weight-bold col-form-label">Foto Satker</label>
					<p class="col text-muted">Foto ini akan tampil pada halaman dashboard anda</p>
				    <div class="col-12 d-flex flex-row align-items-center mt-2 mb-2">
				    	<img src="{{ asset('pictures/default.jpg') }}" class="default-img mr-4" id="preview-foto">
				    	<div class="btn-action">
				    		<input type="file" name="foto" id="foto" hidden="">
				    		<button class="btn btn-sm upload-btn mr-1" type="button">Upload Foto</button>
				    		<button class="btn btn-sm delete-btn" type="button">Hapus</button>
				    	</div>
				    </div>
				  </div>
				  <div class="form-group row">
				  	<label class="col-12 font-weight-bold col-form-label">Nama Satker <span class="text-danger">*</span></label>
				  	<div class="col-12">
				  		<input type="text" class="form-control" name="nama_satker" placeholder="Masukkan Nama Satker">
				  	</div>
				  	<div class="col-12 error-notice" id="nama_error"></div>
				  </div>
				  <div class="form-group row">
					<label class="col-12 font-weight-bold col-form-label">Nickname Satker <span class="text-danger">*</span></label>
					<div class="col-12">
						<input type="text" class="form-control" name="nickname_satker" placeholder="Masukkan Nickname Satker">
					</div>
					<div class="col-12 error-notice" id="nama_error"></div>
				</div>
				  <div class="form-group row">
				  	<label class="col-12 font-weight-bold col-form-label">Eselon I <span class="text-danger">*</span></label>
				  	<div class="col-12">
				  		<input type="text" class="form-control" name="kementrian" placeholder="Masukkan Unit Eselon I">
				  	</div>
				  	<div class="col-12 error-notice" id="email_error"></div>
				  </div>
				  <div class="form-group row">
				  	<label class="col-12 font-weight-bold col-form-label">Alamat Satker <span class="text-danger">*</span></label>
				  	<div class="col-12">
				  		<textarea type="text" class="form-control" name="alamat_satker" placeholder="Masukkan Alamat Satker"></textarea>
				  	</div>
				  	<div class="col-12 error-notice" id="username_error"></div>
				  </div>
				  <div class="form-group row">
				  	<label class="col-12 font-weight-bold col-form-label">Kontak Satker <span class="text-danger">*</span></label>
				  	<div class="col-12">
				  		<input type="text" class="form-control" name="email_satker" placeholder="Masukkan Password">
				  	</div>
				  	<div class="col-12 error-notice" id="email_satker"></div>
				  </div>
				  <div class="row mt-5">
				  	<div class="col-12 d-flex justify-content-end">
				  		<button class="btn simpan-btn btn-sm" type="submit"><i class="mdi mdi-content-save"></i> Simpan</button>
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
	});
</script>
@endsection