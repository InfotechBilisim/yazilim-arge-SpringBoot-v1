<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
        
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
  <title><spring:message code="appTitle"/></title>
<link rel="icon"  type="image/png" href="resources/assets/styles/images/favicon.png">
<link href="resources/assets/styles/fonts/googleapis.css"  rel="stylesheet"/>
<link rel="stylesheet" href="resources/libs/font-awesome/4.7.0/css/font-awesome.css" />
<link href="resources/libs/font-awesome/5.13.1/css/promin.css" rel="stylesheet"/>
<link href="resources/libs/select2/4.0.3/css/select2.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="resources/libs/jquery/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript" src="resources/assets/scripts/common.js" /></script>

<script src="resources/libs/jquery/jquery-1.12.4.js"></script>

</head>
<body class="">

	<!-- TEMPLATE -->
	<jsp:include page='common/header.jsp'></jsp:include>
	<!-- TEMPLATE -->

	<main>
		<div class="page_header">
			<h1><spring:message code='settings'/></h1>
		</div>
		<div class="column_container">

			<!-- TEMPLATE -->
			<jsp:include page='common/innerMenu.jsp'></jsp:include>
			<!-- TEMPLATE -->

			<div class="column column_4_3">
				<div class="widget_container">
					<div class="widget_header">
						<spring:message code='userInfos'/> <strong> - <span id="idNameTittle"></span>
							- <%
					//	out.print(Utils.get().getUserCompany());
					%></strong>
					</div>
					<div class="widget_content">
						<div
							class="form_container form_container_alternative column_container">
							<div class="column ">
								<div class="input_wrapper">
									<label for="last_name"><spring:message code='name'/></label> <input class="field forced"
										data-key="first_name" type="text" id="first_name"
										placeholder="<spring:message code='name'/>">
								</div>
								<div class="input_wrapper">
									<label for="last_name"><spring:message code='surname'/></label> <input
										class="field forced" data-key="last_name" type="text"
										id="last_name" placeholder="<spring:message code='surname'/>">
								</div>

								<!-- 
								<div class="input_wrapper">
									<label for="email">E-Posta Adresi</label> <input
										class="field forced" data-mask="email" data-key="email"
										type="text" id="email" placeholder="E-Posta Adresi">
								</div>
								 -->

								<div class="input_wrapper">
									<label><spring:message code='e_posta'/></label>
								</div>
								<div class="select2_wrapper">
									<select id="email"
										class="field forced select2_email_address_edit" multiple></select>
								</div>
								<br>
								<div class="input_wrapper">
									<label for="phone"><spring:message code='phoneNumber'/></label> <input class="field forced"
										data-mask="phone" data-key="phone" type="text" id="phone"
										placeholder="05XX XXX XX XX">
								</div>
							</div>
							<div class="column ">
								<div class="input_wrapper">
									<label><spring:message code='mapReloadPeriod'/></label> 
									<select id="refresh_period">
										<option value="-1"><spring:message code='noRefresh'/></option>
										<option value="10000">10 <spring:message code='second'/></option>
										<option value="30000">30 <spring:message code='second'/></option>
										<option value="60000">1 <spring:message code='minute'/></option>
										<option value="120000">2 <spring:message code='minute'/></option>
										<option value="300000">5 <spring:message code='minute'/></option>
										<option value="600000">10 <spring:message code='minute'/></option>
									</select>
								</div>
							
								<div class="input_wrapper ">
									<label for="vehicle_name_type"><spring:message code='labelRepresetation'/></label> <select
										class="field" data-key="vehicle_name_type"
										id="vehicle_name_type">
										<option value="ALIAS"><spring:message code='mobileLabel'/></option>
										<option value="PLAKA_HIZ"><spring:message code='mobileLabel_Speed'/></option>
										<option value="PLAKA_SURUCU"><spring:message code='mobileLabel_Driver'/></option>
										<option value="SURUCU_HIZ"><spring:message code='driver_speed'/></option>
									</select>
								</div>


								<div class="input_wrapper">
									<label><spring:message code='autoProdLang'/></label> <select id="select_lang">
										<option value="tr"><spring:message code='turkish'/></option>
										<option value="en"><spring:message code='english'/></option>
									</select>
								</div>
								<!-- 
									<div class="input_wrapper toggle_wrapper">
										<input class="field" data-key="toggle" type="checkbox"
											id="toggle" name="toggle"> <label for="toggle">
											<span>Üst Üste Gelen Araçları Küme Olarak Göster</span> <i
											class="far fa-toggle-on"></i>
										</label>
	
									</div>
									<br>
								 -->
								<div
									class="input_wrapper input_wrapper_w_list input_wrapper_w_trigger">
									<label><spring:message code='password'/> <a href="javascript:;"
										onclick="object_functions.toggle_password_container();"><spring:message code='change'/></a></label>
								</div>
								<div class="password_container hidden">
									<div class="input_wrapper">
										<label for="password_exist"><spring:message code='currentPassword'/></label>
										<input class="field" data-key="password" type="password" id="password_exist" placeholder="<spring:message code='currentPassword'/>">
									</div>
									<div class="input_wrapper">
										<label for="password_new"><spring:message code='newPassword'/></label> <input
											class="field" data-key="password_new" type="password"
											id="password_new" minlength="6" placeholder="<spring:message code='newPassword'/>">
									</div>
									<div class="input_wrapper">
										<label for="password_new_re"><spring:message code='newPasswordAgain'/></label> <input
											class="field" data-key="password_new_re"
											type="password" id="password_new_re" minlength="6"
											placeholder="<spring:message code='newPasswordAgain'/>">
									</div>
								</div>
								<div class="button_container right_aligned">
									<a class="button button_rounded_corner" href="javascript:;"
										onClick="object_functions.update()"><spring:message code='save'/></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	
	<!-- TEMPLATE -->
	<jsp:include page='common/footer.jsp'></jsp:include>
	<jsp:include page='common/commonHtml.jsp'></jsp:include>
	<!-- TEMPLATE -->
	<link rel="stylesheet" href="resources/assets/styles/css/infotech.css">
	<jsp:include page='resources/base.jsp'></jsp:include>

	<script src="resources/libs/js/jquery.inputmask.js"></script>
	<script src="resources/libs/jquery/jquery-ui.js"></script>
	<script src="resources/libs/select2/4.0.3/js/select2.min.js"></script>
	<script
		src="resources/libs/select2-multi-checkboxes/select2.multi-checkboxes.js"></script>


	<script type="text/javascript">
	$(document).ready(function() {
		getCurentUserDataAndBind();
		addActiveClassToInnerMenu(".settings_user_info");
		controlMax("#password_exist",32); controlMax("#password_new",32);controlMax("#password_new_re",32);
		controlMax("#first_name",25);controlMax("#last_name",25);
	});
	
	var username = "";

	function getCurentUserDataAndBind(){
		showLoading();
		$.ajax({
			url : "user/getUserData",
			type : "get",
			success : function(res) {
				if(res && res.data){
					var data = res.data;
					$("#first_name").val(data.uname);
					$("#last_name").val(data.usurname);
					//$("#email").val(data.email);
					
					if(data.email){
						var mailList;
						if(data.email.indexOf(",") > 0){
							mailList = data.email.split(",");
						}else if(data.email.indexOf(";") > 0){
							mailList = data.email.split(";");
						}else{
							mailList = [data.email];
						}
						initialize_select2("#email",mailList,"<spring:message code='fillEPostaField'/>",true,"<spring:message code='fillEPostaAddr'/>");
						$('#email').val(mailList).trigger('change');
					}else{
						initialize_select2("#email",[],"<spring:message code='fillEPostaField'/>",true,"<spring:message code='fillEPostaAddr'/>");
					}

					
					$("#select_lang").val(data.auto_rpt_lang);
					$("#phone").val(data.msisdn);
					$("#vehicle_name_type").val(data.mobileMapLabel);
					
					//$("#toggle").prop("checked", data.mobileGroupOnMap);
					username = data.username;

					$("#idNameTittle").text(data.uname + " " + data.usurname);

					getUserRefreshPeriod();
				}
			},
			error : function(xhr) {
				//Do Something to handle error
				hideLoading();
			}
		});


	}

	function getUserRefreshPeriod(){
		$.ajax({
			 url: "index/getUserMobileLocationRefreshTime",
             data: {},
             type: "GET",
             dataType: 'json',
             contentType: "application/json; charset=utf-8",
             success: function(data) {
				if(data && data.data){
					var data = data.data;
					$("#refresh_period").val(data.param_value);
				}
				hideLoading();
			},
			error : function(xhr) {
				//Do Something to handle error
				hideLoading();
			}
		});
	}

	function updateUserData(){
		var data = getUserFormData();

		if(!data){
			BASE.show_info_messages("warning","<spring:message code='warning'/>","<spring:message code='mailKarakterSiniri' arguments='50;256' argumentSeparator=";"/>");
			return false;
		}
			
		showLoading();
		$.ajax({
			url : "user/updateExistUser",
			type : "POST",
			data : JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			success : function(data) {
				if(data && data.succes){
					$("#idNameTittle").text($("#first_name").val() + " " + $("#last_name").val());
				}else if(data && !data.succes){
					BASE.show_info_messages("warning","<spring:message code='warning'/>",data.message);
				}
				hideLoading();
			},
			error : function(xhr) {
				//Do Something to handle error
				hideLoading();
			}
		});
	}
	
	

	function getUserFormData(){
		var data = {};
		data.username = username;
		data.uname = $("#first_name").val();
		data.usurname = $("#last_name").val();
		data.email = getSelectedListFromMulti("#email");
		data.msisdn = $("#phone").val();
		data.mobileMapLabel = $("#vehicle_name_type").val();
		data.newPassword = $("#password_new").val();
		data.password = $("#password_exist").val();
		data.newPasswordRe = $("#password_new_re").val();
		//data.mobileGroupOnMap = $("#toggle").prop("checked") ? 1 : 0;
		data.autoRepeatLang = $("#select_lang").val();
		data.refreshPeriod = $("#refresh_period").val();

		var isError = false;
		if(data.email && data.email.length > 0){
			for(i=0; i< data.email.length; i++){
				if(data.email[i].length > 50){
					isError = true;			
					break;
				}
			}
			if(isError)
				return false;
			
			data.email = data.email.join(";");
			if(data.email.length > 256)
				return false;
		}


		return data;
	}


	
	
	var object_functions 	= {
		"update" 	: () => {
			//TODO: check errors, do the ajax and update the group!
			var form_data = get_form_data('.form_container');
		
			if($(".password_container").is(":visible")){
				if(form_data.data.password_exist == ""){
					$("#password_exist").closest(".input_wrapper").addClass("error");
					form_data.errors.push("password_exist");
				}
					
				if(form_data.data.password_new == ""){
					$("#password_new").closest(".input_wrapper").addClass("error");
					form_data.errors.push("password_new");
				}


				if(form_data.data.password_new_re == ""){
					$("#password_new_re").closest(".input_wrapper").addClass("error");
					form_data.errors.push("password_new_re");
				}
				if(form_data.data.password_new_re != form_data.data.password_new){
					$("#password_new").closest(".input_wrapper").addClass("error");
					$("#password_new_re").closest(".input_wrapper").addClass("error");
					form_data.errors.push("password_new");
					form_data.errors.push("password_new_re");
				}

				if(form_data.data.password_new_re && form_data.data.password_new.length < 6){
					$("#password_new").closest(".input_wrapper").addClass("error");
					form_data.errors.push("password_new");
					form_data.errors.push("password_new_re");
				}
			}
			console.log(form_data);
			if($.isEmptyObject(form_data.errors)){
				updateUserData();
			}
		},
		toggle_password_container : ()=>{
			$(".password_container").slideToggle(200);
		}
		
	}

	function getSelectedListFromMulti(combo){
		var list = [];

		$.each($(combo +" option:selected"), function(){
			var num = $(this).val();            
			list.push(num);
	    });
	    return list;
	}

	
</script>
</body>
</html>
