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
<ul class="memoList-wrap">
	<c:forEach items="${memoList}" var="memoList">
		<li>
			<span class="code">${memoList.code }</span>
			<a class="content" href="${pageContext.request.contextPath}/memo/memoDetail.do?code=${memoList.code}">${memoList.content }</a>
			<div class="info-bottom">
				<em class="writer">${memoList.writer }</em>
				<span class="date">${memoList.date1 }</span>
			</div>
		</li>
	</c:forEach>
</ul>

<a href="${pageContext.request.contextPath}/memo/memoForm.do">신규</a>
