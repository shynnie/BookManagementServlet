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

@WebServlet(name = "ProfileDelete", urlPatterns = { "/ProfileDelete" })
public class ProfileDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static Logger logger = Logger.getLogger(String.valueOf(ProfileRead.class));

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("####################   Initialize Profile Delete page");
        Connection con = (Connection) getServletContext().getAttribute("DBConnection");

        String id = request.getParameter("id");
        logger.info("id :::: " +id);
        //Create new Query
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement("" +
                    "DELETE FROM users " +
                    "WHERE id = ?");
            ps.setString(1, id);
            ps.executeUpdate();
            response.sendRedirect("manageUsers.jsp");;
            //Create new Query


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