$(document).ready(function() {

    const base_url = window.location.origin;   

    // #ajax setup#
    $(function() {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    });
    // var jsFeatured = $('#featured').is(":checked");

  
    $(document).on('click','.switch_statusStaff', function(e) {

if($(this).is(":checked")){
    var staff_status = 'allow';
}
else if($(this).is(":not(:checked)")){
    var staff_status = 'ban';
}
var role_name = $(this).attr('data-role-name');
var perm_name = $(this).attr('data-perm-name');

var csrf_token = $('meta[name="csrf-token"]').attr('content');
$.ajax({
    type: "POST",
    dataType: 'json',
     url: base_url+'/admin/permissions/enable-disable',

    data: {status:staff_status,role:role_name,perm:perm_name,_token:csrf_token},
    success: function(data) {
         // IF TRUE THEN SHOW SUCCESS MESSAGE  

            notification(data.success, data.msg, 3000);
    
    },
    error: function(xhr, status, error) {
            notification(false, xhr.responseText, 3000);

    //	console.log(xhr.responseText);
      }
});

});


});

