const APP_CONFIG = {
 datatable_default_options: {
  "processing": true,
  "scrollX": false,
  "stateSave": true,
  "lengthChange": true,
  "dom": "tlip",
  'select': 'multi',
  "filter": false,
  'order': [
   [1, 'asc']
  ],
  "info": true,
  "infoCallback": function(settings, start, end, max, total, pre) {
   return "Bu sayfada: " + (end - start + 1) + "/" + total + " kayıt gösterilmektedir."
  },
  "language": {
   "paginate": {
    "previous": "Önceki",
    "next": "Sonraki"
   },
   "language": {
    "decimal": ".",
    "thousands": ","
   },
   "lengthMenu": "Bir sayfada _MENU_ kayıt Göster"
  }
 }
}

$(document).ready(function() {
 initialize_date_selectors();
 initialize_inputmasks();
 map_initialize();
 // setTimeout(function(){BASE.show_notification("Kontak
 // Açıldı","34AFD387_AUP","Bugün, 05:15","İstanbul, Ümraniye, Mehmet
 // Akif","Cum sociis natoque penatibus et magnis dis parturient montes,
 // nascetur ridiculus mus.");},2000);
 // setTimeout(function(){BASE.remove_notification();},6000);
});

var BASE = {
 "add": () => {
  var form_data = get_form_data(".popup_add .form_container");
  //Do yout thing here!
  if ($.isEmptyObject(form_data.errors)) {
   //TODO: check errors, do the ajax and update the group!
   object_functions.toggle_add_form();
  }
 },
 "show_notification": (title, sub_title, time, location, content) => {
  $(".main_notification.notification_widget .list_item .title").html(title);
  $(".main_notification.notification_widget .list_item .sub_title").html(sub_title);
  $(".main_notification.notification_widget .list_item .time").html(time);
  $(".main_notification.notification_widget .list_item .location").html(location);
  $(".main_notification.notification_widget .list_item .content").html(content);
  $(".main_notification.notification_widget .list_item a.link").attr("title", content);
  $(".main_notification.notification_widget").addClass("active");
 },
 "show_info_messages": (type, title, sub_title) => {
  $(".main_info_container").attr('class', 'main_info_container ' + type);
  $(".main_info_container .info_title").html(title);
  $(".main_info_container .info_sub_title").html(sub_title);
  $(".main_info_container").slideDown(200);
  setTimeout(function() {
   $(".main_info_container").slideUp(200);
   setTimeout(function() {
    $(".main_info_container").removeClass(type);
    $(".main_info_container .info_title").html("");
    $(".main_info_container .info_sub_title").html("");
   }, 1000);
  }, 4000);

 },
 "remove_notification": () => {
  $(".main_notification.notification_widget").removeClass("active");
 },
 "toggle_menu": () => {
  $("body").toggleClass("menu_open");
 }
}
var doughnut_chart = "";
var guage_chart = "";

