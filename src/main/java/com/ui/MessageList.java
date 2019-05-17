package com.ui;

import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.html.Div;


public class MessageList extends Div{

    public MessageList(){
        addClassName("message-list");

    }

    @Override
	public void add(Component... components) {
		super.add(components);
		
		components[components.length-1].getElement().callFunction("scrollIntoView");
	}
}