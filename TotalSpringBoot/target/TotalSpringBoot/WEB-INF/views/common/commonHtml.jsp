<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script type="text/javascript" src="resources/assets/scripts/common.js" /></script>

<div class="popup_container">
	<div class="overlay" onClick="popup_close(this);"></div>
	<div class="popup_header">
		<strong class="title">Popup Title</strong> <strong class="sub_title">
			- Popup Sub Title</strong> <a href="javascript:;" class="button_close"
			onClick="popup_close(this);"><i class="fas fa-times"></i></a>
	</div>
	<div class="popup_content">
		<div class="map_container">
			<div id="map"></div>
		</div>
	</div>
	<div class="popup_footer">
		<a class="button button_white" href="javascript:;"
			onClick="popup_close(this);"><spring:message code="close" /></a>
	</div>
</div>

<div class="popup_container messagePopup">
	<div class="overlay"></div>
	<div class="popup_header">
		<strong class="title">Popup Title</strong> <strong class="sub_title">
			- Popup Sub Title</strong> <a href="javascript:;" class="button_close"
			onClick="popup_close(this);"><i class="fas fa-times"></i></a>
	</div>
	<div class="popup_content" style="height: auto;">
		
	</div>
	<div class="popup_footer">
		<a class="button button_white" href="javascript:;"
			onClick="popup_close(this);"><spring:message code="close" /></a>
	</div>
</div>


<div class="loading">
	<img
		src="resources/assets/styles/images/loading_1.gif">
</div>

<div class="notTrasparentLoading" style="display: none">
	<img
		src="resources/assets/styles/images/loading_1.gif">
</div>

<div class="main_info_container">
	<i class="icon"></i> <strong class="info_title"></strong> <span
		class="info_sub_title"></span>
</div>

<div class="info_news_container">
	<div class="info_news">
		<div class="info_header">
			<div class="info_logo_container">
				<div class="logo_container"></div>
				<span>Yenilikler</span>
			</div>
			<a class="close_button" href="javascript:;"
				onclick="close_info_modal();"></a>
		</div>
		<div class="scroll_wrapper">
			<ul class="info_slider">
				<li class="info_slider_item active" data-id="0">
					<div class="info_container">
						<img src="resources/assets/styles/images/info.png">
						<div class="info_content">
							<strong>Canlı Hız Gösterimi</strong> <span>Cras dolor
								ante, placerat quis dictum quis, varius sed urna. Donec semper
								ut metus a sollicitudin.</span>
						</div>
					</div>
				</li>
				<li class="info_slider_item" data-id="1">
					<div class="info_container">
						<img src="resources/assets/styles/images/info.png">
						<div class="info_content">
							<strong>Canlı Hız Gösterimi 2</strong> <span>Cras dolor
								ante, placerat quis dictum quis, varius sed urna. Donec semper
								ut metus a sollicitudin.</span>
						</div>
					</div>
				</li>
				<li class="info_slider_item" data-id="2">
					<div class="info_container">
						<img src="resources/assets/styles/images/info.png">
						<div class="info_content">
							<strong>Canlı Hız Gösterimi 3</strong> <span>Cras dolor
								ante, placerat quis dictum quis, varius sed urna. Donec semper
								ut metus a sollicitudin.</span>
						</div>
					</div>
				</li>
				<li class="info_slider_item" data-id="3">
					<div class="info_container">
						<img src="resources/assets/styles/images/info.png">
						<div class="info_content">
							<strong>Canlı Hız Gösterimi 4</strong> <span>Cras dolor
								ante, placerat quis dictum quis, varius sed urna. Donec semper
								ut metus a sollicitudin.</span>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="slider_bullets">
			<a class="slider_bullet active" href="javascript:;"
				onclick="slide_to(this,0)"></a> <a class="slider_bullet"
				href="javascript:;" onclick="slide_to(this,1)"></a> <a
				class="slider_bullet" href="javascript:;" onclick="slide_to(this,2)"></a>
			<a class="slider_bullet" href="javascript:;"
				onclick="slide_to(this,3)"></a>
		</div>
		<div class="info_footer">
			<label><input type="checkbox" onChange="hide_info_modal();">Bir
				daha gösterme</label> <a href="javascript:;" class="next_item"
				onclick="next_item();">Sonraki</a> <a href="javascript:;"
				class="hidden_close_button" onclick="close_info_modal();">Kapat</a>
		</div>
	</div>
</div>



<div class="widget_container main_notification notification_widget widget_list has_scroll_container">
	<div class="widget_content">
		<div class="scroll_container">
			<ul class="list list_events">
				<li class="list_item list_item_event has_notification_color"><a
					class="notification_color" href="javascript:;"
					onclick="BASE.remove_notification(this);"
					style="background-color: #63E7FF"><i class='fa fa-times'></i></a> <strong
					class="title"></strong> <span class="sub_title"></span>
					<div>
						<span class="time"><i class="fal fa-clock"></i> </span> <span
							class="location"><i class="fal fa-location-circle"></i> </span>
					</div>
					<p class="content"></p> 
					<a class="link" href="notifications" title="" id="bildirim_habercisi"></a>
				</li>
			</ul>
		</div>
	</div>
</div>


<script type="text/javascript">

function showMessage(baslik,subBaslik,icerik){
	$(".messagePopup .title").text(baslik);
	$(".messagePopup .sub_title").text(subBaslik);
	$(".messagePopup .popup_content").text(icerik);
	$(".messagePopup").show();
}
</script>
