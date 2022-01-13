<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.lang.*, java.sql.*, java.io.*, org.owasp.esapi.ESAPI, com.sun.org.apache.xerces.internal.impl.dv.util.*"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%

String css;
String res;
String param;
String url = request.getRequestURL().toString();
String lang = (String)request.getParameter("lang");
String baseLang = "";

String token=request.getParameter("token");

if(lang == null || "".equals(lang)){
    lang = (String)session.getAttribute("lang");
}
if(!("en".equalsIgnoreCase(lang) || "tr".equalsIgnoreCase(lang))){
    lang = "tr";
}
lang = lang.toLowerCase(Locale.US);

if(url.contains("web.bmtakip.com")) {
	css = "resources/assets/styles/css/base_bm.css";
	res = "i18/messages_bm_" + lang;
	param="bm";
} else if(url.contains("locale")) {
	css = "resources/assets/styles/css/base_locate.css";
	res = "i18/messages_locate_" + lang;
	param="locate";
} else {
	css = "resources/assets/styles/css/base.css";
	res = "i18/messages_" + lang;
	param="total";
}
//Utils.get().setMes(res);

String signupVisible="";//Utils.get().translateText("signupVisible");
String instagramLink = "";//Utils.get().translateText("instagramLink");
String twitterLink = "";//Utils.get().translateText("twitterLink");
String youtubeLink = "";//Utils.get().translateText("youtubeLink");
String companyLink = "";//Utils.get().translateText("companyLink");
String appStore = "";//Utils.get().translateText("appStore");
String googlePlay ="";// Utils.get().translateText("googlePlay");

%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="icon" type="image/png" href="resources/assets/styles/images/favicon.png">
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=windows-UTF-8">
    <title><spring:message code="changePass"/></title>
	<link rel="stylesheet" href="<%= css %>">
</head>
<body class="login_page">
	<main>
    <div class="login_container">
        <div class="form_container">
            <form id="login-form" action="index" method="post"></form>
                <div class="logo_container"></div>
                <div class="collapsable_container" data-id="login">
                    <div class="input_wrapper">
                        <i class="icon icon_login_username"></i>
                        <input type="password" id="password" class="field forced" data-key="password"  placeholder="<spring:message  code='password'/>" name="password" onKeyUp="$(this).closest('.input_wrapper').removeClass('error')">
                    </div>
                    <div class="input_wrapper">
                        <i class="icon icon_login_password"></i>
                        <input type="password" id="passwordAgain" class="field forced" data-key="passwordAgain"  placeholder='<spring:message  code="passwordAgain"/>' name="passwordAgain" onKeyUp="$(this).closest('.input_wrapper').removeClass('error')">
                    </div>

                    </div>
                    <div class="button_container">
                        <a href="javascript:;" class="button" onClick="login();"><spring:message code="save" /></a>
			            <% if(signupVisible.equals("on")){ %>
				           <a href="javascript:;" class="link" onClick="open_form('signup')"></a>
			            <% } %>
                    </div>
                    <c:if test="${message!=null}">
                        <span style="color: red;">${message}</span>
                    </c:if>
                    <div class="alert" th:if="${message}" th:text="${message}"></div>
                </div>
                <div class="collapsable_container" data-id="signup">
                    <div class="input_wrapper">
                        <i class="icon icon_login_username"></i>
                        <input type="number" id="signup_imei" name="signup_imei" class="field forced" data-key="signup_imei" max="999999999999999" min=""  placeholder='<spring:message code="IMEI" />' onKeyUp="$(this).closest('.input_wrapper').removeClass('error')">
                    </div>
                    <div class="input_wrapper">
                        <i class="icon icon_login_username"></i>
                        <input type="text" id="signup_alias" name="signup_alias" class="field forced" data-key="signup_alias"  placeholder='<spring:message code="plate" />' onKeyUp="$(this).closest('.input_wrapper').removeClass('error')">
                    </div>
                    <div class="input_wrapper">
                        <i class="icon icon_login_username"></i>
                        <input type="text" id="signup_email" name="signup_email" class="field forced" data-key="signup_email"  placeholder='<spring:message code="emailAddr" />' onKeyUp="$(this).closest('.input_wrapper').removeClass('error')">
                    </div>
                    <div class="input_wrapper">
                        <i class="icon icon_login_password"></i>
                        <input type="text" id="signup_password" name="signup_password" class="field forced" data-key="signup_password"  placeholder='<spring:message code="password" />' onKeyUp="$(this).closest('.input_wrapper').removeClass('error')">
                    </div>
                    <div class="input_wrapper">
                        <i class="icon icon_login_password"></i>
                        <input type="text" id="signup_password_re" name="signup_password_re" class="field forced" data-key="signup_password_re"  placeholder='<spring:message code="passwordAgain" />' onKeyUp="$(this).closest('.input_wrapper').removeClass('error')">
                    </div>
                    <div class="input_wrapper">
                        <i class="icon icon_login_password"></i>
                        <input type="text" id="signup_phone_number" name="signup_phone_number" class="field forced" data-mask="phone" data-key="signup_phone_number"  placeholder='<spring:message code="phoneNo" />' onKeyUp="$(this).closest('.input_wrapper').removeClass('error')">
                    </div>

