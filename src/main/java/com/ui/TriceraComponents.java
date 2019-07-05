package com.ui;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.core.Request;
import com.core.Response;
import com.core.TriceraConstants;
import com.core.TriceraEngine;
import com.utilities.TriceraFileReader;
import com.utilities.TriceraSQLUtils;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.HasComponents;
import com.vaadin.flow.component.Key;
import com.vaadin.flow.component.UI;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.icon.Icon;
import com.vaadin.flow.component.icon.VaadinIcon;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.component.upload.Upload;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;


/**
 * TriceraComponents
 * 
 * Contains UI Components and EventListeners
 */
public class TriceraComponents {
    private TriceraEngine engine;
    private String request;
    private MessageList messageList;
    private HorizontalLayout inputLayout;
    private TextField messageField;

    Logger logger = Logger.getLogger(TriceraComponents.class.getName());

    public TriceraComponents() {
        engine = new TriceraEngine();
    }

    public TriceraComponents(MessageList messageList) {
        this.messageList = messageList;
        engine = new TriceraEngine();
    }
    public TriceraComponents(MessageList messageList, HorizontalLayout inputLayout) {
        this.messageList = messageList;
        this.inputLayout = inputLayout;
        engine = new TriceraEngine();
    }

    public Button createBtnSend(TextField textField){
        Button btnSend = new Button("Send", new Icon(VaadinIcon.PAPERPLANE));
        btnSend.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
        btnSend.addClickShortcut(Key.ENTER);
        btnSend.addClickListener(click -> {
            //if (!isUploading) request = textField.getValue();
            request = textField.getValue();
            
            engine.processRequest();
            textField.clear();
            textField.focus();
        });
        return btnSend;
    }

    public Button createBtnSettings(){
        // This will contain : (1) Clear Text, (2) Logout
        Button btnSettings = new Button(" ", new Icon(VaadinIcon.COG));
        btnSettings.addClassName("main-layout__btnDefaults");
        btnSettings.addClickListener(click -> {
            Notification notif = new Notification("Please choose an action", 5000, Position.BOTTOM_END);
            Button clearText = new Button("Clear Text", event->{
                messageList.removeAll();
                notif.close();
            });
            Button restart = new Button("Logout", event->{
                notif.close();
                UI.getCurrent().getPage().reload();
            });
            restart.addThemeVariants(ButtonVariant.LUMO_ICON);
            notif.add(clearText, restart);
            notif.open();
        });
        return btnSettings;
    }

    public Boolean reloadInputLayout(int parent_reqid){
        boolean isReloaded = false;
        inputLayout.removeAll();
        try {
            TriceraSQLUtils util = new TriceraSQLUtils();
            // Load initial display, if any
            for(Request req : util.getRequestTableByRequestID(parent_reqid)){
                String initDisplay = (req.getInit_display() != null) ? req.getInit_display() : "";
                System.out.println("MainLayout.reloadInputLayout() : response = " + initDisplay);
                if (!initDisplay.isEmpty()) messageList.add(new Bubble(".", initDisplay));
            }
            
            Div generatedButtons = new Div();
            for(Response resp : util.getResponseTableByRequestID(parent_reqid)){
                System.out.println("### MainLayout.reloadInputLayout() : " + resp.toString());
    
                // check if special component (seqid less than zero)
                if (resp.getSeq() < 0) {
                    if (resp.getSeq() == TriceraConstants.SEQ_TEXTFIELD){
                        System.out.println("textfield generated from " + resp.getParent_reqid() + " with next reqid = " + resp.getNext_reqid());
                        messageField = new TextField();
                        messageField.setClearButtonVisible(true);
                        messageField.setWidth("100%");
                        messageField.setAutofocus(true);
                        inputLayout.add(messageField);
                    } else if (resp.getSeq() == TriceraConstants.SEQ_UPLOAD){
                        Div output = new Div();
        
                        MemoryBuffer buffer = new MemoryBuffer();
                        Upload upload = new Upload(buffer);
                        request = "";
        
                        upload.addSucceededListener(event -> {
                            // TriceraFileReader tfr = new TriceraFileReader();
                            // component = tfr.createComponent(event.getMIMEType(), event.getFileName(), buffer.getInputStream());
                            // uploadDoc = tfr.getDocument();
                            // showOutput(event.getFileName(), component, output);
                            // isUploading = true;
                            // request += "File: " + event.getFileName() + " \n ";
                            
                        });
                        inputLayout.add(upload);
        
                    } else if (resp.getSeq() == TriceraConstants.SEQ_REPORT_BTN){
                        System.out.println("Button generated from " + resp.getParent_reqid() + " with next reqid = " + resp.getNext_reqid());
                        generatedButtons.add(createAutoReplyButton(resp));
                    } else {
                        // not supported yet
                    }
                } else {
                    generatedButtons.add(createAutoReplyButton(resp));
                }
    
            }

            inputLayout.add(generatedButtons);
            inputLayout.expand(generatedButtons);
            addDefaultInputComponents(); // + send and clear buttons
            isReloaded = true;
        } catch (SQLException se) {
            messageList.add(new Bubble(engine.getUsername(), "Failed Connecting to Database, please try again later."));
        } catch (Exception e) {
            messageList.add(new Bubble(engine.getUsername(), "General Exception Occured"));
        }
        
        
        return isReloaded;
    }

    private Button createAutoReplyButton(Response resp) {
        Button autoReply = new Button(resp.getDisplay());
        autoReply.addClassName("main-layout__autobtn");
        autoReply.addClickListener(click -> {
            engine.setResponse(
                new Response(
                    resp.getDisplay(),
                    resp.getSeq(),
                    resp.getNext_reqid()));
            request = resp.getDisplay();
            engine.processRequest();
        });
        return autoReply;
    }

    private void addDefaultInputComponents() {
        inputLayout.add(
            createBtnSend(messageField), 
            createBtnSettings()
        );
    }




    
}