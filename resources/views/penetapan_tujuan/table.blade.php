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