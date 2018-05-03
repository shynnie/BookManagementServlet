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
import java.util.logging.Logger;

@WebServlet(name = "ProfileView", urlPatterns = { "/ProfileView" })
public class ProfileView extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static Logger logger = Logger.getLogger(String.valueOf(ProfileView.class));

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("####################   Initialize Profile View page");
        Connection con = (Connection) getServletContext().getAttribute("DBConnection");

        String id = request.getParameter("id");
        logger.info("id :::: " +id);
        //Create new Query
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("" +
                    "SELECT id, name, email, country, role " +
                    "FROM users " +
                    "WHERE id = ?");
            ps.setString(1, id);
            rs = ps.executeQuery();

            while(rs.next()){
                User user = new User(rs.getString("name"), rs.getString("email"), rs.getString("country"), rs.getInt("id"), rs.getInt("role"));
                logger.info("User found with details = "+user);
                HttpSession session = request.getSession();
                session.setAttribute("profileView", user);
                response.sendRedirect("profileEdit.jsp");;
                logger.info("session profileView :::" + session);
            }
            //Create new Query


        } catch (SQLException e) {
            e.printStackTrace();
            logger.info("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }finally{
            try {
                rs.close();
                ps.close();
            } catch (SQLException e) {
                logger.info("SQLException in closing PreparedStatement or ResultSet");;
            }
        }

    }

}