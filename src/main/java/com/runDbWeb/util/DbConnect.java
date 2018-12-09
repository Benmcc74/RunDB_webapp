/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.runDbWeb.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author Ben McCarthy
 */



public class DbConnect {
	private Logger logger = LogManager.getLogger(DbConnect.class);

	public Connection con;
    private RunDBWebProperties prp;

    public DbConnect() {
    	logger.info("RunDb3 Application DbConnect() constructor 001 - Logging INFO");
        init();
        try {
        	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String host = prp.getRunProp("db.host");
            String user = prp.getRunProp("db.user");
            String password = prp.getRunProp("db.password");
            con = DriverManager.getConnection(host, user, password);
        }
        catch (SQLException ex) {
        	logger.error("SQL " + ex.getMessage());
            System.out.println("SQL " + ex.getMessage());
            throw new RuntimeException(ex);
        }
        catch (Exception ex) {
        	logger.error(ex.getMessage());
            System.out.println(ex.getMessage());
            throw new RuntimeException(ex);
        }
    
    }

    public final void init() {
    	logger.debug("RunDb3 Application init() method 001 - Logging DEBUG");
        prp = new RunDBWebProperties();
        prp.loadRunProp();
    }

    public void closeConnection() {
    	logger.debug("RunDb3 Application closeConnection() method 001 - Logging DEBUG");
        try {
            con.close();
        } catch(SQLException ex) {
        	logger.error(ex.getMessage());
            System.out.println("Cannot close Database connection");
            throw new RuntimeException(ex);
        }
    }
}
