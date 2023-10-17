<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>    
	<form method="post" action="<c:url value='/login/loginProcess.do'/>">
		<security:csrfInput/>
		<ul>
			<li>
				<c:set var="savedId" value="${cookie['savedId']['value'] }" />
				<input type="text" name="memId" placeholder="아이디" value="${not empty validId ? validId : savedId}"/>
				<input type="checkbox" name="saveId" ${not empty savedId ? 'checked':'' }/>아이디기억하기
				<c:remove var="validId" scope="session"/>
			</li>
			<li>
				<input type="password" name="memPass" placeholder="비밀번호" />
				<input type="submit" value="로그인" />
			</li>
		</ul>
	</form>










