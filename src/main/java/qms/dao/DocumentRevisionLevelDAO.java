package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.DocumentRevisionLevel;


public class DocumentRevisionLevelDAO {
	private DataSource dataSource;
	
	
	public boolean insert_Documentrevision(DocumentRevisionLevel documentRevisionLevel) {
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
			System.out.println("before executing query");
			String cmd_insert = "insert into tbl_documentrevisionlevel(revision_level)values('"+documentRevisionLevel.getRevision_level()+"')";
		
			statement.execute(cmd_insert);
			System.out.println("query executed successfully");
			
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

	
	
	
	
	public List<DocumentRevisionLevel> getDocumentRevisionLevels() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<DocumentRevisionLevel> documentRevisionLevels = new ArrayList<DocumentRevisionLevel>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_documentrevisionlevel";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				documentRevisionLevels.add(new DocumentRevisionLevel(resultSet
						.getString("id"), resultSet
						.getString("revision_level")));
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
		return documentRevisionLevels;
	}	
	
	public  List<DocumentRevisionLevel> getlimitedrevisionlevelreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentRevisionLevel> documentRevisionLevels = new ArrayList<DocumentRevisionLevel>();
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_documentrevisionlevel where id limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				documentRevisionLevels.add(new DocumentRevisionLevel(resultSet
						.getString("id"), resultSet
						.getString("revision_level")));
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
		return documentRevisionLevels;

	}
	public int getnoofrevisionlevelreport() {
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
		
		try {

			String cmd;
				cmd = "select count(*) as noofrecords from tbl_documentrevisionlevel";
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
	//Get request method
	public List<DocumentRevisionLevel> getDocumentRevisionLevels(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<DocumentRevisionLevel> documentRevisionLevels = new ArrayList<DocumentRevisionLevel>();
	    try{
	    	String cmd_select = "select * from tbl_documentrevisionlevel  where id='"+id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while(resultSet.next()){
				documentRevisionLevels.add(new DocumentRevisionLevel(resultSet
						.getString("id"), resultSet
						.getString("revision_level")));
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
	    return documentRevisionLevels;
		
	}
	//Update Operation
	public boolean update_documentrevisionlevel(DocumentRevisionLevel documentRevisionLevel) {
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
			
			String cmd_update = "update tbl_documentrevisionlevel set revision_level='"+documentRevisionLevel.getRevision_level()+"' where id='"+documentRevisionLevel.getId()+"'";
			
			System.out.println(cmd_update);
			 statement.execute(cmd_update);
			 status = true;
			
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
	public boolean delete_documentrevisionlevel(String id) {
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
			String cmd_delete = "delete from tbl_documentrevisionlevel where id='"+ id + "'";
			
			
			statement.execute(cmd_delete);
			
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
