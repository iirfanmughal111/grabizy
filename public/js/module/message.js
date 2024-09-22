$(document).ready(function() {

    var viewMessageModal = document.getElementById('viewMessageModal')
viewMessageModal.addEventListener('show.bs.modal', function(event) {
    // Button that triggered the modal
    var button = event.relatedTarget;
    var message = JSON.parse(button.getAttribute('data-msg'));
    
    if (message) {
        $('.modal-title').html(message.name);

        $('#msg_name').html(message.name);
        $('#msg_email').html(message.email);

        $('#msg_subject').html(message.subject);

        $('#msg_message').html(message.message);
        markasRead(message.id);

    }
});

function markasRead(msg_id){
    var csrf_token = $('meta[name="csrf-token"]').attr('content');
    $.ajax({
        type: "POST",
        dataType: 'json',
        data: {msg_id:msg_id,_token:csrf_token},

        url: base_url + '/admin/messages/read',

        success: function(data) {
            console.log(data);
        },

        error: function(xhr, status, error) {
            	alert(xhr.responseText);

            // $('#addEditCategoryFormBtn').html('Save');

            // var errorsResponse = JSON.parse(xhr.responseText);
            // var errors = errorsResponse['errors'];
            // const propertyNames = Object.keys(errors);
            // const toNumericPairs = input => {
            //     const entries = Object.entries(errors);
            //     entries.forEach(entry => entry[0] = +entry[0]);
            //     return entries;
            // }
            // var tempError = toNumericPairs(errors);
            // let errorList = ' ';

            // for (var i = 0; i < propertyNames.length; i++) {

            //     errorList += '<li>' + tempError[i][1] + '</li>'

            // }
            // notification(false, errorList, 3000);

        }

    });

}
});
