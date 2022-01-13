<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
 <title><spring:message code="appTitle"/></title>
<link rel="icon" type="image/png" href="resources/assets/styles/images/favicon.png">
<link href="resources/assets/styles/fonts/googleapis.css"  rel="stylesheet"/>
<link rel="stylesheet"
	href="resources/libs/datatables/datatables.min.css" />
	<link rel="stylesheet" href="resources/libs/font-awesome/4.7.0/css/font-awesome.css" />
<link href="resources/libs/font-awesome/5.13.1/css/promin.css" rel="stylesheet"/>
<link
	href="resources/libs/select2/4.0.3/css/select2.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="resources/libs/jquery/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="resources/assets/styles/css/base.css">

<script src="resources/libs/jquery/jquery-1.12.4.js"></script>

</head>
<body class="">

	<jsp:include page='common/header.jsp'></jsp:include>

	<main>
		<div class="page_header">
			<div class="form_container column_container">
				<div class="column column_4_1">
					<h1><spring:message code="settings"/></h1>
				</div>
				<div class="column column_4_3 filter_container">
					<div class="input_wrapper">
						<span class="comboLabelsBildirimler"><spring:message code='userType'/></span>
						<select id="datatable_filter_vehicle_group" required>
							<option value="-"><spring:message code="userType"/></option>
						</select>
					</div>
					<div class="input_wrapper input_wrapper_w_icons">
						<span class="comboLabelsBildirimler"><spring:message code='filterTitleArama'/></span>
						<input type="text" id="searchUserText" value=""
							placeholder="<spring:message code='searchUser'/>">
						<div class="icons" "style="top: 15px;">
							<a href="javascript:;" onclick="search_all_routes();"><i
								class="far fa-search"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="column_container">
	
			<jsp:include page='common/innerMenu.jsp'></jsp:include>

			<div class="column column_4_3">
				<!-- User Add -->
				<div class="widget_container add_container hidden hidden_form">
					<div class="widget_header"><spring:message code='newUser'/></div>
					<div class="widget_content">
						<div
							class="form_container form_container_alternative column_container">
							<div class="column">
								<div class="input_wrapper">
									<label for="user_name_new"><spring:message code='username'/></label> <input
										type="text" id="user_name_new" placeholder="<spring:message code='username'/>" max="32"
										class="field forced">
								</div>
								<div class="column_container">
									<div class="column input_wrapper">
										<label for="password_new"><spring:message code='password'/></label> <input type="password" min="6"  minlength="6"
											id="password_new" placeholder="<spring:message code='password'/>" class="field forced">
									</div>
									<div class="column input_wrapper">
										<label for="password_re_new"><spring:message code='passwordAgain'/></label> <input
											type="password" id="password_re_new" laceholder="<spring:message code='passwordAgain'/>" minlength="6"
											class="field forced">
									</div>
								</div>
								<div class="column_container">
									<div class="column input_wrapper">
										<label for="user_firstname_new"><spring:message code='name'/></label> <input type="text"
											id="user_firstname_new" placeholder="<spring:message code='name'/>"
											class="field forced">
									</div>
									<div class="column input_wrapper">
										<label for="user_lastname_new"><spring:message code='surname'/></label> <input
											type="text" id="user_lastname_new" placeholder="<spring:message code='surname'/>">
									</div>
								</div>
								<div class="column_container">
									<div class="column input_wrapper">
										<label for="user_email_new"><spring:message code='emailAdr'/></label> <input
											type="text" id="user_email_new"
											placeholder="<spring:message code='fillEPostaField'/>" class="field forced"
											data-mask="email">
									</div>
									<div class="column input_wrapper">
										<label for="user_phone_new"><spring:message code='phoneNumber'/></label> <input
											type="text" id="user_phone_new" placeholder="05XX XXX XX XX"
											class="field forced" data-mask="phone">
									</div>
								</div>
								<div class="column_container">
									<div class="column input_wrapper">
										<label for="user"><spring:message code='userType'/></label> <select name="user"
											id="user_type_new" class="forced">
										</select>
									</div>
									<div class="column input_wrapper">
										<label for="user">
											<spring:message code='geoPrivilegeText'/>
										</label> <select name="user" id="rigth_geo_new">
											<option value="1"><spring:message code='VAR'/></option>
											<option value="0"><spring:message code='YOK'/></option>
											<option value="2"><spring:message code='canView'/></option>
										</select>
									</div>
								</div>
							</div>
							<div class="column">
								<div class="input_wrapper companySelectForMobilesDiv">
									<label for="company"><spring:message code='company'/></label> <select name="company"
										class="companySelectForMobiles"
										id="companySelectForMobiles_new">
										<option value="-"><spring:message code='all'/></option>
									</select>
								</div>

								<div class="input_wrapper">
									<label for="user"><spring:message code='mobilePrivilege'/></label>
								</div>
								<div class="select2_wrapper">
									<select id="select2_2" class="field select2_2" multiple></select>
									<div class="input_wrapper checkbox_wrapper">
										<input type="checkbox" id="select_2_all_1"
											data-key="select_2_all_1"
											onChange="select2_select_all(this);"> <label
											for="select_2_all_1"><span><spring:message code='selectAllMobiles'/></span></label>
									</div>
								</div>
								<div class="input_wrapper">
									<br> <label for="user"><spring:message code='reportsPrivilege'/></label>
								</div>
								<div class="select2_wrapper">
									<select id="select2_3" class="field select2_3" multiple></select>
									<div class="input_wrapper checkbox_wrapper">
										<input type="checkbox" id="select_2_all_3"
											data-key="select_2_all_3"
											onChange="select2_select_all(this);"> <label
											for="select_2_all_3"><span><spring:message code='selectAllReports'/></span></label>
									</div>
								</div>
								<div class="button_container right_aligned">
									<a class="button button_white" href="javascript:;"
										onClick="object_functions.toggle_add_form();"><spring:message code='cancel'/></a> <a
										class="button" href="javascript:;"
										onClick="object_functions.add();"><spring:message code='save'/></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--EOF User Add -->

				<!-- User Edit -->
				<div class="widget_container update_container hidden hidden_form">
					<div class="widget_header">
						<spring:message code='editUser'/> - <strong></strong>
					</div>
					<div class="widget_content">
						<div
							class="form_container form_container_alternative column_container">
							<div class="column">
								<div class="input_wrapper">
									<label for="user_name"><spring:message code='username'/></label> <input type="text"
										id="user_name" placeholder="<spring:message code='username'/>" max="32" disabled>
								</div>
								<div class="column_container">
									<div class="column input_wrapper">
										<label for="password"><spring:message code='password'/></label> <input type="password" min="6"  minlength="6"
											id="password" placeholder="<spring:message code='password'/>"
											style="margin-bottom: 10px;">
									</div>
									<div class="column input_wrapper">
										<label for="password_re"><spring:message code='passwordAgain'/></label> <input
											type="password" min="6" id="password_re"  placeholder="<spring:message code='passwordAgain'/>"  minlength="6">
									</div>
								</div>
								<div class="column_container">
									<div class="column input_wrapper">
										<label for="user_firstname"><spring:message code='name'/></label> <input type="text"
											id="user_firstname" placeholder="<spring:message code='name'/>">
									</div>
									<div class="column input_wrapper">
										<label for="user_lastname"><spring:message code='surname'/></label> <input type="text"
											id="user_lastname" placeholder="<spring:message code='surname'/>">
									</div>
								</div>
								<div class="column_container">
									<div class="column input_wrapper">
										<label for="user_email"><spring:message code='emailAdr'/></label> <input
											type="text" id="user_email"
											placeholder="<spring:message code='fillEPostaField'/>">
									</div>
									<div class="column input_wrapper">
										<label for="user_phone"><spring:message code='phoneNumber'/></label> <input type="text"
											id="user_phone" placeholder="05XX XXX XX XX">
									</div>
								</div>
								<div class="column_container">
									<div class="column input_wrapper">
										<label for="user"><spring:message code='userType'/></label> <select name="user"
											id="user_type_select">
										</select>
									</div>
									<div class="column input_wrapper" id="user_rigth_geo_div">
										<label for="user">
											<spring:message code='geoPrivilegeText'/>	
										</label> <select name="user" id="user_rigth_geo">
											<option value="1"><spring:message code='VAR'/></option>
											<option value="0"><spring:message code='YOK'/></option>
											<option value="2"><spring:message code='canView'/></option>
										</select>
									</div>
								</div>
							</div>
							<div class="column">
								<div class="input_wrapper companySelectForMobilesDiv">
									<label for="company"><spring:message code='company'/></label> <select name="company"
										class="companySelectForMobiles"
										id="companySelectForMobiles_edit">
										<option value="-"><spring:message code='all'/></option>
									</select>
								</div>
								<div class="input_wrapper">
									<label for="user"><spring:message code='mobilePrivilege'/></label>
								</div>
								<div class="select2_wrapper">
									<select id="select2_4" class="field select2_4" multiple>
									</select>
									<div class="input_wrapper checkbox_wrapper">
										<input type="checkbox" id="select_2_all_4"
											data-key="select_2_all_4" class="field"
											onChange="select2_select_all(this);"> <label
											for="select_2_all_4"><span><spring:message code='selectAllMobiles'/></span></label>
									</div>
								</div>
								<div class="input_wrapper">
									<br> <label for="user"><spring:message code='reportsPrivilege'/></label>
								</div>
								<div class="select2_wrapper">
									<select id="select2_5" class="field select2_5" multiple>
									</select>
									<div class="input_wrapper checkbox_wrapper">
										<input type="checkbox" id="select_2_all_5"
											data-key="select_2_all_5" class="field"
											onChange="select2_select_all(this);"> <label
											for="select_2_all_5"><span><spring:message code='selectAllReports'/></span></label>
									</div>
								</div>
								<div class="button_container right_aligned">
									<a class="button button_white" href="javascript:;"
										onClick="object_functions.toggle_update_form();"><spring:message code='cancel'/></a> <a
										class="button" href="javascript:;"
										onClick="object_functions.update();"><spring:message code='save'/></a>
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

	<script
		src="resources/libs/datatables/datatables.min.js"></script>

	<jsp:include page='resources/base.jsp'></jsp:include>
	<script
		src="resources/libs/js/jquery.inputmask.js"></script>
	<script src="resources/libs/jquery/jquery-ui.js"></script>
	<script
		src="resources/libs/select2/4.0.3/js/select2.min.js"></script>
	<script
		src="resources/libs/select2-multi-checkboxes/select2.multi-checkboxes.js"></script>
		<link rel="stylesheet" href="resources/assets/styles/css/infotech.css">


	<script	src="resources/libs/select2/4.0.3/js/select2.min.js"></script>
	<script type="text/javascript" src="resources/assets/scripts/common.js"/></script>
	
		
	<script type="text/javascript">
	$(document).ready(function() {
		addActiveClassToInnerMenu(".settings_management_users");
		setAdminComboSelections();		
		openDataTableViaDataAndSettings();
		loadKullaniciTypeList();

		getUserCompanyRelatinsList(); // Kullanıcının mobilleri tek bir company'den mi yoksa alt companylerden de mi geliyor.
		controlMax("#password",32);
		controlMax("#password_re",32);
		controlMax("#password_new",32);
		controlMax("#password_re_new",32);
		controlMax("#user_firstname",25);
		controlMax("#user_lastname",25);
		controlMax("#user_firstname_new",25);
		controlMax("#user_lastname_new",25);
		controlMax("#user_email_new",50);
		controlMax("#user_email",50);

		
	});

	var companyAllMobileList =  null;
	var reportList =  null;
	var data = null;
	var notSelectedCompanyMobiles = null;
	var userReportList = [];
	var useraAtanmamisRaporList = [];
	var notSelectedCompanyReports  = [];
	var eventTrClicksEventBindings = false;
	var isOldValueAdmin = false;

	function loadKullaniciTypeList(){
	_query("user/privilegesComboList","GET",{},false).then(function(data) {
		if(data && data.succes && data.data){
			var d = data.data;
			for (i = 0; i < d.length; i++) {
				$('#datatable_filter_vehicle_group').append($('<option>', {
				    value: d[i].value,
				    text: d[i].label
				}));
				$('#user_type_new').append($('<option>', {
				    value: d[i].value,
				    text: d[i].label
				}));
				$('#user_type_select').append($('<option>', {
				    value: d[i].value,
				    text: d[i].label
				}));
			}
		}
	});
	}

	function getUserCompanyRelatinsList(){
		_query("company/listUserCompanyRelationsList","GET",{},false).then(function(data) {
			if(data && data.succes && data.data){
				var d = data.data;

				if(d.length < 2){
					$(".companySelectForMobilesDiv").css("display","none");
				}else{
					$(".companySelectForMobilesDiv").css("display","block");
				
				for (i = 0; i < d.length; i++) {
					$('.companySelectForMobiles').append($('<option>', {
					    value: d[i].childCompany,
					    text: d[i].childCompany
					}));
				}
			 }
			}
		});

		$(".companySelectForMobiles").on("change",function(){
			    var filter = $(this).val();

			    //Öncelikle seçilen araçları boşalt - ok
			    var mobileSelect = $("#select2_4").closest(".select2_wrapper");
			    $("select",mobileSelect).val(null).trigger("change");

			    //Aşağı doğru açılan select2 dropdownu boşalt
			    $("#select2_4").select2({
			        matcher: function(term, text, option) {
			            return false;
			        }
			    });

			    if(filter == "-"){
			    	initialize_select2("#select2_4",companyAllMobileList,"<spring:message code='searchMobile'/>");
				 }else{
				    var newArray = companyAllMobileList.filter(function (el) { return el.company == filter });
		    		initialize_select2("#select2_4",newArray,"<spring:message code='searchMobile'/>");
				}
			})
		}

	function setAdminComboSelections(){
		
		$("#user_type_new").on("change",function(){
			var d = $("#user_type_new").val()
			if(d == "1"){
				$("#select_2_all_1").prop("checked",true);
				select2_select_all("#select_2_all_1");
				$("#rigth_geo_new").attr("disabled","disabled");
				$("#rigth_geo_new").val("1");
			}else{
				$("#rigth_geo_new").attr("disabled",false);
				$("#rigth_geo_new").val("0");
			}
		});

		

		$("#user_type_select").on("change",function(){
			var d = $("#user_type_select").val();
			if(d == "1"){
				$("#select_2_all_4").prop("checked",true);
				select2_select_all("#select_2_all_4");
				$("#user_rigth_geo").attr("disabled","disabled");
				$("#user_rigth_geo").val("1");
				isOldValueAdmin = true;
			}else{
				$("#user_rigth_geo").attr("disabled",false);
				if(isOldValueAdmin)
					$("#user_rigth_geo").val("0");
				isOldValueAdmin = false;
			}
		});
	}

	
