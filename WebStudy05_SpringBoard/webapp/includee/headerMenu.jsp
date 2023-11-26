<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap w-100 p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="${pageContext.request.contextPath }">Class3.5</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <ul class="nav px-3 col">
  	<li class="nav-item text-nowrap">
      <a class="nav-link" href="${pageContext.request.contextPath }/memo/memoList.do">메모장(model)</a>
    </li>
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="${pageContext.request.contextPath }/memoAjax/memoList.do">메모장(ajax)</a>
    </li>
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="${pageContext.request.contextPath }/test/test.do">시험</a>
    </li>
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="${pageContext.request.contextPath }/testProf/testForm.do">시험(교수)</a>
    </li>
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="${pageContext.request.contextPath }/board/boardList.do">자유게시판</a>
    </li>
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="#">회원관리</a>
    </li>
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="#">상품관리</a>
    </li>
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="#">거래처관리</a>
    </li>
  </ul>
  <ul class="nav px-3 col-2">
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="${pageContext.request.contextPath }/login/loginForm.jsp">Sign in</a>
    </li>
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="${pageContext.request.contextPath }/login/logout.do">Sign out</a>
    </li>
  </ul>
</nav>