var chart_functions = {
 "generate_bar_chart": (selector, data, options_override) => {
  /** Generates Charjs Bar chart with given data */
  var chart_canvas = $(selector);
  var chart_parent = $(chart_canvas).closest(".widget_container");

  var bar_chart_options = {
   maintainAspectRatio: false,
   tooltips: {
    enabled: false
   },
   legend: {
    display: false
   },
   scales: {
    xAxes: [{
     barThickness: 0,
     gridLines: {
      display: false,
      drawBorder: false
     },
     ticks: {
      display: false,
      beginAtZero: true
     }
    }],
    yAxes: [{
     barThickness: 5,
     position: "left",
     gridLines: {
      display: false,
      drawBorder: false
     },
    }]
   }
  };

  if (typeof options_override !== undefined) {
   $.extend(bar_chart_options, options_override);
  }

  // And for a doughnut chart
  var the_chart = new Chart(chart_canvas, {
   type: 'horizontalBar',
   data: data,
   options: bar_chart_options
  });
 },
 "generate_bar_chart_alternative_old": (selector, data) => {

  $(selector).html("<ul class='" + (typeof data.links != "undefined" ? "has_links" : "") + "'></ul>");

  var labels = data.labels;
  var dataset = data.datasets[0];
  var max_value = 0;

  $.each(dataset.data, function(index, value) {
   if (value > max_value)
    max_value = value;
  });

  $.each(labels, function(index, label) {
   var percentage = dataset.data[index] * 100 / (max_value == 0 ? 1 : max_value);
   var link_string = (typeof data.links != "undefined" ? ("<a class='link' href='" + data.links[index] + "'></a>") : "");

   $("ul", $(selector)).append("<li>\
				<span class='label'>" + label + "</span>\
				<div class='bar'><div style='width:" + percentage + "%; background-color:" + dataset.backgroundColor[index] + "'></div></div>\
				<span class='label'>" + dataset.data[index] + "</span>\
				" + link_string + "\
			</li>");
  });

  setTimeout(function() {
   $("ul", $(selector)).addClass("loaded");
  }, 50);
 },
 "generate_bar_chart_alternative": (selector, data) => {
  /** Generates Custom HTML5 Bar Chart with given data */
  $(selector).html("<ul class='" + (typeof data.links != "undefined" ? "has_links" : "") + "'></ul>");

  var labels = data.labels;
  var dataset = data.datasets[0];

  $.each(labels, function(index, label) {
   var percentage = dataset.data[index][0] * 100 / dataset.data[index][1];
   var link_string = (typeof data.links != "undefined" ? ("<a class='link' href='" + data.links[index] + "'></a>") : "");

   $("ul", $(selector)).append("<li>\
				<span class='label'>" + label + "</span>\
				<div class='bar'><div style='width:" + percentage + "%; background-color:" + dataset.backgroundColor[index] + "'></div></div>\
				<span class='label'>" + dataset.data[index][0] + "</span>\
				" + link_string + "\
			</li>");
  });

  setTimeout(function() {
   $("ul", $(selector)).addClass("loaded");
  }, 50);
 },
 "generate_bar_chart_alternative_without_label": (selector, data) => {
  /** Generates Custom HTML5 Bar Chart with given data */
  $(selector).html("<ul class='" + (typeof data.links != "undefined" ? "has_links" : "") + "'></ul>");

  var labels = data.labels;
  var dataset = data.datasets[0];

  $.each(labels, function(index, label) {
   var percentage = dataset.data[index][0] * 100 / dataset.data[index][1];
   var link_string = (typeof data.links != "undefined" ? ("<a class='link' href='" + data.links[index] + "'></a>") : "");

   $("ul", $(selector)).append("<li>\
					<span class='label'>" + label + "</span>\
					<div class='bar'><div style='width:" + percentage + "%; background-color:" + dataset.backgroundColor[index] + "'></div></div>\
					" + link_string + "\
				</li>");
  });

  setTimeout(function() {
   $("ul", $(selector)).addClass("loaded");
  }, 50);
 },
 "generate_guage_chart": (selector, data, click_event) => {
  /** Generates a Gauge Chart (Half cut doughnut chart) */
  var chart_canvas = $(selector);
  var chart_parent = $(chart_canvas).closest(".widget_container");

  // And for a doughnut chart
  if(guage_chart && guage_chart.canvas == chart_canvas)
   guage_chart.destroy();

  guage_chart = new Chart(chart_canvas, {
   type: 'doughnut',
   data: data,
   options: {
    rotation: 1 * Math.PI,
    circumference: 1 * Math.PI,
    cutoutPercentage: 70,
    tooltips: {
     enabled: false
    },
    legend: {
     display: false
    }
   }
  });



  if ($(".summary", chart_parent).length > 0) {
   $(".summary strong", chart_parent).html(data.datasets[0].data[0]);
  }

 },
 "generate_doughnut_chart": (selector, data, click_event) => {
  /** Generates a doughnut chart */
  var chart_canvas = $(selector);
  var chart_parent = $(chart_canvas).closest(".widget_container");


  // And for a doughnut chart
 if(doughnut_chart && doughnut_chart.canvas == chart_canvas)
   doughnut_chart.destroy();

  doughnut_chart = new Chart(chart_canvas, {
   type: 'doughnut',
   data: data,
   options: {
	   animation: false,
    legend: {
     display: false
    },
    cutoutPercentage: 65
   }
  });


  if (typeof(click_event) !== "undefined") {
   $(chart_canvas).click((event) => {
    click_event(event, doughnut_chart);
   });
  }

  if ($(".summary", chart_parent).length > 0) {
   var total_value = 0;
   $.each(data.datasets[0].data, function(index, value) {
    total_value += value;
   });
   $(".summary strong", chart_parent).html(total_value);
  }

  if ($(".legend", chart_parent).length > 0) {
   $(".legend", chart_parent).html("");

   $.each(data.labels, function(index, label) {
    $(".legend", chart_parent).append(
     '<div class="legend_item">\
						<i style="background:' + data.datasets[0].backgroundColor[index] + '"></i>\
						<strong>' + data.datasets[0].data[index] + '</strong>\
						<span>' + data.labels[index] + '</span>\
					</div>'
    );
   });

   if (typeof(click_event) !== "undefined") {
    $(".legend_item", $(".legend", chart_parent)).click((event) => {
     click_event(event, doughnut_chart);
    });
   }
  }

 }
}



