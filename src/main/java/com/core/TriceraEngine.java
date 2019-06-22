
/* 

This class encapsulates the Logic Flow / Response Tree 

Author: John Paulo Mataac (@cyberpau)
*/

package com.core;

import java.util.ArrayList;
import java.util.List;

import com.utilities.TriceraSQLUtils;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.Paragraph;


public class TriceraEngine {
    private int requestCode = 0;
    private int responseCode = -1;
    private String username;
    private String response;

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

    public Component processRequest(int id, int seq, String request, String variables){
        System.out.println("TriceraEngine.processRequest() : " + " id = " + id + " | seq = " + seq + " | requestString = " + request);
        TriceraSQLUtils util = new TriceraSQLUtils();
        Response resp = util.getResponseRow(id, seq);

        switch (id) {
            case TriceraConstants.REQUESTCODE_ASK_USER:
                System.out.println("REQUESTCODE_ASK_USER");
                username = request;
                responseCode = resp.getNext_reqid();
                response = "Hello " + username + ", " + resp.getResponse_display();
                break;
        
            default:
                response = (resp.getResponse_display() != null) ? resp.getResponse_display() : "";
                return util.getResponseComponentFromSP(resp, request, variables);
        }
        return null;
    }

    public String processRequest(int id, int seq, String request){
        System.out.println("TriceraEngine.processRequest() : " + " id = " + id + " | seq = " + seq + " | requestString = " + request);
        TriceraSQLUtils util = new TriceraSQLUtils();
        Response resp = util.getResponseRow(id, seq);
        switch (id) {
            case TriceraConstants.REQUESTCODE_ASK_USER:
                username = request;
                responseCode = resp.getNext_reqid();
                response = "Hello " + username + ", " + resp.getResponse_display();
                break;
        
            default:
                System.out.println("Went to default case with sp");
                response = (resp.getResponse_display() != null) ? resp.getResponse_display() : "";

                String sp_script = (resp.getStored_proc() != null) ? resp.getStored_proc() : "";
                if (!sp_script.isEmpty()){
                    System.out.println("display + sp_response");
                    StringBuilder sb = new StringBuilder();
                    List<Object> objParam = new ArrayList<Object>();
                    String sp_response = util.getResponseStringFromSP(resp.getStored_proc(), resp.getResponse_type(), objParam);
                    if(!response.isEmpty()) sb.append(response);
                    if(!sp_response.isEmpty()){
                        sb.append("<BR/>");
                        switch (resp.getResponse_type()) {
                            case 1:
                                sb.append(sp_response);
                                break;
                        
                            default:
                                // assume it is a String with COLUMN 1
                                sb.append(sp_response);
                                break;
                        }
                        
                        response = sb.toString();
                    }
                }
                break;
        }
        return response;
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