/* 

This class contains the Main Layout of the Chat UI. 

Author: John Paulo Mataac (@cyberpau)
*/

package com.ui;

import com.core.Document;
import com.core.Request;
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
    Component component;
    Document uploadDoc;

    TriceraComponents tricom;

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

        // load dynamic UI components
        tricom = new TriceraComponents(messageLayout, inputLayout);
        engine = new TriceraEngine();
        paramBuilder = new StringBuilder();
        tricom.reloadInputLayout(1);
        
        add(headerLayout, messageLayout, inputLayout);
        expand(messageLayout);
    }

    private void processRequest() {
        System.out.println("MainLayout.processRequest() : request = " + request);
        if (request != null && request.isEmpty()) return; // just in case to prevent spam
        
        //response = engine.processRequest(requestid, sequenceID, request);
        if (!isUploading){
            component = engine.processRequest(requestid, sequenceID, request, paramBuilder.toString());
            String parameter = (engine.getParam() == null) ? "" : engine.getParam();
            if(parameter.isEmpty()) paramBuilder = new StringBuilder();
            paramBuilder.append(parameter);
            System.out.println("### MainLayout.processRequest() : paramBuilder =" + paramBuilder.toString());
            messageLayout.add(new Bubble(engine.getUsername(), request));
            if (component != null){ 
                messageLayout.add(new Bubble(".", component));
            }else {
                if (engine.getResponse() != null && !engine.getResponse().getDisplay().isEmpty()) 
                messageLayout.add(new Bubble(".", engine.getResponse().getDisplay()));
            }
            
        } else {
            engine.setUploadDoc(uploadDoc);
            engine.processRequest(requestid, sequenceID, request, paramBuilder.toString());
            if(component != null) messageLayout.add(new Bubble(engine.getUsername(), component));
            isUploading = false;
            if (engine.getResponse() != null && !engine.getResponse().getDisplay().isEmpty()) 
                messageLayout.add(new Bubble(".", engine.getResponse().getDisplay()));
        }
        
        tricom.reloadInputLayout(nextRequestID);
    }

    private void showOutput(String text, Component content, HasComponents outputContainer) {

        HtmlComponent p = new HtmlComponent(Tag.P);

        p.getElement().setText(text);
        outputContainer.add(p);
        outputContainer.add(content);
    }
}