/** Initializes all date selectors in document */
function initialize_date_selectors() {
 $(".date_selector").each(function(index, selector) {

  var options = {
   maxSpan: { // En fazla bir ay seçebileceği aralık
    days: 30
   },
   opens: 'left',
   minDate: $('.date_range_picker', selector).data('starts_from_today') == true ? moment() : moment().subtract(2, 'year'),
   maxDate: $('.date_range_picker', selector).data('starts_from_today') == true ? null : moment(),
   startDate: moment(),
   endDate: moment()
    // ,parentEl : selector
    ,
   ranges: {
    'Bugün': [moment(), moment()],
    'Dün': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
    'Son 7 Gün': [moment().subtract(6, 'days'), moment()],
    'Son 30 Gün': [moment().subtract(29, 'days'), moment()],
    'Bu Ay': [moment().startOf('month'), moment().endOf('month')],
    'Geçen Ay': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
   },
   autoUpdateInput: false,
   buttonClasses: "button",
   cancelClass: "button_white",
   showCustomRangeLabel: true,
   showDropdowns: true,
   timePicker: !$('.date_range_picker', selector).data('timepicker_disabled'),
   timePicker24Hour: true,
   opens: "left",
   locale: {
    format: "DD.MM.YYYY HH:mm",
    separator: " - ",
    applyLabel: "Uygula",
    cancelLabel: "İptal",
    fromLabel: "Baş",
    toLabel: "Bit",
    customRangeLabel: "Tarih Aralığı",
    weekLabel: "W",
    daysOfWeek: ["Pa", "Pt", "Sa", "Ça", "Pe", "Cu", "Ct"],
    monthNames: ["Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"],
    firstDay: 1
   },
   timePickerIncrement: 1
  }

  if ($('.date_range_picker', selector).data('predefined_disabled') == true)
   delete(options.ranges);

  $('.date_range_picker', selector).daterangepicker(
   options,
   function(start, end, label) {
    if (typeof(label) !== "undefined" && label != "Tarih Aralığı") {
     $('.date_range_picker', selector).val(label);
     $(".date_start").val(start.format('DD.MM.YYYY 00:00'));
     $(".date_end").val(end.format('DD.MM.YYYY 23:59'));
    } else {
     if (start.format('DD.MM.YYYY HH:mm') != end.format('DD.MM.YYYY HH:mm'))
      $('.date_range_picker', selector).val(start.format('DD.MM.YYYY HH:mm') + " - " + end.format('DD.MM.YYYY HH:mm'));
     else {
      $('.date_range_picker', selector).val(start.format('DD.MM.YYYY HH:mm'));
     }
     $(".date_start").val(start.format('DD.MM.YYYY HH:mm'));
     $(".date_end").val(end.format('DD.MM.YYYY HH:mm'));
    }


   }
  );

  if ($(".date_start").val() == "") {
   $(".date_start").val($.datepicker.formatDate('dd.mm.yy 00:00', new Date()));
   $(".date_end").val($.datepicker.formatDate('dd.mm.yy 23:59', new Date()));
  }

  if ($('.date_range_picker', selector).data('predefined_disabled') != true)
   $('.date_range_picker', selector).val("Bugün");

 });
}

function set_custom_date(start_date, start_time, end_date, end_time) {
 if (start_time == "" || start_time === null)
  start_time = "00:00";
 if (end_time == "" || end_time === null)
  end_time = "23:59";
 if (end_date == "" || end_date === null)
  end_date = $.datepicker.formatDate('dd.mm.yy', new Date());

 $(".date_selector .date_range_picker").val(start_date + " - " + end_date);
 $(".date_selector .date_start").val(start_date + " " + start_time);
 $(".date_selector .date_end").val(end_date + " " + end_time);
}

