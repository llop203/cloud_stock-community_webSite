
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="common.jsp" %>



<c:if test="${sessionScope.user_no==null or sessionScope.user_id==null}">
	<script>
		alert("로그인후 이용가능합니다.");
		location.replace("${croot}/loginForm.do");
	</script>
</c:if>
<c:if test="${sessionScope.user_no!=null and sessionScope.user_id!=null}">
	<%
		session.removeAttribute("user_no");
		session.removeAttribute("user_id");
	%>
	<script>
		alert("로그아웃 완료!\n메인페이지로 이동합니다.");
		location.replace("${croot}/mainPageForm.do");
	</script>
</c:if>






