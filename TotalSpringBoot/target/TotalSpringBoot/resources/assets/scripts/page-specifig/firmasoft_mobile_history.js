var commonData;
var animationStarted = false;

$(document).ready(() => {

	$("body").addClass("overlay_open");
	changActivePage(".history");

	var mobile = getUrlParameter("m");
	if (mobile) {
		var d = new Date();
		var bugun = d.getDate();
		$("#datatable_filter_vehicle_name_first").val(mobile);
		$(".ranges li[data-range-key='<spring:message code='today'/>']").click();
		$("#dateRange_filter").val("<spring:message code='today'/>");
		$('#dateRange_filter').data('daterangepicker').setStartDate(bugun);
		$('#dateRange_filter').data('daterangepicker').setEndDate(bugun);
		search_overlay();
	}
});

var datatable = null;
var distance = 0;
var duration = 0;
var avgSpeed = 0;
var idle = 0;
var maxSpeed = 0;
var isFirstEntryToPage = true;

function trip_overlay_close(to_close) {
	$(".trip_overlay").hide();
	$(".page_header .filter_container").show();

	$("html,body").scrollTop(0);
	$("html,body").css("overflow", "auto");
	$("body").removeClass("trip_detail_open");

	$(".page_header .button_close_trip_overlay").hide();
	$(".page_header h1").show();

	stopAnimation();

	toogleMapBtnColor('icon_map_trips', false);
}

function bindTrClickEvent() {
	$('#datatable tbody').on('click', 'tr', function() {
		var data = datatable.row(this).data();
		if (!data) {
			return;
		}
		showHistoryPoint(data);
	});
}

function search_overlay() {
	$("body").removeClass("overlay_open");
	$('.search_overlay').fadeOut(100);

	if (isFirstEntryToPage) {
		setParameterViaFirstPage();
		isFirstEntryToPage = false;
	}
	listTrips();
}

function eventGrChange(gr) {
	var developerData = {};
	developerData["grName"] = $(gr).val();
	$.ajax({
		url: "mobileListGr",
		data: developerData,
		method: "POST",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success: function(response) {
			$("#datatable_filter_vehicle_name").empty();
			$("#datatable_filter_vehicle_name_first").empty();
			var option;
			var len = response.length;
			for (var i = 0; i < len; i++) {
				option = new Option(response[i].label, response[i].value);
				$('#datatable_filter_vehicle_name').append($('<option>', {
					value: response[i].value,
					text: response[i].label
				}));
				$('#datatable_filter_vehicle_name_first').append($('<option>', {
					value: response[i].value,
					text: response[i].label
				}));
			}
		}
	});
}

function setParameterViaFirstPage() {
	$("#datatable_filter_vehicle_group").val($("#datatable_filter_vehicle_group_first").val());
	$("#dateRange").val($("#dateRange_filter").val());
	$("#datatable_filter_vehicle_name").val($("#datatable_filter_vehicle_name_first").val());
}

function toogleMapBtnColor(btn, open) {

	if (open === true && !$("." + btn).hasClass("coloredBackGround")) {
		$("."+btn).closest("a").addClass("activeMapBtn");
		$("." + btn).addClass("coloredBackGround");
	} else if (open === false && $("." + btn).hasClass("coloredBackGround")) {
		$("."+btn).closest("a").removeClass("activeMapBtn");
		$("." + btn).removeClass("coloredBackGround");
	} else {
		$("."+btn).closest("a").toggleClass("activeMapBtn");
		$("." + btn).toggleClass("coloredBackGround");
	}

	if (btn = "icon_map_trips" && open == true) {
		$("."+btn).closest("a").removeClass("activeMapBtn");
		$("." + btn).removeClass("coloredBackGround");
	} else if (btn = "icon_map_speed" && open == true) {
		$("."+"icon_map_trips").closest("a").removeClass("activeMapBtn");
		$("." + "icon_map_trips").removeClass("coloredBackGround");
	}

}

function removeClassByBtn(btn) {
	$("."+btn).closest("a").removeClass("activeMapBtn");
	$("." + btn).removeClass("coloredBackGround");
}

function addClassByBtn(btn) {
	if (!$("." + btn).hasClass("coloredBackGround")) {
		$("."+btn).closest("a").addClass("activeMapBtn");
		$("." + btn).addClass("coloredBackGround");
	}
}

function resetMapButonColors() {
	$(".coloredBackGround").each(function(index, field) {
		$(field).closest("a").removeClass("activeMapBtn");
		$(field).removeClass("coloredBackGround");
	});
}

var myTable = null;

function getFormData() {
	data = {
		"mobileID": $('#datatable_filter_vehicle_name').val(),
		"startDate": $("#stDate")[0].value,
		"endDate": $('#endDate')[0].value,
	};
	return data;
}

function showHistoryPoint(data) {
	
	$(".page_header .filter_container").hide();
	$(".page_header h1").hide();
	
	$("#distanceText").hide();
	$("#lastKmText").show();
	isTrClick = true;

	$(".page_header .button_close_trip_overlay").show();

	$("html,body").scrollTop(0);
	$("html,body").css("overflow", "hidden");
	$("body").addClass("trip_detail_open");
	
	showPointMap();
	
	commonMapObject.startUp(true, data['mobileID']);
	commonMapObject.setMapMarkerIcon('./resources/assets/styles/images/pinTracker2.png');
	commonMapObject.addMarker(data['longitude'], data['latitude']);
	commonMapObject.zoomToCoordinate(data['longitude'], data['latitude']);
	commonMapObject.zoomIn();
	commonMapObject.zoomIn();
	commonMapObject.zoomIn();
	commonMapObject.zoomIn();

	$(".trip_overlay").show();
	
	populatePointWidget(data);

	resetMapButonColors();
	toogleMapBtnColor('icon_map_trips', true);
	disableToolTipsForPointMap();
}