var columns = [
	{
		"data": "username",
		"name": "username",
		"title": "<spring:message code='username'/>"
	},
	{
		"data": "uname",
		"name": "uname",
		"title": "<spring:message code='name'/>"
	},
	{
		"data": "usurname",
		"name": "usurname",
		"title": "<spring:message code='surname'/>"
	},
	{
		"data": "email",
		"name": "email",
		"title": "<spring:message code='e_posta'/>"
	},
	{
		"data": "msisdn",
		"name": "msisdn",
		"title": "<spring:message code='phoneNumber'/>"
	},
	{
		"data": "privilegeText",
		"name": "privilegeText",
		"title": "<spring:message code='userType'/>"
	},
	{
		"data": "rightGeoText",
		"name": "rightGeoText",
		"title": "<spring:message code='geoRight'/>"
	},
	{
		"data":"aliasesTextList",
		"name":"aliasesTextList",
		"title":"<spring:message code='assignedMobiles'/>"
	},
	{
		"data":"aliasesTextList",
		"name":"aliasesTextList",
		"title":""
	}
];

function paswordKontrol(t){
	var errors = [];

	var newPassword = $("#password"+ t).val();
	var newPasswordRe = $("#password_re"+t).val();
	
	if(newPassword != newPasswordRe){
		BASE.show_info_messages("warning","<spring:message code='warning'/>","<spring:message code='passwordsNotSame'/>");
		errors.push("Şifreler eşleşmiyor");
		return errors
	}

	if(newPassword && newPassword.length < 6){
		BASE.show_info_messages("warning","<spring:message code='warning'/>","<spring:message code='passwordMustLeast6Char'/>");
		errors.push("<spring:message code='passwordMustLeast6Char'/>");
		return errors
	}

	return errors;
}

