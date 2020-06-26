<%@ page import="com.javaex.vo.UserVo" %>
<%@ page import="com.javaex.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserVo authUser = (UserVo)session.getAttribute("authUser");
    UserDao userDao = new UserDao();
    String userId = (userDao.getUser(authUser.getNo())).getId();
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
                <h3>회원정보</h3>
                <div id="location">
                    <ul>
                        <li>홈</li>
                        <li>회원</li>
                        <li class="last">회원정보</li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <!-- //content-head -->

            <div id="user">
                <div id="modifyForm">
                    <form action="/mySite/user" method="get">
                        <input type="hidden" name="action" value="modify">
                        <!-- 아이디 -->
                        <div class="form-group">
                            <label class="form-text" for="input-uid">아이디</label>
                            <span class="text-large bold"><%=userId%></span>
                        </div>

                        <!-- 비밀번호 -->
                        <div class="form-group">
                            <label class="form-text" for="input-pass">패스워드</label>
                            <input type="text" id="input-pass" name="password" value="" placeholder=""	>
                        </div>

                        <!-- 이메일 -->
                        <div class="form-group">
                            <label class="form-text" for="input-name">이름</label>
                            <input type="text" id="input-name" name="name" value="" placeholder="<%=authUser.getName()%>">
                        </div>

                        <!-- //나이 -->
                        <div class="form-group">
                            <span class="form-text">성별</span>

                            <label for="rdo-male">남</label>
                            <input type="radio" id="rdo-male" name="gender" value="male" >

                            <label for="rdo-female">여</label>
                            <input type="radio" id="rdo-female" name="gender" value="female" >

                        </div>

                        <!-- 버튼영역 -->
                        <div class="button-area">
                            <button type="submit" id="btn-submit">회원정보수정</button>
                        </div>

                    </form>


                </div>
                <!-- //modifyForm -->
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
