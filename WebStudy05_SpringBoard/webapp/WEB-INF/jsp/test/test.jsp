<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    


<style>

	
</style>

<ul>
	<c:forEach items="${testPasg }" var="ques">
	<li>
		<span>${ques.testNum }번</span><strong>정답 : ${ques.testAns }</strong>
		<p>${ques.testQuest }</p>
		<ol class="mun"></ol>
	</li>
	</c:forEach>
</ul>
<button type="submit">제출</button>

<script>


//시험지문 
function fn_htmlStr(data) {
	
	//console.log("ajaxDataajaxDataajaxDataajaxData :::: " , data);
	
	
	let liTags = "";
	const mun = $(".mun");


	//계속 배열의 마지막 값만 출력됨 진심 짜증남.,...
	
	for (let i = 0; i < data.length; i++) {
				console.log("let i", data[i]);

			for (let j = 0; j < 4; j++) {
				
				console.log("let j", data[i].pasgList[j].testPasg);
			}
		
			
			
			
		/* 
			let num = i+1;
			
			liTags = `
				<li class="items">
					 <label for="checkNum\${num}">
					 	<strong>\${num}</strong>
						<input type="checkbox" />
						<strong>\${data[i].pasgList[i].testPasg}</strong>
					</label>
				</li> ` 

				
				mun.append(liTags); */
			
			
			
			
		
	}
	
	
	
	
	
	/* for (let i = 0; i < data.length; i++) {
		
			let num = i+1;
		
			liTags = `
				<li class="items">
					 <label for="checkNum\${num}">
					 	<strong>\${num}</strong>
						<input type="checkbox" />
						<strong>\${data[i].pasgList[i].testPasg}</strong>
					</label>
				</li> ` 
				
				/* liTags = $("<li>").append(
						  $("<label>").attr("for", "checkNum")
						  ,$("<input>").prop("type", "checkbox")
						  ,$("<p>").html(data[i].pasgList[i].testPasg)
						 
				);	   */
				
				//mun.append(liTags);} */
	
}




function init() {
	//시험지문 
	$.ajax({
		url: "${pageContext.request.contextPath }/test/ajaxPasg" ,
		type: "get",
		dataType: "json",
		success: function(data) {
			//console.log("지문 :" , data);
			//console.log("지문 :" , data[0].pasgList[0]);
			fn_htmlStr(data); //시험지문 
		},
		error: function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});  

}
init();




//submit 기능 추가하기 










 

</script>


<script>




</script>