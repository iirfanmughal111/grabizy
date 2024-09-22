// alert('error');
function ajaxCall() {
    this.send = function(data, url, method, success, type) {
        type = 'json';
        var successRes = function(data) {
            success(data);
        }

        var errorRes = function(xhr, ajaxOptions, thrownError) {
            
            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);

        }
        jQuery.ajax({
            url: url,
            type: method,
            data: data,
            success: successRes,
            error: errorRes,
            dataType: type,
            timeout: 60000
        });

    }

}
$(document).ready(function(){
function locationInfo() {
    var rootUrl = "https://geodata.phplift.net/api/index.php";
    var call = new ajaxCall();

    this.getCities = function(id) {
        jQuery(".cities option:gt(0)").remove();
        //get additional fields
        const selected_city = $('#selected_city').val();
        console.log(selected_city);
        var url = rootUrl+'?type=getCities&countryId='+ '&stateId=' + id;
        var method = "post";
        var data = {};
        jQuery('.cities').find("option:eq(0)").html("Please wait..");
        call.send(data, url, method, function(data) {
            jQuery('.cities').find("option:eq(0)").html("Select City");
                var listlen = Object.keys(data['result']).length;

                if(listlen > 0)
                {
                    jQuery.each(data['result'], function(key, val) {

                        var option = jQuery('<option />');
                        option.attr('value', val.name).text(val.name);
                        jQuery('.cities').append(option);
                        if (val.name == selected_city){
                            option.attr('selected', 'selected');
                        }
                    });
                }

                jQuery(".cities").prop("disabled",false);
            
        });
    };

    this.getStates = function(id) {
        console.log("state->",id);
        jQuery(".states option:gt(0)").remove();
        jQuery(".cities option:gt(0)").remove();
        //get additional fields
        var stateClasses = jQuery('#stateId').attr('class');

        const selected_region = $('#selected_region').val();
        
        var url = rootUrl+'?type=getStates&countryId=' + id;
        var method = "post";
        var data = {};
        jQuery('.states').find("option:eq(0)").html("Please wait..");
        call.send(data, url, method, function(data) {
            jQuery('.states').find("option:eq(0)").html("Select State");
            
                jQuery.each(data['result'], function(key, val) {
                    var option = jQuery('<option />');
                    option.attr('value', val.name).text(val.name);
                    option.attr('stateid', val.id);
                    jQuery('.states').append(option);

                    if (val.name == selected_region){
                        option.attr('selected', 'selected');
                        setUserCity(val.id);
                    }
                });
                jQuery(".states").prop("disabled",false);
            
        });
    };

    this.getCountries = function() {
        var url = rootUrl+'?type=getCountries';
        var method = "post";
        const selected_country = $('#selected_country').val();
        var data = {};
        jQuery('.countries').find("option:eq(0)").html("Please wait..");
        call.send(data, url, method, function(data) {
            jQuery('.countries').find("option:eq(0)").html("Select Country");
            
            
            jQuery.each(data['result'], function(key, val) {
                var option = jQuery('<option />');
                
                option.attr('value', val.name).text(val.name);
                option.attr('data-countryid', val.id);
                if (val.name == selected_country){
                    option.attr('selected', 'selected');
                    setUserState(val.id);
                }
                jQuery('.countries').append(option);
            });
                // jQuery(".countries").prop("disabled",false);
            
        });
    };

}

jQuery(function() {
    var loc = new locationInfo();
    loc.getCountries();
    jQuery(".countries").on("change", function(ev) {
        var countryId = jQuery("option:selected", this).attr('data-countryid');
        if(countryId != ''){
            loc.getStates(countryId);
        }
        else{
            jQuery(".states option:gt(0)").remove();
        }
    });
    jQuery(".states").on("change", function(ev) {
        var stateId = jQuery("option:selected", this).attr('stateid');
        if(stateId != ''){
            loc.getCities(stateId);
        }
        else{
            jQuery(".cities option:gt(0)").remove();
        }
    });
});

// function setLocation(){
//     var countryId = jQuery("option:selected", this).attr('data-countryid');
//     if(countryId != ''){
//         loc.getStates(countryId);
//     }
//     else{
//         jQuery(".states option:gt(0)").remove();
//     }
// }

function setUserState(countryId){
    var loc = new locationInfo();
    if(countryId != ''){
        loc.getStates(countryId);
    }
    else{
        jQuery(".states option:gt(0)").remove();
    }
}

function setUserCity(stateId){
    var loc = new locationInfo();
    if(stateId != ''){
        loc.getCities(stateId);
    }
    else{
        jQuery(".cities option:gt(0)").remove();
    }
}

});