<!-- 
                    <div class="input_wrapper checkbox_wrapper">
                        <input type="checkbox" id="signup_privacy" data-key="signup_privacy" class="field">
                        <label for="signup_privacy"><span><a href="javascript:;" onclick="window.open('eula','MyWindow','width=600,height=800,toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, titlebar=yes'); return false;">Hizmet sözleşmesini</a> okudum onaylıyorum.</span></label>
                    </div>
  -->
                    <div class="button_container">
                        <a href="javascript:;" class="button" onClick="activation();"><spring:message code="signUp" /></a>
                        <a href="javascript:;" class="link" onClick="open_form('login')"><span><spring:message code="alreadyHaveAccount" /></span> <strong><spring:message code="signInUpper" /></strong></a>
                    </div>
                </div>
            </form>
        </div>

    </div>
</main>

<div class="main_info_container">
	<i class="icon"></i> <strong class="info_title"></strong> <span
		class="info_sub_title"></span>
</div>


<script src="resources/libs/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript"  src="resources/assets/scripts/base.js"></script>
<script src="resources/libs/js/jquery.inputmask.js"></script>

<script>
function changeFavicon(src) {
    $('link[rel="icon"]').attr('href', src);
}
changeFavicon("resources/assets/styles/images/favicon_"+ "<%= param%>" + ".png" );

