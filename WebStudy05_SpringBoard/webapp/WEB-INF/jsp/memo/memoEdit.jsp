<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>      
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<h1>수정</h1>



<form action="${pageContext.request.contextPath}/memo/formEdit" method="post">
	<sec:csrfInput/>
	<input type="hidden" name="code" value="${memoDetail.code}" />
	<ul>
		<li>writer : <input type="text" name="writer" value="${memoDetail.writer}" /></li>
		<li>content : <input type="text" name="content" value="${memoDetail.content}" /></li>
		<li>date : </li>
	</ul>
	<div class="btn-wrap right">
		<a href="${pageContext.request.contextPath}/memo/memoList.do">취소</a>
		<button id="memoEdit" type="submit">저장</button>
	</div>
</form> 


<a href="${pageContext.request.contextPath}/memo/memoList.do">목록</a>


<script>
document.addEventListener("DOMContentLoaded", function(){
	
	
	let memoEdit = document.getElementById("memoEdit");
	memoEdit.addEventListener("click", function() {
		if(confirm("수정하시겠습니까?") == true) {
			alert("수정되었습니다");
		}else {
			return;
		}
	});
	
	
	
});


</script>