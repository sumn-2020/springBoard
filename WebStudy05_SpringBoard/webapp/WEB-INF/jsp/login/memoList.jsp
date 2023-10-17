<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>      

<!-- 리스트 하나일 경우   -->
<%-- 
${memoList.code}
${memoList.writer}
${memoList.content}
${memoList.date1} --%>



<!--   리스트 두개 이상일 경우  -->
<ul>
	<c:forEach items="${memoList}" var="memoList">
		<li>${memoList.code }</li>
		<li>${memoList.writer }</li>
		<li><a href="${pageContext.request.contextPath }/memo/detail">${memoList.content }</a></li>
		<li>${memoList.date1 }</li>
	</c:forEach>
</ul>
