package com.core;

public class Response {
    
    private int parent_reqid;
    private int seq;
    private String display;
    private String description;
    private int next_reqid;
    private String response_display;
    private String stored_proc;
    private short response_type;
    private short cont_looping;
    private String param_name;
    
    public Response(){

    }

    public Response(int parent_reqid, int seq, String display, String description, int next_reqid, String response_display, String stored_proc, short response_type, short cont_looping){
        this.parent_reqid = parent_reqid;
        this.seq = seq;
        this.display = display;
        this.description = description;
        this.next_reqid = next_reqid;
        this.response_display = response_display;
        this.stored_proc = stored_proc;
        this.response_type = response_type;
        this.cont_looping = cont_looping;
    }

    public int getParent_reqid() {
        return parent_reqid;
    }

    public void setParent_reqid(int parent_reqid) {
        this.parent_reqid = parent_reqid;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNext_reqid() {
        return next_reqid;
    }

    public void setNext_reqid(int next_reqid) {
        this.next_reqid = next_reqid;
    }

    public String getResponse_display() {
        return response_display;
    }

    public void setResponse_display(String response_display) {
        this.response_display = response_display;
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

    public short getCont_looping() {
        return cont_looping;
    }

    public void setCont_looping(short cont_looping) {
        this.cont_looping = cont_looping;
    }

    public String getParam_name() {
        return (param_name == null) ? "" : param_name;
    }

    public void setParam_name(String param_name) {
        this.param_name = param_name;
    }

    public Response(int parent_reqid, int seq, String display, String description, int next_reqid,
            String response_display, String stored_proc, short response_type, short cont_looping, String param_name) {
        this.parent_reqid = parent_reqid;
        this.seq = seq;
        this.display = display;
        this.description = description;
        this.next_reqid = next_reqid;
        this.response_display = response_display;
        this.stored_proc = stored_proc;
        this.response_type = response_type;
        this.cont_looping = cont_looping;
        this.param_name = param_name;
    }

    @Override
    public String toString() {
        return "Response [cont_looping=" + cont_looping + ", description=" + description + ", display=" + display
                + ", next_reqid=" + next_reqid + ", param_name=" + param_name + ", parent_reqid=" + parent_reqid
                + ", response_display=" + response_display + ", response_type=" + response_type + ", seq=" + seq
                + ", stored_proc=" + stored_proc + "]";
    }

}