/*Necessary objects and functions for this page*/
var datatable = null;
var object_functions 	= {
	"add"		: () => {
		var form_data = get_form_data(".hidden_form.add_container .form_container");
		console.log(form_data);
		//Do yout thing here!
		if($.isEmptyObject(form_data.errors) &&  $.isEmptyObject(paswordKontrol("_new"))){
			if($("#user_type_new").val() != null){
				saveNewUser();
			}else{
				BASE.show_info_messages("warning","<spring:message code='warning'/>","<spring:message code='userTypeselectionMsg'/>");
			}
		}
	},
	"update" 	: () => {
		var form_data = get_form_data(".hidden_form.update_container .form_container");

		//Do yout thing here!
		if($.isEmptyObject(form_data.errors)  &&  $.isEmptyObject(paswordKontrol(""))){
			//TODO: check errors, do the ajax and update the group!
			updateUserData();
			object_functions.toggle_update_form();
		}			
	},
	"delete": (object_id,dom_element) => { // TODO test et

		var r = confirm("<spring:message code='sureDeleteRecord'/>");
		if (r == false) {
			return false;
		}
		
		_query("user/delete_by_username","POST", object_id,false).then(function(data) {
			if(data && data.succes){
				$(dom_element).parents("tr").remove();
				$(dom_element).parents("li").remove();
				openDataTableViaDataAndSettings();
			}else{
				console.log("silme işlemi sırasında bir hata oluştu"); //TODO silme Başarısız  mesajı
			}

		});
		//TODO: do the ajax and delete the object.
	},
	"toggle_add_form": (group_id) => {
		if(!$('.hidden_form.add_container').is(":visible")){
			$('.hidden_form.add_container').show();
			$(".top_container").hide();
			$(".filter_container").hide();
			getVehicleList("#select2_2",null);
			getReportList("#select2_3",null);
			$("#user_type_new").val("7");
			$("#user_type_new").trigger('change');
		}
		else{
			$('.hidden_form.add_container').hide();
			$(".top_container").show();
			$(".filter_container").show();
			//TODO Clear Form (?)
		}
	},
	"toggle_update_form": (data) => {
		if(!$('.hidden_form.update_container').is(":visible")){
			$('.hidden_form.update_container').show();
			$(".top_container").hide();
			$(".filter_container").hide();
			mapSelectedUserFromDatatable(data);

			 
		}
		else{
			$('.hidden_form.update_container').hide();
			$(".top_container").show();
			$(".filter_container").show();
			//TODO Clear Form (?)
		}
	}
}

