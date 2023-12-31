<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    


<style>

	
</style>

<ul class="ques_wrap">
  <c:forEach items="${testPasg}" var="ques">
    <li class="quesLis">
      <span>${ques.testNum}번</span><strong>정답: ${ques.testAns}</strong>
      <p>${ques.testQuest}</p>
      <ol class="mun">
        <c:forEach items="${ques.pasgList}" var="pasgList" varStatus="status">
          <c:if test="${pasgList.testpasgId eq ques.testQId}">
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
  
  
<button type="submit">제출</button>

<script>
  const mun = $(".mun");
  mun.find(".items").each(function(index) {
    $(this).find("label").attr("for", "input_" + index);
    $(this).find("input").attr("id", "input_" + index);
  }); 
  
</script>


