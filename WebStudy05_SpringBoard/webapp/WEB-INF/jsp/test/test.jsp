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

<script>


//시험지문 
function fn_htmlStr(data) {
	
	console.log("ajaxDataajaxDataajaxDataajaxData :::: " , data);
	
		
	let liTags = "";
	const mun = $(".mun");
	
	for (var i = 0; i < data.length; i++) {
			//console.log("ajaxData" + [i] + " :::: " , data.pasgList[i]);

			/*  liTags = `
				<li class="items">
					 <label for="checkNum${data[i].pasgList[i]}">
						<strong><c:out value="${data[i].pasgList[i] }"></c:out></strong>
						<input type="checkbox" id="checkNum${data[i].pasgList[i]}" />
						${pasg.testPasg}
					</label>
				</li> `  */
				 liTags = $("<li>").append(
						  $("<label>").attr("for", "checkNum")
						  ,$("<input>").prop("type", "checkbox").attr("id",i)
						  ,$("<p>").html(data[i].pasgList[i].testPasg)
						 
				);		 	 
				 mun.append(liTags);
	}
	




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