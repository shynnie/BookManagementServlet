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

@WebServlet(name = "UserInformation", urlPatterns = { "/UserInformation" })
public class UserInformation extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static Logger logger = Logger.getLogger(String.valueOf(UserInformation.class));

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("####################   Initialize UserInformation page");
        Connection con = (Connection) getServletContext().getAttribute("DBConnection");

        //Create new Query
        PreparedStatement ps2 = null;
        ResultSet rs2 = null;
        try {
            ps2 = con.prepareStatement("" +
                    "SELECT id, name, email, country " +
                    "FROM admin");
            rs2 = ps2.executeQuery();
            ArrayList<User> listUsers = new ArrayList<>();

            while(rs2.next()){
                //Handle new query
                logger.info("Initialize UserInformation query");
                User user2 = new User(rs2.getString("name"), rs2.getString("email"), rs2.getString("country"), rs2.getInt("id"));
                listUsers.add(user2);
                logger.info("User found with details = "+user2);
            }

            HttpSession session = request.getSession();
            session.setAttribute("listUsers", listUsers);
            response.sendRedirect("userinformation.jsp");;
        //Create new Query


        } catch (SQLException e) {
            e.printStackTrace();
            logger.info("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }finally{
            try {
                rs2.close();
                ps2.close();
            } catch (SQLException e) {
                logger.info("SQLException in closing PreparedStatement or ResultSet");;
            }
        }

    }

}