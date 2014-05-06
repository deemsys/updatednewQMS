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

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import qms.model.DocumentMain;
import qms.model.Employee;
import qms.model.ExternalDocument;
import qms.model.Form;
import qms.model.NonConformance;

public class DocumentControlDAO extends AbstractExcelView
{
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	/**
	 * Excel Sheet Generation
	 */
	
	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HSSFSheet excelSheet = workbook.createSheet("Document Report");
		excelSheet.setDefaultColumnWidth(20);
		  
		//Style 1
		CellStyle style = workbook.createCellStyle();
	        Font font = workbook.createFont();
	        font.setFontName("Arial");
	        style.setFillForegroundColor(HSSFColor.BROWN.index);
	        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        style.setWrapText(true);
	        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	        font.setColor(HSSFColor.WHITE.index);
	        style.setFont(font);
		
	    //Style2
	        CellStyle style2 = workbook.createCellStyle();
	        Font font2 = workbook.createFont();
	        font2.setFontName("Arial");
	        style2.setFillForegroundColor(HSSFColor.YELLOW.index);
	        style2.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        style2.setWrapText(true);
	        font2.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	        font2.setColor(HSSFColor.WHITE.index);
	        style2.setFont(font2); 
		
		@SuppressWarnings("unchecked")
		List<DocumentMain> documentMains = (List<DocumentMain>) model.get("documentMains");
		String[] fields=(String[])model.get("fields");
		

        setExcelHeader(excelSheet,style,fields);
		