function updateUserData(){
	showLoading();
	var dataT = getUpdateUserDatas();
	if(dataT){
		_query("user/saveUser","POST",dataT,true).then(function(data){
			if(data.succes){
				openDataTableViaDataAndSettings();
			}
			hideLoading();
		});
	}
}

	function clearForm(){
		$("#user_name_new").val("");
		$("#companySelectForMobiles_new").val("-");
		$("#password_new").val("");
		$("#password_re_new").val("");
		$("#user_firstname_new").val("");
		$("#user_lastname_new").val("");
		$("#user_email_new").val("");
		$("#user_phone_new").val("");
		$("#user_type_new").val("7");
		$("#rigth_geo_new").val("0");
		$("#companySelectForMobiles").val("-");
		$("#select2_2").val([]).trigger("change");
		$("#select2_3").val([]).trigger("change");
		$("#select_2_all_1").prop("checked",false).change();
		$("#select_2_all_3").prop("checked",false).change();
	}

function saveNewUser(){
	showLoading();
	var dataT = getNewUserDatas();
	if(dataT){
		_query("user/saveUser","POST",dataT,true).then(function(data){
			if(data.succes){
				clearForm();
				openDataTableViaDataAndSettings();
				object_functions.toggle_add_form();
			}
			hideLoading();
		});
	}
}

