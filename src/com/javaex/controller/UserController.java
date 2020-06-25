package com.javaex.controller;

import com.javaex.dao.UserDao;
import com.javaex.util.WebUtil;
import com.javaex.vo.UserVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user")
public class UserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if("joinForm".equals(action)) {
            WebUtil.forward(request,response,"/WEB-INF/views/user/joinForm.jsp");
        } else if("join".equals(action)) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");

            UserDao userDao = new UserDao();
            UserVo userVo = new UserVo(id,password,name,gender);
            userDao.userInsert(userVo);

            WebUtil.forward(request,response,"WEB-INF/views/user/joinOk.jsp");
        } else if("loginForm".equals(action)) {
            WebUtil.forward(request,response,"WEB-INF/views/user/loginForm.jsp");
        } else if("login".equals(action)) {
            String id = request.getParameter("id");
            String password = request.getParameter("password");

            UserDao userDao = new UserDao();
            UserVo authVo = userDao.getUser(id,password);

            if(authVo != null) {
                //로그인성공 -> 세션에 값 넣어주고 리다이렉트
                HttpSession session = request.getSession();
                session.setAttribute("authUser", authVo);

                WebUtil.redirect(request,response,"/mySite/main");
            } else {
                WebUtil.redirect(request,response,"/mySite/user?action=loginForm&result=fail");
            }
        } else if("logout".equals(action)) {
            HttpSession session = request.getSession();
            session.removeAttribute("authUser");
            session.invalidate();
            WebUtil.redirect(request,response,"/mySite/main");
        } else if("modifyForm".equals(action)) {
            WebUtil.forward(request,response,"WEB-INF/views/user/modifyForm.jsp");
        } else if("modify".equals(action)) {
            String id = request.getParameter("id");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");

            UserDao userDao = new UserDao();
            userDao.userModify(id,password,name,gender);

            UserVo authVo = userDao.getUser(id,password);

            HttpSession session = request.getSession();
            session.setAttribute("authUser", authVo);

            WebUtil.redirect(request,response,"/mySite/main");
        }
    }
}