		setExcelRows(excelSheet,documentMains,fields,style2);
		
	}
	
	
	public void setExcelHeader(HSSFSheet excelSheet,CellStyle style,String[] fields) {
		HSSFRow excelHeader = excelSheet.createRow(0);	
	//	String[] fields={"document_id","document_title","document_type","media_type","location","process","external","issuer","revision_level","date","approver1","approver2","approver3","status","comments"};
		int i=0;
		for (String field : fields) {
			
			if(field.equals("document_id"))
			{
				excelHeader.createCell(i).setCellValue("ID");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("document_title"))
			{
				excelHeader.createCell(i).setCellValue("Document Title");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("document_type"))
			{
				excelHeader.createCell(i).setCellValue("Document Type");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("media_type"))	
			{
				excelHeader.createCell(i).setCellValue("Media Type");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("location"))	
			{
				excelHeader.createCell(i).setCellValue("Location");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("process"))	
			{
				excelHeader.createCell(i).setCellValue("Process");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("external"))
			{
				excelHeader.createCell(i).setCellValue("External");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("issuer"))	
			{
				excelHeader.createCell(i).setCellValue("Issuer");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("revision_level"))	
			{
				excelHeader.createCell(i).setCellValue("Revision Level");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("date"))	
			{
				excelHeader.createCell(i).setCellValue("Date");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("approver1"))	
			{
				excelHeader.createCell(i).setCellValue("Approver 1");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("approver2"))	
			{
				excelHeader.createCell(i).setCellValue("Approver 2");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("approver3"))	
			{
				excelHeader.createCell(i).setCellValue("Approver 3");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("status"))	
			{
				excelHeader.createCell(i).setCellValue("Status");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("comments"))	
			{
				excelHeader.createCell(i).setCellValue("Comments");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			
		}
	
	}
	
	
	//End
	
	
	public void setExcelRows(HSSFSheet excelSheet, List<DocumentMain> documentMains,String[] fields,CellStyle style2){
		int record = 1;
		int i=0;
		for (DocumentMain documentMain:documentMains){	
			HSSFRow excelRow = excelSheet.createRow(record++);
	//		excelRow.setRowStyle((HSSFCellStyle) style2);
		i=0;
				for (String field : fields) {
					
					if(field.equals("document_id"))
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getDocument_id());
							i++;
					}
					else if(field.equals("document_title"))
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getDocument_title());

						i++;
					}
					else if(field.equals("document_type"))
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getDocument_type()
								);	i++;
					}
					else if(field.equals("media_type"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getMedia_type());
						i++;
					}else if(field.equals("location"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getLocation());
						i++;
					}else if(field.equals("process"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getProcess());
						i++;
					}else if(field.equals("external"))
					{
						if(documentMain.getExternal().equals("1"))
						excelRow.createCell(i).setCellValue("Yes");
						else
							excelRow.createCell(i).setCellValue("No");
						i++;
					}else if(field.equals("issuer"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getIssuer());
						i++;
					}else if(field.equals("revision_level"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getRevision_level());
						i++;
					}else if(field.equals("date"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getDate());
						i++;
					}else if(field.equals("approver1"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getApprover1());
						i++;
					}else if(field.equals("approver2"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getApprover2());
						i++;
					}else if(field.equals("approver3"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getApprover3());
						i++;
					}else if(field.equals("status"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getStatus());
						i++;
					}else if(field.equals("comments"))	
					{
						excelRow.createCell(i).setCellValue(
								documentMain.getComments());
						i++;
					}
					
				}
		}
	}
	
	
	
	public String getMax_employeeID(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String Maxid="EMP1001";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  String cmd_select="select max(auto_id) as id from tbl_employee";
			resultSet = statement.executeQuery(cmd_select);
			if(resultSet.next())
			{
				if(!resultSet.getString("id").equals("null"))
				{
					Maxid="EMP"+(Integer.parseInt(resultSet.getString("id"))+1001);
				}
			}
	    }catch(Exception e){
	    	System.out.println("max"+e.toString());
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
	
	//Getting unique id
	public String get_documentid()
	{
		 Connection con = null;
		 Statement statement = null;
		 ResultSet resultset = null;
		 String Max_id = "D1001";
		 try
		 {
			 con = dataSource.getConnection();
			 statement = con.createStatement();
		 }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 try
		 {
			 String cmd_select = "select max(auto_id) as id from tbl_doccontrol_main";
			 resultset = statement.executeQuery(cmd_select);
			 if(resultset.next())
			 {
				 if(!resultset.getString("id").equals("null"))
				 {
					 Max_id = "D" + (Integer.parseInt(resultset.getString("id")) + 1001);
				 }
			 }
			 
		 }
		 catch(Exception e)
		 {
			 System.out.println("max"+e.toString());
			 System.out.println(e.toString());
			 releaseResultSet(resultset);
			 releaseStatement(statement);
		 }
		 finally
		 {
			releaseResultSet(resultset);
			releaseStatement(statement);
			releaseConnection(con);
		 }
		 return Max_id;
	}
	
	
	public boolean delete_document(String document_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status=false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  String cmd_delete1="delete from tbl_doccontrol_main where document_id='"+document_id+"'";
			  String cmd_delete2="delete from tbl_doccontrol_external where document_id='"+document_id+"'";
				 
			  status=statement.execute(cmd_delete1);
			  status=statement.execute(cmd_delete2);
				 
			
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
	
	public List<DocumentMain> getDocument_byid(String auto_number){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains=new ArrayList<DocumentMain>();
		
	    try{
	    	System.out.println("sucess:"+auto_number);
			resultSet = statement.executeQuery("SELECT t1.*,t2.* FROM tbl_doccontrol_main  as t1 join tbl_doccontrol_external as t2 on t1.auto_number=t2.auto_no where t1.auto_number='"+auto_number+"'");
			while(resultSet.next())
			{
				documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("auto_no"),resultSet.getString("issuer"),resultSet.getString("revision_level"),resultSet.getString("date"),resultSet.getString("approver1"),resultSet.getString("approver2"),resultSet.getString("approver3"),resultSet.getString("comments"),resultSet.getString("status"),resultSet.getString("external"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"),resultSet.getString("revision_id")));
				
					
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
	    return documentMains;
		
	}
	
	public List<String> getDocument_prefix(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<String> prefix = new ArrayList<String>();
		//int i=0;
	    try{
	    	resultSet = statement.executeQuery("select * from tbl_document_type_prefix");
			while(resultSet.next())
			{
		
				prefix.add(resultSet.getString("prefix"));
				
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
	    return prefix;
		
	}
	
	
	//Update Operation
	public boolean update_document(DocumentMain documentMain,String auto_number,String admin)
	{
		System.out.println("auto number = "+auto_number);
		System.out.println(documentMain.getAuto_no());
		System.out.println(documentMain.getAuto_number());
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try
		{
			con= dataSource.getConnection();
			statement = con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			String doc_id = new String(documentMain.getDocument_id());
			System.out.println("document_id="+doc_id);
			String[] strings = doc_id.split(",");
			String documentid="";
			String id_nochange = "";
			 String approver1 = new String(documentMain.getApprover1());
			  String[] split = approver1.split(",");
			  String approver = split[0];
			if(strings.length >1)
			
			 documentid = strings[2];
			id_nochange= strings[0];
			
			System.out.println("document id = "+documentid);
			
			 String attachment_name ="";
			  String attachment_type="",attachment_reference="",document_id="";
			  System.out.println("revision_id= "+documentMain.getRevision_id());
			  int revision_id = 0;/*Integer.parseInt(form.getRevision_id());*/
			  System.out.println(revision_id);
			 
			if((documentMain.getAttachment_name() == null && documentMain.getDocument_id().equals(id_nochange+","+id_nochange)) || (documentMain.getAttachment_type() == null && documentMain.getDocument_id().equals(id_nochange+","+id_nochange)) || (documentMain.getAttachment_referrence() == null && documentMain.getDocument_id().equals(id_nochange+","+id_nochange)))
			 {
				System.out.println("all null");
				 resultSet=statement.executeQuery("select tbl_doccontrol_main.attachment_name,tbl_doccontrol_main.attachment_type,tbl_doccontrol_main.attachment_referrence,tbl_doccontrol_external.revision_id from tbl_doccontrol_main,tbl_doccontrol_external where tbl_doccontrol_main.auto_number='"+documentMain.getAuto_number()+"'");
			
				 while(resultSet.next())
			  {
					 /*document_id=resultSet.getString("document_id");*/
				  attachment_name=resultSet.getString("attachment_name");
				  attachment_type=resultSet.getString("attachment_type");
				   attachment_reference= resultSet.getString("attachment_referrence");
				   
				   revision_id = Integer.parseInt(resultSet.getString("revision_id"));
				   System.out.println("revision id ="+revision_id);
			  }
			
			 
				 	statement.executeUpdate("update tbl_doccontrol_main set document_id='"+id_nochange+"',document_title='"+documentMain.getDocument_title()+"',document_type='"+documentMain.getDocument_type()+"',media_type='"+documentMain.getMedia_type()+"',location='"+documentMain.getLocation()+"',process='"+documentMain.getProcess()+"',external='"+documentMain.getExternal()+"',attachment_name='"+attachment_name+"',attachment_type='"+attachment_type+"',attachment_referrence='"+attachment_reference+"' where auto_number='"+documentMain.getAuto_number()+"'");
					statement.executeUpdate("update tbl_doccontrol_external set document_id='"+id_nochange+"',issuer='"+documentMain.getIssuer()+"',revision_level='"+documentMain.getRevision_level()+"',date='"+documentMain.getDate()+"',approver1='"+approver+"',approver2='"+documentMain.getApprover2()+"',approver3='"+documentMain.getApprover3()+"',comments='"+documentMain.getComments()+"',status='"+documentMain.getStatus()+"',revision_id='"+documentMain.getRevision_id()+"' where auto_no='"+documentMain.getAuto_number()+"'");
					status =true;
			 } 
			
		else if(documentMain.getDocument_id().equals(id_nochange+","+id_nochange))
			{
				System.out.println("document id null");
				 resultSet=statement.executeQuery("select  tbl_doccontrol_external.revision_id from tbl_doccontrol_main,tbl_doccontrol_external where tbl_doccontrol_main.auto_number='"+documentMain.getAuto_number()+"'");
				
 
				 while(resultSet.next())
				  {
					 /*document_id=resultSet.getString("document_id");*/
					   revision_id = Integer.parseInt(resultSet.getString("revision_id"));
					   System.out.println("revision id ="+revision_id);	
				  }
				  String cmd_update1 = "update tbl_doccontrol_main set document_id='"+id_nochange+"', document_title='"+documentMain.getDocument_title()+"',document_type='"+documentMain.getDocument_type()+"',media_type='"+documentMain.getMedia_type()+"',location='"+documentMain.getLocation()+"',process='"+documentMain.getProcess()+"',external='"+documentMain.getExternal()+"',attachment_name='"+documentMain.getAttachment_name()+"',attachment_type='"+documentMain.getAttachment_type()+"',attachment_referrence='"+documentMain.getAttachment_referrence()+"' where auto_number='"+documentMain.getAuto_number()+"'";
					statement.execute(cmd_update1);
					String cmd_update2="update tbl_doccontrol_external set document_id='"+id_nochange+"',issuer='"+documentMain.getIssuer()+"',revision_level='"+documentMain.getRevision_level()+"',date='"+documentMain.getDate()+"',approver1='"+approver+"',approver2='"+documentMain.getApprover2()+"',approver3='"+documentMain.getApprover3()+"',comments='"+documentMain.getComments()+"',status='"+documentMain.getStatus()+"',revision_id='"+documentMain.getRevision_id()+"', where auto_no='"+documentMain.getAuto_number()+"'";
				    statement.execute(cmd_update2);
				    status =true;
		}
			else if(documentMain.getAttachment_name() == null || documentMain.getAttachment_type() == null || documentMain.getAttachment_referrence() == null)
			 {
				System.out.println("attachment null");
				 resultSet=statement.executeQuery("select tbl_doccontrol_main.attachment_name,tbl_doccontrol_main.attachment_type,tbl_doccontrol_main.attachment_referrence,tbl_doccontrol_external.revision_id from tbl_doccontrol_main,tbl_doccontrol_external where tbl_doccontrol_main.auto_number='"+documentMain.getAuto_number()+"'");
				

				 while(resultSet.next())
			  {
				 
				  attachment_name=resultSet.getString("attachment_name");
				  attachment_type=resultSet.getString("attachment_type");
				   attachment_reference= resultSet.getString("attachment_referrence");
				   revision_id = Integer.parseInt(resultSet.getString("revision_id"));
				   System.out.println("revision id ="+revision_id);
			  }
			  statement.executeUpdate("update tbl_doccontrol_main set document_id='"+documentid+"',document_title='"+documentMain.getDocument_title()+"',document_type='"+documentMain.getDocument_type()+"',media_type='"+documentMain.getMedia_type()+"',location='"+documentMain.getLocation()+"',process='"+documentMain.getProcess()+"',external='"+documentMain.getExternal()+"',attachment_name='"+attachment_name+"',attachment_type='"+attachment_type+"',attachment_referrence='"+attachment_reference+"' where auto_number='"+documentMain.getAuto_number()+"'");
			  statement.executeUpdate("update tbl_doccontrol_external set document_id='"+documentid+"',issuer='"+documentMain.getIssuer()+"',revision_level='"+documentMain.getRevision_level()+"',date='"+documentMain.getDate()+"',approver1='"+approver+"',approver2='"+documentMain.getApprover2()+"',approver3='"+documentMain.getApprover3()+"',comments='"+documentMain.getComments()+"',status='"+documentMain.getStatus()+"',revision_id='"+documentMain.getRevision_id()+"' where auto_no='"+documentMain.getAuto_number()+"'");	
			  status =true;
			 } 
			else{
				System.out.println("not null");
				 resultSet=statement.executeQuery("select revision_id from tbl_doccontrol_external where auto_no='"+documentMain.getAuto_no()+"'");
				 while(resultSet.next())
				  {
					   revision_id = Integer.parseInt(resultSet.getString("revision_id"));
					   System.out.println("revision id ="+revision_id);
				  }
			String cmd_update1 = "update tbl_doccontrol_main set document_id='"+documentid+"',document_title='"+documentMain.getDocument_title()+"',document_type='"+documentMain.getDocument_type()+"',media_type='"+documentMain.getMedia_type()+"',location='"+documentMain.getLocation()+"',process='"+documentMain.getProcess()+"',external='"+documentMain.getExternal()+"',attachment_name='"+documentMain.getAttachment_name()+"',attachment_type='"+documentMain.getAttachment_type()+"',attachment_referrence='"+documentMain.getAttachment_referrence()+"' where auto_number='"+documentMain.getAuto_number()+"'";
			statement.execute(cmd_update1);
			String cmd_update2="update tbl_doccontrol_external set document_id='"+documentid+"',issuer='"+documentMain.getIssuer()+"',revision_level='"+documentMain.getRevision_level()+"',date='"+documentMain.getDate()+"',approver1='"+approver+"',approver2='"+documentMain.getApprover2()+"',approver3='"+documentMain.getApprover3()+"',comments='"+documentMain.getComments()+"',status='"+documentMain.getStatus()+"',revision_id='"+documentMain.getRevision_id()+"' where auto_no='"+documentMain.getAuto_number()+"'";
		    statement.execute(cmd_update2);
		    status =true;
			}
		
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		finally
		{
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;
	}
	
	public boolean insert_document(DocumentMain documentMain)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status=false;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  String cmd_insert1="insert into tbl_doccontrol_main(auto_number,document_id,document_title,document_type,media_type,location,process,external,attachment_name,attachment_type,attachment_referrence) values('"+documentMain.getAuto_number()+"','"+documentMain.getDocument_id()+"','"+documentMain.getDocument_title()+"','"+documentMain.getDocument_type()+"','"+documentMain.getMedia_type()+"','"+documentMain.getLocation()+"','"+documentMain.getProcess()+"','"+documentMain.getExternal()+"','"+documentMain.getAttachment_name()+"','"+documentMain.getAttachment_type()+"','"+documentMain.getAttachment_referrence()+"')";
			  statement.execute(cmd_insert1);
			  
			  String cmd_insert2="";	
				 cmd_insert2="insert into tbl_doccontrol_external(auto_no,document_id,issuer,revision_level,date,approver1,approver2,approver3,comments,status,revision_id) values('"+documentMain.getAuto_number()+"','"+documentMain.getDocument_id()+"','"+documentMain.getIssuer()+"','"+documentMain.getRevision_level()+"','"+documentMain.getDate()+"','"+documentMain.getApprover1()+"','"+documentMain.getApprover2()+"','"+documentMain.getApprover3()+"','"+documentMain.getComments()+"','"+documentMain.getStatus()+"','"+0+"')";
				 statement.execute(cmd_insert2);
		
			 status=true;
			 
		  }catch(Exception e){
	    	System.out.println(e.toString());
	    	status=false;
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
	
	
	public List<DocumentMain> getDocuments(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_doccontrol_main");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return documentMains;
		
	}
	
	public List<DocumentMain> insert_prefix(String prefix){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		int flag=0;
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
	    	String cmd_available="Select * from tbl_document_type_prefix where prefix='"+prefix+"'";
	    	System.out.println(cmd_available);
	    	resultSet=statement.executeQuery(cmd_available);	    	
	    	if(resultSet.next())
	    	{
	    	 flag=1;
	    	}
	    	if(flag==0)
	    	{
	    	statement.execute("insert into tbl_document_type_prefix(document_type,prefix) values('Userdefined','"+prefix+"')");
	    	}
			
	    }catch(Exception e){
	    	System.out.println("prefix:"+e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return documentMains;
		
	}
	
	public List<DocumentMain> getDocuments(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_doccontrol_main where document_id='"+id+"'");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return documentMains;
		
	}
	public List<DocumentMain> getDocuments_bytype(String type){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_doccontrol_main as t1 join tbl_doccontrol_external as t2 on t1.document_id=t2.document_id where document_type='"+type+"'");
			System.out.println("came");
			while(resultSet.next()){
								documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"), resultSet.getString("document_title"), resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"), resultSet.getString("process"),resultSet.getString("external"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"),resultSet.getString("auto_no"),resultSet.getString("issuer"),resultSet.getString("revision_level"),resultSet.getString("date"), resultSet.getString("approver1"),resultSet.getString("approver2"),resultSet.getString("approver3"),resultSet.getString("comments"),resultSet.getString("status"),resultSet.getString("revision_id")));
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
	    return documentMains;
		
	}
	
	public List<DocumentMain> getDocuments_byExternal(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_doccontrol_main as t1 join tbl_doccontrol_external as t2 on t1.document_id=t2.document_id where external=1");
			System.out.println("came");
			while(resultSet.next()){
				documentMains.add(new DocumentMain(
						resultSet.getString("auto_number"),resultSet.getString("document_id"), 
						resultSet.getString("document_title"), resultSet.getString("document_type"),
						resultSet.getString("media_type"),resultSet.getString("location"),
						resultSet.getString("process"),resultSet.getString("auto_no"), 
						resultSet.getString("issuer"),
						resultSet.getString("revision_level"),resultSet.getString("date"),
						resultSet.getString("approver1"),resultSet.getString("approver2"),
						resultSet.getString("approver3"),resultSet.getString("comments"),
						resultSet.getString("status"),
						resultSet.getString("external"),resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"),resultSet.getString("revision_id")));
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
	    return documentMains;
		
	}
	
	public List<DocumentMain> findDocuments(String search_document_type,String search_process){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_doccontrol_main where document_type='"+search_document_type+"' or process='"+search_process+"'");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return documentMains;
		
	}
	

	public List<DocumentMain> list_documents(String document_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_doccontrol_main as t1 join tbl_doccontrol_external as t2 on t1.document_id=t2.document_id");
			System.out.println("came");
			while(resultSet.next()){
								documentMains.add(new DocumentMain(resultSet.getString("auto_number"),resultSet.getString("document_id"), resultSet.getString("document_title"), resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"), resultSet.getString("process"), resultSet.getString("auto_no"),resultSet.getString("issuer"),resultSet.getString("revision_level"),resultSet.getString("date"), resultSet.getString("approver1"),resultSet.getString("approver2"),resultSet.getString("approver3"),resultSet.getString("comments"),resultSet.getString("status"),resultSet.getString("revision_id"),resultSet.getString("external"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return documentMains;
		
	}
	public  List<DocumentMain> getlimiteddocumentreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
		try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_doccontrol_main limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(
						resultSet.getString("auto_number"),
						resultSet.getString("document_id"),
						resultSet.getString("document_title"),
						resultSet.getString("document_type"),
						resultSet.getString("media_type"),
						resultSet.getString("location"),
						resultSet.getString("process"),
						resultSet.getString("external"), 
						resultSet.getString("attachment_name"),
						resultSet.getString("attachment_type"),
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
		return documentMains;

	}
	public int getnoofdocumentreport() {
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
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
		try {

			String cmd;
			
					cmd = "select count(*) as noofrecords from tbl_doccontrol_main ";
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