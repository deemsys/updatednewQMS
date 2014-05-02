package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import qms.model.ParticipantsDetails;
import qms.model.UserProfile;



public class MainDAO {
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public List<ParticipantsDetails> getParticipants(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
			resultSet = statement.executeQuery("select * from participants_table");
			while(resultSet.next()){
				participants.add(new ParticipantsDetails(resultSet.getString("participants_id"),
			    		resultSet.getString("fname"),
			    		resultSet.getString("lname"),
			    		resultSet.getString("mobile_num"),
			    		resultSet.getString("gender"),
			    		resultSet.getString("city"),
			    		resultSet.getString("education"),
			    		resultSet.getString("note"),
			    		resultSet.getString("medical_details"),
			    		resultSet.getString("messaging_frequency"),
			    		resultSet.getString("group_name"),
			    		resultSet.getString("age"),
			    		resultSet.getString("date_of_join"),
			    		resultSet.getString("email_id"),
			    		resultSet.getString("created_by")));
			}
	    }catch(Exception e){
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return participants;
		
	}
	
	
	public int getrole()
	{
		
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet=null;
		int flag=0;
		int role=4;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = null;
		if (principal instanceof UserDetails) {
		  userDetails = (UserDetails) principal;
		}
		String userName = userDetails.getUsername();
		System.out.println("user name = "+userName);
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		//List<ParticipantsDetails> participants = new ArrayList<ParticipantsDetails>();
	    try{
	    	String cmd_role="select role from login where username='"+userName+"'";
	    	resultSet=statement.executeQuery(cmd_role);
	    	resultSet.next();
	    	role=Integer.parseInt(resultSet.getString("role"));
	    	flag=1;
	    	System.out.println(role);
	    	 
	 }
	    catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    	flag=0;
	    	//return 0;
	    }finally{
	     	releaseStatement(statement);
	    	releaseConnection(con);	    
	    	
	    }
	    if(flag==1)
    		return role;
    	else
    		return 4;
	
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
