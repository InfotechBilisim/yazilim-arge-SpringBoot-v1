<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code='appTitle' /></title>
<link href="resources/assets/styles/fonts/googleapis.css"  rel="stylesheet"/>
<link rel="stylesheet"
	href="resources/libs/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="resources/libs/datatables/datatables.min.css" />
	<link rel="stylesheet" href="resources/libs/font-awesome/4.7.0/css/font-awesome.css" />
<link href="resources/libs/font-awesome/5.13.1/css/promin.css" rel="stylesheet"/>
<link href="resources/libs/select2/4.0.3/css/select2.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="resources/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet"
	href="resources/libs/jquery/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/assets/styles/css/base.css">
<script src="resources/libs/jquery/jquery-1.12.4.js"></script>

<script type="text/javascript" src="resources/assets/scripts/common.js" /></script>
</head>
<body class="">

	<jsp:include page='common/header.jsp'></jsp:include>

	<div class="menu_overlay" onClick="BASE.toggle_menu();"></div>
	<main>
		<div class="page_header">
			<div class="form_container column_container">
				<div class="column column_4_1">
					<h1>
						<spring:message code="settings" />
					</h1>
				</div>
			</div>
		</div>
		<div class="column_container">

			<jsp:include page='common/innerMenu.jsp'></jsp:include>

			<div class="column column_4_3">
				<div class="top_container">
					<div class="widget_container special">
						<div class="widget_header column_container">
							<ul class="column tab_container">
								<li class="tab_name current" data-tab="tab-1"
									onClick="switch_tab(this)"><spring:message
										code="workScheduleTitle" /></li>
								<li class="tab_name" data-tab="tab-2" onClick="switch_tab(this)"><spring:message
										code="workScheduleMobileTitle" /></li>
								<li class="tab_name" data-tab="tab-3" onClick="switch_tab(this)"><spring:message
										code="settings" /></li>
							</ul>
						
						</div>
					</div>
				</div>
				<div class="widget_container tabContent widget_datatable widget_datatable1 current"
					id="tab-1">
					<div class="table_wrapper">
						<table id="datatable" class="fs_datatable">
							<tfoot></tfoot>
						</table>
					</div>
				</div>
				<div class="widget_container tabContent widget_datatable widget_datatable2 "
					id="tab-2">
					<div class="table_wrapper">
						<table id="datatable2" class="fs_datatable">
							<tfoot></tfoot>
						</table>
					</div>
				</div>
				<div class="widget_container tabContent" id="tab-3">
					<div id="settingPageDiv">
						<div class="column_container form_container form_container_alternative">
						
							<div class="column left">
								<div class="toggle_wrapper input_wrapper">
									<input type="checkbox" id="location_data_usage" name="location_data_usage">
									<label for="location_data_usage"> <span><spring:message code="locationDataUsage"/> </span> <i
										class="far fa-toggle-on"></i>
									</label>
								</div>
								<br>
								<div class="button_container left_aligned">
									<a class="button" href="javascript:;" onclick="saveMesaiDisiKonumIsleme();"><spring:message code="save" /></a>
								</div>
							</div>
	
						</div>
					</div>
				</div>
				<div class="widget_container shift_add_container hidden hidden_form">
					<div class="widget_header">
						<spring:message code="newWorkSchedule" />
					</div>
					<div class="widget_content">
						<div
							class="column_container form_container form_container_alternative">
							<div class="column">
								<div class="input_wrapper">
									<label for="user_name"><spring:message
											code="workScheduleName" /></label> <input type="text" id="shift_name"
										class="field forced" data-key="shift_name"
										placeholder="Çizelge Adı Giriniz">
								</div>
								<div class="input_wrapper vehicle_choice">
									<label for="user_no"><spring:message
											code="mobileSelect" /></label>
								</div>
								<div class="select2_wrapper vehicle_selection_container">
									<select id="select2_vehicles" class="field select2_vehicles"
										multiple></select>
									<div class="input_wrapper checkbox_wrapper">
										<input type="checkbox" id="select_vehicles_all"
											data-key="select_vehicles_all" class="field"
											onChange="select2_select_all(this);"> <label
											for="select_vehicles_all"><span><spring:message
													code="selectAllMobiles" /></span></label>
									</div>
								</div>
								<div class="input_wrapper hidden" id="work_type_div">
								<label for="work_type"><spring:message
											code="workType" /></label>
		                        	<select id="work_type" name="work_type" data-key="work_type" style="border: 2px solid #d6d6d6;">
			                            <option value="1"><spring:message  code='calisir'/></option>
			                            <option value="0"><spring:message  code='calismaz'/></option>
			                        </select>
			                    </div>
							</div>
							<div class="column">
								<div class="column_container ">
									<div class="column">
										<div class="input_wrapper">
											<label><spring:message code="workScheduleDays" /></label>
										</div>
										<div class="input_wrapper checkbox_wrapper" id="adf">
											<input type="checkbox" id="weekly_day_1"
												data-key="weekly_day_1" class="field"> <label
												for="weekly_day_1"><span><spring:message
														code="monday" /> </span></label> <input type="checkbox" id="weekly_day_2">
											<label for="weekly_day_2"><span><spring:message
														code="tuesday" /> </span></label> <input type="checkbox"
												id="weekly_day_3"> <label for="weekly_day_3"><span><spring:message
														code="wednesday" /> </span></label> <input type="checkbox"
												id="weekly_day_4"> <label for="weekly_day_4"><span><spring:message
														code="thursday" /> </span></label> <input type="checkbox"
												id="weekly_day_5"> <label for="weekly_day_5"><span><spring:message
														code="friday" /> </span></label> <input type="checkbox" id="weekly_day_6">
											<label for="weekly_day_6"><span><spring:message
														code="saturday" /> </span></label> <input type="checkbox"
												id="weekly_day_0"> <label for="weekly_day_0"><span><spring:message
														code="sunday" /> </span></label>
										</div>
									</div>

									<div class="column">
										<div class="column_container">

											<div class="input_wrapper date_selector">
												<div class="column_container">
													<div class="column input_wrapper">
														<label><spring:message code='stDateSpec'/></label>
													</div>
													<div class="column input_wrapper">
														<label><spring:message code='endDateSpec'/></label>
													</div>
												</div>
												<div class="column_container">
													<div class="column input_wrapper">
														<input id="stDate" type="text" class="datePickerSingle" value="" />
													</div>
													<div class="column input_wrapper">
														<input id="endDate" type="text" class="datePickerSingle" value="" />
													</div>
												</div>
												<br>
											
											


											<div class="column input_wrapper">
												<label><spring:message code="workScheduleStTime" /></label>
											</div>
											<div class="column input_wrapper">
												<label><spring:message code="workScheduleEndTime" /></label>
											</div>
										</div>
										<div class="column_container">
											<div class="column input_wrapper">
												<select id="time_start">
													<option value="00:00">00:00</option>
													<option value="00:30">00:30</option>
													<option value="01:00">01:00</option>
													<option value="01:30">01:30</option>
													<option value="02:00">02:00</option>
													<option value="02:30">02:30</option>
													<option value="03:00">03:00</option>
													<option value="03:30">03:30</option>
													<option value="04:00">04:00</option>
													<option value="04:30">04:30</option>
													<option value="05:00">05:00</option>
													<option value="05:30">05:30</option>
													<option value="06:00">06:00</option>
													<option value="06:30">06:30</option>
													<option value="07:00">07:00</option>
													<option value="07:30">07:30</option>
													<option value="08:00">08:00</option>
													<option value="08:30">08:30</option>
													<option value="09:00">09:00</option>
													<option value="09:30">09:30</option>
													<option value="10:00">10:00</option>
													<option value="10:30">10:30</option>
													<option value="11:00">11:00</option>
													<option value="11:30">11:30</option>
													<option value="12:00">12:00</option>
													<option value="12:30">12:30</option>
													<option value="13:00">13:00</option>
													<option value="13:30">13:30</option>
													<option value="14:00">14:00</option>
													<option value="14:30">14:30</option>
													<option value="15:00">15:00</option>
													<option value="15:30">15:30</option>
													<option value="16:00">16:00</option>
													<option value="16:30">16:30</option>
													<option value="17:00">17:00</option>
													<option value="17:30">17:30</option>
													<option value="18:00">18:00</option>
													<option value="18:30">18:30</option>
													<option value="19:00">19:00</option>
													<option value="19:30">19:30</option>
													<option value="20:00">20:00</option>
													<option value="20:30">20:30</option>
													<option value="21:00">21:00</option>
													<option value="21:30">21:30</option>
													<option value="22:00">22:00</option>
													<option value="22:30">22:30</option>
													<option value="23:00">23:00</option>
													<option value="23:30">23:30</option>
												</select>
											</div>
											<div class="column input_wrapper">
												<select id="time_end">
													<option value="00:00">00:00</option>
													<option value="00:30">00:30</option>
													<option value="01:00">01:00</option>
													<option value="01:30">01:30</option>
													<option value="02:00">02:00</option>
													<option value="02:30">02:30</option>
													<option value="03:00">03:00</option>
													<option value="03:30">03:30</option>
													<option value="04:00">04:00</option>
													<option value="04:30">04:30</option>
													<option value="05:00">05:00</option>
													<option value="05:30">05:30</option>
													<option value="06:00">06:00</option>
													<option value="06:30">06:30</option>
													<option value="07:00">07:00</option>
													<option value="07:30">07:30</option>
													<option value="08:00">08:00</option>
													<option value="08:30">08:30</option>
													<option value="09:00">09:00</option>
													<option value="09:30">09:30</option>
													<option value="10:00">10:00</option>
													<option value="10:30">10:30</option>
													<option value="11:00">11:00</option>
													<option value="11:30">11:30</option>
													<option value="12:00">12:00</option>
													<option value="12:30">12:30</option>
													<option value="13:00">13:00</option>
													<option value="13:30">13:30</option>
													<option value="14:00">14:00</option>
													<option value="14:30">14:30</option>
													<option value="15:00">15:00</option>
													<option value="15:30">15:30</option>
													<option value="16:00">16:00</option>
													<option value="16:30">16:30</option>
													<option value="17:00">17:00</option>
													<option value="17:30">17:30</option>
													<option value="18:00">18:00</option>
													<option value="18:30">18:30</option>
													<option value="19:00">19:00</option>
													<option value="19:30">19:30</option>
													<option value="20:00">20:00</option>
													<option value="20:30">20:30</option>
													<option value="21:00">21:00</option>
													<option value="21:30">21:30</option>
													<option value="22:00">22:00</option>
													<option value="22:30">22:30</option>
													<option value="23:00">23:00</option>
													<option value="23:30">23:30</option>
												</select>
											</div>
										</div>
									</div>
								</div>

								<br>
								<div
									class="toggle_wrapper input_wrapper column_container toggle_wrapper_w_hidden_content">
									<input type="checkbox" id="toggle" name="toggle"> <label
										for="toggle"> <span>Mesai saatleri dışında araç
											verileri sisteme işlenmesin </span> <i class="far fa-toggle-on"></i>
										<div class="clear"></div>
									</label>
								</div>

								<div class="button_container right_aligned">
									<a class="button button_white" href="javascript:;"
										onClick="toggle_form_container('shift_add_container');"><spring:message
											code="cancel" /></a> <a class="button" href="javascript:;"
										onClick="submit_form('shift_add_container');"><spring:message
											code="save" /></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>

	<jsp:include page='common/footer.jsp'></jsp:include>
	<jsp:include page='common/commonHtml.jsp'></jsp:include>

	<link rel="stylesheet" href="resources/assets/styles/css/infotech.css">
	<script src="resources/libs/daterangepicker/moment.min.js"></script>
	<script src="resources/libs/daterangepicker/daterangepicker.js"></script>
	<script src="resources/libs/datatables/datatables.min.js"></script>

	<jsp:include page='resources/base.jsp'></jsp:include>
	<script src="resources/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script src="resources/libs/js/jquery.inputmask.js"></script>
	<script src="resources/libs/jquery/jquery-ui.js"></script>
	<script src="resources/libs/select2/4.0.3/js/select2.min.js"></script>
	<script
		src="resources/libs/select2-multi-checkboxes/select2.multi-checkboxes.js"></script>


	<script>
		var datatable = null;
		var datatable2 = null;
		var activeTab = "tab-1";
		var datatableTemp = datatable;

		var columns = [ {
			"data" : "description",
			"name" : "description",
			"title" : "<spring:message code='workScheduleName'/>"
		}, {
			"data" : "start_date",
			"name" : "start_date",
			"title" : "<spring:message code='workScheduleDateInterval'/>"
		}, {
			"data" : "start_time",
			"name" : "start_time",
			"title" : "<spring:message code='workScheduleTimeInterval'/>"
		}, {
			"data" : "days",
			"name" : "days",
			"title" : "<spring:message code='days'/>"
		}, {
			"data" : "days",
			"name" : "days",
			"title" : ""
		}  ];

		var columnsMobile = [ {
			"data" : "description",
			"name" : "description",
			"title" : "<spring:message code='workScheduleName'/>"
		}, {
			"data" : "alias",
			"name" : "alias",
			"title" : "<spring:message code='Alias'/>"
		}, {
			"data" : "work_type",
			"name" : "work_type",
			"title" : "<spring:message code='status'/>"
		}, {
			"data" : "start_date",
			"name" : "start_date",
			"title" : "<spring:message code='workScheduleDateInterval'/>"
		}, {
			"data" : "start_time",
			"name" : "start_time",
			"title" : "<spring:message code='workScheduleTimeInterval'/>"
		}, {
			"data" : "days",
			"name" : "days",
			"title" : "<spring:message code='days'/>"
		}, {
			"data" : "days",
			"name" : "days",
			"title" : ""
		} ];

		function openDataTableViaDataAndSettings() {
			showLoading();
			$
					.ajax({
						url : "getShiftList",
						dataType : 'json',
						method : "GET",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(response) {
							if (response != null) {
								data = response.data;
								APP_CONFIG.datatable_default_options.data = data;
								APP_CONFIG.datatable_default_options.columns = columns;
								APP_CONFIG.datatable_default_options.filter = true;
								APP_CONFIG.datatable_default_options.stateSave = false;
								if (datatable) {
									datatable.clear();
									datatable.destroy();
									$("#datatable tfoot tr").remove();
								}

								datatable = $('#datatable')
										.DataTable(
												$.extend(
													{},
													APP_CONFIG.datatable_default_options,
													{
														"serverSide" : false,
														'columnDefs' : [ {
															"targets" : 4,
															"orderable" : false,
															"width" : "10px",
															"render" : function(
																	data,
																	type,
																	row,
																	meta) {
																var to_return = "";
																if (type === 'display') {

																	to_return = "<div class='custom_datatable_column_container'>";
																	to_return += '	<div class="edit_container hidden-print">\
																		<a class="menu_button" id="menu_button" href="javascript:;" onclick="open_edit_menu(this);"></a>\
																		<div class="edit_menu">\
																			<a href="javascript:;" onclick="delete_record(\''	+ row.rowno+ '\',this);"><spring:message code="delete"/></a>\
																		</div>\
																	</div>';

																	to_return += "</div>";
																}
																return to_return;
															}
														} ],
												        buttons: [
												        	{
												                extend: 'excel',
												                title : '<spring:message code="workScheduleTitle"/>',
												                autoFilter: true,
												                exportOptions: {
												                    columns: [ 0, 1, 2, 3]
												                }
												            }, 
												            {
												                extend: 'pdf',
												                title : '<spring:message code="workScheduleTitle"/>',
													            orientation: 'landscape',
													            exportOptions: {
												                    columns: [ 0, 1, 2, 3]
												                }
												            }, 
												            {
												                extend: 'print',
													            title : '<spring:message code="workScheduleTitle"/>',
													            exportOptions: {
												                    columns: [ 0, 1, 2, 3]
												                }
												            }
												        ]
													}));
							}

							datatable.buttons()[0].node.style.visibility = 'hidden';
							datatable.buttons()[1].node.style.visibility = 'hidden';
							datatable.buttons()[2].node.style.visibility = 'hidden';


							datatableTemp = datatable;
							hideLoading();
						},
						error : function(xhr) {
							hideLoading();
							BASE.show_info_messages("error", "<spring:message code='error'/>", "<spring:message code='unknownError'/>");
						}
					});

		}

		function openDataTableViaDataAndSettings2() {
			showLoading();
			$.ajax({
			url : "getMobileShiftList",
			dataType : 'json',
			method : "GET",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(response) {
				if (response != null) {
					data = response.data;
					APP_CONFIG.datatable_default_options.data = data;
					APP_CONFIG.datatable_default_options.columns = columnsMobile;
					APP_CONFIG.datatable_default_options.filter = true;
					APP_CONFIG.datatable_default_options.stateSave = false;
					if (datatable2) {
						datatable2.clear();
						datatable2.destroy();
						$("#datatable2 tfoot tr").remove();
					}

					datatable2 = $('#datatable2')
							.DataTable(
								$.extend(
									{},
									APP_CONFIG.datatable_default_options,
									{
										"serverSide" : false,
										'columnDefs' : [ {
											"targets" : 6,
											"orderable" : false,
											"width" : "10px",
											"render" : function(
													data,
													type,
													row,
													meta) {
												var to_return = "";
												if (type === 'display') {

													to_return = "<div class='custom_datatable_column_container'>";
													to_return += '	<div class="edit_container hidden-print">\
														<a class="menu_button" id="menu_button" href="javascript:;" onclick="open_edit_menu(this);"></a>\
														<div class="edit_menu">\
															<a href="javascript:;" onclick="delete_record_mobile(\''
																			+ row.rowno
																			+ '\',this);"><spring:message code="delete"/></a>\
														</div>\
													</div>';

													to_return += "</div>";
												}
												return to_return;
											}
										} ],
								        buttons: [
								        	{
								                extend: 'excel',
								                title : '<spring:message code="workScheduleMobileTitle"/>',
								                autoFilter: true,
								                exportOptions: {
								                    columns: [ 0, 1, 2, 3,4,5]
								                }
								            }, 
								            {
								                extend: 'pdf',
								                title : '<spring:message code="workScheduleMobileTitle"/>',
									            orientation: 'landscape',
									            exportOptions: {
									            	columns: [ 0, 1, 2, 3,4,5]
								                }
								            }, 
								            {
								                extend: 'print',
									            title : '<spring:message code="workScheduleMobileTitle"/>',
									            exportOptions: {
									            	columns: [ 0, 1, 2, 3,4,5]
								                }
								            }
								        ]
									}));
				}
				datatable2.buttons()[0].node.style.visibility = 'hidden';
				datatable2.buttons()[1].node.style.visibility = 'hidden';
				datatable2.buttons()[2].node.style.visibility = 'hidden';
				hideLoading();
			},
			error : function(xhr) {
				hideLoading();
				BASE.show_info_messages("error", "<spring:message code='error'/>", "<spring:message code='unknownError'/>");
			}
		});

		}

		$(document).ready(function() {
			addActiveClassToInnerMenu(".settings_management_shifts");
			openDataTableViaDataAndSettings();
			openDataTableViaDataAndSettings2();
			loadVehicles();

			initializeDateSettings();
		});

		function toggle_form_container(to_toggle) {
			if (activeTab == "tab-1") {
				$(".vehicle_selection_container").hide();
				$(".vehicle_choice").hide();
				$(".toggle_wrapper_w_hidden_content").hide();

				$(".hidden_form:not(." + to_toggle + ")").hide();

				if ($(".hidden_form." + to_toggle).is(":visible")) {
					$(".hidden_form." + to_toggle).hide();
					$(".widget_datatable1").show();
					$(".top_container").show();
				} else {
					clearForm();
					$(".hidden_form." + to_toggle).show();
					$(".widget_datatable1").hide();
					$(".top_container").hide();
				}

				datatableTemp = datatable;
			} else if (activeTab == "tab-2"){
				$(".vehicle_selection_container").show();
				$(".vehicle_choice").show();
				$(".toggle_wrapper_w_hidden_content").hide();

				$(".hidden_form:not(." + to_toggle + ")").hide();

				if ($(".hidden_form." + to_toggle).is(":visible")) {
					$(".hidden_form." + to_toggle).hide();
					$(".widget_datatable2").show();
					$(".top_container").show();
				} else {
					clearForm();
					$(".hidden_form." + to_toggle).show();
					$(".widget_datatable2").hide();
					$(".top_container").hide();
				}
				datatableTemp = datatable2;
			}
			var d = new Date();
			var date = new Date();
			var year = d.getFullYear() + 1;
			date.setFullYear(year);

			$('#dateRange').daterangepicker({
				startDate : d,
				endDate : date,
				locale : {
					format : 'DD.MM.YYYY'
				}
			});
		}

		function submit_form(to_submit) {
			var form_data = get_form_data("." + to_submit);
			
			form_data.start_date_str = $("#stDate").val();
			form_data.end_date_str = $("#endDate").val();

			if(form_data.start_date_str && form_data.end_date_str){
				var st = moment(form_data.start_date_str,"DD.MM.YYYY");
				var ms1 = moment(form_data.end_date_str,"DD.MM.YYYY");

				if(st >= ms1){
					BASE.show_info_messages("warning","<spring:message code='warning'/>","<spring:message code='stDateCannotBiggerThanEndDate'/>");
					return false;
				}
			}

			form_data.start_time_str = $("#time_start").val();
			form_data.end_time_str = $("#time_end").val();
			if(form_data.start_time_str && form_data.end_time_str){
				var h1 = form_data.start_time_str.split(":")[0];
				var m1 = form_data.start_time_str.split(":")[1];
				var h2 = form_data.end_time_str.split(":")[0];
				var m2 = form_data.end_time_str.split(":")[1];

				if(h1 > h2 || (h1 == h2 && m1 >= m2)){
					BASE.show_info_messages("warning","<spring:message code='warning'/>","<spring:message code='stTimeCannotBiggerThanEndTime'/>");
					return false;
				}
			}

			var dto = {
				description : $("#shift_name").val(),
				start_time : $("#time_start").val(),
				end_time : $("#time_end").val(),
				start_date : form_data.start_date_str,
				end_date : form_data.end_date_str,
				monday : document.getElementById("weekly_day_1").checked,
				tuesday : document.getElementById("weekly_day_2").checked,
				wednesday : document.getElementById("weekly_day_3").checked,
				thursday : document.getElementById("weekly_day_4").checked,
				friday : document.getElementById("weekly_day_5").checked,
				saturday : document.getElementById("weekly_day_6").checked,
				sunday : document.getElementById("weekly_day_0").checked,
				work_type: $("#work_type").val()
			}
			if (activeTab == "tab-2") {

				var mobiles = $("#select2_vehicles").val();
				if(!mobiles || mobiles.length < 1){
					BASE.show_info_messages( "warning", "<spring:message code='warning'/>", "<spring:message code='pleaseSelectMobile'/>");
					return false;
				}
				dto = {
					description : $("#shift_name").val(),
					start_time : $("#time_start").val(),
					end_time : $("#time_end").val(),
					start_date : form_data.start_date_str,
					end_date : form_data.end_date_str,
					monday : document.getElementById("weekly_day_1").checked,
					tuesday : document.getElementById("weekly_day_2").checked,
					wednesday : document.getElementById("weekly_day_3").checked,
					thursday : document.getElementById("weekly_day_4").checked,
					friday : document.getElementById("weekly_day_5").checked,
					saturday : document.getElementById("weekly_day_6").checked,
					sunday : document.getElementById("weekly_day_0").checked,
					mobileList : mobiles,
					work_type: $("#work_type").val()
				}
			}

			if ($.isEmptyObject(form_data.errors)) {
				showLoading();
				if (activeTab == "tab-1") {
					_query("workScheduleInsert", "POST", dto, true).then(function(d) {
						if (d.succes) {
							openDataTableViaDataAndSettings();
							toggle_form_container(to_submit);
						} else {
							BASE.show_info_messages( "warning", "<spring:message code='workScheduleError'/>", data.message);
						}
						hideLoading();
					});
				} else {
					_query("workScheduleMobileInsert", "POST", dto, true).then(function(d) {
						if (d.succes) {
							openDataTableViaDataAndSettings2();
							toggle_form_container(to_submit);
						} else {
							BASE.show_info_messages("warning","<spring:message code='workScheduleError'/>",data.message);
						}
						hideLoading();
					});
				}
				
			} else {
				BASE.show_info_messages("warning", "<spring:message code='pleaseFillRequiredfields'/>", data.message);
			}
		}

		function clearForm() {
			$("#shift_name").val("");
			$("#weekly_day_1")[0].checked=false;
			$("#weekly_day_2")[0].checked=false;
			$("#weekly_day_3")[0].checked=false;
			$("#weekly_day_4")[0].checked=false;
			$("#weekly_day_5")[0].checked=false;
			$("#weekly_day_6")[0].checked=false;
			$("#weekly_day_0")[0].checked=false;
			$("#time_start").val("00:00");
			$("#time_end").val("00:00");

			$("#work_type").val($("#work_type option:first").val()).change();
			$("#select_vehicles_all").prop("checked",true).change();
			$("#select_vehicles_all").prop("checked",false).change();

			$("#stDate").val(moment().format("DD.MM.YYYY"));
			$("#endDate").val(moment().format("DD.MM.YYYY"));
		}

		function _query(url, method, data, isStringify) {
			var sendData = isStringify ? JSON.stringify(data) : data;
			return new Promise(function(resolve, reject) {

				$.ajax({
					url : url,
					type : method,
					data : sendData,
					contentType : "application/json; charset=utf-8",
					success : function(res) {
						if (res && (res.data || res.succes)) {
							resolve(res);
						}
						resolve(false);
					},
					error : function(xhr) {
						resolve(false);
					}
				});
			});

		}

		function delete_record(rowno, dom_element) {
			var dto = {
				rowno : rowno,
			}
			showLoading();
			_query("workScheduleDelete", "POST", dto, true).then(function(d) {
				if (d.succes) {
					$(dom_element).parents("tr").remove();
					$(dom_element).parents("li").remove();
				} else {
					BASE .show_info_messages( "warning", "<spring:message code='driverDeleteError'/>", data.message);
				}
				hideLoading();
			});
		}

		function delete_record_mobile(rowno, dom_element) {
			var dto = {
				rowno : rowno,
			}
			showLoading();
			_query("workScheduleMobileDelete", "POST", dto, true).then(function(d) {
				if (d.succes) {
					$(dom_element).parents("tr").remove();
					$(dom_element).parents("li").remove();
				} else {
					BASE .show_info_messages( "warning", "<spring:message code='workScheduleError'/>", data.message);
				}
				hideLoading();
			});
		}

		function saveMesaiDisiKonumIsleme(){
			var dto = {
					dataId : $("#location_data_usage").prop("checked") ? 1: 0,
				}
				showLoading();
				_query("setLocationDataUsage", "POST", dto, true).then(function(d) {
					if(!d){
						BASE .show_info_messages( "warning", "<spring:message code='warning'/>","<spring:message code='islemBasarisiz'/>");
					}
					BASE .show_info_messages( "info", "<spring:message code='info'/>", d.message);
					hideLoading();
				});
		}

		function switch_tab(link_clicked) {
			var tab_id = $(link_clicked).attr('data-tab');

			if (tab_id == "tab-1") {
				activeTab = "tab-1";
				$(".page_header .filter_container").fadeIn(200);
				$(".widget_datatable1").show();
				$(".widget_datatable2").hide();
				$("#work_type_div").addClass("hidden");
				$("#settingPageDiv").addClass("hidden");
				$("#yeniMesaiBtn").show();
				$(".dropdown").show();
				datatableTemp = datatable;
			} else if (tab_id == "tab-2"){
				activeTab = "tab-2";
				document.getElementById("datatable2").style.width = '100%';
				$(".page_header .filter_container").fadeOut(200);
				$(".widget_datatable1").hide();
				$(".widget_datatable2").show();
				$("#work_type_div").removeClass("hidden");
				$("#settingPageDiv").addClass("hidden");
				$("#yeniMesaiBtn").show();
				$(".dropdown").show();
				datatableTemp = datatable2;
			}else{
				activeTab = "tab-3";
				$(".page_header .filter_container").fadeOut(200);
				$(".widget_datatable1").hide();
				$(".widget_datatable2").hide();
				$("#work_type_div").addClass("hidden");
				$("#settingPageDiv").removeClass("hidden");
				$("#yeniMesaiBtn").hide();
				$(".dropdown").hide();
			}

			$('.column.tab_container li').removeClass('current');
			$('.tabContent').removeClass('current');

			$(link_clicked).addClass('current');
			$("#" + tab_id).addClass('current');
		}

		function loadVehicles() {
			var developerData = {
				"grName" : "-1"
			};
			showLoading();
			$.ajax({
			url : "mobileListGr",
			data : developerData,
			method : "POST",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(response) {
				initialize_select2("#select2_vehicles", response, "<spring:message code='chooseMobile'/>");
				hideLoading();
			},error: function(er){
				hideLoading();
			}
		});
		}

		function initializeDateSettings(){
			  $('.datePickerSingle').daterangepicker({
				    singleDatePicker: true,
				    showDropdowns: true,
				    minYear: 2000,
				    maxYear: 2099,
			        autoApply: true,
			        dateFormat: 'dd.mm.yyyy',
				    locale: {
				    	format: 'DD.MM.YYYY',
				    	monthNames: [
						    "<spring:message code='ocak'/>",
						     "<spring:message code='subat'/>",
					     	 "<spring:message code='mart'/>",
					     	 "<spring:message code='nisan'/>",
					         "<spring:message code='mayis'/>",
					         "<spring:message code='haziran'/>",
					         "<spring:message code='temmuz'/>",
					         "<spring:message code='agustos'/>",
					         "<spring:message code='eylul'/>",
					         "<spring:message code='ekim'/>",
					         "<spring:message code='kasim'/>",
					         "<spring:message code='aralik'/>"
					               ]
				    }
				  }, function(start, end, label) {
				 	//   var years = moment().diff(start, 'years');
				 	//   alert("You are " + years + " years old!");
				  });
		}

	</script>
</body>
</html>
