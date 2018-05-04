package com.shyn.servlet.main;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Logger;

@WebServlet(name = "ProfileUpdate", urlPatterns = { "/ProfileUpdate" })
public class ProfileUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static Logger logger = Logger.getLogger(String.valueOf(ProfileUpdate.class));

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("####################   Initialize ProfileUpdate page");
        Connection con = (Connection) getServletContext().getAttribute("DBConnection");

        String country = request.getParameter("country");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String id = request.getParameter("id");
        String role = request.getParameter("role");

        //Create new Query
        PreparedStatement ps = null;

        try {
            ps = con.prepareStatement("" +
                    "UPDATE users " +
                    "SET country = ?, " +
                    "name = ?, " +
                    "email = ?, " +
                    "role = ? " +
                    "WHERE id = ?");
            ps.setString(1, country);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, role);
            ps.setString(5, id);
            logger.info("ps ::::" + ps);
            int i = ps.executeUpdate();
            if (i > 0){
                response.sendRedirect("welcome.jsp");
            }

            //Create new Query
            logger.info("Complete");
            
        } catch (SQLException e) {
            e.printStackTrace();
            logger.info("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }finally{
            try {
                ps.close();
            } catch (SQLException e) {
                logger.info("SQLException in closing PreparedStatement or ResultSet");;
            }
        }

    }

}