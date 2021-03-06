package com.utilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.core.Document;
import com.core.Request;
import com.core.Response;
import com.core.TableSet;
import com.core.TriceraConstants;
import com.ui.TriceraPieChart;
import com.ui.TriceraVerticalBar;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.html.Paragraph;
import com.vaadin.flow.server.VaadinSession;

import org.apache.commons.lang.StringUtils;

import net.bytebuddy.implementation.bytecode.Throw;


public class TriceraSQLUtils {
    private static final String SQL_SELECT_FROM_RESPONSE = "SELECT parent_reqid, seq, display, description, next_reqid, response_display, stored_proc, response_type, continue_loop, param_name FROM RESPONSE ";
    private static final String SQL_SELECT_FROM_REQUEST_BY_REQID = "SELECT reqid, description, init_display, stored_proc, response_type FROM REQUEST where reqid = ? ORDER BY reqid, seq ASC";
    private static final String SQL_INSERT_INTO_DOCUMENT = "INSERT INTO [dbo].[DOCUMENTS]([title] ,[bulk_content] ,[uploader_id] ,[file_location]) VALUES (?, ?, ? ,?);";
    private String param = "";
    Connection conn;
    PreparedStatement ps;

    StringBuilder paramScript;
    int paramCount;

    public TriceraSQLUtils(){

    }

