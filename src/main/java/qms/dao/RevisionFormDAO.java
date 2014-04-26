package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.Form;
import qms.model.Process;
import qms.model.RevisionForm;

public class RevisionFormDAO {
	private DataSource dataSource;
	public List<RevisionForm> getRevision(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<RevisionForm> revisionForms = new ArrayList<RevisionForm>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_revisionform");
			while(resultSet.next()){
				revisionForms.add(new RevisionForm(resultSet.getString("document_id"),resultSet.getString("effective_date"),resultSet.getString("approver1"),
						resultSet.getString("issuer"),resultSet.getString("comments"),resultSet.getString("revision_id")));
				
			}
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return revisionForms;
		
	}
	public List<RevisionForm> getRevision(String revision_id,String document_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		System.out.println();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<RevisionForm> revisionForms = new ArrayList<RevisionForm>();
	    try{
	    	System.out.println("select * from tbl_revisionform where document_id='"+document_id+"' and revision_id='"+revision_id+"'");
			resultSet = statement.executeQuery("select * from tbl_revisionform where document_id='"+document_id+"'AND revision_id='"+revision_id+"'");
			while(resultSet.next()){
				revisionForms.add(new RevisionForm(resultSet.getString("document_id"),resultSet.getString("effective_date"),resultSet.getString("approver1"),
						resultSet.getString("issuer"),resultSet.getString("comments"),resultSet.getString("revision_id")));
				
			}
			System.out.println("revision_id"+revisionForms.get(0).getRevision_id());
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return revisionForms;
		
	}
	public List<RevisionForm> getRevision(String document_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		System.out.println();
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<RevisionForm> revisionForms = new ArrayList<RevisionForm>();
	    try{
	    	System.out.println("select * from tbl_revisionform where document_id='"+document_id+"'");
			resultSet = statement.executeQuery("select * from tbl_revisionform where document_id='"+document_id+"'");
			while(resultSet.next()){
				revisionForms.add(new RevisionForm(resultSet.getString("document_id"),resultSet.getString("effective_date"),resultSet.getString("approver1"),
						resultSet.getString("issuer"),resultSet.getString("comments"),resultSet.getString("revision_id")));
				
			}
			System.out.println("revision_id"+revisionForms.get(0).getRevision_id());
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return revisionForms;
		
	}
	public boolean insert_revision(RevisionForm form,String auto_id)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status=false;
		System.out.println("auto_id = "+auto_id);
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  System.out.println("inserting into revision table");
			  int revision_id =0;
			  String approver1 = new String(form.getApprover1());
			  String[] split = approver1.split(",");
			  String approver = split[0];
			  resultSet=statement.executeQuery("select revision_id from tbl_form_child where auto_no='"+auto_id+"'");
				 while(resultSet.next())
				  {
					   revision_id = Integer.parseInt(resultSet.getString("revision_id"));
					   System.out.println("revision id ="+revision_id);
				  }
			  
			  String cmd_insert2;	
				 cmd_insert2="insert into tbl_revisionform(document_id,effective_date,approver1,issuer,comments,revision_id) values('"+form.getDocument_id()+"','"+form.getEffective_date()+"','"+approver+"','"+form.getIssuer()+"','"+form.getComments()+"','"+revision_id+"')";
				 statement.execute(cmd_insert2);
		
			 status=true;
		  }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
		    return status;
	}
	
	public void releaseConnection(Connection con) {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
		}
	}

	public void releaseResultSet(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
	}

	public void releaseStatement(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (Exception e) {
		}
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
}
