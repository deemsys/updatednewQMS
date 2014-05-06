package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import qms.model.DocumentMain;
import qms.model.Process;
import qms.model.RevisionForm;

import qms.model.RevisionDocument;


public class RevisionDocumentDAO {
	private DataSource dataSource;
	public List<RevisionDocument> getRevision(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<RevisionDocument> revisionDocuments = new ArrayList<RevisionDocument>();
		    try{
			resultSet = statement.executeQuery("select * from tbl_revisiondocument");
			while(resultSet.next()){
				revisionDocuments.add(new RevisionDocument(
						resultSet.getString("auto_number")
						,resultSet.getString("document_id")
						,resultSet.getString("issuer")
						,resultSet.getString("revision_level")
						,resultSet.getString("date")
						,resultSet.getString("approver1")
						,resultSet.getString("approver2")
						,resultSet.getString("approver3")
						,resultSet.getString("comments")
						,resultSet.getString("status")
						,resultSet.getString("revision_id")));
				
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
	    return revisionDocuments;
		
	}
	public List<RevisionDocument> getRevision(String revision_id,String document_id){
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
		List<RevisionDocument> revisionDocuments = new ArrayList<RevisionDocument>();
	    try{
	    	System.out.println("select * from tbl_revisiondocument where document_id='"+document_id+"' and revision_id='"+revision_id+"'");
			resultSet = statement.executeQuery("select * from tbl_revisiondocument where document_id='"+document_id+"'AND revision_id='"+revision_id+"'");
			
			
			while(resultSet.next()){
				revisionDocuments.add(new RevisionDocument(
						resultSet.getString("auto_number")
						,resultSet.getString("document_id")
						,resultSet.getString("issuer")
						,resultSet.getString("revision_level")
						,resultSet.getString("date")
						,resultSet.getString("approver1")
						,resultSet.getString("approver2")
						,resultSet.getString("approver3")
						,resultSet.getString("comments")
						,resultSet.getString("status")
						,resultSet.getString("revision_id")));
			}
			System.out.println("revision_id"+revisionDocuments.get(0).getRevision_id());
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
	    return revisionDocuments;
		
	}
	
		
	public List<RevisionDocument> getRevision(String auto_number){
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
		List<RevisionDocument> revisionDocuments = new ArrayList<RevisionDocument>();
		    try{
	    	System.out.println("select * from tbl_revisiondocument where auto_number='"+auto_number+"'");
			resultSet = statement.executeQuery("select * from tbl_revisiondocument where auto_number='"+auto_number+"'");
			while(resultSet.next()){
				revisionDocuments.add(new RevisionDocument(
						 resultSet.getString("auto_number")
						,resultSet.getString("document_id")
						,resultSet.getString("issuer")
						,resultSet.getString("revision_level")
						,resultSet.getString("date")
						,resultSet.getString("approver1")
						,resultSet.getString("approver2")
						,resultSet.getString("approver3")
						,resultSet.getString("comments")
						,resultSet.getString("status")
						,resultSet.getString("revision_id")));
			}
			System.out.println("revision_id"+revisionDocuments.get(0).getRevision_id());
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
	    return revisionDocuments;
		
	}
	public boolean insert_revision(RevisionDocument document,String auto_id,DocumentMain documentMain)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status=false;
		System.out.println("auto_number = "+auto_id);
		String revision_no="",documentid="",issuer="",revisionlevel="",date="",approver1="",approver2="",approver3="", status1="",comments="";
		 
		 
		  document.getDocument_id();
		  document.getIssuer();
		  document.getRevision_level();
		  document.getDate();
		  document.getApprover1();
		  document.getApprover2();
		  document.getApprover3();
		  document.getComments();
		  document.getStatus();
		  document.getRevision_id();
		 
		  
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  System.out.println("inserting into revision table");
			  int revision_id =0;
			  String documnet = new String(documentMain.getDocument_id());
			  String approver = new String(document.getApprover1());
			  
			  System.out.println("update approver= "+approver);
			  String[] split = approver.split(",");
			  String[] doc = documnet.split(",");
			  String approver11 = split[0];
			  String document_number = doc[2];
			  System.out.println("document number split 2= "+document_number+" split 1"+doc[1]);
			  System.out.println("update approver split= "+approver11);

			  System.out.println("");
			  System.out.println("before executing the query");
			  resultSet=statement.executeQuery("select tbl_doccontrol_external.document_id,tbl_doccontrol_external.issuer,tbl_doccontrol_external.revision_level,tbl_doccontrol_external.date,tbl_doccontrol_external.approver1,tbl_doccontrol_external.approver2,tbl_doccontrol_external.approver3,tbl_doccontrol_external.comments,tbl_doccontrol_external.status,tbl_doccontrol_external.revision_id from tbl_doccontrol_external where tbl_doccontrol_external.auto_no='"+auto_id+"'");
				System.out.println("query executed successfully"); 
			  while(resultSet.next())
				  {
					 //  revision_id = Integer.parseInt(resultSet.getString("revision_id"));
					  // System.out.println("revision id ="+revision_id);
					   documentid = resultSet.getString("document_id");
					   System.out.println(documentid+"  "+documentMain.getDocument_id());
					   issuer = resultSet.getString("issuer");
					   System.out.println(issuer+" "+documentMain.getIssuer());
					   revisionlevel = resultSet.getString("revision_level");
					   date = resultSet.getString("date");
					   approver1 = resultSet.getString("approver1");
					   approver2 = resultSet.getString("approver2");
					   approver3 = resultSet.getString("approver3");
					   comments = resultSet.getString("comments");
					   status1 = resultSet.getString("status");
					   revision_no = resultSet.getString("revision_id");
					   
				  }
		  if((!document_number.equals(documentid))|| (!documentMain.getIssuer().equals(issuer))||(!documentMain.getRevision_level().equals(revisionlevel))|| (!documentMain.getDate().equals(date))||(!documentMain.getApprover1().equals(approver1))|| (!documentMain.getApprover2().equals(approver2))|| (!documentMain.getApprover3().equals(approver3))|| (!documentMain.getComments().equals(comments))|| (!documentMain.getStatus().equals(status1))||  (!documentMain.getRevision_id().equals(revision_no)))
			  {	
			 String cmd_insert2;	
				 cmd_insert2="insert into tbl_revisiondocument(auto_number,document_id,issuer,revision_level,date,approver1,approver2,approver3,comments,status,revision_id) values('"+document.getAuto_number()+"','"+document_number+"','"+document.getIssuer()+"','"+document.getRevision_level()+"','"+document.getDate()+"','"+approver11+"','"+document.getApprover2()+"','"+document.getApprover3()+"','"+document.getComments()+"','"+document.getStatus()+"','"+document.getRevision_id()+"')";
				 statement.execute(cmd_insert2);
				 status=true;
			  }
			
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
	
	public boolean insert_revision(RevisionDocument document,String auto_id)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status=false;
		System.out.println("auto_id = "+auto_id);
		System.out.println("document_id =" +document.getDocument_id());
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  System.out.println("inserting into revision table");
			  int revision_id =0;
			  String approver1 = new String(document.getApprover1());
			  System.out.println("approver1="+approver1);
			  String[] split = approver1.split(",");
			  String[] doc = document.getDocument_id().split(",");
			  
			  String approver = split[0];
			  String document1 = doc[1];
			  System.out.println("approver="+approver);
			  resultSet=statement.executeQuery("select revision_id from tbl_doccontrol_external where auto_no='"+auto_id+"'");
				 while(resultSet.next())
				  {
					   revision_id = Integer.parseInt(resultSet.getString("revision_id"));
					   System.out.println("revision id ="+revision_id);
				  }
			  
			  String cmd_insert2;	
				cmd_insert2="insert into tbl_revisiondocument(auto_number,document_id,issuer,revision_level,date,approver1,approver2,approver3,comments,status,revision_id) values('"+document.getAuto_number()+"','"+document1+"','"+document.getIssuer()+"','"+document.getRevision_level()+"','"+document.getDate()+"','"+approver+"','"+document.getApprover2()+"','"+document.getApprover3()+"','"+document.getComments()+"','"+document.getStatus()+"','"+0+"')";

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


