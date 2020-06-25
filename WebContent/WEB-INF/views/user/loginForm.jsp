<%@ page import="com.javaex.vo.UserVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String result = request.getParameter("result");
    UserVo authUser = (UserVo)session.getAttribute("authUser");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="/mySite/assets/css/mysite.css" rel="stylesheet" type="text/css">
    <link href="/mySite/assets/css/user.css" rel="stylesheet" type="text/css">

</head>
<body>
    <div id="wrap">

        <div id="header">
            <h1><a href="/mySite/main">MySite</a></h1>
            <%if(authUser != null){%>
            <ul>
                <li><%=authUser.getName()%> 님(<%=authUser.getNo()%>) 안녕하세요^^</li>
                <li><a href="/mySite/user?action=logout">로그아웃</a></li>
                <li><a href="">회원정보수정</a></li>
            </ul>
            <%} else {%>
            <ul>
                <li><a href="/mySite/user?action=loginForm">로그인</a></li>
                <li><a href="/mySite/user?action=joinForm">회원가입</a></li>
            </ul>
            <%}%>
        </div>
        <!-- //header -->

        <div id="nav">
            <ul>
                <li><a href="">방명록</a></li>
                <li><a href="">갤러리</a></li>
                <li><a href="">게시판</a></li>
                <li><a href="">입사지원서</a></li>
            </ul>
            <div class="clear"></div>
        </div>
        <!-- //nav -->

        <div id="aside">
            <h2>회원</h2>
            <ul>
                <li>회원정보</li>
                <li>로그인</li>
                <li>회원가입</li>
            </ul>
        </div>
        <!-- //aside -->

        <div id="content">

            <div id="content-head">
                <h3>로그인</h3>
                <div id="location">
                    <ul>
                        <li>홈</li>
                        <li>회원</li>
                        <li class="last">로그인</li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <!-- //content-head -->

            <div id="user">
                <div id="loginForm">
                    <form action="/mySite/user" method="get">
                        <input type="hidden" name="action" value="login">
                        <!-- 아이디 -->
                        <div class="form-group">
                            <label class="form-text" for="input-uid">아이디</label>
                            <input type="text" id="input-uid" name="id" value="" placeholder="아이디를 입력하세요">
                        </div>

                        <!-- 비밀번호 -->
                        <div class="form-group">
                            <label class="form-text" for="input-pass">비밀번호</label>
                            <input type="text" id="input-pass" name="password" value="" placeholder="비밀번호를 입력하세요"	>
                        </div>
                        <%if(("fail").equals(result)){%>
                            <p style="color:red">틀렸음 ㅋㅋㅋㅋ</p>
                        <%}%>
                        <!-- 버튼영역 -->
                        <div class="button-area">
                            <button type="submit" id="btn-submit">로그인</button>
                        </div>

                    </form>
                </div>
                <!-- //loginForm -->
            </div>
            <!-- //user -->
        </div>
        <!-- //content  -->
        <div class="clear"></div>

        <div id="footer">
            Copyright ⓒ 2020 황일영. All right reserved
        </div>
        <!-- //footer -->

    </div>
    <!-- //wrap -->

</body>

</html>