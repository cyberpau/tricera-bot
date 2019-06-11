
/* 

This class encapsulates the Logic Flow / Response Tree 

Author: John Paulo Mataac (@cyberpau)
*/

package com.core;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.utilities.TriceraSQLUtils;
import com.utilities.VaadinConnectionPool;
import com.vaadin.flow.component.UI;
import com.vaadin.flow.server.VaadinSession;


public class TriceraEngine {
    private int requestCode = 0;
    private int responseCode = -1;
    private String username;
    private String response;

    // flags:
    private boolean isSearching = false;
    private boolean isRestarted = false;

    public TriceraEngine(){

    }

    public TriceraEngine(String username){
        this.username = username;

    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return super.toString();
    }

	public String processRequest(String request) {
        RequestGenerator gen = new RequestGenerator(requestCode);
        System.out.println("***********");
        // validate request here
        validate(request);
        response = "";

        if(requestCode < 0){
            // Should go here if replied by: {"Yes", "No", "Cancel", "Maybe", "Modify", etc.}
            switch (requestCode) {
                case TriceraConstants.RESPONSECODE_TF:
                    if(isSearching){
                        Connection conn;
                        PreparedStatement ps;
                        ResultSet rs;

                        String result = "";
                        String sql = "SELECT * FROM freetexttable(dbo.LESSON_LEARNT, (problem_descr, solution_descr), ? , 5) as T" 
                            + " join dbo.LESSON_LEARNT as LL on T.[KEY] = LL.ll_ref_no";

                        try {
                            conn = VaadinConnectionPool.getConnection();
                            ps = conn.prepareStatement(sql);
                            ps.setString(1, request);
                            rs = ps.executeQuery();
                            while(rs.next()){
                                result = rs.getString(5);
                            } 
                        } catch (Exception e) {
                            System.out.println(e.toString());
                        }

                        response += "Check this out! <BR/>" + result; // first response to query
                        response += "<BR/> Did this help?";
                        responseCode = 14;
                    }
                    break;

                case TriceraConstants.RESPONSECODE_BTN_YES:
                    if(isSearching){
                        response = "Great! I'm glad I could be of assistance. Is there anything else I can do for you " + username + "?";
                        responseCode = 6144;
                        isSearching = false;
                    }
                    break;
            
                case TriceraConstants.RESPONSECODE_BTN_NO:
                    if(isSearching){
                        Connection conn;
                        PreparedStatement ps;
                        ResultSet rs;

                        String result = "";
                        String sql = "SELECT * FROM freetexttable(dbo.LESSON_LEARNT, (problem_descr, solution_descr), ? , 5) as T" 
                            + " join dbo.LESSON_LEARNT as LL on T.[KEY] = LL.ll_ref_no";

                        try {
                            conn = VaadinConnectionPool.getConnection();
                            ps = conn.prepareStatement(sql);
                            ps.setString(1, request);
                            rs = ps.executeQuery();
                            while(rs.next()){
                                result = rs.getString(5);
                            } 
                        } catch (Exception e) {
                            System.out.println(e.toString());
                        }
                        response = "How about this? <BR/>" + result;
                        responseCode = 14;
                    }
                    break;
            
                case TriceraConstants.REQUESTCODE_ERROR:
                
                    break;
                default:
                    break;
            }
        } else {
            // these are scalable generated buttons
            switch(requestCode){
                case TriceraConstants.REQUESTCODE_ASK_USER:
                    username = request;
                    TriceraSQLUtils util = new TriceraSQLUtils();
                    util.insertUserSession(username);
                    response = "Hello " + username + ", what can I do for you?";
                    responseCode = gen.getResponseCode();
                    break;
                case TriceraConstants.REQUESTCODE_SEARCH:
                    if(!isSearching){
                        response = " Sure! Give me some keywords so I can check it in my 3C database.";
                        responseCode = TriceraConstants.RESPONSECODE_TF;
                        isSearching = true;
                    }
                    break;
    
                case TriceraConstants.REQUESTCODE_ERROR:
                    if(isRestarted && (request.equalsIgnoreCase(TriceraConstants.CONST_OK))){
                        UI.getCurrent().getPage().reload();
                        response = "";
                    }
                    isRestarted = false;
                    break;

                default:
                    // do nothing...
                    response = "I'm dumb... Do you want to restart everything?";
                    response += VaadinSession.getCurrent().getSession().getId();
                    requestCode = 8192;
                    isRestarted = true;
                    break;
            }
        }
        
        
		return response;
    }
    
    private void validate(String request) {
        System.out.println("validate(): request = " + request);
        System.out.println("validate(): requestCode = " + requestCode);
    }

    /**
     * @return the response
     */
    public String getResponse() {
        return response;
    }

    /**
     * @param response the response to set
     */
    public void setResponse(String response) {
        this.response = response;
    }

    /**
     * @return the requestCode
     */
    public int getRequestCode() {
        return requestCode;
    }

    /**
     * @param requestCode the requestCode to set
     */
    public void setRequestCode(int requestCode) {
        this.requestCode = requestCode;
    }

    /**
     * @return the responseCode
     */
    public int getResponseCode() {
        return responseCode;
    }

    /**
     * @param responseCode the responseCode to set
     */
    public void setResponseCode(int responseCode) {
        this.responseCode = responseCode;
    }
}