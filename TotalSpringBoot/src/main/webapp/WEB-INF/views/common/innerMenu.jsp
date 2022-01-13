<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	
<!-- Ayarlar Altındaki Sol tarafta kalan menu -->
<div class="column column_4_1">
	<div class="widget_container">
		<div class="widget_content">
			<ul class="list list_menu">
				<li class="has_sub_list">
					<strong>
						<a
						href="javascript:;"><spring:message code="userSettings" /></a>
					</strong>
					<ul class="list list_menu">
						<li class="settings_user_info">
							<a href="settings_user_info"><spring:message code="userInfos" /></a>
						</li>
							<li class="user_notification">
								<a href="user_notification"><spring:message code="userNotificaion" /></a>
							</li>
					</ul>
				</li>
				
				
			</ul>
		</div>
	</div>
</div>
