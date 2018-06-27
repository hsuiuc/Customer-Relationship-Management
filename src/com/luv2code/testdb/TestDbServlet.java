package com.luv2code.testdb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "TestDbServlet")
public class TestDbServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = "root";
        String pass = "admin";

        String jdbcURL = "jdbc:mysql://localhost:3306/web_customer_tracker?useSSL=false";
        String driver = "com.mysql.jdbc.Driver";

        try {
            PrintWriter out = response.getWriter();
            out.println("Connecting to database : " + jdbcURL);
            Class.forName(driver);
            Connection myConn = DriverManager.getConnection(jdbcURL, user, pass);
            out.println("SUCCESS!");
            myConn.close();
        }
        catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }

    }
}
