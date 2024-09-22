const base_url = window.location.origin;

    


// For ViewSingleFile

var loadFile = function(event) {
    var output = document.getElementById('outputImage');
    output.classList.remove("d-none");
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
        URL.revokeObjectURL(output.src) // free memory
    }
};


function showFiles(event) {
    const images = document.getElementById('show-prod-images');
    const totalImages = document.getElementById('total-prod-images');
    const imageFiles = event.target.files;

    // Show the number of images selected
    totalImages.innerText = imageFiles.length;

    // Empty the images div
    images.innerHTML = '';
    totalImages.classList.remove("d-none");
    if (imageFiles.length > 0) {
        // Loop through all the selected images
        for (const imageFile of imageFiles) {
            const reader = new FileReader();

            // Convert each image file to a string
            reader.readAsDataURL(imageFile);

            // FileReader will emit the load event when the data URL is ready
            // Access the string using reader.result inside the callback function
            reader.addEventListener('load', () => {
                // Create new <img> element and add it to the DOM
                images.innerHTML += `
                <div class="image_box mb-3">
                    <img class="table-image" src='${reader.result}'>
                    <span class='image_name'>${imageFile.name}</span>
                </div>
            `;
            });
        }
    } else {
        // Empty the images div
        images.innerHTML = '';
    }


    
}
notifHTML =
            "<div class='modal-rotate-custom ncf-container nfc-top-right'><div class='ncf success'><p class='ncf-title'>Success</p><p class='nfc-message'>Message</p></div></div>";
            
$(document).ready(function(){
    
    $("#fadeBtn").click(function(){
      $("#div1").fadeIn();
      $("#div2").fadeIn("slow");
      $('#notification').html(notifHTML);
      

    });
            
$('.sidebar_container').css('background', '#001b48');
  });
function notification(type, value, timeout) {

    let notifHTML = '';
    //  $('#notification').css('display', 'none');
    if (type == true) {
        notifHTML =
            "<div class='modal-rotate-custom ncf-container nfc-top-right' style='z-index:999999;'><div  class='ncf success'><p class='ncf-title'>Success</p><p class='nfc-message'>" +
            value + "</p></div></div>";

    } else {
        notifHTML =
            "<div class='modal-rotate-custom ncf-container nfc-top-right' style='z-index:999999;'><div  class='ncf error'><p class='ncf-title'>Error</p><p class='nfc-message'>" +
            value + "</p></div></div>";
    }
    $('#notification').html(notifHTML);
   // $('#notification').fadeIn(timeout);
   // $('#notification').fadeOut(timeout);

    setTimeout(function() {
         $('#notification').html('');
    }, (timeout*2));

}


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

function timeConverter(UNIX_timestamp){
    var a = new Date(UNIX_timestamp * 1000);
   
    var year = a.getFullYear();
    var month = (a.getMonth()+1);
    var date = a.getDate();
    var m = (month < 10 ? '0'+month : month);
    var day = (date < 10 ? '0'+date : date);
    var time = year + '-' + m + '-' + day;
    return time;
  }

  function currentDateTime(){
    var a = new Date();
   
    var year = a.getFullYear();
    var month = (a.getMonth()+1);
    var date = a.getDate();
    var m = (month < 10 ? '0'+month : month);
    var day = (date < 10 ? '0'+date : date);
    var hours = a.getHours();
    var mins = a.getMinutes();
    var secs = a.getSeconds();

    var time = year + '-' + m + '-' + day + '-' + hours + ':' + mins + ':' + secs;
    return time;
  }

  $(document).on('click','.deleteNotifications', function(e) {
    var deleteNotification_id = $(this).attr('data-notif-id');
e.preventDefault(); // prevent
    var csrf_token = $('meta[name="csrf-token"]').attr('content');
    $.ajax({
       type:'post',
       dataType: 'json',
       url:'/delete-notification/',
        data: {_token:csrf_token,notification_id:deleteNotification_id},
       success:function(data) {
     

        notification(data.success, data.msg, 3000);

        let notifRow =document.getElementById('notif-row-'+deleteNotification_id);
        if (notifRow){
        notifRow.remove();
    }
       },
       error: function(xhr, status, error) {
//  notification(false, xhr.responseText, 3000);

     //   console.log(xhr.responseText);
      }
    });
    });
    

    $(document).on('click','.readNotifications', function(e) {
        var readNotification_id = $(this).attr('data-notif-id');
    e.preventDefault(); // prevent
        var csrf_token = $('meta[name="csrf-token"]').attr('content');
        $.ajax({
           type:'post',
           dataType: 'json',
           url:'/read-notification/',
            data: {_token:csrf_token,notification_id:readNotification_id},
           success:function(data) {
    
     notification(data.success, data.msg, 3000);
    
    
            let notifread_at = document.getElementById('notif-read_at-' + readNotification_id);
            if (notifread_at){
               // notifread_at.html('refresh required');
            //    var datetime = "LastSync: " + new Date().today() + " @ " + new Date().timeNow();
                $('#notif-read_at-'+readNotification_id).html(currentDateTime());
                $('#notif-read-btn-icon-'+readNotification_id).toggleClass('fa-envelope-open');
                $('#notif-read-btn-icon-'+readNotification_id).toggleClass('fa-envelope');
            }
            
           },
           error: function(xhr, status, error) {
    //  notification(false, xhr.responseText, 3000);
    
             console.log(xhr.responseText);
          }
        });
        });
        


        // $('ul.nav li.dropdown').hover(function() {
        //     $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
        //   }, function() {
        //     $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
        //   });
         
