package com.javaex.dao;

import com.javaex.vo.UserVo;

public class DaoTest {
    public static void main(String[] args) {
        UserDao dao = new UserDao();
        dao.userInsert(new UserVo("testuser","1234","testuser","female"));
    }
}
