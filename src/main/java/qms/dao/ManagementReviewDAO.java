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
import qms.model.ManagementReview;

public class ManagementReviewDAO extends AbstractExcelView
{
	private static DataSource dataSource; 	
	public void setDataSource(DataSource dataSource) {
		ManagementReviewDAO.dataSource = dataSource;
	}

	public DataSource setDataSource() {
	return dataSource;
}
	@SuppressWarnings("rawtypes")
	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook ,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		
		response.setHeader("Content-Disposition","attachment;filename='"+(String)model.get("title")+"'");
		
		
		HSSFSheet excelSheet = workbook.createSheet((String)model.get("title"));
		
		@SuppressWarnings("unchecked")
		List<ManagementReview> managementreviewdetails = (List<ManagementReview>) model.get("managementreview");
		String[] fields=(String[])model.get("fields");
		setExcelHeader(excelSheet,managementreviewdetails,fields);
		setExcelRows(excelSheet,managementreviewdetails,fields);
		
	}

	//creating header records
	public void setExcelHeader(HSSFSheet excelSheet,List<ManagementReview> managementreviewdetails,String[] fields)
	{
		HSSFRow excelHeader = excelSheet.createRow(0);
		int record = 0;
		for(String field:fields)
			{
				if (field.equals("review_id")) 
				{
					excelHeader.createCell(record++).setCellValue(
							"REVIEW ID");
					
				}
				else if (field.equals("management_review_date")) {
					excelHeader.createCell(record++).setCellValue(
							"MANAGEMENT REVIEW DATE");
					}
				else if (field.equals("attendee_list_with_titles")) {
					excelHeader.createCell(record++).setCellValue(
							"ATTENDEE LIST WITH TITLES");
					} 
				else if (field.equals("next_management_review_by")) {
					excelHeader.createCell(record++).setCellValue(
							"NEXT MANAGEMENT REVIEW BY");
					}
				else if (field.equals("category")) {
					excelHeader.createCell(record++).setCellValue(
							"CATEGORY");
					}
				
				else if (field.equals("assessment")) {
					excelHeader.createCell(record++).setCellValue(
							"ASSESSMENT");
					}
				else if (field.equals("report_link")) {
					excelHeader.createCell(record++).setCellValue(
							"REPORT LINK");}
				else if (field.equals("action_needed")) {
					excelHeader.createCell(record++).setCellValue(
							"ACTION NEEDED");
					}
				else if (field.equals("action_detail")) {
					excelHeader.createCell(record++).setCellValue(
							"ACTION DETAILS");
					}
				else if (field.equals("action_due_date")) {
					excelHeader.createCell(record++).setCellValue(
							"ACTION DUE DATE");
					}
				else if (field.equals("responsibility")) {
					excelHeader.createCell(record++).setCellValue(
							"RESPONSIBILTY");
					}
				else if (field.equals("completion_date")) {
					excelHeader.createCell(record++).setCellValue(
							"COMPLETION DATE");
					}
				else if (field.equals("continuous_improvement_project")) {
					excelHeader.createCell(record++).setCellValue(
							"CONTINUOUS IMPROVEMENT PROJECT");
					}
				
			}
		}


	//creating cell records
		
	public void setExcelRows(HSSFSheet excelSheet, List<ManagementReview> managementreviewdetails,String[] fields){
		int record = 1,c=0;
		
		for (ManagementReview managementreviews:managementreviewdetails ){	
			
			HSSFRow excelRow = excelSheet.createRow(record++);
			c=0;
			for(String field:fields)
			{
				if (field.equals("review_id")) 
				{						
					excelRow.createCell(c++).setCellValue(
							managementreviews.getReview_id());
				}
				else if (field.equals("management_review_date")) {
					excelRow.createCell(c++).setCellValue(
							managementreviews.getManagement_review_date());
					}
				else if (field.equals("attendee_list_with_titles")) {
					excelRow.createCell(c++).setCellValue(
							managementreviews.getAttendee_list_with_titles());
					} 
				else if (field.equals("next_management_review_by")) {
					excelRow.createCell(c++).setCellValue(
							managementreviews.getNext_management_review_by());
					}
				else if (field.equals("category")) {
					excelRow.createCell(c++).setCellValue(
							managementreviews.getCategory());}
				else if (field.equals("assessment")) {
					excelRow.createCell(c++).setCellValue(
							managementreviews.getAssessment());}
				else if (field.equals("report_link")) {
					excelRow.createCell(c++).setCellValue(
							managementreviews.getReport_link());}
				else if (field.equals("action_needed")) {
					excelRow.createCell(c++).setCellValue(
							managementreviews.getAction_needed());}
				else if (field.equals("action_detail")) {
					excelRow.createCell(c++).setCellValue(
							managementreviews.getAction_detail());}
				else if (field.equals("action_due_date")) {
					excelRow.createCell(c++).setCellValue(
							managementreviews.getAction_due_date());}
							
				else if (field.equals("responsibility")) {
					excelRow.createCell(c++).setCellValue(
						managementreviews.getResponsibility());}
				
				else if (field.equals("completion_date")) {
					excelRow.createCell(c++).setCellValue(
						managementreviews.getCompletion_date());}
				
				else if (field.equals("continuous_improvement_project")) {
					excelRow.createCell(c++).setCellValue(
						managementreviews.getContinuous_improvement_project());
					}
			
			}
		}
	}

