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


<div id="contentBody"></div>


<script>
$(document).ready(function() {
	let $contentBody = $("#contentBody");
    
    
	function init(){
		$.ajax({
			url: "${pageContext.request.contextPath }/memoAjax/memoListResponse",
			contentType:"application/json;charset:utf-8",
			type: "get",
			//data: JSON.stringify(data),
			//dataType: "text",
			success: function(resp) {
				console.log(resp);
				
				
				for (var i = 0; i < resp.length; i++) {
					$contentBody.append(
							$("<p>").html(resp[i].code + ',' + resp[i].content + "," + resp[i].writer + "," + resp[i].date1 )
							//,$("<p>").html(resp[i].content)
							//,$("<p>").html(resp[i].writer)
							//,$("<p>").html(resp[i].date1)	
					); 
				}
				
				
			},
			error: function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
		
	init();

	
	
	
	

	
});

</script>