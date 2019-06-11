package com.utilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.vaadin.flow.server.VaadinSession;


public class TriceraSQLUtils {

    Connection conn;
    PreparedStatement ps;

    public TriceraSQLUtils(){

    }

    public void insertUserSession(String username){
        if (username.isEmpty()) return;
        String sessionID = VaadinSession.getCurrent().getSession().getId();
        String sql = "INSERT INTO [SESSION_LOGS](session_id, user_id) VALUES (?, ?)";

        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, sessionID);
            ps.setString(2, username);
            //ps.executeQuery();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    public int getUserSessionTransactionId(String username){
        if (username.isEmpty()) return 0;
        String sessionID = VaadinSession.getCurrent().getSession().getId();
        String sql = "SELECT TOP 1 tranid FROM [SESSION_LOGS] WHERE session_id = ? OR user_id = ?";
        int tranid = 0;

        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, sessionID);
            ps.setString(2, username);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                tranid = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return tranid;
    }
}