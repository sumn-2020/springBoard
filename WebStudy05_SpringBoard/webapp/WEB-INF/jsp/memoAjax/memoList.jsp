<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>      


<!-- 리스트 하나일 경우   --> 
<%-- ${memoList.code}
${memoList.writer}
${memoList.content}
${memoList.date1} 

 --%>


<div id="contentBody">신규</div>


<script>
$(document).ready(function() {
	let $contentBody = $("#contentBody");
	

	$.ajax({
		url: "/memo/memoList",
		method: "post",
		data: $contentBody.serialize(), 
		dataType: "json",
		success: function(resp) {
			console.log(resp);
		},
		error: function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});

	
});

</script>