function initialize_inputmasks() {

 if ($(".field[data-mask='email']") && $(".field[data-mask='email']").inputmask) {
  $(".field[data-mask='email']").inputmask({
   alias: "email"
  });
  $(".field[data-mask='phone']").inputmask({
   mask: ["0999 999 99 99"],
   keepStatic: true
  }); // (999){+|1}
  $(".field[data-mask='number']").inputmask({
   alias: "numeric"
  });
  $(".field[data-mask='number_formatted']").inputmask({
   alias: "numeric",
   rightAlign: false,
   groupSeparator: ".",
   radixPoint: ","
  });
 }
}

function refresh_speed_graph(vehicle_speed) {
 $(".vehicle_average_speed_graph").removeClass("warning").removeClass("danger");

 var max_speed = 160;
 var percentage = 100 * vehicle_speed / max_speed;

 $(".vehicle_average_speed_graph div").css("width", percentage + "%");
 if (vehicle_speed > 80 && vehicle_speed <= 120) {
  $(".vehicle_average_speed_graph").addClass("warning");
 }
 if (vehicle_speed > 120) {
  $(".vehicle_average_speed_graph").addClass("danger");
 }

 $(".speed_km span").html(vehicle_speed + "")
}

function toggle_hidden_content(button_clicked) {
 var parent = $(button_clicked).closest(".input_wrapper");
 $("> .hidden_content", parent).slideToggle(200);
}

/** Map Related Scripts **/
var map;
var google;
var current_mouse_position = {
 x: -1,
 y: -1
};

function map_initialize() {
 if (google)
  map = new google.maps.Map(document.getElementById('map'), {
   center: {
    lat: 41.0082,
    lng: 28.9784
   },
   zoom: 12,
   fullscreenControl: false,
   disableDefaultUI: true
   // styles:
   // [{"featureType":"all","elementType":"labels","stylers":[{"visibility":"on"}]},{"featureType":"all","elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#000000"},{"lightness":40}]},{"featureType":"all","elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#000000"},{"lightness":16}]},{"featureType":"all","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":17},{"weight":1.2}]},{"featureType":"administrative.country","elementType":"labels.text.fill","stylers":[{"color":"#e5c163"}]},{"featureType":"administrative.locality","elementType":"labels.text.fill","stylers":[{"color":"#c4c4c4"}]},{"featureType":"administrative.neighborhood","elementType":"labels.text.fill","stylers":[{"color":"#e5c163"}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":21},{"visibility":"on"}]},{"featureType":"poi.business","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#e5c163"},{"lightness":"0"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"visibility":"off"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"road.highway","elementType":"labels.text.stroke","stylers":[{"color":"#e5c163"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":18}]},{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"color":"#575757"}]},{"featureType":"road.arterial","elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"road.arterial","elementType":"labels.text.stroke","stylers":[{"color":"#2c2c2c"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":16}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#999999"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":19}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":17}]}]
  });

 if ($(".map_container .right_click_popup").length > 0) {

  $(".map_container").contextmenu(function() {
   var mousePosition = {};
   var menuPostion = {};
   var menuDimension = {};

   menuDimension.x = $(".right_click_popup").outerWidth();
   menuDimension.y = $(".right_click_popup").outerHeight();

   mousePosition.x = current_mouse_position.x;
   mousePosition.y = current_mouse_position.y;

   if (mousePosition.x + menuDimension.x > $(window).width() + $(window).scrollLeft()) {
    menuPostion.x = mousePosition.x - menuDimension.x;
   } else {
    menuPostion.x = mousePosition.x;
   }

   if (mousePosition.y + menuDimension.y > $(window).height() + $(window).scrollTop()) {
    menuPostion.y = mousePosition.y - menuDimension.y;
   } else {
    menuPostion.y = mousePosition.y;
   }


   $(".right_click_popup").css({
    "top": menuPostion.y,
    "left": menuPostion.x
   });
   $(".right_click_popup").slideDown(100);

  });

  $(document).mousemove(function(event) {
   current_mouse_position.x = event.pageX;
   current_mouse_position.y = event.pageY;
  });

  $(".map_container").click(function() {
   $(".right_click_popup").fadeOut(100);
  });
 }
}


