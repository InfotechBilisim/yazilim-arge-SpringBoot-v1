/**
 * Burdaki fonsiyonlar daha sonra base.js'ye yada genel bir yere taşınabilir.
 * Şimdilik herhangi bir şekilde ezilmesinler diye ayrı bir js içine yazıldı.
 */

function showLoading(){
	$(".loading").show();
}

function hideLoading(){
	$(".loading").hide();
}

function showNotTrasparentLoading(){
	$(".notTrasparentLoading").show();
}

function hideNotTrasparentLoading(){
	$(".notTrasparentLoading").hide();
}

function formatDate(ms) {
	if (!ms) {
		return "";
	}

	var date = new Date(ms);
	var options = {
		year: 'numeric',
		month: 'numeric',
		day: 'numeric'
	};
	return date.toLocaleDateString('tr', options);
}

function formatDateToDD_MM_YYYY_HH_MM(ms) {
	if (!ms) {
		return "";
	}

	var date = new Date(ms);
	var options = {
		year: 'numeric',
		month: 'numeric',
		day: 'numeric'
	};
	
	var h = date.getHours() < 10 ? ("0" + date.getHours()) : date.getHours();
	var m = date.getMinutes() < 10 ? ("0" + date.getMinutes()) : date.getMinutes();
	
	return date.toLocaleDateString('tr', options) + " " + h + ":" + m ;
}

function formatDateToDD_MM_YYYY_HH_MM_SS(ms) {
	if (!ms) {
		return "";
	}

	var date = new Date(ms);
	var options = {
		year: 'numeric',
		month: 'numeric',
		day: 'numeric'
	};
	
	var h = date.getHours() < 10 ? ("0" + date.getHours()) : date.getHours();
	var m = date.getMinutes() < 10 ? ("0" + date.getMinutes()) : date.getMinutes();
	var s = date.getSeconds() < 10 ? ("0" + date.getSeconds()) : date.getSeconds();
	
	return date.toLocaleDateString('tr', options) + " " + h + ":" + m + ":" + s;
}

function formatDateToHHMM(ms) {
	if (!ms) {
		return "";
	}
	var date = new Date(ms);
	var h = date.getHours() < 10 ? ("0" + date.getHours()) : date.getHours();
	var m = date.getMinutes() < 10 ? ("0" + date.getMinutes()) : date.getMinutes();
	return h + ":" + m;
}

function formatDateToHHMMSS(ms) {
	if (!ms) {
		return "";
	}

	var date = new Date(ms);
	var h = date.getHours() < 10 ? ("0" + date.getHours()) : date.getHours();
	var m = date.getMinutes() < 10 ? ("0" + date.getMinutes()) : date.getMinutes();
	var s = date.getSeconds() < 10 ? ("0" + date.getSeconds()) : date.getSeconds();

	return h + ":" + m + ":" + s;
}

function makeDateForThemeParam(param,date) {
	if (!date) {
		return "";
	}
	
	var saatSplit = date.split(" ");
	var dateSplit = saatSplit[0].split(".");
	var formattedDate ;
	
	if(param==true) {
		formattedDate =  dateSplit[2] + dateSplit[1]  +dateSplit[0] +  saatSplit[1].replace(":","");
	} else {
		formattedDate =  dateSplit[2] + dateSplit[1]  +dateSplit[0] + saatSplit[1].replace(":","");
	}
	return formattedDate;
}


function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
}

function addActiveClassToInnerMenu(claz){
	$(claz).addClass("active");
}


function setDatePickerToTodayTemp(element){
	$(".ranges li[data-range-key='Bugün']").click();
	$(element).val("Bugün");
	$(".date_start").val($.datepicker.formatDate('dd.mm.yy 00:00', new Date()));
	$(".date_end").val($.datepicker.formatDate('dd.mm.yy 23:59', new Date()));	
}

function controlMax(el,max){
	$(el).on('keydown keyup', function(e){
//		console.log("kontrol" + e.keyCode);
		var t = $(this).val();
	    if (t.length > max 
	        && e.keyCode !== 46
	        && e.keyCode !== 8
	       ) {
	       e.preventDefault();
           $(this).val(t.substr(0,max));
	    }
	});
	
}

function controlIsNumber(el){
	$(el).on('keydown keyup', function(e){
		var t = $(this).val();
	    if (isNaN(t)) {
	       e.preventDefault();
           $(this).val(t.substr(0,t.length - 1));
	    }
	});
	
}



		function toogleMapBtnColor(btn,open){

			if(open===true){
				$("."+btn).closest("a").addClass("activeMapBtn");
				$("."+btn).addClass("coloredBackGround");
				return false;
			}else if(open===false){
				$("."+btn).closest("a").removeClass("activeMapBtn");
				$("."+btn).removeClass("coloredBackGround");
				return false;
			}
			
			if(!$("."+btn).hasClass("coloredBackGround")){
				$("."+btn).closest("a").addClass("activeMapBtn");
				$("."+btn).addClass("coloredBackGround");
			}else if($("."+btn).hasClass("coloredBackGround")){
				$("."+btn).closest("a").removeClass("activeMapBtn");
				$("."+btn).removeClass("coloredBackGround");
			}else{
				$("."+btn).closest("a").toggleClass("activeMapBtn");
				$("."+btn).toggleClass("coloredBackGround");
			}
		}

		function toogleMapBtnColorMobile(){

			if(!$(".icon_map_vehicle").hasClass("coloredBackGround")){
				$("#mobileIcon").addClass("activeMapBtn");
				$(".icon_map_vehicle").addClass("coloredBackGround");
				toogleMapBtnColor('icon_map_tag',labelMode);
				
			}else if($(".icon_map_vehicle").hasClass("coloredBackGround")){
				$("#mobileIcon").removeClass("activeMapBtn");
				$(".icon_map_vehicle").removeClass("coloredBackGround");
				toogleMapBtnColor('icon_map_tag',false);
			}
		}
		
		
				function removeClassByBtn(btn){
			$("."+btn).removeClass("coloredBackGround");
		}

		function addClassByBtn(btn){
			if(!$("."+btn).hasClass("coloredBackGround")){
				$("."+btn).addClass("coloredBackGround");
			}
		}

		function resetMapButonColors(){
			$(".coloredBackGround").each(function(index,field){
				$(field).removeClass("coloredBackGround");
			});
		}



