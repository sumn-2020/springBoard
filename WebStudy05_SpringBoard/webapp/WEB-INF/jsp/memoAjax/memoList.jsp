<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>      




<!-- 목록 select  -->


<div id="contentBody"></div>
<button>신규 insert</button>
	
	
<!-- 수정  -->
<div id="contentView"></div>


<script>
$(document).ready(function() {

	

	
	let $contentBody = $("#contentBody");
	let $contentView = $("#contentView");
	
    
    //목록 select 
	function init(){
		$.ajax({
			url: "${pageContext.request.contextPath }/memoAjax/memoListResponse",
			contentType:"application/json;charset:utf-8",
			type: "get",
			//data: JSON.stringify(data),
			//dataType: "text",
			success: function(resp) {
				//console.log(resp);
				
				// **********************
				// list목록 페이지 띄우기 
				// **********************
				for (var i = 0; i < resp.length; i++) {
					/* $contentBody.append(
							$("<span>").html(resp[i].code)
							,$("<a>")
							.attr("class","aLink")
							//.attr("id","aLink"+[i])
							.attr("href", "javascript:void(0);")
							//.attr("href", '${pageContext.request.contextPath }/memoAjax/memoView/' + resp[i].code)
							.html(resp[i].content)
							,$("<p>").html(resp[i].writer)
							,$("<p>").html(resp[i].date1)	
					);  */
					
					
					$contentBody.append(
							$("<a>")
							.attr("class","aLink")
							.attr("href", "javascript:void(0);")
							.append(
								$("<span>").html(resp[i].code)	
								,$("<span>").html(resp[i].content)
								,$("<p>").html(resp[i].writer)
								,$("<p>").html(resp[i].date1)	
							)
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

	
	// **********************
	// aLink클릭시 뷰페이지 띄우기 
	// **********************
	$("#contentBody").on("click", ".aLink", function(){
		 $(this).each(function(index) {
		
			 
			console.log(this.children[0].innerText);
			let code = this.children[0].innerText;

			
			 $.ajax({
					url: '${pageContext.request.contextPath }/memoAjax/memoView/' + code,
					type: "get",
					//data: JSON.stringify(data),
					dataType: "json", //이걸 지정안해주면 resp넘어오는 데이터가 xml형식으로 넘어오게 됨 
					success: function(data) {
						
						$contentView.empty();
						console.log("data : " ,  data.code);
						
						
						$contentView.append(
								$("<span>").html(data.code)	
								,$("<span>").html(data.content)
								,$("<p>").html(data.writer)
								,$("<p>").html(data.date1)	
							
						) 
						
						
					},
					error: function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});  
		 });
	 }); 
	
	

	

	


	
});

</script>