function map_toggle_fullscreen() {
 $("body").toggleClass("fullscreen");

}

function map_highlight_trip(selected_trip) {
 $(".list_item", $(selected_trip).closest(".list")).removeClass("active");
 $(selected_trip).addClass("active");
}

/** Popup Scripts * */
function popup_open(to_open, callback = () => {}) {
 $(to_open).show();
 if (typeof callback === "function")
  callback();
}

function popup_close(to_close) {
 $(to_close).closest(".popup_container").hide();
}

/* Edit menu function */
function open_edit_menu(button_clicked) {
 $(".edit_menu.open").removeClass("open");
 $(button_clicked).siblings(".edit_menu").addClass("open");

 $('body').on("click", function(evt) {
  if (!$(evt.target).hasClass("edit_menu") && $(evt.target).closest(".edit_container").length == 0) {
   $(".edit_menu.open").removeClass("open");
   $('body').off("click");
  }
 });
}

function switch_tab(link_clicked) {

 var tab_id = $(link_clicked).attr('data-tab');

 if (tab_id == "tab-1") {
  $(".page_header .filter_container").fadeIn(200);
 } else {
  $(".page_header .filter_container").fadeOut(200);
 }

 $('.column.tab_container li').removeClass('current');
 $('.tabContent').removeClass('current');

 $(link_clicked).addClass('current');
 $("#" + tab_id).addClass('current');
}


function toggle_next_item() {
 if ($(".info_slider_item:last-child").hasClass("active")) {
  $(".info_footer .next_item").hide();
  $(".info_footer .hidden_close_button").show();
 } else {
  $(".info_footer .hidden_close_button").hide();
  $(".info_footer .next_item").show();
 }
}

function slide_to(to_select, index) {
 $(".slider_bullet").removeClass("active");
 $(to_select).addClass("active");
 $(".info_slider_item").removeClass("active");
 $(".info_slider_item[data-id='" + index + "']").addClass("active");
 $(".scroll_wrapper").animate({
  "scrollLeft": $(".info_slider_item").width() * index
 });
 toggle_next_item();
}

function next_item() {
 var current_position = $(".scroll_wrapper").scrollLeft();
 $(".scroll_wrapper").animate({
  "scrollLeft": current_position + $(".info_slider_item").width()
 });

 $(".info_slider_item.active").next().addClass("active");
 $(".info_slider_item.active").prev().removeClass("active");

 $(".slider_bullet.active").next().addClass("active");
 $(".slider_bullet.active").prev().removeClass("active");
 toggle_next_item();
}

function hide_info_modal() {
 if ($(".info_footer input").is(":checked")) {
  // TODO hide
 }
}

function close_info_modal() {
 $(".info_news_container").hide();
 $(".info_news_container .info_footer label input")
}

function open_info_modal() {
 $(".info_news_container").show();
}

function validate_email(email) {
 var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
 return re.test(String(email).toLowerCase());
}

function get_form_data(selector) {
 var to_return = {
  "data": {},
  "errors": []
 };
 $(".error", selector).removeClass("error");

 $(".field", selector).each(function(index, field) {
  var field_value = $.trim($(field).val());
  var field_key = $.trim($(field).data("key"));
  var is_forced = $(field).hasClass("forced");
  var field_parent = $(field).closest(".input_wrapper");
  if ($(field).data("mask") == "email") {
   if (!validate_email($(field).val()))
    field_value = "";
  }
  if ($(field).data("mask") == "phone") {
   field_value = field_value.replace(/\s/g, '');
   console.log(field_value);
   if (!(field_value.length == "11" && $.isNumeric(field_value)))
    field_value = "";
  }
  /*
   * $(".field[data-mask='email']").inputmask({ alias: "email"});
   * $(".field[data-mask='phone']").inputmask({ mask: ["0999 999 99 99"],
   * keepStatic: true });
   */

  if (field_parent.length == 0) {
   field_parent = $(field).closest(".select2_wrapper");
  }

  if (field_parent.length == 0) {
   field_parent = field;
  }

  if ($(field).is(":checkbox")) {
   field_value = $(field).is(":checked");
  }
  if (is_forced && field_value == "") {
   $(field_parent).addClass("error");
   to_return.errors.push(field_key);
  }
  to_return.data[field_key] = field_value;
 });

 return to_return;
}

