<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.lang.*, java.sql.*, java.io.*, org.owasp.esapi.ESAPI, com.sun.org.apache.xerces.internal.impl.dv.util.*"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%

String css;
String res;
String param;
String url = request.getRequestURL().toString();
String lang = (String) request.getParameter("lang");
String baseLang = "";
if (lang == null || "".equals(lang)) {
	lang = (String) session.getAttribute("lang");
}
if (!("en".equalsIgnoreCase(lang) || "tr".equalsIgnoreCase(lang))) {
	lang = "tr";
}
lang = lang.toLowerCase(Locale.US);

//url = "kopilot";

if (url.contains("web.bmtakip.com")) {
	css = "resources/assets/styles/css/base_bm.css";
	res = "i18/messages_bm_" + lang;
	param = "bm";
} else if (url.contains("locate")) {
	css = "resources/assets/styles/css/base_locate.css";
	res = "i18/messages_locate_" + lang;
	param="locate";
} else if(url.contains("turpak")) {
	css = "resources/assets/styles/css/base_turpak.css";
	res = "i18/messages_turpak_" + lang;
	param="turpak";
} else if(url.contains("sis")) {
	css = "resources/assets/styles/css/base_sis.css";
	res = "i18/messages_sis_" + lang;
	param="sis";
} else if(url.contains("kopilot")) {
	css = "resources/assets/styles/css/base_kopilot.css";
	res = "i18/messages_kopilot_" + lang;
	param="kopilot";
} else {
	css = "resources/assets/styles/css/base.css";
	res = "i18/messages_" + lang;
	param = "total";
}
//Utils.get().setMes(res);

String signupVisible = "";//Utils.get().translateText("signupVisible");
String instagramLink = "";//Utils.get().translateText("instagramLink");
String twitterLink = "";//Utils.get().translateText("twitterLink");
String youtubeLink = "";//Utils.get().translateText("youtubeLink");
String companyLink = "";//Utils.get().translateText("companyLink");
String appStore = "";//Utils.get().translateText("appStore");
String googlePlay = "";//Utils.get().translateText("googlePlay");


String beniHatirlaOzelligiAktif = "";//Utils.get().translateText("beniHatirlaOzelligiAktif");
String sifremiUnuttumOzelligiAktif = "";//Utils.get().translateText("sifremiUnuttumOzelligiAktif");

String sdk_fastLoginUri = "";
String sdk_fastLoginAppId = "";
String sdk_fastRedirectUri = "";
String fastLoginUri = "";
String fastRedirectUri = "";
String clientId = "";
String randomState ="";
String randomNonce = "";
Long hizliGirisMode = 0L;////Long.parseLong(Utils.get().translateText("hizliGirisMode"));
boolean isHizliGirisOn = false;
if (hizliGirisMode == 1) {
	fastLoginUri = "";//Utils.get().translateText("fastLoginUri");
	fastRedirectUri = "";//Utils.get().translateText("fastRedirectUri");
	clientId = "";//Utils.get().translateText("fastloginClientId");
	randomState = "";//Utils.get().getRandomString();
	randomNonce = "";//Utils.get().getRandomString();
	isHizliGirisOn = true;
}else if (hizliGirisMode == 2){
	sdk_fastLoginUri = "";//Utils.get().translateText("sdk_fastLoginUri");
	sdk_fastLoginAppId = "";//Utils.get().translateText("sdk_fastLoginAppId");
	sdk_fastRedirectUri = "";//Utils.get().translateText("sdk_fastRedirectUri");
			
	isHizliGirisOn = true;
}

Long loginWithUsernamePassActive = 1L;
String unamePassLoginActive = "";//Utils.get().translateText("loginWithUsernamePassActive");
if(!unamePassLoginActive.equals("")){
	loginWithUsernamePassActive = Long.parseLong(unamePassLoginActive);
}

%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="icon" type="image/png" href="resources/assets/styles/images/favicon.png">
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=windows-UTF-8">
    <title><spring:message code="appTitle"/></title>
    <link href="resources/assets/styles/fonts/googleapis.css"  rel="stylesheet"/>
    <link rel="stylesheet" href="resources/libs/font-awesome/4.7.0/css/font-awesome.css" />
    <link href="resources/libs/font-awesome/5.13.1/css/promin.css" rel="stylesheet"/>
	<link rel="stylesheet" href="resources/assets/styles/css/infotech.css">
	<link rel="stylesheet" href="<%= css %>">
	
	<style type="text/css">
		.openFastLoginBtn{
			/*background-color: blue;
			background-image: url(resources/assets/styles/images/hizli_giris.png);
			*/
		}
	</style>
