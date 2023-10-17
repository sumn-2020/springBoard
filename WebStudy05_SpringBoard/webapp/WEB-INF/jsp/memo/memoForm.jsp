<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>      
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h1>등록</h1>


<form method="post" action="${pageContext.request.contextPath}/memo/form.do">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="code" value="101" />
	<ul>
		<li>writer : <input type="text" name="writer" placeholder="wrtier" /></li>
		<li>content : <input type="text" name="content" placeholder="content" /></li>
		
		<c:set var="today" value="<%=new java.util.Date()%>" />
		<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy/MM/dd" /></c:set> 
		<li>date : <c:out value="${date}" /></li>
	</ul>
	<div class="btn-wrap right">
		<a href="${pageContext.request.contextPath}/memo/memoList.do">취소</a>
		<button type="submit">저장</button>
	</div>
</form>


<a href="${pageContext.request.contextPath}/memo/memoList.do">목록</a>