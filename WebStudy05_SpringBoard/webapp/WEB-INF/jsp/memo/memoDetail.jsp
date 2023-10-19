<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>      
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<h1>${memoDetail.writer}의 상세페이지 </h1>
<br><br>
${memoDetail.code}
${memoDetail.writer}
${memoDetail.content}
${memoDetail.date1} 



<button type="button" onclick="f_moveedit()">수정</button>
<form id="delForm" method="post" action="${pageContext.request.contextPath }/memo/delForm/${memoDetail.code}" >
	<sec:csrfInput/>
	<button type="button" onclick="f_moveDelete()">삭제</button>
</form>



<button type="button">목록</button>


<script>
function f_moveedit() {
 	let url = "${pageContext.request.contextPath}/memo/formEdit/${memoDetail.code}?code=${memoDetail.code}";
 	location.href = url;
}

function f_moveDelete() {
	if(confirm("정말로 삭제하시겠습니까?")){
		document.getElementById('delForm').submit();
	}
	
	
}
</script>