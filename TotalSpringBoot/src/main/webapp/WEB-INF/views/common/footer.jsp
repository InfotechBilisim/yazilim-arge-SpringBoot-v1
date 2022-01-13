<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script type="text/javascript">
function formatDateForFooter() {
	var date = new Date();
	var options = {
		year: 'numeric',
		month: 'numeric',
		day: 'numeric'
	};
	
	var h = date.getHours() < 10 ? ("0" + date.getHours()) : date.getHours();
	var m = date.getMinutes() < 10 ? ("0" + date.getMinutes()) : date.getMinutes();
	
	var result = date.toLocaleDateString('tr', options) + "  " + h + ":" + m ;
	
	var footerDateLabel =  document.getElementsByClassName("footerDateLabel");
	if(footerDateLabel && footerDateLabel.length > 0)
		footerDateLabel[0].innerText = result;
}
formatDateForFooter();
</script>