package com.core;

import com.vaadin.flow.component.UI;
import com.vaadin.flow.component.page.Page;

public class TriceraEngine {
    private int requestCode = 0;
    private int responseCode = 1;
    private String username;
    private String response;

    // flags:
    private boolean isOngoingConcernSearch = false;
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
        // validate request here
        validate(request);

        response = "";
        switch(requestCode){
            case TriceraConstants.REQUESTCODE_ASK_USER:
                username = request;
                response = "Hello " + username + ", what can I do for you?";
                responseCode = 48;
                break;
            case TriceraConstants.REQUESTCODE_SEARCH_3C:
                if(!isOngoingConcernSearch){
                    response = " Sure! Give me some keywords so I can check it in my 3C database.";
                    responseCode = TriceraConstants.RESPONSECODE_TF;
                    isOngoingConcernSearch = true;
                } else {
                    if(request.equalsIgnoreCase(TriceraConstants.CONST_YES)){
                        response = "Great! I'm glad I could be of assistance.";
                        responseCode = 48;
                        isOngoingConcernSearch = false;
                    } else if (request.equalsIgnoreCase(TriceraConstants.CONST_CANCEL)){
                        response = "I still have remaining results found, but I guess this is the end for us </3";
                        responseCode = 6;
                        isOngoingConcernSearch = false;
                    } else {
                        // execute stored procedure here:
                        response = "How about this? " + response;
                        responseCode = 14;
                    }
                    
                }
                
                break;

            case TriceraConstants.REQUESTCODE_RESTART:
                if(isRestarted && (request.equalsIgnoreCase(TriceraConstants.CONST_YES))){
                    UI.getCurrent().getPage().reload();
                    response = "";
                }
                isRestarted = false;
            default:
                // do nothing...
                response = "I'm dumb... Do you want to restart everything?";
                requestCode = TriceraConstants.REQUESTCODE_RESTART;
                responseCode = 6;
                isRestarted = true;
                break;

        }
        
		return response;
    }
    
    private void validate(String request) {

    }

    public String processRequest(String request, int code) {
        // execute stored procedure here:
        if (code == TriceraConstants.REQUESTCODE_ASK_USER){
            // ask for username
            this.username = request;
            this.response = "Hello " + username + ", what can I do for you?";
            this.responseCode = 2;
        }
		return request;
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