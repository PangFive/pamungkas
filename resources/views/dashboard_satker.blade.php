@extends('templates/main')
@section('css')
<link rel="stylesheet" href="{{ asset('css/dashboard/style.css') }}">
<style type="text/css">
  .bg-dash{
    background-image: url('{{ asset('pictures/' . auth()->user()->satker->foto) }}');
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;

  }
</style>
@endsection
@section('page-title')
    Beranda
@endsection
@section('content')
<div class="row page-title-header">
  <div class="col-12">

  </div>
</div>

<div class="row">

  <div class="col-lg-12 col-md-12 col-sm-12 col-12">
    <div class="row">
      <div class="col-lg-5 col-md-5 col-sm-5 col-5 mb-4 pr-0">
        <div class="card card-noborder bg-dash" style="border-radius: 15px 0 0 15px; height:100%;">

        </div>
      </div>
      <div class="col-lg-7 col-md-7 col-sm-7 col-7 mb-4 pl-0">
        <div class="card card-noborder" style="border-radius: 0 15px 15px 0;">
          <div class="card-body custom-card-p ml-5 mr-5 mt-1 mt-xl-4 mb-xl-4 mb-1">
            <h4 class="font-weight-bold">{{ auth()->user()->satker->nama_satker }}</h4>
            <h6 class="card-subtitle mb-2 text-muted">{{ auth()->user()->satker->kementrian }}</h6>
            <p class="card-text">{{ auth()->user()->satker->alamat_satker }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="col-lg-12 col-md-12 col-sm-12 col-12">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-6 col-6 p-0 mb-4">
        <div class="col mb-3">
          <div class="card b-radius card-noborder bg-gradient-blue-soft">
            <div class="card-body pt-3 pb-1">
                <h3 class="font-weight-semibold mb-0 p-0 text-white">Penetapan</br>Tujuan</h3>
                <div class="d-flex justify-content-between mt-3">
                  <p class="text-white mb-0">2021</p>
                  <h1 class="font-weight-bold mb-0 text-white" style="margin-top: -70px; font-size:80px">{{ $penetapan }}%</h1>
                </div>
            </div>
          </div>
        </div>
        <div class="col mb-0">
          <div class="card b-radius card-noborder bg-gradient-blue">
            <div class="card-body pt-3 pb-1">
                <h3 class="font-weight-semibold mb-0 p-0 text-white">Pencapaian</br>Tujuan</h3>
                <div class="d-flex justify-content-between mt-3">
                  <p class="text-white mb-0">2021</p>
                  <h1 class="font-weight-bold mb-0 text-white" style="margin-top: -70px; font-size:80px">{{ $penilaian }}%</h1>
                </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-6 col-md-6 col-sm-6 col-6 mb-4">
        <div class="card b-radius card-noborder bg-gradient-red-soft" style="height: 100%">
          <div class="card-body pb-0 pt-3 pr-5 pl-5">
            <h3 class="font-weight-semibold mb-3 text-white text-center">Struktur & Proses</h3>
            <div class="d-flex justify-content-between">
              <h5 class="font-weight mb-0 text-white">Lingkungan Pengendalian</h5>
              <h5 class="font-weight mb-0 text-white">{{ $s_p_1 }}</p>
            </div>
            <div class="d-flex justify-content-between">
              <h5 class="font-weight mb-0 text-white">Penilaian Risiko</h5>
              <h5 class="font-weight mb-0 text-white">{{ $s_p_2 }}</p>
            </div>
            <div class="d-flex justify-content-between">
              <h5 class="font-weight mb-0 text-white">Kegiatan Pengendalian</h5>
              <h5 class="font-weight mb-0 text-white">{{ $s_p_3 }}</p>
            </div>
            <div class="d-flex justify-content-between">
              <h5 class="font-weight mb-0 text-white">Informasi & Komunikasi</h5>
              <h5 class="font-weight mb-0 text-white">{{ $s_p_4 }}</p>
            </div>
            <div class="d-flex justify-content-between">
              <h5 class="font-weight mb-0 text-white">Monitoring</h5>
              <h5 class="font-weight mb-0 text-white">{{ $s_p_5 }}</p>
            </div>
            <p class="mb-0 text-white">{{$tahun_now}}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="col-lg-12 col-md-12 col-sm-12 col-12 mb-4">
    <div class="card b-radius card-noborder">
      <div class="card-body">
        <div class="row">
          <div class="d-flex justify-content-between col-12">
            <h4 class="font-weight m-0">Atensi</h4>
            <button type="button" class="btn btn-filter-custom">View All</button>
          </div>
          <table class="table table-striped mt-4">
            <tbody>
              <tr>
                <td> Sasaran Kegiatan belum dinilai </td>
                <td class="col-1"> <label class="badge badge-warning">{{ $a_sasaran }}</label> </td>
              </tr>
              <tr>
                <td> Indikator Kinerja Kegiatan belum dinilai </td>
                <td class="col-1"> <label class="badge badge-warning">{{ $a_ikk }}</label> </td>
              </tr>
              <tr>
                <td> Target Kegiatan belum dinilai </td>
                <td class="col-1"> <label class="badge badge-warning">{{ $a_target }}</label> </td>
              </tr>
              <tr>
                <td> Pegawai belum mengisi kuesioner </td>
                <td class="col-1"> <label class="badge badge-warning">{{ $res_belum }}</label> </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
@section('script')
<script src="{{ asset('js/dashboard/script.js') }}"></script>
<script src="{{ asset('plugins/js/Chart.min.js') }}"></script>
<script src="{{ asset('plugins/js/ChartRadius.js') }}"></script>
<script type="text/javascript">
@if ($message = Session::get('update_success'))
  swal(
      "Berhasil!",
      "{{ $message }}",
      "success"
  );
@endif

</script>
@endsection
