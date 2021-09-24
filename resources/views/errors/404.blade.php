<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-AU-compatible" content="ie=edge">
    <link rel="stylesheet" href="{{ asset('assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/iconfonts/ionicons/css/ionicons.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/iconfonts/typicons/src/font/typicons.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/css/vendor.bundle.base.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/css/vendor.bundle.addons.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/shared/style.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/scss/demo_1/style.css') }}">
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="{{ asset('css/main/style.css') }}">
    <link rel="shortcut icon" href="{{ asset('icons/favicon.png') }}"/>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/dashboard/style.css') }}">
    <title>Page Not Found</title>
    <style>
        
        .animation{
            height: auto;
            
        }

        html { height: 100%; }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }
    </style>
</head>
<body>
    <div id="anim" >
        <lottie-player src="{{ asset('animation/4047-404-animation.json') }}"  background="transparent"  speed="1"  style="width: 90%; height: auto; margin-left:10%"  loop  autoplay></lottie-player>
        <div class="row mx-auto" id="landing">
            <div class="col-lg-12 mr-5 ml-4 text-center">
             <h1 class="font-weight-bold mb-4 text-muted" style="font-size: 40px">Halaman yang kamu cari tidak tersedia</h1>
             <button onclick="goBack()" class="btn btn-simpan btn-to-login btn-lg"style=" border-radius:15px">Kembali</button>
            </div>
          </div>
    </div>
    <script src="{{ asset('js/lottie.js') }}"></script>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>