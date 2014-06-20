//http://www.compuware.com/content/dam/compuware/application-development/whitepapers/wp_dataconversion.pdf
package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;


import qms.model.DocumentMain;
import qms.model.InternalAudits;
import qms.model.Maintenance;





public class MaintenanceDAO extends AbstractExcelView
{
	private DataSource dataSource;
	 
	
	
		
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
     
	 // Excel Sheet Generation
	 
	
	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		

		HSSFSheet excelSheet = workbook.createSheet("NonConformance Report");
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
	        System.out.println("came inside report");

		@SuppressWarnings("unchecked")
		List<Maintenance> maintenances = (List<Maintenance>) model.get("maintenances");
		String[] fields=(String[])model.get("fields");
		
		//System.out.println("came inside report");
        setExcelHeader(excelSheet,style,fields);
		
		setExcelRows(excelSheet,maintenances,fields,style2);
		
	}
	

	//creating header records
	public void setExcelHeader(HSSFSheet excelSheet,CellStyle style,String[] fields) {
		HSSFRow excelHeader = excelSheet.createRow(0);	
	//	String[] fields={"document_id","document_title","document_type","media_type","location","process","external","issuer","revision_level","date","approver1","approver2","approver3","status","comments"};
		int i=0;
		for (String field : fields) {
			
			if(field.equals("equipment_id"))
			{
				excelHeader.createCell(i).setCellValue("Equipement Id");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("equipment_name"))
			{
				excelHeader.createCell(i).setCellValue("Equipement Name");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("equipment_model"))
			{
				excelHeader.createCell(i).setCellValue("Equipement Model");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("serial_number"))
			{
				excelHeader.createCell(i).setCellValue("Serial Number");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("date_acquired"))
			{
				excelHeader.createCell(i).setCellValue("Date Acquired");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("equipment_status"))
			{
				excelHeader.createCell(i).setCellValue("Equipement Status");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("frequency_maintenance"))	
			{
				excelHeader.createCell(i).setCellValue("Frequency Maintenance");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("calibration"))	
			{
				excelHeader.createCell(i).setCellValue("Calibration");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("type_of_maintenance"))	
			{
				excelHeader.createCell(i).setCellValue("Type of maintenance");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("maintenance_frequency"))	
			{
				excelHeader.createCell(i).setCellValue("Maintenance Frequency");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("reference"))	
			{
				excelHeader.createCell(i).setCellValue("Reference");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("instructions"))	
			{
				excelHeader.createCell(i).setCellValue("Instructions");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("due_date"))	
			{
				excelHeader.createCell(i).setCellValue("Due Date");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("completion_date"))	
			{
				excelHeader.createCell(i).setCellValue("Completion Date");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("completed_by"))	
			{
				excelHeader.createCell(i).setCellValue("Completed By");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("notes"))	
			{
				excelHeader.createCell(i).setCellValue("Notes");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
		}
	
	}
	
	
	//End
	
	
	//creating cell records
	public void setExcelRows(HSSFSheet excelSheet, List<Maintenance> maintenances,String[] fields,CellStyle style2){
		int record = 1;
		int i=0;
		for (Maintenance maintenance:maintenances){	
			HSSFRow excelRow = excelSheet.createRow(record++);
	//		excelRow.setRowStyle((HSSFCellStyle) style2);
		i=0;
				for (String field : fields) {
					
					if(field.equals("equipment_id"))
					{
						excelRow.createCell(i).setCellValue(
								maintenance.getEquipment_id());
							i++;
					}
					else if(field.equals("equipment_name"))
					{
						excelRow.createCell(i).setCellValue(
								maintenance.getEquipment_name());

						i++;
					}
					else if(field.equals("equipment_model"))
					{
						excelRow.createCell(i).setCellValue(
								maintenance.getEquipment_model());
								i++;
					}
					else if(field.equals("serial_number"))	
					{
						excelRow.createCell(i).setCellValue(
								maintenance.getSerial_number());
						i++;
					}else if(field.equals("date_acquired"))	
					{
						excelRow.createCell(i).setCellValue(
								maintenance.getDate_acquired());
						i++;
					}else if(field.equals("equipment_status"))	
					{
						excelRow.createCell(i).setCellValue(
								maintenance.getEquipment_status());
						i++;
					}else if(field.equals("frequency_maintenance"))
					{
						excelRow.createCell(i).setCellValue(
								maintenance.getFrequency_maintenance());
						i++;
					}else if(field.equals("calibration"))	
					{
						excelRow.createCell(i).setCellValue(
								maintenance.getCalibration());
						i++;
					}else if(field.equals("type_of_maintenance"))	
					{
						excelRow.createCell(i).setCellValue(maintenance.getType_of_maintenance());
						i++;
					}else if(field.equals("maintenance_frequency"))	
					{
						String maintances =" ";
						if(maintenance.getWeekly().equals("yes"))
						{
							maintances =maintances+"Weekly,";
						}
						if(maintenance.getMonthly().equals("yes")){
							maintances =maintances+"Monthly,";
						}
						if(maintenance.getQuarterly().equals("yes")){
							maintances =maintances+"Quarterly,";
						}
						if(maintenance.getSemiannually().equals("yes")){
							maintances =maintances+"Semi-Annually,";
						}
						if(maintenance.getAnnually().equals("yes")){
							maintances =maintances+"Annually";
						}
						excelRow.createCell(i).setCellValue(maintances);
						i++;
					}else if(field.equals("reference"))	
					{
							excelRow.createCell(i).setCellValue(						
									maintenance.getReference1());
						i++;
					
					}else if(field.equals("instructions"))	
					{
						excelRow.createCell(i).setCellValue(						
							maintenance.getInstructions());
						
						i++;
					}else if(field.equals("due_date"))	
					{
						excelRow.createCell(i).setCellValue(
								maintenance.getDue_date());
						i++;
					}else if(field.equals("completion_date"))	
					{
						excelRow.createCell(i).setCellValue(
								maintenance.getCompletion_date());
						i++;
					}else if(field.equals("completed_by"))	
					{
						excelRow.createCell(i).setCellValue(
								maintenance.getCompleted_by());
						i++;
					}
					else if(field.equals("notes"))	
					{
						excelRow.createCell(i).setCellValue(
								maintenance.getNotes());
						i++;
					}
				}
				
		}
	}

	

	
	//Insert operation
	public boolean insert_maintenance(Maintenance maintenance) {
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
			String cmd_insert = "insert into tbl_maintenance(equipment_id,equipment_name,equipment_model,serial_number,date_acquired,equipment_status,frequency_maintenance,calibration)values('"+maintenance.getEquipment_id()+"','"+maintenance.getEquipment_name()+"','"+maintenance.getEquipment_model()+"','"+maintenance.getSerial_number()+"','"+maintenance.getDate_acquired()+"','"+maintenance.getEquipment_status()+"','"+maintenance.getFrequency_maintenance()+"','"+maintenance.getCalibration()+"')";
			String cmd_insert1 = "insert into tbl_maintenancechild(equipmentid,type_of_maintenance,weekly,monthly,quarterly,semiannually,annually,reference1,reference2,reference3,reference4,reference5,instructions,instructionattach,due_date,completion_date,completed_by,notes)values('"+maintenance.getEquipmentid()+"','"+maintenance.getType_of_maintenance()+"','"+maintenance.getWeekly()+"','"+maintenance.getMonthly()+"','"+maintenance.getQuarterly()+"','"+maintenance.getSemiannually()+"','"+maintenance.getAnnually()+"','"+maintenance.getReference1()+"','"+maintenance.getReference2()+"','"+maintenance.getReference3()+"','"+maintenance.getReference4()+"','"+maintenance.getReference5()+"','"+maintenance.getInstructions()+"','"+maintenance.getInstructionattach()+"','"+maintenance.getDue_date()+"','"+maintenance.getCompletion_date()+"','"+maintenance.getCompleted_by()+"','"+maintenance.getNotes()+"')";
			statement.execute(cmd_insert);
			statement.execute(cmd_insert1);
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
	
	//Search operation for find a particular record
	public List<Maintenance>  search_maintenance(String equipment_id,String equipment_name,int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		//boolean status = false;
		System.out.println("equipment_id");
		
		
		List<Maintenance> maintenance = new ArrayList<Maintenance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			
			if(page >= 1)
	    	{
	    	int offset = 5 * (page - 1);
			int limit = 5;
			if(!equipment_id.equals("") && !equipment_name.equals(""))
			{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"' and t1.equipment_name='"+equipment_name+"' limit " + offset + ","+ limit+"");  
			}
			else if(equipment_id.equals("") && !equipment_name.equals(""))
			{
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_name='"+equipment_name+"' limit " + offset + ","+ limit+"");
			}
			else if(!equipment_id.equals("") && equipment_name.equals(""))
			{
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"' limit " + offset + ","+ limit+"");				
			}
			else
			{
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"' or t1.equipment_name='"+equipment_name+"' limit " + offset + ","+ limit+"");
						
			}
	    	}
			else{		
			if(!equipment_id.equals("") && !equipment_name.equals(""))
			{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"' and t1.equipment_name='"+equipment_name+"'");  
			}
			else if(equipment_id.equals("") && !equipment_name.equals(""))
			{
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_name='"+equipment_name+"'");
			}
			else if(!equipment_id.equals("") && equipment_name.equals(""))
			{
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"'");				
			}
			else
			{
				resultSet = statement.executeQuery("select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"' or t1.equipment_name='"+equipment_name+"'");
						
			}
			}
	    	
			
			//resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("weekly"), resultSet
						.getString("monthly"),resultSet
						.getString("quarterly"),resultSet
						.getString("semiannually"),resultSet
						.getString("annually"),resultSet
						.getString("reference1"),resultSet
						.getString("reference2"),resultSet
						.getString("reference3"),resultSet
						.getString("reference4"),resultSet 
						.getString("reference5"), resultSet
						.getString("instructions"),resultSet
						.getString("instructionattach"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));

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
		return maintenance;
	}
	public int FindMaintenance(String equipment_id,String equipment_name){
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
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
	    try{
	    	if(!equipment_id.equals("") && !equipment_name.equals(""))
			{
			resultSet = statement.executeQuery("select count(*) as noofrecords from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"' and t1.equipment_name='"+equipment_name+"'");  
			}
			else if(equipment_id.equals("") && !equipment_name.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords  from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_name='"+equipment_name+"'");
			}
			else if(!equipment_id.equals("") && equipment_name.equals(""))
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords  from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"'");				
			}
			else
			{
				resultSet = statement.executeQuery("select count(*) as noofrecords  from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"' or t1.equipment_name='"+equipment_name+"'");
						
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
		
	//Request method
	public List<Maintenance> getmaintenance() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<Maintenance> maintenance = new ArrayList<Maintenance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid ";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("weekly"), resultSet
						.getString("monthly"),resultSet
						.getString("quarterly"),resultSet
						.getString("semiannually"),resultSet
						.getString("annually"),resultSet
						.getString("reference1"),resultSet
						.getString("reference2"),resultSet
						.getString("reference3"),resultSet
						.getString("reference4"),resultSet
						.getString("reference5"), resultSet
						.getString("instructions"),resultSet
						.getString("instructionattach"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));

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
		return maintenance;
	}

	//Get request method
	public List<Maintenance> getmaintenance(String equipment_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
	    try{
	    	String cmd_select = "select * from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("weekly"), resultSet
						.getString("monthly"),resultSet
						.getString("quarterly"),resultSet
						.getString("semiannually"),resultSet
						.getString("annually"),resultSet
						.getString("reference1"),resultSet
						.getString("reference2"),resultSet
						.getString("reference3"),resultSet
						.getString("reference4"),resultSet
						.getString("reference5"), resultSet
						.getString("instructions"),resultSet
						.getString("instructionattach"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));


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
	    return maintenance;
		
	}
	
	//Edit operation
	public List<Maintenance> edit_maintenance(String equipment_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<Maintenance> maintenance = new ArrayList<Maintenance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("weekly"), resultSet
						.getString("monthly"),resultSet
						.getString("quarterly"),resultSet
						.getString("semiannually"),resultSet
						.getString("annually"),resultSet
						.getString("reference1"),resultSet
						.getString("reference2"),resultSet
						.getString("reference3"),resultSet
						.getString("reference4"),resultSet
						.getString("reference5"), resultSet
						.getString("instructions"),resultSet
						.getString("instructionattach"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));
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
		return maintenance;
	}

	//Update Operation
	public boolean update_maintenance(Maintenance maintenance) {
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
			
			String cmd_update = "update tbl_maintenance set equipment_id='"+maintenance.getEquipment_id()+"',equipment_name='"+maintenance.getEquipment_name()+"',equipment_model='"+maintenance.getEquipment_model()+"',serial_number='"+maintenance.getSerial_number()+"',date_acquired='"+maintenance.getDate_acquired()+"',equipment_status='"+maintenance.getEquipment_status()+"',frequency_maintenance='"+maintenance.getFrequency_maintenance()+"',calibration='"+maintenance.getCalibration()+"' where equipment_id='"+maintenance.getEquipment_id()+"'";
			String cmd_update1 = "update tbl_maintenancechild set equipmentid='"+maintenance.getEquipmentid()+"',type_of_maintenance='"+maintenance.getType_of_maintenance()+"',weekly='"+maintenance.getWeekly()+"',monthly='"+maintenance.getMonthly()+"',quarterly='"+maintenance.getQuarterly()+"',semiannually='"+maintenance.getSemiannually()+"',annually='"+maintenance.getAnnually()+"',reference1='"+maintenance.getReference1()+"',reference2='"+maintenance.getReference2()+"',reference3='"+maintenance.getReference3()+"',reference4='"+maintenance.getReference4()+"',reference5='"+maintenance.getReference5()+"',instructions='"+maintenance.getInstructions()+"',instructionattach='"+maintenance.getInstructionattach()+"',due_date='"+maintenance.getDue_date()+"',completion_date='"+maintenance.getCompletion_date()+"',completed_by='"+maintenance.getCompleted_by()+"',notes='"+maintenance.getNotes()+"' where equipmentid='"+maintenance.getEquipmentid()+"'";
			
			 statement.execute(cmd_update);
			 statement.execute(cmd_update1);
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
	
	
	//Delete Operation
	public boolean delete_maintenance(String equipment_id) {
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
			String cmd_delete = "delete from tbl_maintenance where equipment_id='"+ equipment_id + "'";
			String cmd_delete1 = "delete from tbl_maintenancechild where equipmentid='"+ equipment_id + "'";
			String admin_delete = "delete from tbl_maintenancechild where equipmentid='"+equipment_id+"'";
			
			statement.execute(cmd_delete);
			statement.execute(cmd_delete1);
			statement.execute(admin_delete);
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
	
	/*//report request passing
	public List<Maintenance> getMaintenance_bytype(String type,int no_of_days)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<Maintenance> maintenances = new ArrayList<Maintenance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
	    try{
			String cmd_select = null;

	   if(type=="maintain_for_30")
		//resultSet = statement.executeQuery("select * from tbl_maintenance where due_date between now() and DATE_ADD(NOW(), INTERVAL 30 DAY)" );
			cmd_select= "select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id";
		   //cmd_select="select * from tbl_maintenance";

		   else if(type=="maintain_for_ndays")
			     cmd_select = "select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date between now() and DATE_ADD(NOW(),INTERVAL 10  DAY)";
			   //cmd_select="select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date between now() and DATE_ADD(NOW(),INTERVAL " + no_of_days + " DAY)";
			   //cmd_select= "select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date between now() and DATE_ADD(NOW(),INTERVAL no_of_days DAY)";
	   else if(type=="past_due_maintenance")
		   cmd_select= "select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date<now()";
		   //cmd_select= "select * from tbl_maintenance where due_date<now()";
	   else if(type=="past_due_calibration")
			cmd_select= "select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date<now() and calibration='yes'";
	   else
			cmd_select ="select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date between now() and DATE_ADD(NOW())";
		 
		resultSet = statement.executeQuery(cmd_select);   
	   while(resultSet.next()){
		   
			System.out.println(maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("maintenance_frequency"), resultSet
						.getString("reference"), resultSet
						.getString("instructions"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes"))));

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
	    return maintenance;
		
	}

*/
	//Report Generation
	public List<Maintenance> getMaintenance_bytype(String type,int no_of_days)
	 {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		System.out.println("no of days = "+no_of_days);
		System.out.println("type = "+type);
		  Calendar c = Calendar.getInstance();
		  Date date = c.getTime();
		  c.setTime(date);
		    System.out.println("Day of week = "+c.get(Calendar.DAY_OF_WEEK));
		    System.out.println("first day of week = "+c.getFirstDayOfWeek());
		    int i = c.get(Calendar.DAY_OF_WEEK);
		    System.out.println("value 0f i = "+i);
		    int currentDay = c.get(Calendar.DATE);
		    int currentMonth = c.get(Calendar.MONTH) + 1;
		    int currentYear = c.get(Calendar.YEAR);
		    String currentdate = currentYear+"-"+currentMonth+"-"+currentDay;
		    
		    Date start = c.getTime();
		    c.add(Calendar.DATE, +no_of_days);
		    Date end = c.getTime();
		    System.out.println(start + " - " + end);
		    int oldDay = c.get(Calendar.DATE);
		    int oldMonth = c.get(Calendar.MONTH) + 1;
		    int oldYear = c.get(Calendar.YEAR);
		    String olddate = oldYear+"-"+oldMonth+"-"+oldDay;
		    System.out.println(olddate);
		    System.out.println(currentdate);
		List<Maintenance> maintenances = new ArrayList<Maintenance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = null;
			
			if(type=="maintain_for_30")
			cmd_select="select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where t2.calibration='No' and (t1.due_date BETWEEN NOW() AND NOW()+INTERVAL 30 DAY)";

				else if(type=="upcoming_calibration"){
					String query = "select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where (t2.calibration='Yes' AND t1.due_date BETWEEN '"+currentdate+"' AND '"+olddate+"')";
					System.out.println(query);
					cmd_select= "select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where t2.calibration='Yes' AND t1.due_date BETWEEN NOW() AND '"+olddate+"'";
				
				}
					else if(type=="maintenance_past_due")
						cmd_select="select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where t2.calibration='No' and t1.due_date<now()";
				else if(type=="calibration_past_due")
						cmd_select="select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where t1.due_date<now() and t2.calibration='yes'";
				
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println("came");
				System.out.println(maintenances.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("weekly"), resultSet
						.getString("monthly"),resultSet
						.getString("quarterly"),resultSet
						.getString("semiannually"),resultSet
						.getString("annually"),resultSet
						.getString("reference1"),resultSet
						.getString("reference2"),resultSet
						.getString("reference3"),resultSet
						.getString("reference4"),resultSet
						.getString("reference5"), resultSet
						.getString("instructions"),resultSet
						.getString("instructionattach"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes"))));

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
		return maintenances;
	}

	public  List<Maintenance> getlimitedmaintenancereport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("weekly"), resultSet
						.getString("monthly"),resultSet
						.getString("quarterly"),resultSet
						.getString("semiannually"),resultSet
						.getString("annually"),resultSet
						.getString("reference1"),resultSet
						.getString("reference2"),resultSet
						.getString("reference3"),resultSet
						.getString("reference4"),resultSet
						.getString("reference5"), resultSet
						.getString("instructions"),resultSet
						.getString("instructionattach"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));
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
		return maintenance;

	}
	public int getnoofmaintenancereport() {
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
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
		try {

			String cmd;
				cmd = "select count(*) as noofrecords from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id ";
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

}
		