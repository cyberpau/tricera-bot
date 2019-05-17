package com.ui;

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
        btnClear.addClickListener(click -> {
            messageLayout.removeAll();
        });
        inputLayout.add(btnSend, btnClear);
    }

    private void processRequest() {
        if (request.isEmpty()) return; // just in case to prevent spam
        response = engine.processRequest(request);
        messageLayout.add(new Bubble(engine.getUsername(), request + "[" + engine.getRequestCode() + "]"));
        if (!response.isEmpty()) messageLayout.add(new Bubble(".", response));
        reloadInputLayout(engine.getResponseCode());
    }

    private void reloadInputLayout(int responseCode) {
        inputLayout.removeAll();

        if ((responseCode & TriceraConstants.RESPONSECODE_TF) == TriceraConstants.RESPONSECODE_TF){
            messageField = new TextField();
            messageField.setClearButtonVisible(true);
            messageField.setWidth("100%");
            messageField.focus();
            inputLayout.add(messageField);
        } else {
            Div generatedButtons = new Div();
            if ((responseCode & TriceraConstants.RESPONSECODE_BTN_YES) == TriceraConstants.RESPONSECODE_BTN_YES){
                generatedButtons.add(createAutoReplyButton(TriceraConstants.CONST_YES));
            }
            if ((responseCode & TriceraConstants.RESPONSECODE_BTN_NO) == TriceraConstants.RESPONSECODE_BTN_NO){
                generatedButtons.add(createAutoReplyButton(TriceraConstants.CONST_NO));
            }
            if ((responseCode & TriceraConstants.RESPONSECODE_BTN_CANCEL) == TriceraConstants.RESPONSECODE_BTN_CANCEL){
                generatedButtons.add(createAutoReplyButton(TriceraConstants.CONST_CANCEL));
            }
            if ((responseCode & TriceraConstants.RESPONSECODE_BTN_3C) == TriceraConstants.RESPONSECODE_BTN_3C){
                generatedButtons.add(createAutoReplyButton(TriceraConstants.CONST_HELP_CONCERN, TriceraConstants.REQUESTCODE_SEARCH_3C));
            }
            if ((responseCode & TriceraConstants.RESPONSECODE_BTN_LESSONLEARN) == TriceraConstants.RESPONSECODE_BTN_LESSONLEARN){
                generatedButtons.add(createAutoReplyButton(TriceraConstants.CONST_ADD_LESSON, TriceraConstants.REQUESTCODE_ADD_LESSONLEARN));
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

    private Button createAutoReplyButton(String constYes) {
        int rc = engine.getRequestCode();
        return createAutoReplyButton(constYes, rc);
    }

    private void loadGreetings() {
        messageLayout.add(new Bubble(".", "Hello Human!, my name is Tri-C.E.R.A. and I'm an awesome chatbot"));
        messageLayout.add(new Bubble(".", "What's your name?"));
        engine.setRequestCode(TriceraConstants.REQUESTCODE_ASK_USER);
    }
}
