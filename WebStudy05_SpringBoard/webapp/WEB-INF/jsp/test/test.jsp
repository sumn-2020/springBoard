<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    


<style>

	
</style>



<form id="submitForm">
	<ul class="ques_wrap">
	 
	   <c:forEach items="${testPasg}" var="ques">
	  	<input type="text" name="testQId" value="${ques.testQId }" />
	  	
	    <li class="quesLis">
	      <span>${ques.testNum}번</span><strong>정답: <%-- <span id="testAns" data-test-ans="${ques.testAns}" ></span> --%><span id="testAns">${ques.testAns}</span></strong>
	      <p>${ques.testQuest}</p>
	      <ol class="mun">
	        <c:forEach items="${ques.pasgList}" var="pasgList" varStatus="status">
	          <c:if test="${pasgList.testQId eq ques.testQId}">
	            <li class="items">
	              <label>
	                <input type="radio" name="input_${ques.testQId}" />
	                <p>${pasgList.testPasg}</p>
	              </label>
	            </li>
	          </c:if>
	        </c:forEach>
	      </ol>
	    </li>
	  </c:forEach>
	</ul>
	
	<!-- SUBMIT 해서 INSERT하기 
	 1) 제출 버튼 클릭하는 순가 SUBMIT 테이블에 INSERT쿼리로 넣기
	 2) 지문 테이블의 ANSWER과 SUBMIT테이블의 나의 ANSWER이 맞는지 아닌지 비교 후 
	 3) 몇 점인지 출력 
	  -->
	<button type="button" id="btnSubmit">제출</button>
</form>

<script>
  //문제 지문 label for input id 동일하게 만들기 
  const mun = $(".mun");
  mun.find(".items").each(function(index) {
    $(this).find("label").attr("for", "input_" + index);
    $(this).find("input").attr("id", "input_" + index);
  }); 
  
  
  //1) 제출버튼 클릭하는 순간 ajax로 배열 넘기기 컨트롤러까지는 일단 넘어감 
  //2) (배열로 만들어서 넘겨지는지 확인하기 )
  //2) 정답비교해서 점수매기기 
  $("#btnSubmit").on('click', function(event){

	  
	   // 단일값일 경우
	  //const testId = $('input[name="testQId"]').val();
	  
	  // 배열일 경우 -> testId 
	  const testQIdArry = [];
	  $('input[name="testQId"]').each(function(i) {
		  testQIdArry.push($(this).val());
	  }); 
	  console.log("testQIdArry" , testQIdArry);
	  

	  /*  const objParams = {
		testQId : testQIdArry
	  }
	  console.log("objParams:::", objParams); 
	   */

	  $.ajax({
			url : "${pageContext.request.contextPath}/test/testSubmit",
			method : "post",
			contentType: "application/json", // 데이터 유형 설정
			data : JSON.stringify(testQIdArry), 
			dataType:"json",
			success : function(resp) {
				
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
  });
 
  
  
</script>


