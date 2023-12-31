<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    


<style>

	
</style>

<ul>
  <c:forEach items="${testPasg}" var="ques">
    <li>
      <span>${ques.testNum}번</span><strong>정답: ${ques.testAns}</strong>
      <p>${ques.testQuest}</p>
      <ol class="mun">
        <c:forEach items="${ques.pasgList}" var="pasgList" varStatus="status">
          <c:if test="${pasgList.testpasgId eq ques.testQId}">
            <li class="items">
              <label>
                <input type="checkbox" />
                <p>${pasgList.testPasg}</p>
              </label>
            </li>
          </c:if>
        </c:forEach>
      </ol>
    </li>
  </c:forEach>
</ul>
<button type="submit">제출</button>

<script>
  const mun = $(".mun");
  mun.find(".items").each(function(index) {
    $(this).find("label").attr("for", "input_" + index);
    $(this).find("input").attr("id", "input_" + index);
  });
</script>


