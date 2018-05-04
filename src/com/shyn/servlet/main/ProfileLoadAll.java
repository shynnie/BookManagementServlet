package com.shyn.servlet.main;


import com.shyn.util.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Logger;

@WebServlet(name = "ProfileLoadAll", urlPatterns = "/ProfileLoadAll" )
public class ProfileLoadAll extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static Logger logger = Logger.getLogger(String.valueOf(ManageUsers.class));

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("####################   Initialize ProfileLoadAll page");

        Connection con = (Connection) getServletContext().getAttribute("DBConnection");

        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            ps = con.prepareStatement("" +
                    "SELECT * " +
                    "FROM Users ");
            rs = ps.executeQuery();
            ArrayList<User> ProfileLoadAll = new ArrayList<>();

            while (rs.next()) {
                logger.info("Initialize ProfileLoadAll query");
                User user = new User(rs.getString("name"), rs.getString("email"), rs.getString("country"), rs.getInt("id"), rs.getInt("role"));
                ProfileLoadAll.add(user);
                logger.info("User with details = " +user);
            }
            HttpSession session = request.getSession();
            session.setAttribute("ProfileLoadAll", ProfileLoadAll);
            response.sendRedirect("manageUsers.jsp");
        }
        catch (Exception e){
            e.printStackTrace();
            logger.info("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }
        finally {
            try{
                rs.close();
                ps.close();
            } catch (SQLException e) {
                logger.info("SQLException in closing PreparedStatement or ResultSet");
            }
        }
    }
}