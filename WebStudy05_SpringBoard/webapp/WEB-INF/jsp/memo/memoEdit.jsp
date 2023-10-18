<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>      
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h1>수정</h1>



<form action="${pageContext.request.contextPath}/memo/formEdit" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<ul>
		<li>writer : <input type="text" name="writer" value="${memoDetail.writer}" /></li>
		<li>content : <input type="text" name="content" value="${memoDetail.content}" /></li>
		<li>date : <c:out value="${memoDetail.date1}" /></li>
	</ul>
	<div class="btn-wrap right">
		<a href="${pageContext.request.contextPath}/memo/memoList.do">취소</a>
		<button type="submit">저장</button>
	</div>
</form> 


<a href="${pageContext.request.contextPath}/memo/memoList.do">목록</a>