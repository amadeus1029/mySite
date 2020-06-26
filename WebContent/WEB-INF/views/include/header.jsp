<%@ page import="com.javaex.vo.UserVo" %>
<%
    UserVo authUser = (UserVo)session.getAttribute("authUser");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="header">
    <h1><a href="/mySite/main">MySite</a></h1>
    <%if(authUser != null){%>
    <ul>
        <li><%=authUser.getName()%> 님(<%=authUser.getNo()%>) 안녕하세요^^</li>
        <li><a href="/mySite/user?action=logout">로그아웃</a></li>
        <li><a href="/mySite/user?action=modifyForm">회원정보수정</a></li>
    </ul>
    <%} else {%>
    <ul>
        <li><a href="/mySite/user?action=loginForm">로그인</a></li>
        <li><a href="/mySite/user?action=joinForm">회원가입</a></li>
    </ul>
    <%}%>
</div>
