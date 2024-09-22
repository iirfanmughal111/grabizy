@extends('admin/master')
@section("headstatus_value")
Product Status
@endsection

@section("bodyContent")


<div class="body flex-grow-1 px-3">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-header">Create Status</div>
                <div class="card-body">
                    <div class="row ">
                        <div class="row">
                            
                            @if ($errors->any())
                            @foreach ($errors->all() as $error)
                            <div class="alert alert-danger" role="alert">
                                    {{$error}}
                                </div>
                            @endforeach
                            @endif
                                                 
                            <div class="col-12 d-flex justify-content-end">

                                @if(session('status'))
                                <div class="alert alert-success" role="alert">
                                    {{session('status')}}
                                </div>

                                @endif
                                <a type="button" href="{{url('admin/status')}}" class=" btn-default btn-danger"
                                    data-bs-dismiss="modal">Cancel</a>

                            </div>
                        </div>
                        <div class="col-12 ">

                            <form method="post"  action="{{url('admin/status/save')}} "
                                id="addEditStatusForm">
                                @csrf
                                <div class=" mb-3">
                                    <label class="default-input-field custom-input">
                                        <input type="text" id="status_value" name="status_value" value="{{ $status->value  ?? old('status_value') }}"
                                            aria-describedby="status_value" placeholder="&nbsp;" />
                                        <span class="default-input-placeholder">Status Value</span>
                                        <span class="default-input-border"></span>
                                    </label>

                                </div>
                                <div class=" mb-3">
                                    <label class="default-input-field custom-input">
                                        <input type="text" id="status_message" name="status_message" value="{{ $status->message  ?? old('status_message') }}"
                                            aria-describedby="status_message" placeholder="&nbsp;" />
                                        <span class="default-input-placeholder">Status Message</span>
                                        <span class="default-input-border"></span>
                                    </label>

                                </div>


                                <input type="hidden" class="form-control" value="{{$status->id ?? 'null'}}" id="status_id"
                                    name="status_id">

                                <button type="submit" id="addEditStatusFormBtn"
                                    class="btn-default btn-primary">{{trans('global.submit')}}</button>

                            </form>


                        </div>

                    </div>
                </div>

            </div>
        </div>
        <!-- /.col-->
    </div>

    @endsection


    @section('additionolJs')



    @endsection