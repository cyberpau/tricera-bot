package com.utilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.core.Request;
import com.core.Response;
import com.vaadin.flow.server.VaadinSession;


public class TriceraSQLUtils {
    private static final String SQL_SELECT_FROM_RESPONSE = "SELECT parent_reqid, seq, display, description, next_reqid, response_display, stored_proc, response_type, continue_loop FROM RESPONSE";
    private static final String SQL_SELECT_FROM_REQUEST_BY_REQID = "SELECT reqid, description, init_display, stored_proc, response_type FROM REQUEST where reqid = ? ORDER BY reqid, seq ASC";

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

    public List<Response> getResponseTableByRequestID(int requestID){
        List<Response> responses = new ArrayList<Response>();
        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement(SQL_SELECT_FROM_RESPONSE + " where parent_reqid = ? ");
            ps.setInt(1, requestID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Response result = new Response();
                result.setParent_reqid(rs.getInt(1));
                result.setSeq(rs.getInt(2));
                result.setDisplay(rs.getString(3));
                result.setDescription(rs.getString(4));
                result.setNext_reqid(rs.getInt(5));
                result.setResponse_display(rs.getString(6));
                result.setStored_proc(rs.getString(7));
                result.setResponse_type(rs.getShort(8));
                result.setCont_looping(rs.getShort(9));
                responses.add(result);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
		}
		return responses;
    }

    public Response getResponseRow(int requestID, int sequenceID){
        Response response = new Response();
        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement(SQL_SELECT_FROM_RESPONSE + " where parent_reqid = ? AND seq = ? ");
            ps.setInt(1, requestID);
            ps.setInt(2, sequenceID);
            System.out.println(SQL_SELECT_FROM_RESPONSE + " where parent_reqid = ? AND seq = ? ");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                
                response.setParent_reqid(rs.getInt(1));
                response.setSeq(rs.getInt(2));
                response.setDisplay(rs.getString(3));
                response.setDescription(rs.getString(4));
                response.setNext_reqid(rs.getInt(5));
                response.setResponse_display(rs.getString(6));
                response.setStored_proc(rs.getString(7));
                response.setResponse_type(rs.getShort(8));
                response.setCont_looping(rs.getShort(9));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
		}
		return response;
    }

    public String getResponseStringFromSP(String sp_script, int type, List<Object> parameters){
        String responseString = "";
        int counter = 1;
        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement(sp_script);
            for(Object param : parameters){
                if(param instanceof String){
                    ps.setString(counter, param.toString());
                } else if (param instanceof Integer){
                    ps.setInt(counter, Integer.parseInt(param.toString()));
                }
                counter++;
            }
            System.out.println(sp_script);
            ResultSet rs = ps.executeQuery();
            switch (type) {
                case 1:
                    while(rs.next()){
                        responseString = rs.getString(1);
                    }
                    break;

                case 2:
                    while(rs.next()){
                        responseString = rs.getString(1);
                        responseString += " \n\n " + rs.getObject(2);
                    }
                    break;
                default:
                    while(rs.next()){
                        responseString = rs.getString(1);
                    }
                    break;
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        System.out.println("TricerSQLUtils.getResponseStringFromSP() : response = " + responseString);
        return responseString;
    }

    public List<Request> getRequestTableByRequestID(int requestID){
        List<Request> requests = new ArrayList<Request>();
        
        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement(SQL_SELECT_FROM_REQUEST_BY_REQID);
            ps.setInt(1, requestID);
            System.out.println(SQL_SELECT_FROM_REQUEST_BY_REQID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Request request = new Request();
                request.setReqid(rs.getInt(1));
                request.setDescription(rs.getString(2));
                request.setInit_display(rs.getString(3));
                request.setStored_proc(rs.getString(4));
                request.setResponse_type(rs.getShort(5));
                requests.add(request);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
		}
		return requests;
    }
}