<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>      



<h1>${memoDetail.writer}의 상세페이지 </h1>
<br><br>
${memoDetail.code}
${memoDetail.writer}
${memoDetail.content}
${memoDetail.date1} 



<button type="button">수정</button>
<button type="button">삭제</button>
<button type="button">목록</button>