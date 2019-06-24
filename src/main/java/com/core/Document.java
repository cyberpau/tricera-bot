package com.core;

import java.sql.Date;

/**
 * Document
 */
public class Document {

    private int refid;
    private String title;
    private String bulk_content;
    private Date upload_dt;
    private String file_location;
    private int uploader_id;

    public Document() {
    }

    public int getRefid() {
        return refid;
    }

    public void setRefid(int refid) {
        this.refid = refid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBulk_content() {
        return bulk_content;
    }

    public void setBulk_content(String bulk_content) {
        this.bulk_content = bulk_content;
    }

    public Date getUpload_dt() {
        return upload_dt;
    }

    public void setUpload_dt(Date upload_dt) {
        this.upload_dt = upload_dt;
    }

    public String getFile_location() {
        return file_location;
    }

    public void setFile_location(String file_location) {
        this.file_location = file_location;
    }

    public int getUploader_id() {
        return uploader_id;
    }

    public void setUploader_id(int uploader_id) {
        this.uploader_id = uploader_id;
    }

    public Document(String title, String bulk_content, String file_location, int uploader_id) {
        this.title = title;
        this.bulk_content = bulk_content;
        this.file_location = file_location;
        this.uploader_id = uploader_id;
    }

	public Document(String title, String bulk_content, int uploader_id, String file_location) {
        this.title = title;
        this.bulk_content = bulk_content;
        this.uploader_id = uploader_id;
        this.file_location = file_location;
	}

    @Override
    public String toString() {
        return "Document [bulk_content=" + bulk_content + ", file_location=" + file_location + ", refid=" + refid
                + ", title=" + title + ", upload_dt=" + upload_dt + ", uploader_id=" + uploader_id + "]";
    }

    
    
}