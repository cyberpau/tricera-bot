
/* 

This class encapsulates the Logic Flow / Response Tree 

Author: John Paulo Mataac (@cyberpau)
*/

package com.core;

import java.applet.AppletContext;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.utilities.TriceraSQLUtils;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.Paragraph;

import org.apache.commons.io.FileUtils;

public class TriceraEngine {
    private int requestCode = 0;
    private int responseCode = -1;
    private String username;
    private String response;
    private String param;
    private Document uploadDoc;

    public TriceraEngine() {

    }

    public TriceraEngine(String username) {
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

    public Component processRequest(int id, int seq, String request, String paramBuilder) {
        TriceraSQLUtils util = new TriceraSQLUtils();
        Response resp = util.getResponseRow(id, seq);
        System.out.println(
                "### TriceraEngine.processRequest() : Request = " + request + " | Response = " + resp.toString());
        Component responseComponent = null;

        switch (id) {
        case TriceraConstants.REQUESTCODE_ASK_USER:
            username = request;
            responseCode = resp.getNext_reqid();
            response = "Hello " + username + ", " + resp.getResponse_display();
            break;

        case TriceraConstants.REQUESTCODE_DOCUMENT_UPLOAD:
            if (uploadDoc == null)
                return null;
            util.insertDocument(uploadDoc);
            System.out.println("### TriceraEngine.processRequest() : Document = " + uploadDoc.toString());
            try {
                File file = new File("References/" + uploadDoc.getTitle());
                FileOutputStream stream = new FileOutputStream(file);
                stream.write(uploadDoc.getBulk_content().getBytes());
                stream.close();
            } catch (Exception e) {
                System.out.println("### TriceraEngine.processRequest() : Exception = " + e.toString()); 
            }
            // try {
            // final File file = new File("References/" + uploadDoc.getTitle());
            // FileUtils.writeStringToFile(file, uploadDoc.getBulk_content(),
            // StandardCharsets.UTF_8);
            // } catch (Exception e) {
            // System.out.println("### TriceraEngine.processRequest() : Exception = " +
            // e.toString());
            // }
            break;

        default:
            response = (resp.getResponse_display() != null) ? resp.getResponse_display() : "";
            responseComponent = util.getResponseComponentFromSP(resp, request, paramBuilder);
            param = util.getParam();
            break;
        }
        System.out.println("### TriceraEngine.processRequest() : for paramBuilder = " + paramBuilder);
        return responseComponent;
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

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }

    public Document getUploadDoc() {
        return uploadDoc;
    }

    public void setUploadDoc(Document uploadDoc) {
        this.uploadDoc = uploadDoc;
    }

}