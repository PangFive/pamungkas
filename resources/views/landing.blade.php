<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>

    <!-- CSS -->
    <link rel="stylesheet" href="{{ asset('assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/iconfonts/ionicons/css/ionicons.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/iconfonts/typicons/src/font/typicons.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/css/vendor.bundle.base.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/css/vendor.bundle.addons.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/shared/style.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/css/sweetalert.css') }}">
    <link rel="stylesheet" href="{{ asset('css/login/style.css') }}">
    <link rel="shortcut icon" href="{{ asset('icons/favicon.png') }}"/>
    <link rel="stylesheet" href="{{ asset('css/dashboard/style.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/iconfonts/font-awesome/css/font-awesome.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/animate.min.css') }}"/>
    <!-- End-CSS -->
    <style>
      .margin-img{
        margin-left:-10%; 
        margin-right:5%; 
        max-width: 60%; 
        height: auto;

        -webkit-transition: all 0.2s linear;
        -moz-transition: all 0.2s linear;
        -o-transition: all 0.2s linear;
        transition: all 0.2s linear;
      }
      
      .margin-img-landing{
        margin-left:5%; 
        margin-right:-10%; 
        max-width: 60%; 
        height: auto;
      }
    </style>
    
    {{-- <img class="" src="{{ asset('icons/hero/logo.svg') }}" alt="logo" /> --}}
  </head>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="pl-5 pr-5 animate__animated animate__fadeInDown">
          <nav class="navbar navbar-expand pl-5 pr-5 navbar-light bg-light" style="min-height: 10vh">
            <div class="collapse navbar-collapse" id="navbarText">
              <a href="/"><img class="" src="{{ asset('icons/hero/logo.svg') }}" alt="logo" /></a>
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="#">About <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Blog</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Contact</a>
                </li>
              </ul>
            </div>
          </nav>
        </div>
        <div class="content-wrapper d-flex justify-content-center align-items-center auth login-page theme-one">
          <div class="row animate__animated animate__fadeIn" id="landing">
            <div class="col-lg-12 mr-5 ml-4">
             <h1 class="font-weight-bold" style="font-size: 80px">New SPIP</h1>
             <p style="font-size: 20px">Monitoring Berkelanjutan Penilaian Mandiri Maturitas SPIP  </br>Unit Kerja Eselon II</p>
             <button class="btn btn-simpan btn-to-login btn-lg" style=" border-radius:15px">Klik untuk login</button>
            </div>
          </div>
          <img id="imgLanding" class="d-none d-xl-block margin-img-landing animate__animated animate__bounceInRight" src="{{ asset('icons/icon_login.svg') }}" alt="logo" />
          <div class="row d-none animate__animated animate__fadeIn" id="loginLanding">
            <div class="col-lg-12">
              <div class="auto-form-wrapper">
                @if($users != 0)
                <h2 class="h3 mb-4 font-weight-bold">Login to your account</h2>
                <form action="{{ url('/verify_login') }}" method="post" name="login_form">
                  @csrf
                  <div class="form-group">
                    <label class="label">Email</label>
                    <div class="input-group">
                      <input type="text" class="form-control" name="email" placeholder="Email">
                      <div class="input-group-append">
                        <span class="input-group-text check-value" id="email_error"></span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="label">Password</label>
                    <div class="input-group">
                      <input type="password" class="form-control" name="password" placeholder="*********">
                      <div class="input-group-append">
                        <span class="input-group-text check-value" id="password_error"></span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <button type="submit" class="btn btn-simpan btn-lg" style="width: 100%; border-radius:15px">Login now</button>
                  </div>
                </form>
                @else
                <form action="{{ url('/first_account') }}" method="post" name="create_form">
                  @csrf
                  <div class="form-group">
                    <label class="label">Nama</label>
                    <div class="input-group">
                      <input type="text" class="form-control" name="nama" placeholder="Nama">
                      <div class="input-group-append">
                        <span class="input-group-text check-value" id="nama_error"></span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="label">Email</label>
                    <div class="input-group">
                      <input type="email" class="form-control" name="email" placeholder="Email">
                      <div class="input-group-append">
                        <span class="input-group-text check-value" id="email_error"></span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="label">Username</label>
                    <div class="input-group">
                      <input type="text" class="form-control" name="username_2" placeholder="Username">
                      <div class="input-group-append">
                        <span class="input-group-text check-value" id="username_2_error"></span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="label">Password</label>
                    <div class="input-group">
                      <input type="password" class="form-control" name="password_2" placeholder="*********">
                      <div class="input-group-append">
                        <span class="input-group-text check-value" id="password_2_error"></span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <button class="btn btn-primary submit-btn btn-block">Buat Akun</button>
                  </div>
                </form>
                @endif
              </div>
              <p class="mt-3 footer-text text-center" style="color: grey">copyright © 2021 Podjok 28 - BPKP Kepri</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Javascript -->
    <script src="{{ asset('assets/vendors/js/vendor.bundle.base.js') }}"></script>
    <script src="{{ asset('assets/vendors/js/vendor.bundle.addons.js') }}"></script>
    <script src="{{ asset('assets/js/shared/off-canvas.js') }}"></script>
    <script src="{{ asset('assets/js/shared/misc.js') }}"></script>
    <script src="{{ asset('plugins/js/jquery.form-validator.min.js') }}"></script>
    <script src="{{ asset('plugins/js/sweetalert.min.js') }}"></script>
    <script src="{{ asset('js/login/script.js') }}"></script>
    <script type="text/javascript">
      @if ($message = Session::get('create_success'))
        swal(
            "Berhasil!",
            "{{ $message }}",
            "success"
        );
      @endif

      @if ($message = Session::get('login_failed'))
        swal(
            "Gagal!",
            "{{ $message }}",
            "error"
        );
      @endif
      $(document).on('click', '.btn-to-login', function(){
          
          $('#landing').addClass('d-none');
          $('#imgLanding').removeClass('margin-img-landing');
          $('#imgLanding').addClass('margin-img');
          $('#loginLanding').removeClass('d-none');
          
      });

    </script>
    <!-- End-Javascript -->

  </body>
</html>