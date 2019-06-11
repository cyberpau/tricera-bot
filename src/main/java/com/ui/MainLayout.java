/* 

This class contains the Main Layout of the Chat UI. 

Author: John Paulo Mataac (@cyberpau)
*/

package com.ui;

import com.core.RequestGenerator;
import com.core.TriceraConstants;
import com.core.TriceraEngine;
import com.vaadin.flow.component.Key;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.button.ButtonVariant;
import com.vaadin.flow.component.dependency.HtmlImport;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.H2;
import com.vaadin.flow.component.icon.Icon;
import com.vaadin.flow.component.icon.VaadinIcon;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.page.Viewport;
import com.vaadin.flow.component.textfield.TextField;
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
        reloadInputLayout(engine.getResponseCode());
        loadGreetings();
        
        add(headerLayout, messageLayout, inputLayout);
        expand(messageLayout);
    }

    private void addDefaultInputComponents() {
        Button btnSend = new Button("Send", new Icon(VaadinIcon.PAPERPLANE));
        btnSend.addThemeVariants(ButtonVariant.LUMO_PRIMARY);
        btnSend.addClickShortcut(Key.ENTER);
        btnSend.addClickListener(click -> {
            request = messageField.getValue();
            processRequest();
            messageField.clear();
            messageField.focus();
        });

        Button btnClear = new Button(" ", new Icon(VaadinIcon.TRASH));
        btnClear.addClassName("main-layout__btnDefaults");
        btnClear.addClickListener(click -> {
            messageLayout.removeAll();
        });
        inputLayout.add(btnSend, btnClear);
    }

    private void processRequest() {
        if (request.isEmpty()) return; // just in case to prevent spam
        response = engine.processRequest(request);
        messageLayout.add(new Bubble(engine.getUsername(), request));

        String[] responseArray = response.split("<BR/>");
        for(String reply : responseArray){
            if (!response.isEmpty()) messageLayout.add(new Bubble(".", reply));
        }
        reloadInputLayout(engine.getResponseCode());
    }

    private void reloadInputLayout(int responseCode) {
        inputLayout.removeAll();
        RequestGenerator gen = new RequestGenerator();
        Div generatedButtons = new Div();
        System.out.println("responseCode: " + responseCode);

        if ((responseCode & TriceraConstants.RESPONSECODE_TF) == TriceraConstants.RESPONSECODE_TF){
            engine.setRequestCode(TriceraConstants.RESPONSECODE_TF);
            messageField = new TextField();
            messageField.setClearButtonVisible(true);
            messageField.setWidth("100%");
            messageField.focus();
            inputLayout.add(messageField);
        } else if(responseCode != 0){
            for(int value : gen.getAllRequestCode()){
                if(value != 0 && (responseCode & value) == value){
                    RequestGenerator btn = new RequestGenerator(value);
                    int rc = (btn.getResponseCode() < 0) ? btn.getResponseCode() : btn.getRequestCode();
                    System.out.println("Generating buttons... " + btn.getButtonName() + " : " + rc);
                    generatedButtons.add(createAutoReplyButton(btn.getButtonName(), rc));
                }
            }
            inputLayout.add(generatedButtons);
            inputLayout.expand(generatedButtons);
        }
        addDefaultInputComponents(); // + send and clear buttons
    }

    private Button createAutoReplyButton(String constYes, int code) {
        Button autoReply = new Button(constYes);
        autoReply.addClassName("main-layout__autobtn");
        autoReply.addClickListener(click -> {
            request = constYes;
            engine.setRequestCode(code);
            processRequest();
        });
        return autoReply;
    }

    private void loadGreetings() {
        messageLayout.add(new Bubble(".", "Hello Human!, my name is Tri-C.E.R.A. and I'm an awesome chatbot"));
        messageLayout.add(new Bubble(".", "What's your name?"));
        engine.setRequestCode(TriceraConstants.REQUESTCODE_ASK_USER);
    }
}