function toggle_menu(){
			$("body").toggleClass("menu_open");
		}
		
	$(document).ready(function(){
		window.history.replaceState("", "", "reset_password");
		$( "#login_username" ).focus();
		$('#login_username, #login_password, #login_remember_me').keypress(function (e) {
		  if (e.which == 13) {
		   	login();
		  }
		});

		var reloadPage = true;
		$("#login_language").on("change",function(){
			if(reloadPage){
				var lang = $(this).val();
					$.ajax({
						 url 	: "changeLang"
						,method	: "POST"
						,data	: {"param": '<%=param%>',"lang": lang}
						,success: function(response){
							location.reload();
							reloadPage=false;
						},
						error: function(err){
				
						}
					});	
			}else{
				reloadPage=true;
			}		
		});
		$("#login_language").val('<%=lang%>');


		var sayac = 0;
		var defaultVal = "off";
		$("#login_remember_me").on("change", function(){
			if(sayac % 2 ==0)
				defaultVal = "on";
			else
				defaultVal = "off";
			sayac++;
			
			$("#remember_me").val(defaultVal);
		});
		var rem = false;//Utils.get().isRememberMeActive()%>;
		if(rem == 'true'){
			$("#login_remember_me").prop('checked','true');
			$("#login_remember_me").change();
		}
		
	});
	
	
	function open_form(to_open){
		if(typeof to_open == "undefined")
			to_open = "login"

		if(to_open == "forgot_password" && !$("#login_username").val()){
			BASE.show_info_messages("warning","<spring:message code='warning'/>","<spring:message code='usernameError'/>");
			return false;
		}
		
		$(".form_container .collapsable_container:visible").slideUp(function(){
			$(".form_container .collapsable_container[data-id="+to_open+"]").slideDown();
		});
		
	}
	
	function login(){
		var form_data = get_form_data(".collapsable_container[data-id=login]");

		var a=$("#password").val();
		var b=$("#passwordAgain").val();

		if(a!=b) {
			BASE.show_info_messages("warning","<spring:message code='warning'/>","<spring:message code='passwordsNotMatch'/>");
			return false;
			}
		
		if(!$.isEmptyObject(form_data.errors)){
			return false;
		}

		var data = {
				password: $("#password").val(),
				passwordAgain: $("#passwordAgain").val(),
				token:<%= token %>
		};

		$.ajax({
			 url 	: "resetPassword"
			,data	: data
			,method	: "POST"
			,success: function(response){
				if(response !=null) {
					if(response == "success") {
						BASE.show_info_messages("info","<spring:message code='islemBasarili'/>","<spring:message code='success'/>");
						location.reload();
					}else if(response == "tokenExpire"){
						BASE.show_info_messages("warning","<spring:message code='warning'/>","<spring:message code='tokenExpire'/>");
					} else if(response == "fail"){
						BASE.show_info_messages("warning","<spring:message code='warning'/>","<spring:message code='anErrorOccurred'/>");
					} else {
						BASE.show_info_messages("info","<spring:message code='islemBasarisiz'/>","<spring:message code='userTokenError'/>");
					}
				}
			},
			error: function(err){
	
			}
		});

		

		//document.getElementById('login-form').submit();
		
	}

	function rememberPassword(){
		var form_data = get_form_data(".login_container");

		var mailAdr = $("#forgot_password_email").val();

		if(!mailAdr){
			BASE.show_info_messages("warning","<spring:message code='warning'/>","<spring:message code='mailAdrError'/>");
			return false;
		}

		var data = {
				forgot_password_email: mailAdr,
				forgot_password_username: $("#login_username").val(),
				lang:'<%=lang%>',
				param:'<%=param%>'
		};

		$.ajax({
			 url 	: "rememberPassword2"
			,data	: data
			,method	: "POST"
			,success: function(response){
				if(response !=null) {
					if(response == "success") {
						open_form('login');
						BASE.show_info_messages("info","<spring:message code='islemBasarili'/>","<spring:message code='passwordSendedToMail'/>");
					}else if(response == "invalidMailAdr"){
						BASE.show_info_messages("warning","<spring:message code='warning'/>","<spring:message code='validMailError'/>");
					} else {
						BASE.show_info_messages("info","<spring:message code='islemBasarisiz'/>","<spring:message code='passwordSendError'/>");
					}
				}
			},
			error: function(err){
	
			}
		});
	
		}

	function activation() {

		var form_data = get_form_data(".collapsable_container[data-id=signup]");

		var index = form_data.errors.indexOf("forgot_password_email");
		if (index !== -1) form_data.errors.splice(index, 1);
		
		if(!$.isEmptyObject(form_data.errors)){
			return false;
		}

	    if($("#signup_imei").val().length != 15){
	    	BASE.show_info_messages("warning","<spring:message  code='warning'/>","<spring:message code='imeiMaxCharError' />");
	    	$("#signup_imei").closest('.input_wrapper').addClass('error');
	    	return false;
		}
		
		var filter = /([0-9]{10})|(\([0-9]{3}\)\s+[0-9]{3}\-[0-9]{4})/;
	    if (!filter.test($("#signup_phone_number").val().replace(/ /g, ""))) {
	    	$("#signup_phone_number").closest('.input_wrapper').addClass('error');
	        return false;
	    }

	/*
		if(!$("#signup_privacy").prop("checked")){
			BASE.show_info_messages("warning","<spring:message  code='warning'/>","Lütfen Hizmet sözleşmesini okuyup onaylayınız.");
			return false;
		}
		*/

		if($("#signup_password").val() != $("#signup_password_re").val()){
			$("#signup_password").closest('.input_wrapper').addClass('error');
			$("#signup_password_re").closest('.input_wrapper').addClass('error');
			BASE.show_info_messages("warning","<spring:message  code='warning'/>","<spring:message code='passwordsNotMatch' />");
			return false;
		}

		if($("#signup_password").val().length < 6){
			BASE.show_info_messages("warning","<spring:message code='warning'/>","<spring:message code='passwordMinCharError' />");
			$("#signup_password").closest('.input_wrapper').addClass('error');
			return false;
		}
		
		$.ajax({
			 url 	: "activation"
			,data	: form_data.data
			,method	: "POST"
			,success: function(response){
						if(response !=null) {
							var mes = document.getElementById("message");
							
							if(response == "success") {
								open_form('login');
								BASE.show_info_messages("info","<spring:message  code='islemBasarili'/>","<spring:message  code='activationSucces'/>");

								$(".form_container .collapsable_container[data-id=signup] input").val('');
							} else {
							var msg = "";
							if(response == "invalidMailAdr") {
									mes ="<spring:message  code='validMailError'/>";
									$("#signup_email").closest('.input_wrapper').addClass('error');
								}else if(response == "imeiNotFound") {
										mes = "<spring:message  code='imeiNotFound'/>";
								} else if(response="userInUse") {
									mes = "<spring:message  code='userInUse'/>";
								} else if(response="companyInUse") {
									mes = "<spring:message  code='companyInUse'/>";
								} else if(response="passwordMisMatch") {
									mes = "<spring:message  code='passwordMisMatch'/>";
								} else if(response="companyCreationFail") {
									mes = "<spring:message  code='companyCreationFail'/>";
								} else if(response="userCreationFail") {
									mes = "<spring:message  code='userCreationFail'/>";
								} else if(response="mobileUpdateFail") {
									mes = "<spring:message  code='mobileUpdateFail'/>";
								} else if(response="usersMobileFail") {
									mes = "<spring:message  code='usersMobileFail'/>";
								}

								BASE.show_info_messages("warning","<spring:message  code='islemBasarisiz'/>",mes);
								}
						} 
				}
		});
	
		}
	
	function get_form_data(selector){
		var to_return = {
			 "data" 	: {}
			,"errors"	: []
		};
		$(".error",selector).removeClass("error");
		
		$(".field",selector).each(function(index,field){
			var field_value 	= $.trim($(field).val());
			var field_key 		= $.trim($(field).data("key"));
			var is_forced 		= $(field).hasClass("forced");
			var field_parent 	= $(field).closest(".input_wrapper");
			if(field_parent.length == 0){
				field_parent = field;
			}
			
			if($(field).is(":checkbox")){
				field_value = $(field).is(":checked");
			}
			if(is_forced && field_value == ""){
				$(field_parent).addClass("error");
				to_return.errors.push(field_key);
			}
			to_return.data[field_key] = field_value;
		});
		
		return to_return;
	}
	</script>
</body>
</html>