@extends('admin/master')
@section("headTitle")
Dashbord
@endsection

@section("bodyContent")
@include('admin.user.viewLocationModal')

<div class="body flex-grow-1 px-3">
        <div class="container-lg">
          <div class="row">
            <div class="col-sm-6 col-lg-3">
              <div class="card mb-4 text-white bg-primary">
                <div class="card-body pb-0 d-flex justify-content-between align-items-start">
                  <div>
                    <div class="fs-4 fw-semibold">{{$counts['users']}} <span class="fs-6 fw-normal"><i class="fa-solid fa-users nav-icon"></i></span></div>
                    <div>Users</div>
                  </div>
                 
                </div>
                <div class="c-chart-wrapper mt-3 mx-3" style="height:70px;">
                  <canvas class="chart" id="card-chart1" height="70"></canvas>
                </div>
              </div>
            </div>
            <!-- /.col-->
            <div class="col-sm-6 col-lg-3">
              <div class="card mb-4 text-white bg-info">
                <div class="card-body pb-0 d-flex justify-content-between align-items-start">
                  <div>
                    <div class="fs-4 fw-semibold">{{$counts['categories']}} <span class="fs-6 fw-normal"><i class="fa-brands fa-squarespace nav-icon"></i></span>
                      </div>
                    <div>Active Categories</div>
                  </div>
                 
                </div>
                <div class="c-chart-wrapper mt-3 mx-3" style="height:70px;">
                  <canvas class="chart" id="card-chart2" height="70"></canvas>
                </div>
              </div>
            </div>
            <!-- /.col-->
            <div class="col-sm-6 col-lg-3">
              <div class="card mb-4 text-white bg-warning">
                <div class="card-body pb-0 d-flex justify-content-between align-items-start">
                  <div>
                    <div class="fs-4 fw-semibold">{{$counts['products']}} <span class="fs-6 fw-normal"><i class="fa-solid fa-box-open nav-icon"></i></span></div>
                    <div>Products</div>
                  </div>
                  
                </div>
                <div class="c-chart-wrapper mt-3" style="height:70px;">
                  <canvas class="chart" id="card-chart3" height="70"></canvas>
                </div>
              </div>
            </div>
            <!-- /.col-->
            <div class="col-sm-6 col-lg-3">
              <div class="card mb-4 text-white bg-danger">
                <div class="card-body pb-0 d-flex justify-content-between align-items-start">
                  <div>
                    <div class="fs-4 fw-semibold">{{$counts['orders']}} <span class="fs-6 fw-normal"><i class="fa-solid fa-truck-fast nav-icon"></i></span></div>
                    <div>Orders</div>
                  </div>
                 
                </div>
                <div class="c-chart-wrapper mt-3 mx-3" style="height:70px;">
                  <canvas class="chart" id="card-chart4" height="70"></canvas>
                </div>
              </div>
            </div>
            <!-- /.col-->
          </div>
          <!-- /.row-->


          <div class="row">
            <div class="col-md-12">
              <div class="card mb-4">
                <div class="card-header">Last Acitve Users</div>
                <div class="card-body">
                  <div class="row">

                  <div class="table-responsive px-4">
                    <table class="table border mb-0">
                      <thead class="table-light fw-semibold">
                        <tr class="align-middle">
                          <th class="text-center">
                            Image
                          </th>
                          <th>Name</th>
                          <th >Last IP</th>
                          <th>Email</th>
                          <th class="text-center">Order Count</th>
                          <th>Activity</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach ($users as $user)
                        
                        <tr class="align-middle">
                          <td class="text-center">
                            <div class="avatar avatar-md">
                              <a href="{{url('admin/users/profile/'.$user->id)}}">
                            @if ($user->Profile && isset($user->Profile->profile_image))

                              <img class=" avatar-img dashboard-image"
                                  src="{{ file_exists(public_path('uploads/user/'.$user->Profile->profile_image)) ? asset('uploads/user/'.$user->Profile->profile_image) : asset('/no-image.png') }}">


                              <input type="hidden" name="old_image"
                                  value="{{$user->Profile->profile_image}}" />
                                  @else
                                  <img class=" avatar-img dashboard-image"
                                  src="{{ file_exists(asset('/no-image.png')) ? asset('/no-image.png') : asset('/no-image.png') }}">
                              @endif
                              </a>
                           </div>
                          </td>
                          <td>
                            <div>{{$user->name}}</div>
                            <div class="small text-medium-emphasis"> Registered: {{$user->created_at}}</div>
                          </td>
                          <td >
                          {{$user->last_ip ? $user->last_ip : '0.0.0.0'}}
                          </td>
                          <td>
                          <div class="fw-semibold">{{$user->email}}</div>
                          <div class="small text-medium-emphasis">
                          @if($user->Profile)
                            {{$user->Profile->address_line1}} {{$user->Profile->address_line1 ? ',' : ''}}
                                    {{$user->Profile->address_line2}} {{$user->Profile->address_line2 ? ',' : ''}} 
                                     {{$user->Profile->city}} {{$user->Profile->city ? ',' : ''}} 
                                    {{$user->Profile->region}} {{$user->Profile->region ? ',' : ''}}
                                     {{$user->Profile->country}}
                                    </span></p>
                            @endif
                          </div>
                          

                           
                          
                          </td>
                          <td class="text-center">
                          {{orderCount($user->id)}}
                          </td>
                          <td>
                            <div class="small text-medium-emphasis">Last login</div>
                                         
                            <div class="fw-semibold">
                              {{ Carbon\Carbon::createFromTimestamp($user->last_active)->toDateTimeString() }} 

                            </div>
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
@section('additionolJs')


@endsection