function getNewUserDatas(){
	var dataT = {};
	
	dataT.newPassword = $("#password_new").val();
	dataT.newPasswordRe = $("#password_re_new").val();
	
	dataT.uname = $("#user_firstname_new").val();
	dataT.usurname = $("#user_lastname_new").val();
	dataT.username = $("#user_name_new").val();
	dataT.email = $("#user_email_new").val();
	dataT.msisdn = $("#user_phone_new").val();
	dataT.privilege = parseInt($("#user_type_new").val());
	dataT.rightgeo = parseInt($("#rigth_geo_new").val());

	dataT.mobileNoList = getSelectedList("#select2_2");
	dataT.reportNoList = getSelectedList("#select2_3");

	dataT.chooseAllMobiles = $("#select_2_all_1").prop("checked");
	dataT.chooseAllReports = $("#select_2_all_3").prop("checked");
	dataT.companySelect = $("#companySelectForMobiles_new").val();
			
	return dataT;
}

function getUpdateUserDatas(){
	var dataT = {};
	dataT.newPassword = $("#password").val();
	dataT.newPasswordRe = $("#password_re").val();
	
	dataT.uname = $("#user_firstname").val();
	dataT.usurname = $("#user_lastname").val();
	dataT.username = $("#user_name").val();
	dataT.email = $("#user_email").val();
	dataT.msisdn = $("#user_phone").val();
	dataT.privilege = parseInt($("#user_type_select").val());
	dataT.rightgeo = parseInt($("#user_rigth_geo").val());
	
	dataT.mobileNoList = getSelectedList("#select2_4");
	dataT.reportNoList = getSelectedList("#select2_5");

	dataT.chooseAllMobiles = $("#select_2_all_4").prop("checked");
	dataT.chooseAllReports = $("#select_2_all_5").prop("checked");
	dataT.companySelect = $("#companySelectForMobiles_edit").val();
			
	return dataT;
}