</head>
<body class="login_page">
<%
if(false && url.equals("kopilot")){
	%>
	<jsp:include page='kopilot/login.jsp'></jsp:include>	
<%
}else{

%>
	<main>
    <div class="login_container">
        <div class="form_container">
            <form id="login-form" action="index" method="post">
                <div class="logo_container"></div>
                <div class="collapsable_container" data-id="login">
                <input id="login_mode" name="login_mode" type="hidden" value="2"/>
                <%if(loginWithUsernamePassActive == 1){ %>
                    <div class="input_wrapper">
                        <i class="icon icon_login_username"></i>
                        <input type="text" id="login_username" class="field forced" data-key="username"  placeholder="<spring:message  code='username'/>" name="username" onKeyUp="$(this).closest('.input_wrapper').removeClass('error')">
                    </div>
                    <div class="input_wrapper">
                        <i class="icon icon_login_password"></i>
                        <input type="password" id="login_password" class="field forced" data-key="password"  placeholder='<spring:message  code="password"/>' name="password" onKeyUp="$(this).closest('.input_wrapper').removeClass('error')">
                    </div>
                    <%}else{%>
                    <input id="username" name="username" type="hidden" value=""/>
                    <input id="password" name="password" type="hidden" value=""/>
                     <%}%>

                    <div class="column_container">
                        <div class="input_wrapper">
                        	<select id="login_language" name="language" data-key="language" style="border: 2px solid #d6d6d6;">
	                            <option value="tr"><spring:message  code='turkish'/></option>
	                            <option value="en"><spring:message  code='english'/></option>
	                        </select>
	                    </div>
	                    
	                    <div class="column">
	                    <% if(beniHatirlaOzelligiAktif.equals("1")){%>
						    <div class="input_wrapper toggle_wrapper">
						   	    <input id="remember_me" name="remember_me" type="hidden" value="off"/>
						        <input type="checkbox" id="login_remember_me" data-key="login_remember_me" class="field">
						        <label for="login_remember_me">
						            <i class="far fa-toggle-on" aria-hidden="true"></i>
						            <span><spring:message  code="rememberMe"/></span>
						        </label>
						    </div>
						    <% }else{%>
						   	 <input id="login_remember_me" name="login_remember_me" type="hidden" value="off"/>
						   	 <input id="remember_me" name="remember_me" type="hidden" value="off"/>
						    <%}%>
						</div>
						
						<div class="column right">
					   <!-- 
						<% if(sifremiUnuttumOzelligiAktif.equals("1")){%>
                            	<a class="link" href="javascript:;" onClick="open_form('forgot_password')"><spring:message code="forgotPassword" /></a>
						    <%}%>
						 --> 
                                <input id="css" name="css" type="hidden" value="<%= css %>"/>
                                <input id="param" name="param" type="hidden" value="<%= param %>"/>
                        </div>

                    </div>
                    <div class="button_container">
                    <%if(loginWithUsernamePassActive == 1){ %>
                        <a href="javascript:;" class="button" onClick="login();"><spring:message code="signIn" /></a>
                         <%}%>
                       <% if(isHizliGirisOn){%>
                       <br>
                       <%if(loginWithUsernamePassActive == 1){ %>
                       <div class="loginSeperator"><spring:message code="orUpperCase" /></div>
                        <br>
                        <%}%>
                       		 <a href="javascript:;" class="openFastLoginBtn" onClick="openFastLogin();">
                       		 <img class="hizliLoginBtn" src="resources/assets/styles/images/hizli_login/mavi_<%= lang %>.png">
                       		 </a>
                       <% } %>
           <!-- 
           	            <% if(signupVisible.equals("on")){ %>
				           <a href="javascript:;" class="link" onClick="open_form('signup')"><span><spring:message code="dontHaveAccount" /></span> <strong><spring:message code="signUp" /></strong></a>
			            <% } %>
			    -->        
			           
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
                        <input type=password id="signup_password" name="signup_password" class="field forced" data-key="signup_password"  placeholder='<spring:message code="password" />' onKeyUp="$(this).closest('.input_wrapper').removeClass('error')">
                    </div>
                    <div class="input_wrapper">
                        <i class="icon icon_login_password"></i>
                        <input type="password" id="signup_password_re" name="signup_password_re" class="field forced" data-key="signup_password_re"  placeholder='<spring:message code="passwordAgain" />' onKeyUp="$(this).closest('.input_wrapper').removeClass('error')">
                    </div>
                    <div class="input_wrapper">
                        <i class="icon icon_login_password"></i>
                        <input type="text" id="signup_phone_number" name="signup_phone_number" class="field forced" data-mask="phone" data-key="signup_phone_number"  placeholder='05XX XXX XX XX' onKeyUp="$(this).closest('.input_wrapper').removeClass('error')">
                    </div>
            </form>
        </div>
        <div class="login_footer">

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
changeFavicon("resources/assets/styles/images/favicon_"+ "<%=param%>" + ".png" );

function toggle_menu(){
			$("body").toggleClass("menu_open");
		}
		
	$(document).ready(function(){
		window.history.replaceState("", "", "login");
		$( "#login_username" ).focus();
		$('#login_username, #login_password, #login_remember_me').keypress(function (e) {
		  if (e.which == 13) {
		   	login();
		  }
		});
		
		controlMax("#signup_imei",16);
		controlMax("#signup_password",32);
		controlMax("#signup_password_re",32);
		controlMax("#signup_alias",32);
		controlMax("#signup_email",40);

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
		var rem = false;//Utils.get().isRememberMeActive()
		if(rem == 'true'){
			$("#login_remember_me").prop('checked','true');
			$("#login_remember_me").change();
		}
		
	});

		<% if(isHizliGirisOn){%>

		function openFastLogin() {
			var popw = 500;
			var poph = 600;
			var popupFastLogin;
			var popx=(screen.width/2)-(popw/2);
			var popy=(screen.height/2)-(poph/2);
			var dil = '<%=lang%>';
			$("#login_mode").val("1");
			
			<% if(hizliGirisMode == 1L){%>
				var fastUrl = "<%=fastLoginUri%>" + '?client_id=' + '<%=clientId%>' + '&scope=openid%20phone&redirect_uri=' + '<%=fastRedirectUri%>' + '&response_type=code&state=State.' + '<%=randomState%>' + '&nonce=Nonce.' + '<%=randomNonce%>' + '&prompt=login&acr_values=2&display=page&ui_locales='+dil+'&claims_locales=' + dil;
				popupFastLogin = window.open(fastUrl, "fastLogin", "width="+popw+",height="+poph+",menubar=0,toolbar=0,directories=0,location=1,scrollbars=yes,resizable=yes,left="+popx+",top="+popy+"");
			<% } %>

			<% if(hizliGirisMode == 2L){%>
				var fastUrl = "<%=sdk_fastLoginUri%>" + '?appId=' + '<%=sdk_fastLoginAppId%>' + '&scope=openid%20phone&serviceRedirectUrl=' + '<%=sdk_fastRedirectUri%>' + '&response_type=code&state=State.' + '<%=randomState%>' + '&language=' + dil.toLocaleUpperCase();
				popupFastLogin = window.open(fastUrl, "fastLogin", "width="+popw+",height="+poph+",menubar=0,toolbar=0,directories=0,location=1,scrollbars=yes,resizable=yes,left="+popx+",top="+popy+"");
			<% } %>
			
			var timer = setInterval(checkPopup, 1000);

			function checkPopup() {
			    if (popupFastLogin.closed) {
			        clearInterval(timer);
			    	document.getElementById('login-form').submit();
			    }
			}
                
		}
	<% } %>

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
		
		if(!$.isEmptyObject(form_data.errors)){
			return false;
		}
		$("#login_mode").val("2");
		document.getElementById('login-form').submit();
		
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

	function controlMax(el,max){
		$(el).on('keydown keyup', function(e){
			var t = $(this).val();
		    if (t.length > max 
		        && e.keyCode !== 46
		        && e.keyCode !== 8
		       ) {
		       e.preventDefault();
	           $(this).val(t.slice(0, -1));
		    }
		});
		
	}
	</script>
	<%}%>
</body>
</html>