// to GET MAXIMUM REVIEW ID	
	public int getMax_reviewid(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int Maxid=1001;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		 try{
			  String cmd_select="select max(auto_id) as id from tbl_managementreviewmain";
			resultSet = statement.executeQuery(cmd_select);
			if(resultSet.next())
			{
				if(!resultSet.getString("id").equals("null"))
				{
					Maxid=Integer.parseInt(resultSet.getString("id"))+1;
				}
			}
	    }catch(Exception e)
	    {
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
		    return Maxid;
		
	}

// to INSERT INTO TABLE 
	public boolean insert_managementreview(ManagementReview managementreviewdetails) 
	{
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
			String cmd_insert = "insert into tbl_managementreviewmain(review_id,management_review_date,attendee_list_with_titles,next_management_review_by)  values('"+managementreviewdetails.getReview_id()+"','"+managementreviewdetails.getManagement_review_date()+"','"+managementreviewdetails.getAttendee_list_with_titles()+"','"+managementreviewdetails.getNext_management_review_by()+"')";
			String cmd_insert2 = "insert into tbl_managementreviewchild(review_id,category,assessment,report_link,action_needed,action_detail,action_due_date,responsibility,completion_date,continuous_improvement_project) values('"+managementreviewdetails.getReview_id()+"','"+managementreviewdetails.getCategory()+"','"+managementreviewdetails.getAssessment()+"','"+managementreviewdetails.getReport_link()+"','"+managementreviewdetails.getAction_needed()+"','"+managementreviewdetails.getAction_detail()+"','"+managementreviewdetails.getAction_due_date()+"','"+managementreviewdetails.getResponsibility()+"','"+managementreviewdetails.getCompletion_date()+"','"+managementreviewdetails.getContinuous_improvement_project()+"')";
			System.out.println(statement.execute(cmd_insert));
			System.out.println(statement.execute(cmd_insert2));
			
		} 
		catch (Exception e) {
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
// to EDIT REVIEW 
	public List<ManagementReview> edit_managementreview(String review_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		//boolean status = false;
		
		List<ManagementReview> managementreviewdetails = new ArrayList<ManagementReview>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			resultSet = statement.executeQuery("select * from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"+review_id+"'");
			while (resultSet.next()) {
						System.out.println(managementreviewdetails.add(new ManagementReview(resultSet
						.getString("review_id"), resultSet
						.getString("management_review_date"), resultSet
						.getString("attendee_list_with_titles"), resultSet
						.getString("next_management_review_by"), resultSet
						.getString("category"),resultSet
						.getString("assessment"),resultSet
						.getString("report_link"),resultSet
						.getString("action_needed"),resultSet
						.getString("action_detail"),resultSet
						.getString("action_due_date"),resultSet
						.getString("responsibility"),resultSet
						.getString("completion_date"),resultSet
						.getString("continuous_improvement_project"))));
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
		return managementreviewdetails;
	}

// To UPDATE TABLE 
public boolean update_managementreview(ManagementReview managementreviewdetails) {
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
		String cmd_update = "update tbl_managementreviewmain set management_review_date='"+managementreviewdetails.getManagement_review_date()+"',attendee_list_with_titles='"+managementreviewdetails.getAttendee_list_with_titles()+"',next_management_review_by='"+managementreviewdetails.getNext_management_review_by()+"' where review_id='"+managementreviewdetails.getReview_id()+"'"; 
		statement.execute(cmd_update);
		String cmd_update2 = "update tbl_managementreviewchild set category='"+managementreviewdetails.getCategory()+"',assessment='"+managementreviewdetails.getAssessment()+"',report_link='"+managementreviewdetails.getReport_link()+"',action_needed='"+managementreviewdetails.getAction_needed()+"',action_detail='"+managementreviewdetails.getAction_detail()+"',action_due_date='"+managementreviewdetails.getAction_due_date()+"',responsibility='"+managementreviewdetails.getResponsibility()+"',completion_date='"+managementreviewdetails.getCompletion_date()+"',continuous_improvement_project='"+managementreviewdetails.getContinuous_improvement_project()+"' where review_id='"+managementreviewdetails.getReview_id()+"'"; 
	statement.execute(cmd_update2);
		
		
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
// for listing THE TABLE 
public List<ManagementReview> get_managementreview(){
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	//boolean status = false;
	List<ManagementReview> managementreviewdetails = new ArrayList<ManagementReview>();

	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	
		try {
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id");
			while (resultSet.next()) {
			managementreviewdetails.add(new ManagementReview(resultSet
						.getString("review_id"), resultSet
						.getString("management_review_date"), resultSet.getString("attendee_list_with_titles"), resultSet
						.getString("next_management_review_by"), resultSet.getString("category"),
						 resultSet.getString("assessment"),
						 resultSet.getString("report_link"),
						 resultSet.getString("action_needed"),
						 resultSet.getString("action_detail"),
						 resultSet.getString("action_due_date"),
						 resultSet.getString("responsibility"),
						 resultSet.getString("completion_date"),
						 resultSet.getString("continuous_improvement_project")));
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
	return managementreviewdetails;
}
// to SEARCH WITH ID.... 
public List<ManagementReview> search_managementreviews(String review_id,String category,String management_review_date) {
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	
	System.out.println(review_id);
	List<ManagementReview> managementreviewdetails = new ArrayList<ManagementReview>();

	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	
		try {
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id where t1.review_id='"+review_id+"'or t2.category='"+category+"'or t1.management_review_date='"+management_review_date+"'");  
			while (resultSet.next()) {
			managementreviewdetails.add(new ManagementReview(resultSet
						.getString("review_id"), resultSet
						.getString("management_review_date"), resultSet.getString("attendee_list_with_titles"), resultSet
						.getString("next_management_review_by"), resultSet.getString("category"),
						 resultSet.getString("assessment"),
						 resultSet.getString("report_link"),
						 resultSet.getString("action_needed"),
						 resultSet.getString("action_detail"),
						 resultSet.getString("action_due_date"),
						 resultSet.getString("responsibility"),
						 resultSet.getString("completion_date"),
						 resultSet.getString("continuous_improvement_project")));
	
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
	return managementreviewdetails;
}
// For REPORT GENERATION 
public  List<ManagementReview> getmanagement_bytype(String type){
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	List<ManagementReview> managementreviewdetails = new ArrayList<ManagementReview>();
	
	try {
		con = dataSource.getConnection();
		statement = con.createStatement();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	try {
		String cmd_select = "select * from tbl_managementreview";
		
		if(type.equals("management_review_minutes"))
			cmd_select="select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id";			
		
		else if (type.equals("upcoming_management_review_memo")) {
			cmd_select="select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id";				
		}
		
		else if (type.equals("action_list_beween_dates")) {
			cmd_select="select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id";//doubts
		}
		
		else if (type.equals("past_due_action_list")) {
			cmd_select="select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id";
		}
	
		else if (type.equals("list_of_continuous_improv_projects")) {
			cmd_select="select t1.*,t2.* from tbl_managementreviewmain as t1 join tbl_managementreviewchild as t2 on t1.review_id=t2.review_id";
		}
		System.out.println(cmd_select);
		resultSet = statement.executeQuery(cmd_select);
		while (resultSet.next()) {			
			managementreviewdetails.add(new ManagementReview(resultSet
					.getString("review_id"), resultSet
					.getString("management_review_date"), resultSet
					.getString("attendee_list_with_titles"), resultSet
					.getString("next_management_review_by"), resultSet
					.getString("category"), resultSet
					.getString("assessment"), resultSet
					.getString("report_link"), resultSet
					.getString("action_needed"), resultSet
					.getString("action_detail"), resultSet
					.getString("action_due_date"),resultSet
					.getString("responsibility"),resultSet
					.getString("completion_date"),resultSet
					.getString("continuous_improvement_project")));
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
	return managementreviewdetails;
}

// to DELETE SPECIFIC REVIEW
public boolean delete_managementreview(String review_id) {
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
		String cmd_delete = "delete from tbl_managementreviewmain where review_id='" + review_id + "'";
		statement.execute(cmd_delete);
		String cmd_delete2 = "delete from tbl_managementreviewchild where review_id='" + review_id + "'";
		statement.execute(cmd_delete2);
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
