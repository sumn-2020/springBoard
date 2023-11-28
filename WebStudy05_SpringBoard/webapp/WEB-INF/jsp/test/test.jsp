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
			<c:forEach items="${ques.pasgList }" var="pasg" varStatus="status">
				<li class="items">
					<%-- <label for="checkNum">
						<strong><c:out value="${status.index+1 }"></c:out></strong>
						<input type="checkbox" />
						${pasg.testPasg}
					</label> --%>
				</li>
			</c:forEach> 
		</ol>
		 
	</li>
	</c:forEach>
</ul>

<script>

//debugger;
function fn_htmlStr() {
	let htmlStr = "";
	htmlStr += `
		 <label for="checkNum">
			<strong><c:out value="${status.index+1 }"></c:out></strong>
			<input type="checkbox" />
			${pasg.testPasg}
		</label>
	`; 

	const items = document.querySelector(".items");
	items.innerHTML = htmlStr;
}



//문제속 지문 만들기 => 캡쳐해놓은 거 보고 ... 한번 해보기 
//지문에 1,2,3,4, id에 숫자 붙여서 id값 다 다르게 하여 checkbox 클릭 잘되게 
//submit 기능 추가하기 

function pasgList() {
	
	let pasgList = [];
	let pasgIndex = 0;
	for (var i = 0; i < array.length; i++) {
		
	}
	
	
	
}








 

</script>


<script>




</script>