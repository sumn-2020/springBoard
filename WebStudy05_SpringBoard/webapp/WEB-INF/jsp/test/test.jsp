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
		
		<ol>
			<c:forEach items="${ques.pasgList }" var="pasg">
				<li><strong>1</strong>${pasg.testPasg}</li>
			</c:forEach> 
		</ol>
		
	</li>
	</c:forEach>
</ul>


<script>




</script>