<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'AuthManageController@viewLogin')->name('landing');

Route::get('/login', 'AuthManageController@viewLogin')->name('login');
Route::post('/verify_login', 'AuthManageController@verifyLogin');
Route::post('/first_account', 'UserManageController@firstAccount');
Route::get('/report', 'ReportManageController@report');
Route::get('/report/{id}', 'ReportManageController@reportId')->name('reportId');

Route::group(['middleware' => ['auth', 'checkRole:superadmin,admin,petugas,responden,monitor']], function(){
	Route::get('/logout', 'AuthManageController@logoutProcess');
	Route::get('/dashboard', 'ViewManageController@viewDashboard');
	Route::get('/dashboard/chart/{filter}', 'ViewManageController@filterChartDashboard');
	Route::post('/market/update', 'ViewManageController@updateMarket');
	// -------------------------Struktur & Proses -------------------
	// > Struktur & Proses
	Route::get('/struktur','StrukturProsesController@viewStruktur')->name('struktur');
	Route::get('/struktur/kuesioner','StrukturProsesController@viewPenilaian')->name('struktur.kuesioner');
	Route::post('/struktur/responden/add','StrukturProsesController@tambahResponden')->name('struktur.responden.add');
	Route::get('/struktur/kuesioner/{id_mapping}/{tipe_kuesioner}','StrukturProsesController@formKuesioner')->name('struktur.kuesioner.mapping');
	Route::post('/struktur/kuesioner/create','StrukturProsesController@createKuesioner')->name('struktur.kuesioner')->name('struktur.kuesioner.create');


	// > Penetapan Tujuan
	Route::get('/penetapan','PenetapanController@viewPenetapan')->name('penetapan');
	Route::get('/penetapan/penilaian','PenetapanController@penilaianPenetapan')->name('penetapan.penilaian');
	Route::post('/penetapan/penilaian/create','PenetapanController@penilaianCreate')->name('penetapan.penilaian.create');
	Route::post('/penetapan/addsasaran','PenetapanController@addSasaran')->name('penetapan.addsasaran');
	Route::post('/penetapan/addoutput/','PenetapanController@addOutput')->name('penetapan.addoutput');
	Route::get('/penetapan/addoutput/{sasaran_id}','PenetapanController@getSasaran')->name('penetapan.getsasaran');
	Route::get('/penetapan/editoutput/{id}','PenetapanController@getOutput')->name('penetapan.getoutput');
	Route::post('/penetapan/editoutput','PenetapanController@editOutput')->name('penetapan.editoutput');
	Route::get('/penetapan/editsasaran/{sasaran_id}','PenetapanController@getSasaran');
	Route::post('/penetapan/editsasaran','PenetapanController@editSasaran')->name('penetapan.editsasaran');
	Route::delete('/penetapan/deleteoutput','PenetapanController@deleteOutput')->name('penetapan.deleteoutput');
	Route::delete('/penetapan/deletesasaran','PenetapanController@deleteSasaran')->name('penetapan.deletesasaran');


	// > Pencapaian Tujuan
	Route::get('/pencapaian','TujuanController@viewPencapaian')->name('pencapaian');
	Route::get('/pencapaian/penilaian','TujuanController@penilaianPencapaian')->name('pencapaian.penilaian');
	Route::post('/pencapaian/penilaian/create','TujuanController@penilaianCreate')->name('pencapaian.penilaian.create');
	Route::post('/pencapaian/addsasaran','TujuanController@addSasaran')->name('pencapaian.addsasaran');
	Route::post('/pencapaian/addoutput/','TujuanController@addOutput')->name('pencapaian.addoutput');
	Route::post('/pencapaian/addrealisasi/','TujuanController@addRealisasi')->name('pencapaian.addrealisasi');
	Route::get('/pencapaian/addoutput/{sasaran_id}','TujuanController@getSasaran')->name('pencapaian.getsasaran');
	Route::get('/pencapaian/getsasaranpenilaian/{sasaran_id}','TujuanController@getSasaranPenilaian')->name('pencapaian.getsasaranpenilaian');
	Route::get('/pencapaian/editoutput/{id}','TujuanController@getOutput')->name('pencapaian.getoutput');
	Route::get('/pencapaian/editoutputpenilaian/{id}','TujuanController@getOutputPenilaian')->name('pencapaian.getoutputpenilaian');
	Route::post('/pencapaian/editoutput','TujuanController@editOutput')->name('pencapaian.editoutput');
	Route::post('/pencapaian/editoutputrealisasi','TujuanController@editOutputRealisasi')->name('pencapaian.editoutputrealisasi');
	Route::get('/pencapaian/editsasaran/{sasaran_id}','TujuanController@getSasaran');
	Route::post('/pencapaian/editsasaran','TujuanController@editSasaran')->name('pencapaian.editsasaran');
	Route::delete('/pencapaian/deleteoutput','TujuanController@deleteOutput')->name('pencapaian.deleteoutput');
	Route::delete('/pencapaian/deletesasaran','TujuanController@deleteSasaran')->name('pencapaian.deletesasaran');

	
	// ------------------------- Fitur Cari -------------------------
	Route::get('/search/{word}', 'SearchManageController@searchPage');
	// ------------------------- Profil -------------------------
	Route::get('/profile', 'ProfileManageController@viewProfile');
	Route::post('/profile/update/data', 'ProfileManageController@changeData');
	Route::post('/profile/update/password', 'ProfileManageController@changePassword');
	Route::post('/profile/update/picture', 'ProfileManageController@changePicture');
	// ------------------------- Kelola Akun -------------------------
	// > Akun
	Route::get('/account', 'UserManageController@viewAccount');
	Route::get('/account/new', 'UserManageController@viewNewAccount');
	Route::post('/account/create', 'UserManageController@createAccount');
	Route::get('/account/edit/{id}', 'UserManageController@editAccount');
	Route::post('/account/update', 'UserManageController@updateAccount');
	Route::get('/account/delete/{id}', 'UserManageController@deleteAccount');
	Route::get('/account/filter/{id}', 'UserManageController@filterTable');
	// ----------------------- Kelola Satker ---------------------------
	// > Satker
	Route::get('/satker', 'SatkerManageController@viewSatker');
	Route::get('/satker/edit/{id}', 'SatkerManageController@editSatker');
	Route::post('/satker/update', 'SatkerManageController@updateSatker');
	Route::get('/satker/new', 'SatkerManageController@viewNewSatker');
	Route::post('/satker/create', 'SatkerManageController@createSatker');
	Route::get('/satker/delete/{id}', 'SatkerManageController@deleteSatker');
	// > Akses
	Route::get('/access', 'AccessManageController@viewAccess');
	Route::get('/access/change/{user}/{access}', 'AccessManageController@changeAccess');
	Route::get('/access/check/{user}', 'AccessManageController@checkAccess');
	Route::get('/access/sidebar', 'AccessManageController@sidebarRefresh');
	// ------------------------- Kelola Barang -------------------------
	// > Barang
	Route::get('/product', 'ProductManageController@viewProduct');
	Route::get('/product/new', 'ProductManageController@viewNewProduct');
	Route::post('/product/create', 'ProductManageController@createProduct');
	Route::post('/product/import', 'ProductManageController@importProduct');
	Route::get('/product/edit/{id}', 'ProductManageController@editProduct');
	Route::post('/product/update', 'ProductManageController@updateProduct');
	Route::get('/product/delete/{id}', 'ProductManageController@deleteProduct');
	Route::get('/product/filter/{id}', 'ProductManageController@filterTable');
	// > Pasok
	Route::get('/supply/system/{id}', 'SupplyManageController@supplySystem');
	Route::get('/supply', 'SupplyManageController@viewSupply');
	Route::get('/supply/new', 'SupplyManageController@viewNewSupply');
	Route::get('/supply/check/{id}', 'SupplyManageController@checkSupplyCheck');
	Route::get('/supply/data/{id}', 'SupplyManageController@checkSupplyData');
	Route::post('/supply/create', 'SupplyManageController@createSupply');
	Route::post('/supply/import', 'SupplyManageController@importSupply');
	Route::get('/supply/statistics', 'SupplyManageController@statisticsSupply');
	Route::get('/supply/statistics/product/{id}', 'SupplyManageController@statisticsProduct');
	Route::get('/supply/statistics/users/{id}', 'SupplyManageController@statisticsUsers');
	Route::get('/supply/statistics/table/{id}', 'SupplyManageController@statisticsTable');
	Route::post('/supply/statistics/export', 'SupplyManageController@exportSupply');
	// ------------------------- Transaksi -------------------------
	Route::get('/transaction', 'TransactionManageController@viewTransaction');
	Route::get('/transaction/product/{id}', 'TransactionManageController@transactionProduct');
	Route::get('/transaction/product/check/{id}', 'TransactionManageController@transactionProductCheck');
	Route::post('/transaction/process', 'TransactionManageController@transactionProcess');
	Route::get('/transaction/receipt/{id}', 'TransactionManageController@receiptTransaction');
	// ------------------------- Kelola Laporan -------------------------
	
	Route::get('/report/transaction', 'ReportManageController@reportTransaction');
	Route::post('/report/transaction/filter', 'ReportManageController@filterTransaction');
	Route::get('/report/transaction/chart/{id}', 'ReportManageController@chartTransaction');
	Route::post('/report/transaction/export', 'ReportManageController@exportTransaction');
	Route::get('/report/workers', 'ReportManageController@reportWorker');
	Route::get('/report/workers/filter/{id}', 'ReportManageController@filterWorker');
	Route::get('/report/workers/detail/{id}', 'ReportManageController@detailWorker');
	Route::post('/report/workers/export/{id}', 'ReportManageController@exportWorker');
});

// Auth::routes();
// Route::get('/home', 'HomeController@index')->name('home');