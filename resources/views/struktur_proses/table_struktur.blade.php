@foreach ($respondens as $key => $responden)
<tr>
<td class="col-1"> {{$respondens->firstItem() + $key}} </td>
<td class="py-1 col-2">
    <img src="{{ asset('pictures/' . $responden->user->foto) }}" alt="image">
</td>
<td class="col-3" style="white-space: normal;">{{$responden->user->nama}}</td>
<td class="col-2" style="white-space: normal;">
    {{$responden->user->email}}
</td>
<td class="col-4">
    <div class="row">
    <p class="col-1 m-0">{{$responden->kuesioner->tipe_kuesioner}} - </p>
    <p class="col-11 m-0" style="white-space: normal;">{{$responden->kuesioner->uraian_tipe_kuesioner}}</p>
    </div>
</td>
<td class="col-1">
    <button type="button" class="btn-delete btn btn-secondary pl-2 pr-2" data-token="{{ csrf_token() }}" data-delete="{{ $responden->id }}">
    <strong><span aria-hidden="true">&times;</span></strong>
    </button>
</td>
</tr>
@endforeach