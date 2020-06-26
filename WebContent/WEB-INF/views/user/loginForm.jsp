<%@ page import="com.javaex.vo.UserVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String result = request.getParameter("result");
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

        <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        <!-- //header -->

        <jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
        <!-- //nav -->

        <jsp:include page="/WEB-INF/views/include/asideuser.jsp"></jsp:include>
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

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        <!-- //footer -->

    </div>
    <!-- //wrap -->

</body>

</html>