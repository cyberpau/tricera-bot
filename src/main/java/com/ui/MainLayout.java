/* 

This class contains the Main Layout of the Chat UI. 

Author: John Paulo Mataac (@cyberpau)
*/

package com.ui;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.core.Document;
import com.core.Request;
import com.core.RequestGenerator;
import com.core.Response;
import com.core.TriceraConstants;
import com.core.TriceraEngine;
import com.utilities.TriceraFileReader;
import com.utilities.TriceraSQLUtils;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.HasComponents;
import com.vaadin.flow.component.HtmlComponent;
import com.vaadin.flow.component.Key;
import com.vaadin.flow.component.Tag;
import com.vaadin.flow.component.UI;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.dependency.HtmlImport;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.H2;
import com.vaadin.flow.component.icon.Icon;
import com.vaadin.flow.component.icon.VaadinIcon;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.Notification.Position;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.page.Viewport;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.component.upload.Upload;
import com.vaadin.flow.component.upload.receivers.FileData;
import com.vaadin.flow.component.upload.receivers.MemoryBuffer;
import com.vaadin.flow.component.upload.receivers.MultiFileMemoryBuffer;
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
    Component component;
    Document uploadDoc;

    private String param;
    private StringBuilder paramBuilder;

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
        paramBuilder = new StringBuilder();
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
        
        //response = engine.processRequest(requestid, sequenceID, request);
        if (!isUploading){
            component = engine.processRequest(requestid, sequenceID, request, paramBuilder.toString());
            String parameter = (engine.getParam() == null) ? "" : engine.getParam();
            if(parameter.isEmpty()) paramBuilder = new StringBuilder();
            paramBuilder.append(parameter);
            System.out.println("### MainLayout.processRequest() : paramBuilder =" + paramBuilder.toString());
            messageLayout.add(new Bubble(engine.getUsername(), request));
            if (component != null) {
                messageLayout.add(new Bubble(".", component));
            } else if (engine.getResponse() != null && !engine.getResponse().isEmpty()) {
                messageLayout.add(new Bubble(".", engine.getResponse()));
            }
        } else {
            engine.processDocumentUpload(uploadDoc);
            if(component != null) messageLayout.add(new Bubble(engine.getUsername(), component));
            isUploading = false;
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
            System.out.println("MainLayout.reloadInputLayout() : response = " + response);
            if (!response.isEmpty()) messageLayout.add(new Bubble(".", response));
        }
        
        Div generatedButtons = new Div();
        for(Response resp : util.getResponseTableByRequestID(parent_reqid)){
            System.out.println("### MainLayout.reloadInputLayout() : " + resp.toString());
            requestid = resp.getParent_reqid();
            nextRequestID = resp.getNext_reqid();
            sequenceID = resp.getSeq();

            if (sequenceID == TriceraConstants.SEQ_TEXTFIELD){
                System.out.println("textfield generated from " + resp.getParent_reqid() + " with next reqid = " + nextRequestID);
                messageField = new TextField();
                messageField.setClearButtonVisible(true);
                messageField.setWidth("100%");
                messageField.setAutofocus(true);
                inputLayout.add(messageField);
            } else if (sequenceID == TriceraConstants.SEQ_UPLOAD){
                Div output = new Div();

                MemoryBuffer buffer = new MemoryBuffer();
                Upload upload = new Upload(buffer);
                request = "";

                upload.addSucceededListener(event -> {
                    TriceraFileReader tfr = new TriceraFileReader();
                    component = tfr.createComponent(event.getMIMEType(), event.getFileName(), buffer.getInputStream());
                    uploadDoc = tfr.getDocument();
                    showOutput(event.getFileName(), component, output);
                    isUploading = true;
                    request += "File: " + event.getFileName() + " \n ";
                    
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

    private void showOutput(String text, Component content, HasComponents outputContainer) {

        HtmlComponent p = new HtmlComponent(Tag.P);

        p.getElement().setText(text);
        outputContainer.add(p);
        outputContainer.add(content);
    }
}
