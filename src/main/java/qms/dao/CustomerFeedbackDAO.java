package qms.dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import qms.model.*;

public class CustomerFeedbackDAO extends AbstractExcelView
{
	private DataSource dataSource; 

	/**
	 * Excel Sheet Generation
	 */
	
	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HSSFSheet excelSheet = workbook.createSheet("Animal List");
		setExcelHeader(excelSheet);
		
		List<CustomerFeedback> customerFeedbacks = (List<CustomerFeedback>) model.get("customerFeedbacks");
		setExcelRows(excelSheet,customerFeedbacks);
		
	}
	
	
	public void setExcelHeader(HSSFSheet excelSheet) {
		HSSFRow excelHeader = excelSheet.createRow(0);
		excelHeader.createCell(0).setCellValue("Date of Feedback");
		excelHeader.createCell(1).setCellValue("Type of Feedback");
		excelHeader.createCell(2).setCellValue("Feedback recorded by");
		excelHeader.createCell(3).setCellValue("Feedback Details");
		/*excelHeader.createCell(4).setCellValue("Attachments");*/
	}
	
	
	//End
	
	
	public void setExcelRows(HSSFSheet excelSheet, List<CustomerFeedback> customerFeedbacks){
		int record = 1;
		for (CustomerFeedback customerFeedback:customerFeedbacks) {
			HSSFRow excelRow = excelSheet.createRow(record++);
			excelRow.createCell(0).setCellValue(customerFeedback.getDate_of_feedback());
			excelRow.createCell(1).setCellValue(customerFeedback.getType_of_feedback());
			excelRow.createCell(2).setCellValue(customerFeedback.getFeedback_recorded_by());
			excelRow.createCell(3).setCellValue(customerFeedback.getFeedback_details());
			/*excelRow.createCell(4).setCellValue(customerFeedback.getAttachments());*/
		}
	}
	
	
	
	
	
	
	public boolean insert_customerfeedback(CustomerFeedback customerFeedback) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_insert = "insert into tbl_customerfeedback(date_of_feedback,type_of_feedback,feedback_recorded_by,feedback_details,attachment_name,attachement_type,attachment_referrence) values('"+customerFeedback.getDate_of_feedback()+"','"+customerFeedback.getType_of_feedback()+"','"+customerFeedback.getFeedback_recorded_by()+"','"+customerFeedback.getFeedback_details()+"','"+customerFeedback.getAttachment_name()+"','"+customerFeedback.getAttachment_type()+"','"+customerFeedback.getAttachment_referrence()+"')";
			System.out.println(statement.execute(cmd_insert));
			
			//status = statement.execute(cmd_insert);
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;

	}
	
	public boolean delete_customerfeedback(String feedback_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_delete = "delete from tbl_customerfeedback where feedback_id='"+feedback_id+"'";
			status = statement.execute(cmd_delete);
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;

	}
	
	
	
	
	
	
	
	
	public List<CustomerFeedback> getCustomersfeedbacks(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_customerfeedback");
			//System.out.println("came");
			while(resultSet.next()){
		     customerFeedbacks.add(new CustomerFeedback(resultSet.getString("feedback_id"),resultSet.getString("date_of_feedback"),resultSet.getString("type_of_feedback"),resultSet.getString("feedback_recorded_by"),resultSet.getString("feedback_details"),resultSet.getString("attachment_name"),resultSet.getString("attachement_type"),resultSet.getString("attachment_referrence")));
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
	    return customerFeedbacks;
		
	}
	
	public List<CustomerFeedback> getParticular_Customersfeedbacks(String feedback_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_customerfeedback where feedback_id='"+feedback_id+"'");
			//System.out.println("came");
			while(resultSet.next()){
			customerFeedbacks.add(new CustomerFeedback(resultSet.getString("feedback_id"),resultSet.getString("date_of_feedback"), resultSet.getString("type_of_feedback"), resultSet.getString("feedback_recorded_by"), resultSet.getString("feedback_details"), resultSet.getString("attachment_name"),resultSet.getString("attachement_type"),resultSet.getString("attachment_referrence")));
				
				
			
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
	    return customerFeedbacks;
		
	}
	
	
	public boolean update_customerfeedback(CustomerFeedback customerFeedback) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String attachment_name ="";
			  String attachment_type="",attachment_reference="";
			  System.out.println("feedback id = "+customerFeedback.getFeedback_id());
			  if(customerFeedback.getAttachment_name() == null || customerFeedback.getAttachment_type() == null || customerFeedback.getAttachment_referrence() == null)
				 {
				  System.out.println("same file attached");
					 resultSet=statement.executeQuery("select attachment_name,attachement_type,attachment_referrence from tbl_customerfeedback where feedback_id='"+customerFeedback.getFeedback_id()+"'");
				  while(resultSet.next())
				  {
					  attachment_name= resultSet.getString("attachment_name");
					  attachment_type= resultSet.getString("attachement_type");
					   attachment_reference= resultSet.getString("attachment_referrence");
				  }
				  statement.executeUpdate("update tbl_customerfeedback set date_of_feedback='"+customerFeedback.getDate_of_feedback()+"',type_of_feedback='"+customerFeedback.getType_of_feedback()+"',feedback_recorded_by='"+customerFeedback.getFeedback_recorded_by()+"',feedback_details='"+customerFeedback.getFeedback_details()+"',attachment_name='"+attachment_name+"',attachement_type='"+attachment_type+"',attachment_referrence='"+attachment_reference+"' where feedback_id='"+customerFeedback.getFeedback_id()+"'");
				
				  status=true;
				 }
			  else{
				  System.out.println("else");
			String cmd_update = "update tbl_customerfeedback set date_of_feedback='"+customerFeedback.getDate_of_feedback()+"',type_of_feedback='"+customerFeedback.getType_of_feedback()+"',feedback_recorded_by='"+customerFeedback.getFeedback_recorded_by()+"',feedback_details='"+customerFeedback.getFeedback_details()+"',attachment_name='"+customerFeedback.getAttachment_name()+"', attachement_type='"+customerFeedback.getAttachment_type()+"', attachment_referrence='"+customerFeedback.getAttachment_referrence()+"' where feedback_id='"+customerFeedback.getFeedback_id()+"'";
			System.out.println(statement.execute(cmd_update));
			System.out.println("update feedback="+status);
			System.out.println("feed back id= "+customerFeedback.getFeedback_id());
			statement.execute(cmd_update);
			status = true;
			  }
		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;
		

	}
	
	public List<CustomerFeedback> getfeedback_report(String type_of_feedback,String from_date,String to_date){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
	    try{
	    	System.out.println("yes");
	    	String cmd_sqlString="";
	    	System.out.println(type_of_feedback);
	    	if(type_of_feedback.equals("Complaint"))
	    		cmd_sqlString="select * from tbl_customerfeedback where date_of_feedback BETWEEN '"+from_date+"' AND '"+to_date+"' AND type_of_feedback='Complaint'";
	    	else
	    		cmd_sqlString="select * from tbl_customerfeedback where date_of_feedback BETWEEN '"+from_date+"' AND '"+to_date+"' AND type_of_feedback='Suggestion'";
		    	System.out.println(cmd_sqlString);
			resultSet = statement.executeQuery(cmd_sqlString);
			while(resultSet.next()){
				customerFeedbacks.add(new CustomerFeedback(resultSet.getString("feedback_id"),resultSet.getString("date_of_feedback"), resultSet.getString("type_of_feedback"), resultSet.getString("feedback_recorded_by"), resultSet.getString("feedback_details"), resultSet.getString("attachment_name"),resultSet.getString("attachement_type"),resultSet.getString("attachment_referrence")));
			}
	   
	    
	    
	    }
	    catch(Exception e)
	    {
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }
	    finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return customerFeedbacks;
	    
	    
	    }
	
	public List<CustomerFeedback> getfindcustomerfeedback(String date, String type,int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
		try {
			if(page >= 1)
	    	{
	    	int offset = 5 * (page - 1);
			int limit = 5;
			
			if(!date.equals("") && !type.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"' and type_of_feedback='"+ type +"' limit " + offset + ","+ limit+"");
			}
			else if(!date.equals("") && type.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"' limit " + offset + ","+ limit+"");
			}
			else if(date.equals("") && !type.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_customerfeedback where type_of_feedback='"+ type +"' limit " + offset + ","+ limit+"");
			}
			else
			{
				resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"' or type_of_feedback='"+ type +"' limit " + offset + ","+ limit+"");
			}
	    	}
			else
			{

				if(!date.equals("") && !type.equals(""))
				{
					resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"' and type_of_feedback='"+ type +"'");
				}
				else if(!date.equals("") && type.equals(""))
				{
					resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"'");
				}
				else if(date.equals("") && !type.equals(""))
				{
					resultSet = statement.executeQuery("select * from tbl_customerfeedback where type_of_feedback='"+ type +"'");
				}
				else
				{
					resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"' or type_of_feedback='"+ type +"'");
				}
			}
		while (resultSet.next()) {
			customerFeedbacks.add(new CustomerFeedback(resultSet.getString("feedback_id"),resultSet.getString("date_of_feedback"), resultSet.getString("type_of_feedback"), resultSet.getString("feedback_recorded_by"), resultSet.getString("feedback_details"), resultSet.getString("attachment_name"),resultSet.getString("attachement_type"),resultSet.getString("attachment_referrence")));
			

}
		} catch (Exception e) {
			//logger.info(e.toString());
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return customerFeedbacks;

	}
	public List<CustomerFeedback> getfindcustomerfeedback(String date, String type) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
		try {
			if(!date.equals("") && !type.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"' and type_of_feedback='"+ type +"'");
			}
			else if(!date.equals("") && type.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"'");
			}
			else if(date.equals("") && !type.equals(""))
			{
				resultSet = statement.executeQuery("select * from tbl_customerfeedback where type_of_feedback='"+ type +"'");
			}
			else
			{
				resultSet = statement.executeQuery("select * from tbl_customerfeedback where date_of_feedback='"+ date +"' or type_of_feedback='"+ type +"'");
			}
		while (resultSet.next()) {
			customerFeedbacks.add(new CustomerFeedback(resultSet.getString("feedback_id"),resultSet.getString("date_of_feedback"), resultSet.getString("type_of_feedback"), resultSet.getString("feedback_recorded_by"), resultSet.getString("feedback_details"), resultSet.getString("attachment_name"),resultSet.getString("attachement_type"),resultSet.getString("attachment_referrence")));
			

}
		} catch (Exception e) {
			//logger.info(e.toString());
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return customerFeedbacks;

	}

	public int getFindCustomerfeedback(String date, String type) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords =0;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
		try {
			if(!date.equals("") && !type.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_customerfeedback where date_of_feedback='"+ date +"' and type_of_feedback='"+ type +"'");
			}
			else if(!date.equals("") && type.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_customerfeedback where date_of_feedback='"+ date +"'");
			}
			else if(date.equals("") && !type.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_customerfeedback where type_of_feedback='"+ type +"'");
			}
			else
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_customerfeedback where date_of_feedback='"+ date +"' or type_of_feedback='"+ type +"'");
			}
			if (resultSet.next())
				noofRecords = resultSet.getInt("noofrecords");

		} catch (Exception e) {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return noofRecords;
	}

	public  List<CustomerFeedback> getlimitedfeedbackreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
		
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_customerfeedback limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
		     customerFeedbacks.add(new CustomerFeedback(resultSet.getString("feedback_id"),
		    		 resultSet.getString("date_of_feedback"),
		    		 resultSet.getString("type_of_feedback"),
		    		 resultSet.getString("feedback_recorded_by"),
		    		 resultSet.getString("feedback_details"),
		    		 resultSet.getString("attachment_name"),
		    		 resultSet.getString("attachement_type"),
		    		 resultSet.getString("attachment_referrence")));
           	}
			
			} catch (Exception e) {
			/*logger.info(e.toString());*/
				System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return customerFeedbacks;

	}
	public int getnooffeedbackreport() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords = 0;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
		try {

			String cmd;
				cmd = "select count(*) as noofrecords from tbl_customerfeedback ";
			System.out.println("command"+cmd);			
			resultSet = statement.executeQuery(cmd);
			if (resultSet.next())
				noofRecords = resultSet.getInt("noofrecords");

		} catch (Exception e) {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return noofRecords;

	}
	
	
	public DataSource getDataSource() {
		return dataSource;
	}
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	public void releaseConnection(Connection con){
		try{if(con != null)
			con.close();
		}catch(Exception e){}
	}
	public void releaseResultSet(ResultSet rs){
		try{if(rs != null)
			rs.close();
	}catch(Exception e){}
	}
	public void releaseStatement(Statement stmt){
		try{if(stmt != null)
			stmt.close();
	}catch(Exception e){}
	}
}