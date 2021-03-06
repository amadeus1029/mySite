<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <h3>회원가입</h3>
                <div id="location">
                    <ul>
                        <li>홈</li>
                        <li>회원</li>
                        <li class="last">회원가입</li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <!-- //content-head -->

            <div id="user">
                <div id="joinForm">
                    <form action="/mySite/user" method="post">
                        <input type="hidden" name="action" value="join">
                        <!-- 아이디 -->
                        <div class="form-group">
                            <label class="form-text" for="inputId">아이디</label>
                            <input type="text" id="inputId" name="id" value="" placeholder="아이디를 입력하세요">
                            <button type="button" id="">중복체크</button>
                        </div>

                        <!-- 비밀번호 -->
                        <div class="form-group">
                            <label class="form-text" for="inputPass">패스워드</label>
                            <input type="text" id="inputPass" name="password" value="" placeholder="비밀번호를 입력하세요"	>
                        </div>

                        <!-- 이메일 -->
                        <div class="form-group">
                            <label class="form-text" for="inputName">이름</label>
                            <input type="text" id="inputName" name="name" value="" placeholder="이름을 입력하세요">
                        </div>

                        <!-- //나이 -->
                        <div class="form-group">
                            <span class="form-text">성별</span>

                            <label for="genderMale">남</label>
                            <input type="radio" id="genderMale" name="gender" value="male" >

                            <label for="genderFemale">여</label>
                            <input type="radio" id="genderFemale" name="gender" value="female" >

                        </div>

                        <!-- 약관동의 -->
                        <div class="form-group">
                            <span class="form-text">약관동의</span>

                            <input type="checkbox" id="chk-agree" value="" name="">
                            <label for="chk-agree">서비스 약관에 동의합니다.</label>
                        </div>

                        <!-- 버튼영역 -->
                        <div class="button-area">
                            <button type="submit" id="btnSubmit">회원가입</button>
                        </div>

                    </form>
                </div>
                <!-- //joinForm -->
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