function format_option(data) {
 if (!data.id) return data.text; // optgroup
 return "<img class='geo_icon' src='" + data.image + "'/> " + " <span>" + data.text + "</span>";
}

function format_option_checkbox(data) {
 if (!data.id) return data.text;
 return "<label><input type='checkbox' class='select2_checkbox'/><span>" + data.text + "</span></label>";

}

function initialize_select2_multi(container, data, placeholder) {


 if ($(container).data('select2')) {
  $(container).empty();
  $(container).select2("destroy");
 }

 var options = {
  closeOnSelect: false,
  allowClear: true,
  multiple: true,
  placeholder: placeholder,
  dropdownParent: $(container).parent(),
  scrollAfterSelect: false
 };

 if (data != false)
  options.data = data;

 if (typeof is_editable !== "undefined" && is_editable === true) {
  options.tags = true;
  options.closeOnSelect = true;
  options.minimumResultsForSearch = Infinity;
  options.createTag = function(params) {
   if (params.term.indexOf('@') === -1) {
    return null;
   }

   return {
    id: params.term,
    text: params.term,
    isNew: true
   }
  }
  options.language = {
   noResults: function(params) {
    return tooltip;
   }
  };

 }

 console.log("Initializing Select Multi", container, data, placeholder);
 /*
 $(container).select2MultiCheckboxes({
 	placeholder: "Choose multiple elements",
 });*/
 //$(container).select2MultiCheckboxes(options);
 $(container).select2(options);
}

function initialize_select2(container, data, placeholder, is_editable, tooltip, has_image, hide_search, is_on_bottom) {

 console.log("Initializing Select", container);

 if ($(container).data('select2')) {
  $(container).empty();
  $(container).select2("destroy");
 }

 var options = {
  closeOnSelect: false,
  allowClear: true,
  placeholder: placeholder,
  dropdownParent: $(container).parent()
 };

 if (has_image) {
  options.templateResult = format_option,
   options.templateSelection = format_option,
   options.escapeMarkup = function(m) {
    return m;
   }
 }
 if (hide_search) {
  options.minimumResultsForSearch = -1,
   options.closeOnSelect = true,
   options.allowClear = false
 }
 if (is_on_bottom) {
  options.enoughRoomBelow = "500"
 }

 if (data != false)
  options.data = data;

 if (typeof is_editable !== "undefined" && is_editable === true) {
  options.tags = true;
  options.closeOnSelect = true;
  options.minimumResultsForSearch = Infinity;
  options.createTag = function(params) {
   if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(params.term))) {//burası bizdeki gibi kalacak.//Eyyüp
    return null;
   }

   return {
    id: params.term,
    text: params.term,
    isNew: true
   }
  }
  options.language = {
   noResults: function(params) {
    return tooltip;
   }
  };

 }

 $(container).select2(options);
}
/*
 * function initialize_select2(container,data,placeholder,is_editable,tooltip){
 * 
 * console.log("Initializing Select",container);
 * 
 * if($(container).data('select2')){ $(container).empty();
 * $(container).select2("destroy"); }
 * 
 * var options = { closeOnSelect: false, allowClear: true, placeholder:
 * placeholder, dropdownParent : $(container).parent() };
 * 
 * if(data != false) options.data = data;
 * 
 * if(typeof is_editable !== "undefined" && is_editable === true){ options.tags =
 * true; options.closeOnSelect = true; options.minimumResultsForSearch =
 * Infinity; options.createTag = function (params) { if
 * (params.term.indexOf('@') === -1) { return null; }
 * 
 * return { id: params.term, text: params.term, isNew : true } }
 * options.language = { noResults: function (params) { return tooltip; } }; }
 * 
 * $(container).select2(options); }
 */
function select2_select_all(checkbox_clicked) {
 var parent = $(checkbox_clicked).closest(".select2_wrapper");
 $("select", parent).val(null).trigger("change");
 $("select", parent).prop("disabled", $(checkbox_clicked).is(":checked"));
 $(parent).removeClass("error");
}
function remove_notification(to_remove) {
 $(to_remove).closest(".main_notification.notification_widget").removeClass("active");
 // TODO: $.ajax, actual remove function here!
}

function toggle_menu() {
 $("body").toggleClass("menu_open");
}