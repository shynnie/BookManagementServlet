package com.shyn.servlet.main;


import com.shyn.util.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Logger;

@WebServlet(name = "UsersFilter", urlPatterns = "/UsersFilter" )
public class UsersFilter extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static Logger logger = Logger.getLogger(String.valueOf(UsersFilter.class));

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("####################   Initialize UserFilter page");
        String country = request.getParameter("search");
        String name = request.getParameter("search");
        String email = request.getParameter("search");
        String id = request.getParameter("search");
        String errorMsg = null;

        if (country == "" && name == "" && email == "" && id == ""
                ){
            errorMsg = "Search box can't NULL";
        }

        if (errorMsg != null) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/usersfilter.jsp");
            PrintWriter out = response.getWriter();
            out.println("<font color = red>" + errorMsg + "</font>");
            rd.include(request, response);
        }
        else {
            Connection con = (Connection) getServletContext().getAttribute("DBConnection");

            PreparedStatement ps = null;
            ResultSet rs = null;
            try{
                ps = con.prepareStatement("" +
                        "SELECT * " +
                        "FROM Users " +
                        "WHERE country = ? " +
                        "OR name = ? " +
                        "OR id = ? " +
                        "OR email = ? " +
                        "limit 5");
                ps.setString(1, country);
                ps.setString(2, name);
                ps.setString(3, id);
                ps.setString(4, email);
                rs = ps.executeQuery();
                ArrayList<User> filterUsers = new ArrayList<>();

                while (rs.next()) {
                    logger.info("Initialize UserFilter query");
                    User user = new User(rs.getString("name"), rs.getString("email"), rs.getString("country"), rs.getInt("id"), rs.getInt("role"));
                    filterUsers.add(user);
                    logger.info("User with details = " +user);
                }
                HttpSession session = request.getSession();
                session.setAttribute("filterUsers", filterUsers);
                response.sendRedirect("usersfilter.jsp");
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
}