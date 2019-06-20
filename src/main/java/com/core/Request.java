package com.core;

public class Request {
    
    private int reqid;
    private String description;
    private String init_display;
    private String stored_proc;
    private short response_type;

    public Request(){

    }

    public Request(int reqid, String description, String init_display, String stored_proc, short response_type){
        this.reqid = reqid;
        this.description = description;
        this.init_display = init_display;
        this.stored_proc = stored_proc;
        this.response_type = response_type;
    }

    public int getReqid() {
        return reqid;
    }

    public void setReqid(int reqid) {
        this.reqid = reqid;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getInit_display() {
        return init_display;
    }

    public void setInit_display(String init_display) {
        this.init_display = init_display;
    }

    public String getStored_proc() {
        return stored_proc;
    }

    public void setStored_proc(String stored_proc) {
        this.stored_proc = stored_proc;
    }

    public short getResponse_type() {
        return response_type;
    }

    public void setResponse_type(short response_type) {
        this.response_type = response_type;
    }

    public Boolean isNullOrEmpty(){
        Boolean isEmpty = false;
        if (description == null) {
            isEmpty = true;
        }
        return isEmpty;
    }


}