function mapSelectedUserFromDatatable(dataT){
	$("#user_name").val(dataT.username);
	$("#user_firstname").val(dataT.uname);
	$("#user_lastname").val(dataT.usurname);
	$("#user_email").val(dataT.email);
	$("#user_phone").val(dataT.msisdn);
	$("#user_type_select").val(dataT.privilege);
	$("#user_rigth_geo").val(dataT.rightgeo);

	if(dataT.privilege == 1){ // Admin ise bu ayarın gizlenmesi istendi.
		$('#user_rigth_geo').attr('disabled', 'disabled');
		$('#user_rigth_geo').val("1");
		isOldValueAdmin = true;
	}else{
		$('#user_rigth_geo').removeAttr('disabled');
	}
	
	getVehicleList("#select2_4",dataT);
	getReportList("#select2_5",dataT);
}

function getSelectedList(combo){
	var list = [];
	$.each($(combo +" option:selected"), function(){
		var num = $(this).val();            
		list.push(num);
    });
    return list;
}

	function getVehicleList(combo,data){
		//if(companyAllMobileList != null && companyAllMobileList.length > 0){
		//	initialize_select2(combo,companyAllMobileList,"Tüm Araçlarda Ara");
		//	return false;
		//}
		
		$.ajax({
			url : "getCompanyMobiles",
			type : "get",
			success : function(res) {
				if(res && res.data){
					companyAllMobileList = [];
					notSelectedCompanyMobiles = [];
					for (i = 0; i < res.data.length; i++) {
							companyAllMobileList.push({"id": res.data[i].mobile,"text": res.data[i].alias,"company": res.data[i].company});
						if(!data || !data.aliasesTextList || !data.aliasesTextList.includes(res.data[i].alias)){
							notSelectedCompanyMobiles.push({"id": res.data[i].mobile,"text": res.data[i].alias});
						}
					}
				
				initialize_select2(combo,notSelectedCompanyMobiles,"<spring:message code='searchMobile'/>");
					if(data != null){
						autoSelectMobilesViaUserData(data);
						hepsiSecilecekmiKontrolMobiles(companyAllMobileList,data);
					}					
				}
			},
			error : function(xhr) {
				// TODO error mesaj
			}
		});
	}

	function hepsiSecilecekmiKontrolMobiles(resData,dataTemp){
		//Hespi seçimi
		var hespiSecilecekmi = true;
		if(dataTemp.aliasesTextList != null && resData.length == dataTemp.aliasesTextList.length){
			for (i = 0; i < resData.length; i++) {
				if(!dataTemp.aliasesTextList.includes(resData[i].text)){
					hespiSecilecekmi = false;
					break;
			}
		}
		}else{
			hespiSecilecekmi = false;
		}
	
		if(hespiSecilecekmi){
			$("#select_2_all_4").prop("checked",true);
			select2_select_all("#select_2_all_4");
		}
	}


	function autoSelectMobilesViaUserData(data){
		var combo = $("#select2_4");

		if(data.usersMobile && data.usersMobile.length > 1){
			data.usersMobile.sort((a, b) => a.alias.localeCompare(b.alias));
		}
		
        for (var index in data.usersMobile) {
            var d = data.usersMobile[index];
            var newOption = new Option(d.alias,d.mobile, true, true);
            combo.append(newOption).trigger('change');
		}
	}

	function getReportList(combo,data){

		if(reportList != null && reportList.length > 0){
			if(data)
				autoSelectReportsViaUserData(reportList,data.username);
			else
				initialize_select2(combo,reportList,"<spring:message code='chooseReport'/>");
			return false;
		}
		
		$.ajax({
			url : "companyReport/list",
			type : "get",
			success : function(res) {
				if(res && res.data){
					reportList = [];
					var rList = res.data;
					for (i = 0; i < rList.length; i++) {
						reportList.push({"id": rList[i].rowno,"text": rList[i].reportName});
					}

					initialize_select2(combo,reportList,"<spring:message code='chooseReport'/>");
					if(data)
						autoSelectReportsViaUserData(reportList,data.username);
				}
			},
			error : function(xhr) {
				// TODO error mesaj
			}
		});
	}


	function autoSelectReportsViaUserData(tumRaporlar,username){
		
			$.ajax({
				url : "usersReport/list",
				type : "get",
				data: {"username": username},
				success : function(res) {
					if(res && res.data){
					var userReportsL = [];
						for (i = 0; i < res.data.length; i++) {
							userReportsL.push(res.data[i].rowno);
						}

						$("#select2_5").val(userReportsL).trigger("change");
				        hepsiSecilecekmiKontrolReports(tumRaporlar,res.data);
					}
				},
				error : function(xhr) {
					// TODO error mesaj
				}
			});
	}


	function hepsiSecilecekmiKontrolReports(resData,dataTemp){
		var hespiSecilecekmi = true;
		if(resData.length == dataTemp.length){
			for (i = 0; i < resData.length; i++) {
				if(dataTemp[i].rowno != resData[i].id){
					hespiSecilecekmi = false;
					break;
			}
		}
		}else{
			hespiSecilecekmi = false;
		}
	
		if(hespiSecilecekmi){
			$("#select_2_all_5").prop("checked",true);
			select2_select_all("#select_2_all_5");
		}
	}
	
	function openDataTableViaDataAndSettings() {
		showLoading();
		$.ajax({
			 url: "user/getAllUsers",
			 dataType : 'json',			 
			method	: "GET",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(response){
				hideLoading();
				if(response !=null) {
					dataTableData = response.data;
					APP_CONFIG.datatable_default_options.data = dataTableData;
					APP_CONFIG.datatable_default_options.columns = columns;
					APP_CONFIG.datatable_default_options.filter = true;
					APP_CONFIG.datatable_default_options.stateSave = false;
				//	APP_CONFIG.datatable_default_options.responsive= true;
					//APP_CONFIG.datatable_default_options.order = [[0, 'asc'] ];
					APP_CONFIG.datatable_default_options.order= [];
					 if (datatable) {
						 datatable.clear();
						 datatable.destroy();
						} 
					 datatable =  $('#datatable').DataTable(
								$.extend({},
										APP_CONFIG.datatable_default_options,
										{
											 "serverSide"	:false,
												"columnDefs": [
												{
													 "targets"	: 3,
													'render': function(data, type, row, meta){
														if(type === 'display'){
															var email = row.email ? row.email : "";
															if(email && email.length > 14)
																email = email.substr(0,14) + "...";
															data =  '<label title="'+ row.email+'">'+email+'</label>';
														}
														return data;
													}
												},
												{
												 "targets"	: 7
												,"orderable": false,
												"render"	: function(dataTableData, type, row, meta){
													var to_return = "";
													if(type === 'display'){
														var assigned_cars 		 	= "'edit_assigned_cars'";
														var location_place 	 		= "'edit_map'";
														var vehicle_to_location 	= "'location_to_group'";

														to_return = "<div class='custom_datatable_column_container'>";
														if(dataTableData && dataTableData.length > 0){
															var plak = dataTableData[0] ? dataTableData[0] : "";
															if(plak && plak.length > 14)
																plak = plak.substr(0,14) + "...";
															to_return += "<div class='nowrap'><span>" + plak + "</span><strong title='"+dataTableData.join(", ")+"'> + " + (dataTableData.length-1) + " <spring:message code='mobile'/></strong></div>";
														}
													}
													return to_return;
												}
											}],
									        buttons: [
									        	{
									                extend: 'excel',
									                title : '<spring:message code="users"/>',
									                autoFilter: true,
									                exportOptions: {
									                    columns: [ 0, 1, 2, 3,4,5,6,7]
									                }
									            }, 
									            {
									                extend: 'pdf',
									                title : '<spring:message code="users"/>',
										            orientation: 'landscape',
										            exportOptions: {
									                    columns: [ 0, 1, 2, 3,4,5,6,7]
									                }
									            }, 
									            {
									                extend: 'print',
										            title : '<spring:message code="users"/>',
										            exportOptions: {
									                    columns: [ 0, 1, 2, 3,4,5,6,7]
									                }
									            }
									        ]
										}
									) 
								);

						datatable.buttons()[0].node.style.visibility = 'hidden';
						datatable.buttons()[1].node.style.visibility = 'hidden';
						datatable.buttons()[2].node.style.visibility = 'hidden';
						
					 $('#searchUserText').on( 'keyup', function () {
						 search_all_routes();
						});
				

					 $('#datatable_filter_vehicle_group').on('change', function () {
							var text = $("#datatable_filter_vehicle_group option:selected").text();
							var val = $("#datatable_filter_vehicle_group option:selected").val();
							if(val != "-"){
								datatable.columns(5).search(text).draw();
							}else{
								datatable.columns(5).search("").draw();
							}
						});



					    
						
						}

				if(!eventTrClicksEventBindings){
					eventTrClicksEventBindings = true;
					$('#datatable tbody').on('click', 'td', function () {
						data = datatable.row($(this).closest("tr")).data();
						if($(this).index() < datatable.columns().header().length-1){ //ignore the last one since it has an edit container! 
							object_functions.toggle_update_form(data);
						}
					});
				}
				},
				error : function(xhr) {
					hideLoading();
					BASE.show_info_messages("warning","<spring:message code='warning'/>","<spring:message code='unknownError'/>");
				}
		});
			
	}

	 function search_all_routes(){
		 var text = $('#searchUserText').val();
		 datatable
	        .columns(0)
	        .search(text)
	        .draw();
	}

	function editRowClass(row){
		data = datatable.row(row.closest("tr")).data();
		if($(this).index() < datatable.columns().header().length-1){ //ignore the last one since it has an edit container! 
			object_functions.toggle_update_form(data);
		}
	}

	function _query(url,method,data,isStringify){
		var sendData = isStringify ? JSON.stringify(data) : data;
			return new Promise(function(resolve, reject) {

				$.ajax({
					url : url,
					type : method,
					data: sendData,
					contentType: "application/json; charset=utf-8",
					success : function(res) {
						if(res && (res.data || res.succes)){
							resolve(res);
						}
					},
					error : function(xhr) {
						reject(xhr);
					}
				});
			});
				
		}
	
	

	
	$('.title .dt-checkboxes').change(function() {
		$('input:checkbox').not(this).prop('checked', this.checked);
	});

	
</script>
</body>
</html>
