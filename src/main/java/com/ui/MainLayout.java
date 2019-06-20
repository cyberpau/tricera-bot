/* 

This class contains the Main Layout of the Chat UI. 

Author: John Paulo Mataac (@cyberpau)
*/

package com.ui;

import java.util.ArrayList;
import java.util.List;

import com.core.Request;
import com.core.RequestGenerator;
import com.core.Response;
import com.core.TriceraConstants;
import com.core.TriceraEngine;
import com.utilities.TriceraSQLUtils;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.HtmlComponent;
import com.vaadin.flow.component.Key;
import com.vaadin.flow.component.UI;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.dependency.HtmlImport;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.H2;
import com.vaadin.flow.component.html.Hr;
import com.vaadin.flow.component.html.NativeButton;
import com.vaadin.flow.component.icon.Icon;
import com.vaadin.flow.component.icon.VaadinIcon;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.page.Viewport;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.component.upload.Upload;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.server.PWA;

/**
 * The main layout contains the header with the navigation buttons, and the
 * child views below that.
 */
@Route("")
@HtmlImport("frontend://styles/shared-styles.html")
@PWA(name = "Tri-C.E.R.A", shortName = "tricera")
@Viewport("width=device-width, minimum-scale=1.0, initial-scale=1.0, user-scalable=yes")
@PageTitle("Tri-C.E.R.A.")
public class MainLayout extends VerticalLayout {
    private String request = "";
    private String response = "";    

    private TriceraEngine engine;
    private MessageList messageLayout;
    private HorizontalLayout inputLayout;
    private TextField messageField;
    private int nextRequestID;
    private int requestid;
    private int sequenceID;
    Boolean isUploading = false;

    public MainLayout() {
        setDefaultHorizontalComponentAlignment(Alignment.CENTER);
        addClassName("main-layout");
        setSizeFull();

        Div headerLayout = new Div(new H2("Tri-C.E.R.A."));
        headerLayout.getElement().getThemeList().add("dark");
        headerLayout.addClassName("main-layout__header");

        messageLayout = new MessageList();
        messageLayout.setHeight("100%");
        
        inputLayout = new HorizontalLayout();
        inputLayout.addClassName("main-layout__input");
        inputLayout.setAlignItems(Alignment.END);

        // start accessing the engine:
        engine = new TriceraEngine();
        reloadInputLayout(1);
        
        add(headerLayout, messageLayout, inputLayout);
        expand(messageLayout);
    }

    private void addDefaultInputComponents() {
        Button btnSend = new Button("Send", new Icon(VaadinIcon.PAPERPLANE));
        btnSend.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
        btnSend.addClickShortcut(Key.ENTER);
        btnSend.addClickListener(click -> {
            if (!isUploading) request = messageField.getValue();
            
            processRequest();
            messageField.clear();
            messageField.focus();
        });

        Button btnClear = new Button(" ", new Icon(VaadinIcon.TRASH));
        btnClear.addClassName("main-layout__btnDefaults");
        btnClear.addClickListener(click -> {
            Notification notif = new Notification("Please choose an action", 5000, Position.BOTTOM_END);
            Button clearText = new Button("Clear text", event->{
                messageLayout.removeAll();
                notif.close();
            });
            Button restart = new Button("Restart", event->{
                notif.close();
                UI.getCurrent().getPage().reload();
            });
            restart.addThemeVariants(ButtonVariant.LUMO_ICON);
            notif.add(clearText, restart);
            notif.open();
        });
        inputLayout.add(btnSend, btnClear);
    }

    private void processRequest() {
        System.out.println("MainLayout.processRequest() : request = " + request);
        if (request.isEmpty()) return; // just in case to prevent spam
        
        response = engine.processRequest(requestid, sequenceID, request);
        messageLayout.add(new Bubble(engine.getUsername(), request));
        System.out.println("next responseID: " + nextRequestID);

        String[] responseArray = response.split("<BR/>");
        for(String reply : responseArray){
            if (!response.isEmpty()) messageLayout.add(new Bubble(".", reply));
        }
        
        reloadInputLayout(nextRequestID);
    }

    private void reloadInputLayout(int parent_reqid) {
        inputLayout.removeAll();
        isUploading = false;
        TriceraSQLUtils util = new TriceraSQLUtils();
        // Load initial display, if any
        for(Request req : util.getRequestTableByRequestID(parent_reqid)){
            response = (req.getInit_display() != null) ? req.getInit_display() : "";
            String sp_script = (req.getStored_proc() != null) ? req.getStored_proc() : "";
            if (response.isEmpty() && !sp_script.isEmpty()){
                List<Object> objParam = new ArrayList<Object>();
                objParam.add(engine.getUsername());
                response = util.getResponseStringFromSP(req.getStored_proc(), req.getResponse_type(), objParam);
                System.out.println("Went to default case with sp = " + req.getStored_proc());
            }
            if (!response.isEmpty()) messageLayout.add(new Bubble(".", response));
        }
        
        Div generatedButtons = new Div();
        for(Response resp : util.getResponseTableByRequestID(parent_reqid)){
            requestid = resp.getParent_reqid();
            nextRequestID = resp.getNext_reqid();
            sequenceID = resp.getSeq();

            if (sequenceID == TriceraConstants.SEQ_TEXTFIELD){
                System.out.println("textfield generated from " + resp.getParent_reqid());
                messageField = new TextField();
                messageField.setClearButtonVisible(true);
                messageField.setWidth("100%");
                messageField.focus();
                inputLayout.add(messageField);
            } else if (sequenceID == TriceraConstants.SEQ_UPLOAD){
                MemoryBuffer buffer = new MemoryBuffer();
                Upload upload = new Upload(buffer);
                
                upload.addSucceededListener(event -> {
                    isUploading = true;
                    request = "File: " + buffer.getFileName();
                    new Notification("Upload complete!", 3000).open();
                });
                inputLayout.add(upload);

            } else {
                generatedButtons.add(createAutoReplyButton(resp.getDisplay(), nextRequestID, sequenceID));
            }

        }

        inputLayout.add(generatedButtons);
        inputLayout.expand(generatedButtons);
        addDefaultInputComponents(); // + send and clear buttons
    }

    private Button createAutoReplyButton(String displayText, int reqid, int seqid) {
        Button autoReply = new Button(displayText);
        autoReply.addClassName("main-layout__autobtn");
        autoReply.addClickListener(click -> {
            request = displayText;
            nextRequestID = reqid;
            sequenceID = seqid;
            processRequest();
        });
        return autoReply;
    }
}
