<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
 <style>
 #insertDisplay { display: none; }
 
 </style>



<!-- 목록 select  -->
<div id="contentBody"></div>
<button type="button" id="f_insert">신규 insert</button>


<!--  신규 form  -->
<div id="insertDisplay">
	<!-- code: <input type="text" placeholder="code" id="code" /> -->
	content: <input type="text" placeholder="content" id="content" />
	writer: <input type="text" placeholder="writer" id="writer" />
	date1: <input type="text" placeholder="date1" id="date1" />
	<button type="button" id="insertSubmitBtn">등록</button>
</div>
<!--  // 신규 form  -->

	
	
<!-- 뷰페이지  -->
<div id="contentView">
</div>
<!-- 뷰페이지  -->








<script>
$(document).ready(function() {

	

	
	let $contentBody = $("#contentBody");
	let $contentView = $("#contentView");
	
    
    //목록 select 
	function init(){
		$.ajax({
			url: "${pageContext.request.contextPath }/memoAjax/memoListResponse",
			contentType:"application/json;charset:utf-8",
			type: "get",
			//data: JSON.stringify(data),
			//dataType: "text",
			success: function(resp) {
				//console.log(resp);
				
				// **********************
				// list목록 페이지 띄우기 
				// **********************
				for (var i = 0; i < resp.length; i++) {
					/* $contentBody.append(
							$("<span>").html(resp[i].code)
							,$("<a>")
							.attr("class","aLink")
							//.attr("id","aLink"+[i])
							.attr("href", "javascript:void(0);")
							//.attr("href", '${pageContext.request.contextPath }/memoAjax/memoView/' + resp[i].code)
							.html(resp[i].content)
							,$("<p>").html(resp[i].writer)
							,$("<p>").html(resp[i].date1)	
					);  */
					
					
					$contentBody.append(
							$("<a>")
							.attr("class","aLink")
							.attr("href", "javascript:void(0);")
							.append(
								$("<span>").html(resp[i].code)	
								,$("<span>").html(resp[i].content)
								,$("<p>").html(resp[i].writer)
								,$("<p>").html(resp[i].date1)	
							)
					); 
					
				}	
			},
			error: function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	
	}
		
	init();

	
	////////////////////////////////////////////////////////////////////////////////
	
	// **********************
	// aLink클릭시 뷰페이지 띄우기 
	// **********************
	$("#contentBody").on("click", ".aLink", function(){
		 $(this).each(function(index) {
		
			 
			console.log(this.children[0].innerText);
			let code = this.children[0].innerText;

			
			 $.ajax({
					url: '${pageContext.request.contextPath }/memoAjax/memoView/' + code,
					type: "get",
					//data: JSON.stringify(data),
					dataType: "json", //이걸 지정안해주면 resp넘어오는 데이터가 xml형식으로 넘어오게 됨 
					success: function(data) {
						
						$contentView.empty();
						console.log("data : " ,  data.code);
						
						
						$contentView.append(
								$("<span>").addClass("code").html(data.code)	
								,$("<span>").addClass("content").html(data.content)
								,$("<p>").addClass("writer").html(data.writer)
								,$("<p>").addClass("date1").html(data.date1)	
								,$("<button>").attr('onclick','f_delete()').text('삭제')
								,$("<button>").attr('onclick','f_edit()').text('수정')
								,$("<button>").attr('onclick','f_editComplete()').text('수정완료')
						) 
					},
					error: function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});  
		 });
	 }); 
	

	
	///////////////////////////////////////////////////////////////////////////
	

	// **********************
	// 신규 insert 버튼 클릭시  
	// **********************
	$("#f_insert").click(function(){
		$("#insertDisplay").css('display','block');
/* 
		$.ajax({
			url:"${pageContext.request.contextPath}/memoAjax/memoList",
			type:"post",
			success:function(result){
				console.log("result:::::UI :: " + result);
			}
		});	 */
	
	});

	// **********************
	// 신규 등록버튼 클릭시
	// **********************
	//현재 날짜 세팅하기 
	let data1 = $("#date1").attr('value', new Date().toISOString().substring(0, 10));// 오늘 날짜input에 value에 값 넣기 
	
	$("#insertSubmitBtn").on("click",function(){
		
		//let code = $("#code").val();
		let content = $("#content").val();
		let writer = $("#writer").val();

		let sendData = {
			//"code" : code
			 "content" : content
			, "writer" : writer
			//, "date1" : date1
		};
		//console.log("sendData : " + JSON.stringify(sendData));


		$.ajax({
			url:"${pageContext.request.contextPath}/memoAjax/MemoAjaxInsert",
			contentType:"application/json;charset:utf-8",
			data:JSON.stringify(sendData),//마샬링
			type:"post",
			success:function(result){
				//console.log("result : " + result);
				alert("등록완료");
				location.href = "${pageContext.request.contextPath}/memoAjax/memoList";
				
			}
		});	

	});
	
	
	
	
	
	
});





// **********************
// 삭제 버튼 클릭시
// **********************
function f_delete(){
	
	
	
	let code = $("#contentView").children(0).html();
	
 	$.ajax({
		url:"${pageContext.request.contextPath}/memoAjax/memoAjaxDelete/" + code,
		type:"post",
		//data:JSON.stringify(data),//마샬링
		dataType : "json",
		success:function(result){
			console.log("delete결과물왔다!!" + result);
			alert("삭제완료");
			//location.reload(); 새로고침 안하면 삭제 해도 그대로 남아있기 때문에 새로고침 한번 해줘야됨  
			location.href = "${pageContext.request.contextPath}/memoAjax/memoList";
		}
	});	  
	
	
}


//**********************
//수정 버튼 클릭시
//**********************
function f_edit() {

	let code = $("#contentView").children(0).html(); 
	let date1 = $("#contentView").children(3).html(); 
	let content = $("#contentView").children(".content").html("<input id='contentInput' type='text'>");
	let writer = $("#contentView").children(".writer").html("<input id='writerInput' type='text'>");
	


	
	//input안에 value불러올 컨트롤러 타기 
	$.ajax({
		url:"${pageContext.request.contextPath}/memoAjax/memoAjaxUpdateUI/" + code,
		type:"post",
		dataType : "json",
		success:function(result){	
			let contentJson = result.content;
			let writerJson = result.writer;
			let contentVal = $(".content").children().val(contentJson);	
			let writerVal = $(".writer").children().val(writerJson);	
		}
	});		
}




// **********************
// 수정 완료 버튼 클릭시
// **********************
//수정완료 버튼 클릭시 수정쿼리 타기 
function f_editComplete(){
	
	alert("sdfsdf");
	
	let code = $("#contentView").children(0).html(); 
	let contentVal = $("#contentInput").val();
	let writerVal = $("#writerInput").val();
	let date1 = $("#contentView").children(4).html(); 

	
	let data = {
			"content" : contentVal, // "" 따옴표 안에 있는 건 VO에 들어있는 이름과 동일하게 해야 컨트롤러에 넘어감
			"writer" : writerVal, //   "" 따옴표 안에 있는 건 VO에 들어있는 이름과 동일하게 해야 컨트롤러에 넘어감
			"code" : code, // "" 따옴표 안에 있는 건 VO에 들어있는 이름과 동일하게 해야 컨트롤러에 넘어감
			"date1" : date1, // "" 따옴표 안에 있는 건 VO에 들어있는 이름과 동일하게 해야 컨트롤러에 넘어감
			
	}

	$.ajax({
		url:"${pageContext.request.contextPath}/memoAjax/memoAjaxUpdate/" + code,
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		type:"post",
		success:function(result){	
			alert("수정완료");
			location.href = "${pageContext.request.contextPath}/memoAjax/memoList";
		
		}
	});	   
	
}






</script>