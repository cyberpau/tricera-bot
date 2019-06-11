/* 

This class encapsulates the Bubble Chat UI.

Author: John Paulo Mataac (@cyberpau)
*/

package com.ui;

import com.vaadin.flow.component.html.Image;
import com.vaadin.flow.component.html.Paragraph;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;

public class Bubble extends HorizontalLayout{

    public Bubble(){
        addClassName("chat-bubble");

    }

    public Bubble(String user, String message) {
        if(user.isEmpty()) return;
        

        Image userProfile = new Image();
        userProfile.setClassName("bubble-profile");

        Paragraph msg = new Paragraph(message);
        if(user.equals(".")){
            userProfile.setSrc("frontend/images/tricera-bot.jpg");
            add(userProfile, msg);
            expand(msg);
            addClassName("chat-bubble__others");
        } else {
            userProfile.setSrc("frontend/images/me.png");
            add(msg, userProfile);
            expand(msg);
            addClassName("chat-bubble__me");
        }
        

    }

}