function calculateMaxMinAndAvarageSpeed(data) {
	let max = 0;
	let min = 0;
	let avgSpeed = 0;
	let sum = 0;
	let falseSpeeds = 0;

	for (let i = 0; i < data.length; ++i) {
		if(data[i] == null || isNaN(data[i])) {
			falseSpeeds++;
		}
		let speed = parseInt(data[i]);
		if (speed < min) {
			min = speed;
		}
		if (max < speed) {
			max = speed;
		}
		sum += speed;
	}
	avgSpeed = sum / (data.length - falseSpeeds);
	
	if(!isFinite(avgSpeed)) {
		avgSpeed = 0;
		min = 0;
		max = 0;
	}

	return {
		min: min,
		max: max,
		avg: avgSpeed
	}
}

function calculateHistoryDuration(data) {
	let minDate = new Date(_formatDate(data[0]));
	let maxDate = new Date(_formatDate(data[data.length - 1]));
	let minDuration = Math.abs(minDate.getTime() - maxDate.getTime());
	return time_convert(millisToMinutesAndSeconds(minDuration));
}

function _formatDate(date) {
	let els = date.split('.');
	let day = els[0];
	let mounth = els[1];
	let year_and_time = els[2];
	let tmp = mounth + '/' + day + '/' + year_and_time;
	return tmp;
}

function time_convert(num) {
	let hours = parseInt(num / 60);
	let minutes = num;
	if (num > 60) {
		minutes = num % 60;
	}
	return {
		hours: hours,
		minutes: minutes
	};
}

function millisToMinutesAndSeconds(millis) {
	var minutes = Math.floor(millis / 60000);
	var seconds = ((millis % 60000) / 1000).toFixed(0);
	return minutes;
}

function calculateHistoryDistance(data) {
	let sum = 0.0;
	for(let i = 0; i < data.length; ++i) {
		if(data[i] != null) {
			sum += parseFloat(data[i]);
		}
	}
	return sum.toFixed(1);
}

function showPointMap() {
	$('#map').hide();
	$('#mapSettings').show();
}

function showMainMap() {
	$('#map').show();
	$('#mapSettings').hide();
}

function toolTipFunctions(funcName) {
	var mainMapVisible = false;

	if($('#map').is(':visible')) {
		mainMapVisible = true;
	}

	switch(funcName) {
		case 'zoomIn':
			if(mainMapVisible) {
				tripsObject.zoomIn();
			}
			else {
				commonMapObject.zoomIn();
			}
		break;

		case 'zoomOut':
			if(mainMapVisible) {
				tripsObject.zoomOut();
			}
			else {
				commonMapObject.zoomOut();
			}
		break;

		case 'switchSat':
			if(mainMapVisible) {
				tripsObject.switchSat();
			}
			else {
				commonMapObject.switchSat();
			}
		break;

		case 'showCutPoints':
			if(mainMapVisible) {
				tripsObject.showCustPoints();
			}
			else {
				commonMapObject.showCustPoints();
			}
		break;

		case 'showRegions':
			if(mainMapVisible) {
				tripsObject.showRegions();
			}
			else {
				commonMapObject.showRegions();
			}
		break;

		case 'showRoutes':
			if(mainMapVisible) {
				tripsObject.showRoutes();
			}
			else {
				commonMapObject.showRoutes();
			}
		break;
	}
}

function disableToolTipsForPointMap() {
	let elems = document.getElementsByClassName('action_group');
	for(let i = 1; i < elems.length - 1; ++i) {
		elems[i].style.display = 'none';
	}
}

function enableToolTipsForMainMap() {
	let elems = document.getElementsByClassName('action_group');
	for(let i = 0; i < elems.length; ++i) {
		elems[i].style.display = 'block';
	}
}

var myData;
var myData1;


function stopAnimation() {
	tripsObject.animateThemeClear();
	animationStarted = false;
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function playAnimation() {
 	myData = [];
	myData1 = [];
	var j = 0;
	
	var commonDataTemp = JSON.parse(JSON.stringify(commonData));
	
	var xc = commonDataTemp[0]['longitude'];
	var yc = commonDataTemp[0]['latitude'];
	
		for(i = 1; i < commonDataTemp.length; i++){
			if (commonDataTemp[i]['longitude'] != commonDataTemp[i - 1]['longitude'] ||
				commonDataTemp[i]['latitude'] != commonDataTemp[i - 1]['latitude']) {
				var pOri = new OM.geometry.Point(commonDataTemp[i]['longitude'], commonDataTemp[i]['latitude'], 8307);
				pOri = pOri.transform(3857);
				myData[j] =pOri.getX();
				myData[j + 1] = pOri.getY();
				
				myData1[j/2] = commonDataTemp[i];
				myData1[j/2].longitude = myData[j+1];
				myData1[j/2].latitude = myData[j];
				
				//console.log((j/2) + " : "+ myData1[(j/2)].location);
				j = j + 2;
			}
		}
	
	if(myData == null || animationStarted) {
		return;
	}
	var counter = 0;
	let pos = 0;
	setTimeout(function(){ 
		//console.log("----------------------------------------------------------------------------");
		tripsObject.addMarker(xc, yc);
		tripsObject.addPointListener(pointListener);
		tripsObject.playSiaAnimation(myData);
		animationStarted = true;
	 }, 500);

}

function pointListener(x, y) {
	var item= myData1.filter(a => a.longitude == y && a.latitude == x);
	if(item && item.length > 0){
		item = item[0];
		refreshHistoryWidget(item);
	}
}