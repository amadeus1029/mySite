package com.javaex.dao;

import com.javaex.vo.UserVo;

import java.sql.*;

public class UserDao {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    private String driver = "oracle.jdbc.driver.OracleDriver";
    private String url = "jdbc:oracle:thin:@localhost:1521:xe";
    private String id = "webdb";
    private String pw = "webdb";

    private void getConnection() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, id, pw);
        } catch (ClassNotFoundException e) {
            System.out.println("error: 드라이버 로딩 실패 - " + e);
        } catch (SQLException e) {
            System.out.println("error:" + e);
        }
    }

    private void close() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            System.out.println("error:" + e);
        }
    }

    //회원 추가
    public int userInsert(UserVo userVo) {
        int count = 0;
        getConnection();

        try {
            String query = "";
            query += " INSERT INTO users ";
            query += " VALUES (seq_users_no.nextval, ?, ?, ?, ?) ";

            pstmt = conn.prepareStatement(query); // 쿼리로 만들기

            pstmt.setString(1, userVo.getId());
            pstmt.setString(2, userVo.getPassword());
            pstmt.setString(3, userVo.getName());
            pstmt.setString(4, userVo.getGender());

            count = pstmt.executeUpdate(); // 쿼리문 실행

        } catch (SQLException e) {
            System.out.println("error:" + e);
        }

        close();
        return count;
    }

    //로그인하기
    public UserVo getUser(String id, String password) {
        getConnection();
        UserVo userVo = null;

        try {
            String query = "";
            query += " SELECT no, name ";
            query += " FROM users ";
            query += " WHERE id = ? and password = ?";

            pstmt = conn.prepareStatement(query); // 쿼리로 만들기

            pstmt.setString(1, id);
            pstmt.setString(2, password);

            rs = pstmt.executeQuery(); // 쿼리문 실행

            while (rs.next()) {
                int no = rs.getInt("no");
                String name = rs.getString("name");
                userVo = new UserVo();
                userVo.setName(name);
                userVo.setNo(no);
            }

        } catch (SQLException e) {
            System.out.println("error:" + e);
        }



        close();

        return userVo;
    }

    //회원정보 수정
    public UserVo getUser(int no) {
        getConnection();
        UserVo userVo = null;

        try {
            String query = "";
            query += " SELECT id, password ";
            query += " FROM users ";
            query += " WHERE no = ?";

            pstmt = conn.prepareStatement(query); // 쿼리로 만들기

            pstmt.setInt(1, no);

            rs = pstmt.executeQuery(); // 쿼리문 실행

            while (rs.next()) {
                String id = rs.getString("id");
                String password = rs.getString("password");
                userVo = new UserVo();
                userVo.setId(id);
                userVo.setPassword(password);
            }

        } catch (SQLException e) {
            System.out.println("error:" + e);
        }



        close();

        return userVo;
    }

    //수정폼 전송
    public int userModify(int no, String password, String name, String gender) {
        int count = 0;

        getConnection();

        try {

            // 3. SQL문 준비 / 바인딩 / 실행
            String query = ""; // 쿼리문 문자열만들기, ? 주의
            query += " update users ";
            query += " set password = ? , ";
            query += "     name = ? , ";
            query += "     gender = ? ";
            query += " where no = ? ";

            pstmt = conn.prepareStatement(query); // 쿼리로 만들기

            pstmt.setString(1, password); // ?(물음표) 중 1번째, 순서중요
            pstmt.setString(2, name); // ?(물음표) 중 2번째, 순서중요
            pstmt.setString(3, gender); // ?(물음표) 중 3번째, 순서중요
            pstmt.setInt(4, no); // ?(물음표) 중 4번째, 순서중요

            count = pstmt.executeUpdate(); // 쿼리문 실행

        } catch (SQLException e) {
            System.out.println("error:" + e);
        }

        close();

        return count;
    }

}
