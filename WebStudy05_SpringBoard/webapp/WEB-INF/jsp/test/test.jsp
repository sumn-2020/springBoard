<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    


<style>

	
</style>

<%-- ${testVOList } --%>
${testPasg.testpasgId}


<ul>
	<c:forEach items="${testVOList }" var="test">
	
	<li>
		<span>${test.testNum }번</span><strong>정답 : ${test.testAns }</strong>
		<p>${test.testQuest }</p>
		<ol>
			<li><strong>1</strong>1번지문</li>
			<li><strong>2</strong>2번지문</li>
			<li><strong>3</strong>3번지문</li>
			<li><strong>4</strong>4번지문</li>
		</ol>
	</li>
	</c:forEach>
</ul>


<script>




</script>