    public void insertUserSession(String username){
        if (username.isEmpty()) return;
        String sessionID = VaadinSession.getCurrent().getSession().getId();
        String sql = "INSERT INTO [SESSION_LOGS](session_id, user_id) VALUES (?, ?)";

        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, sessionID);
            ps.setString(2, username);
            //ps.executeQuery();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    public int getUserSessionTransactionId(String username) throws SQLException {
        if (username.isEmpty()) return 0;
        String sessionID = VaadinSession.getCurrent().getSession().getId();
        String sql = "SELECT TOP 1 tranid FROM [SESSION_LOGS] WHERE session_id = ? OR user_id = ?";
        int tranid = 0;

        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, sessionID);
            ps.setString(2, username);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                tranid = rs.getInt(1);
            }
        } catch (Exception e) {
            throw new SQLException("");
        }
        return tranid;
    }

    public List<Response> getResponseTableByRequestID(int requestID) throws SQLException {
        List<Response> responses = new ArrayList<Response>();
        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement(SQL_SELECT_FROM_RESPONSE + " where parent_reqid = ? ");
            ps.setInt(1, requestID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Response result = new Response();
                result.setParent_reqid(rs.getInt(1));
                result.setSeq(rs.getInt(2));
                result.setDisplay(rs.getString(3));
                result.setDescription(rs.getString(4));
                result.setNext_reqid(rs.getInt(5));
                result.setResponse_display(rs.getString(6));
                result.setStored_proc(rs.getString(7));
                result.setResponse_type(rs.getShort(8));
                result.setCont_looping(rs.getShort(9));
                result.setParam_name(rs.getString(10));
                responses.add(result);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
            throw new SQLException();
		}
		return responses;
    }

    public Response getResponseRow(int requestID, int sequenceID){
        Response response = new Response();
        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement(SQL_SELECT_FROM_RESPONSE + " where parent_reqid = ? AND seq = ? ORDER BY parent_reqid, seq ASC");
            ps.setInt(1, requestID);
            ps.setInt(2, sequenceID);
            System.out.println("*** getResponseRow = " + SQL_SELECT_FROM_RESPONSE + " where parent_reqid = ? AND seq = ? ");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                
                response.setParent_reqid(rs.getInt(1));
                response.setSeq(rs.getInt(2));
                response.setDisplay(rs.getString(3));
                response.setDescription(rs.getString(4));
                response.setNext_reqid(rs.getInt(5));
                response.setResponse_display(rs.getString(6));
                response.setStored_proc(rs.getString(7));
                response.setResponse_type(rs.getShort(8));
                response.setCont_looping(rs.getShort(9));
                response.setParam_name(rs.getString(10));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
		}
		return response;
    }

    public String getResponseStringFromSP(String sp_script, int type, List<Object> parameters){
        String responseString = "";
        int counter = 1;
        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement(sp_script);
            for(Object param : parameters){
                if(param instanceof String){
                    ps.setString(counter, param.toString());
                } else if (param instanceof Integer){
                    ps.setInt(counter, Integer.parseInt(param.toString()));
                }
                counter++;
            }
            System.out.println("*** getResponseStringFromSP = " + sp_script);
            ResultSet rs = ps.executeQuery();
            switch (type) {
                case 1:
                    while(rs.next()){
                        responseString = rs.getString(1);
                    }
                    break;

                case 2:
                    while(rs.next()){
                        responseString = rs.getString(1);
                        responseString += " \n\n " + rs.getObject(2);
                    }
                    break;
                default:
                    while(rs.next()){
                        responseString = rs.getString(1);
                    }
                    break;
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        System.out.println("TricerSQLUtils.getResponseStringFromSP() : response = " + responseString);
        return responseString;
    }

    public List<Request> getRequestTableByRequestID(int requestID) throws SQLException {
        List<Request> requests = new ArrayList<Request>();
        
        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement(SQL_SELECT_FROM_REQUEST_BY_REQID);
            ps.setInt(1, requestID);
            System.out.println("*** getRequestTableByRequestID = " + SQL_SELECT_FROM_REQUEST_BY_REQID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Request request = new Request();
                request.setReqid(rs.getInt(1));
                request.setDescription(rs.getString(2));
                request.setInit_display(rs.getString(3));
                request.setStored_proc(rs.getString(4));
                request.setResponse_type(rs.getShort(5));
                requests.add(request);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
            throw new SQLException(e);
		}
		return requests;
    }

    public void buildParameters(String paramBuilder, String param_name, String param_value){
        this.param = " DECLARE @" + param_name + " varchar(8000) = N'" + param_value + "'; ";
    }

    public void insertDocument(Document doc) {

        try {
            conn = VaadinConnectionPool.getConnection();
            ps = conn.prepareStatement(SQL_INSERT_INTO_DOCUMENT);
            ps.setString(1, doc.getTitle());
            ps.setString(2, doc.getBulk_content());
            ps.setInt(3, doc.getUploader_id());
            ps.setString(4, doc.getFile_location());
            System.out.println("*** insertDocument = " + SQL_INSERT_INTO_DOCUMENT);
            ps.executeQuery();
            
        } catch (Exception e) {
            System.out.println(e.toString());
		}
    }

    public Component getResponseComponentFromSP(Response resp, String inputText, String paramBuilder){
        System.out.println("### TriceraSQLUtils.getResponseComponentFromSP() : Response = " + resp.toString());
        if (resp.getSeq() > 0) return null;
        String param_name = (resp.getParam_name() == null) ? "" : resp.getParam_name();
        String sp = (resp.getStored_proc() == null) ? "" : resp.getStored_proc();
        System.out.println("TriceraSQLUtils.getResponseComponentFromSP() : sp = " + sp + " | param_name = " + param_name + " | paramCount" + paramCount);
        
        if (sp.isEmpty() && param_name.isEmpty()) return new Paragraph(resp.getResponse_display());

        System.out.println("Before buildParameters : ");
        if (param_name != null && !param_name.isEmpty()) {
            buildParameters(paramBuilder, resp.getParam_name(), inputText);
            paramCount++;
        }
        int sqlCount = StringUtils.countMatches(resp.getStored_proc(), "@");
        System.out.println("Before grid Display : paramCount = " + paramCount + " | SQL param count = " + sqlCount);
        if(sp != null && !sp.isEmpty()){
            // if we get same parameter count, execute the stored procedure
            Grid<TableSet> displayGrid = new Grid<>();
            List<TableSet> tableSet = new ArrayList<>();
            paramBuilder += this.param;

            try {
                String query = paramBuilder + resp.getStored_proc();
                System.out.println("!!! TriceraSQLUtils.getResponseComponentFromSP() : " + query);
                conn = VaadinConnectionPool.getConnection();
                ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                switch (resp.getResponse_type()) {
                    case TriceraConstants.RESPONSE_TYPE_STRING:
                        while(rs.next()){
                            if(rs.getString(1) == null && rs.getString(1).isEmpty()){
                                resp.setNext_reqid(900);
                                return new Paragraph("Can't find related results. Please provide more detailed query.");
                            }
                            return new Paragraph(rs.getString(1));
                        }
                        break;
    
                    case TriceraConstants.RESPONSE_TYPE_TABLE_COL1:
                        
                        while(rs.next()){
                            tableSet.add(new TableSet(rs.getString(1)));
                        }
                        displayGrid.setItems(tableSet);
                        for(int col = 2; col < 5; col++){
                            displayGrid.removeColumnByKey("Col" + col);
                        }
                        break;

                    case TriceraConstants.RESPONSE_TYPE_TABLE_COL2: // Table COL2
                        while(rs.next()){
                            tableSet.add(new TableSet(rs.getString(1).trim(), rs.getString(2).trim()));
                        }
                        displayGrid.setItems(tableSet);
                        displayGrid.addColumn(TableSet::getCol1).setHeader("COLUMN 1").setFlexGrow(0);
                        displayGrid.addColumn(TableSet::getCol2).setHeader("COLUMN 2").setFlexGrow(1);
                        break;
                    case TriceraConstants.RESPONSE_TYPE_VBAR_COL2: // Bar Graph (Description, Data)
                        while(rs.next()){
                            tableSet.add(new TableSet(rs.getString(1).trim(), rs.getString(2).trim()));
                        }
                        TriceraVerticalBar vbar = new TriceraVerticalBar(tableSet);
                        return vbar;
                    case TriceraConstants.RESPONSE_TYPE_PIE_COL2: // Pie Graph (Description, Data)
                        while(rs.next()){
                            tableSet.add(new TableSet(rs.getString(1).trim(), rs.getString(2).trim()));
                        }
                        TriceraPieChart pie = new TriceraPieChart(tableSet);
                        return pie;
                    default:
                        while(rs.next()){
                            return new Paragraph(rs.getString(1)) ;
                        }
                        break;
                }
                
                if (tableSet.size() > 0) return displayGrid;
                
            } catch (SQLException se) {
                System.out.println(se.toString());
                if (se.getErrorCode() != 0){
                    return new Paragraph(se.toString());
                }
            }
        }
       return null;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }
}