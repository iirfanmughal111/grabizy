
$( document ).ready(function() {

    var creatUserModal = document.getElementById('creatUserModal')
    creatUserModal.addEventListener('show.bs.modal', function (event) {
      // Button that triggered the modal
      var button = event.relatedTarget;
      var user = JSON.parse(button.getAttribute('data-user'));
      var role = button.getAttribute('data-role');
      $('#addEditUserFormBtn').html('Save');
      $('#Name').val('');
      $('#email').val('');
      $('#userId').val('null');
      $('#password').val('');
      $('#password').attr('placeholder','For security password not visible,Generate new one');
      $('#addEditUserImage').attr('src', base_url + '/no-image.png');
      $('#role').val('user');
      
      if(user){
    
      $('#Name').attr('value',user.name);
      $('#Name').val(user.name);
      $('#email').attr('value',user.email);
      $('#email').val(user.email);
      $('#userId').attr('value',user.id);
      $('#password').val('');
      
      $('#password').attr('placeholder','For security password not visible,Generate new one');
      const changeSelected = (e) => {
    
      const $select = document.getElementById("role");
      $select.value = role;
    
    };
      changeSelected();

      
      let imageExist = fileExists(base_url + '/uploads/user/' + userId);
      if (imageExist) {
            $('#addEditUserImage').attr('alt',userId);
            $('#addEditUserImage').attr('src',base_url + '/uploads/user/' + userId);
        }
      }
     
    });
    
      var deleteUserModal = document.getElementById('deleteUserModal')
      deleteUserModal.addEventListener('show.bs.modal', function (event) {
      var button = event.relatedTarget;
      var userId = button.getAttribute('data-userId');
      $('#deleteUserFormBtn').html('Delete');
      $('#deleteUserImage').attr('src', base_url + '/no-image.png');

      
      if(userId){
    
      $('#deleteUserId').attr('value',userId);

      let imageExist = fileExists(base_url + '/uploads/user/' + userId);
        if (imageExist) {
              $('#deleteUserImage').attr('alt',userId);
              $('#deleteUserImage').attr('src',base_url + '/uploads/user/' + userId);
          }
      }
     
    });

    var deletePermUserModal = document.getElementById('deletePermUserModal')
      deletePermUserModal.addEventListener('show.bs.modal', function (event) {
      var button = event.relatedTarget;
      var userPermId = button.getAttribute('data-perm-userId');
      $('#deletePermUserFormBtn').html('Delete');
      $('#deletePermUserImage').attr('src', base_url + '/no-image.png');

      
      if(userPermId){
    
      $('#deletePermUserId').attr('value',userPermId);

      let imageExist = fileExists(base_url + '/uploads/user/' + userPermId);
        if (imageExist) {
              $('#deletePermUserImage').attr('alt',userPermId);
              $('#deletePermUserImage').attr('src',base_url + '/uploads/user/' + userPermId);
          }
      }
     
    });
    
    function fileExists(url) {
      if (url) {
          var req = new XMLHttpRequest();
          req.open('GET', url, false);
          req.send();
          return req.status == 200;
      } else {
          return false;
      }
  }
    
    $(document).on('click','#addEditUserFormBtn', function(e) {
        e.preventDefault(); 
        $('#addEditUserFormBtn').html('Loading...');
    
        var csrf_token = $('meta[name="csrf-token"]').attr('content');
        var jsuserId = $('#userId').val();
        var jsName = $('#Name').val();
    
        var jsemail = $('#email').val();
    
        var jspassword = $('#password').val();
    
        var jsrole = $('#role').val();
    
        $.ajax({
            type: "POST",
            dataType: 'json',
            url: base_url+'/admin/users/save',
            data: {_token:csrf_token,userId:jsuserId,Name:jsName,email:jsemail,role:jsrole,password:jspassword,},
            success: function(data) {
    
                    notification(data.success,data.msg,2800);
                     setTimeout(function(){ $('#creatUserModal').modal('hide');
                         $("#creatUserModal .btn-close").click();
                     }, 1000);
                        if (data.success){
                             setTimeout(function(){
                              window.location.href = base_url+'/admin/users'; 
                      }, 3000);
    
                      }
                    
                
            },
            
            error: function(xhr, status, error) {
            $('#addEditUserFormBtn').html('Save');
    
            var errorsResponse = JSON.parse(xhr.responseText);
            var errors = errorsResponse['errors'];
            const propertyNames = Object.keys(errors);
            const toNumericPairs = input => {
                    const entries = Object.entries(errors);
                    entries.forEach(entry => entry[0] = +entry[0]);
                    return entries;
                }
                var tempError = toNumericPairs(errors);
                let errorList = ' ';
    
                    for(var i = 0; i < propertyNames.length;i++){
                        
                    errorList += '<li>'+ tempError[i][1] +'</li>'
    
                    }
                    notification(false,errorList,3000);
    
            //	alert(xhr.responseText);
              }
    
        });
    });

    $(document).on('click','.switch_statusUser', function(e) {
	
      if($(this).is(":checked")){
        var user_status = 1;
      }
      else if($(this).is(":not(:checked)")){
        var user_status = 0;
      }
      var user_id = $(this).attr('data-user-id');

      var csrf_token = $('meta[name="csrf-token"]').attr('content');
      $.ajax({
            type: "POST",
        dataType: 'json',
             url: base_url+'/admin/users/enable-disable',
    
            data: {status:user_status,user_id:user_id,_token:csrf_token},
            success: function(data) {
                 // IF TRUE THEN SHOW SUCCESS MESSAGE  
        
            notification(data.success, data.msg, 2800);
        
            },
        error: function(xhr, status, error) {
        //	console.log(xhr.responseText);
          }
        });
      
    })
    
    $(document).on('click','#deleteUserFormBtn', function(e) {
        e.preventDefault(); 
        $('#deleteUserFormBtn').html('Loading...');

    
        var csrf_token = $('meta[name="csrf-token"]').attr('content');
        var userId = $('#deleteUserId').val();
        $.ajax({
            type: "POST",
            dataType: 'json',
            url: base_url+'/admin/users/delete',
            data: {_token:csrf_token,userId:userId},
            success: function(data) {
                        
                     if (data.success){
                    let userRow =document.getElementById('user-row-'+userId);
                     userRow.remove();
    
                     }
                    notification(data.success,data.msg,2800);
                    setTimeout(function(){ $('#deleteUserModal').modal('hide');
                        $("#deleteUserModal .btn-close").click();
                    }, 1000);
                    
                
            },
            
            error: function(xhr, status, error) {
                alert(xhr.responseText);
              }
        });
    });

    var restoreUserModal = document.getElementById('restoreUserModal')
    restoreUserModal.addEventListener('show.bs.modal', function(event) {
      // Button that triggered the modal
      var button = event.relatedTarget;
      var user = JSON.parse(button.getAttribute('data-restore-user'));
      console.log(user);
      $('#restoreUserFormBtn').html('Restore');
      $('#restoreUserImage').attr('src', base_url + '/no-image.png');
      if (user) {
        $('#restoreUserId').attr('value', user.id);
        let imageExist = fileExists(base_url + '/uploads/user/' + user.image_url);
        if (imageExist) {
          $('#restoreUserImage').attr('alt', user.name);
          $('#restoreUserImage').attr('src', base_url + '/uploads/user/' + user.image_url);
        }
      }
    });


    $(document).on('click', '#restoreUserFormBtn', function(e) {
      e.preventDefault();
      $('#restoreUserFormBtn').html('Loading...');
  
      var csrf_token = $('meta[name="csrf-token"]').attr('content');
      var jsUserId = $('#restoreUserId').val();
      $.ajax({
        type: "POST",
        dataType: 'json',
        url: base_url + '/admin/users/restore',
        data: {
          _token: csrf_token,
          restoreUserId: jsUserId
        },
        success: function(data) {
  
          if (data.success) {
            let userRow = document.getElementById('user-row-' + jsUserId);
            userRow.remove();
          }
          notification(data.success, data.msg, 2800);
          console.log(data.success + ' -> ' + data.msg);
  
          setTimeout(function() {
            $('#restoreUserModal').modal('hide');
            $("#restoreUserModal .btn-close").click();
          }, 1000);
  

        },
  
        error: function(xhr, status, error) {
          console.log(xhr.responseText);
        }
  
      });
    });

   
  
$(document).on('click','.permDeleteUserFormBtn', function(e) {
  e.preventDefault(); 
  $('#deleteUserFormBtn').html('Loading...');

  var csrf_token = $('meta[name="csrf-token"]').attr('content');
  var userId = $('#deletePermUserId').val();
  $.ajax({
      type: "POST",
      dataType: 'json',
      url: base_url+'/admin/users/delete-permanent',
      data: {_token:csrf_token,userId:userId},
      success: function(data) {
                  
               if (data.success){
              let userRow =document.getElementById('user-row-'+userId);
               userRow.remove();

               }
              notification(data.success,data.msg,2800);
              setTimeout(function(){ $('#deletePermUserModal').modal('hide');
                  $("#deletePermUserModal .btn-close").click();
              }, 1000);
          
      },
      
      error: function(xhr, status, error) {
         // console.log(xhr.responseText);
        }
  });
});

/**User location */


      $(document).on('click','.location-btn', function(e) {
        e.preventDefault(); 
        var user = $(this).data('user');
        var csrf_token = $('meta[name="csrf-token"]').attr('content');
          $.ajax({
            dataType: 'json', 
            method: 'post',
            url: 'users/location',
            data: {
                ipAddress: user.last_ip,
                _token: csrf_token,
            }, 
            success: function(data, status, xhr) { 

                if (data.success) {
                  $('#ip').html(data['location']['ip']);
                  $('#country_loc').html(data['location']['countryName']);
                  $('#region').html(data['location']['regionName']);
                  $('#city').html(data['location']['cityName']);
                  $('#zipcode').html(data['location']['zipCode']);
                  $('#timezone').html(data['location']['timezone']);
                  $('#latitude').html(data['location']['latitude']);
                  $('#longitude').html(data['location']['longitude']);
                $('#viewLocationImage').attr('src', base_url + '/no-image.png');
                if (user) {
                  if (user.profile){
                  let imageExist = fileExists(base_url + '/uploads/user/' + user.profile.profile_image);
                    if (imageExist) {
                      $('#viewLocationImage').attr('alt', user.name);
                      $('#viewLocationImage').attr('src', base_url + '/uploads/user/' + user.profile.profile_image);
                    }
                  }
                  $('#location-msg').html(data.msg);
                $('#viewLocationModal').modal('toggle');
                }
              }else{
                  notification(data.success, data.msg,2800);
              }
            },
            error: function(xhr, status, error) {
              //     console.log(xhr.responseText);
                 }
          });
      });
      


});