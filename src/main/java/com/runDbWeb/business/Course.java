/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.runDbWeb.business;

import com.runDbWeb.util.DbConnect;
import com.runDbWeb.util.GetSQL;
import com.runDbWeb.util.RunDBWebProperties;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author Ben McCarthy
 */
public class Course {
	private Logger logger = LogManager.getLogger(Course.class);
	
	public Statement stmt;
    private int crseId;
    private String description;
    private Double mileage;
    private RunDBWebProperties prp;
    private GetSQL getSql;

    public Course() {
    	logger.info("RunDb3 Application Course() constructor 001 - Logging INFO");
        init();
    }

    public final void init() {
    	logger.debug("RunDb3 Application init() method 001 - Logging DEBUG");
        prp = new RunDBWebProperties();
        prp.loadRunProp();
        getSql = new GetSQL();
    }
    
    public void addCourse(String desc, Double mileage) {
    	logger.debug("RunDb3 Application addCourse() method 001 - Logging DEBUG");
        DbConnect dbcon = new DbConnect();
        try {
            stmt = dbcon.con.createStatement();

            /*Get SQL from file, and replace VARs, before executing */
            String sqlString = getSql.getString("AddCourse_sql.txt");
            String sql = sqlString.replaceAll("VAR1", desc).replaceAll("VAR2", mileage.toString());

            stmt.executeQuery(sql);
            
        } catch (SQLException err) {
        	logger.error(err.getMessage());
            System.out.println(err.getMessage());
        } finally {
            if (dbcon != null) {
                dbcon.closeConnection();
            }
        }
        
    }
    public void deleteCourse(int crseId) {
    	logger.debug("RunDb3 Application deleteCourse() method 001 - Logging DEBUG");
        DbConnect dbcon = new DbConnect();
        try {
            stmt = dbcon.con.createStatement();

            /*Get SQL from file, and replace VARs, before executing */
            String sqlString = getSql.getString("DeleteCourse_sql.txt");
            String sql = sqlString.replaceAll("VAR1", ((Integer)crseId).toString());

            stmt.executeQuery(sql);

        } catch (SQLException err) {
        	logger.error(err.getMessage());
            System.out.println(err.getMessage());
        } finally {
            if (dbcon != null) {
                dbcon.closeConnection();
            }
        }
    }

    public void updateCourse(int crseId, String desc, Double mileage) {
    	logger.debug("RunDb3 Application updateCourse() method 001 - Logging DEBUG");
        DbConnect dbcon = new DbConnect();
        try {
            stmt = dbcon.con.createStatement();

            /*Get SQL from file, and replace VARs, before executing */
            String sqlString = getSql.getString("UpdateCourse_sql.txt");
            String sql = sqlString.replaceAll("VAR1", ((Integer)crseId).toString()).replaceAll("VAR2", desc).replaceAll("VAR3", mileage.toString());

            stmt.executeQuery(sql);

        } catch (SQLException err) {
        	logger.error(err.getMessage());
            System.out.println(err.getMessage());
        } finally {
            if (dbcon != null) {
                dbcon.closeConnection();
            }
        }
    }
    
    public ArrayList<ArrayList<String>> getCrseList() {
    	logger.debug("RunDb3 Application getCrseList() method 001 - Logging DEBUG");

        ResultSet rs1;
        ArrayList<ArrayList<String>> table;
        DbConnect dbcon = new DbConnect();
        try {
            stmt = dbcon.con.createStatement();

            /*Get SQL from file, and replace VARs, before executing */
            String sql = getSql.getString("CourseList_sql.txt");

            rs1 = stmt.executeQuery(sql);
            int columnCount = rs1.getMetaData().getColumnCount();
        
            table = new ArrayList<ArrayList<String>>(rs1.getRow());
            
            for(ArrayList<String> row; rs1.next(); table.add(row)) {
                row = new ArrayList<String> (columnCount);
            
                for(int c = 1; c <= columnCount; ++c) 
                    row.add(rs1.getString(c).intern());
            }

        } catch (SQLException err) {
        	logger.error(err.getMessage());
            System.out.println(err.getMessage());
            table = null;
            throw new RuntimeException(err);
        } finally {
            if (dbcon != null) {
                dbcon.closeConnection();
            }
        }
        return table;
    }    

}
