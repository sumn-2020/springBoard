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
		<ol class="mun"></ol>
	</li>
	</c:forEach>
</ul>
<button type="submit">제출</button>

<script>


//시험지문 
function fn_htmlStr(data) {
  const mun = $(".mun");

  for (let i = 0; i < data.length; i++) {
	  
    const testPasg = data[i].pasgList; // 예상 데이터 구조에서 pasgList를 가져옴
    let liTags = ""; // 각 반복마다 새로운 liTags 생성

    for (let j = 0; j < testPasg.length; j++) {
      const pasgList = testPasg[j];
      console.log("pasgList", pasgList);

      let num = j + 1; // j를 기반으로 번호를 매김

      liTags += `
        <li class="items">
          <label for="checkNum\${num}">
            <input type="checkbox" />
            <p>\${pasgList.testPasg}</p>
          </label>
        </li>
      `;
    }

    mun.append(liTags); // 각 반복마다 생성된 liTags를 mun에 추가
  }
}




function init() {
	//시험지문 
	$.ajax({
		url: "${pageContext.request.contextPath }/test/ajaxPasg" ,
		type: "get",
		dataType: "json",
		success: function(data) {
			//console.log("지문 :" , data);
			//console.log("지문 :" , data[0].pasgList[0]);
			fn_htmlStr(data); //시험지문 
		
			
			
			
		},
		error: function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});  

}
init();




//submit 기능 추가하기 










 

</script>


<script>




</script>