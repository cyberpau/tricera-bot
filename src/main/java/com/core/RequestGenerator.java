package com.core;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.utilities.VaadinConnectionPool;

public class RequestGenerator {

    private int requestCode;
    private String description;
    private String buttonName;
    private int responseCode;
    private int generatedComponent;

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    public RequestGenerator(){


    }

    public RequestGenerator(int reqCode) {
        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement("SELECT TOP 1 * FROM REQUEST_GENERATOR where RequestCode = ?");
            ps.setInt(1, reqCode);
            rs = ps.executeQuery();
            while(rs.next()){
                this.requestCode = rs.getInt(1);
                this.description = rs.getString(2);
                this.buttonName = rs.getString(3);
                this.responseCode = rs.getInt(4);
                this.generatedComponent =  rs.getInt(5);
            } 
        } catch (Exception e) {
            System.out.println(e.toString());
        }
	}
	
	public List<Integer> getAllRequestCode(){
		List<Integer> requests = new ArrayList<Integer>();
		try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement("SELECT RequestCode FROM REQUEST_GENERATOR");
            rs = ps.executeQuery();
            while(rs.next()){
                requests.add(rs.getInt(1));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
		}
		return requests;

	}

	public void getRequestGeneratorByRequestCode(int reqCode){
        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement("SELECT TOP 1 * FROM REQUEST_GENERATOR where RequestCode = ?");
            ps.setInt(1, reqCode);
            rs = ps.executeQuery();
            while(rs.next()){
                this.requestCode = rs.getInt(1);
                this.description = rs.getString(2);
                this.buttonName = rs.getString(3);
                this.responseCode = rs.getInt(4);
                this.generatedComponent =  rs.getInt(5);
            } 
        } catch (Exception e) {
            System.out.println(e.toString());
        }
	}

	public int getRequestCode() {
		return requestCode;
	}

	public void setRequestCode(int requestCode) {
		this.requestCode = requestCode;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getButtonName() {
		return buttonName;
	}

	public void setButtonName(String buttonName) {
		this.buttonName = buttonName;
	}

	public int getResponseCode() {
		return responseCode;
	}

	public void setResponseCode(int responseCode) {
		this.responseCode = responseCode;
	}

	public int getGeneratedComponent() {
		return generatedComponent;
	}

	public void setGeneratedComponent(int generatedComponent) {
		this.generatedComponent = generatedComponent;
	}

}