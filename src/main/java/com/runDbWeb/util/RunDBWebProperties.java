/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.runDbWeb.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author Ben McCarthy
 */
public class RunDBWebProperties {

	private Logger logger = LogManager.getLogger(RunDBWebProperties.class);

    Properties prop = new Properties();
    InputStream input = null;
    OutputStream output = null;
    private String filedir = "C:\\RunDbWeb\\deploy\\resources";
/* rundb2.properties for Prod; rundb2Test.properties for Testing  */
    private String filename = "rundbWeb.properties";
    
    public void loadRunProp() {
    	logger.debug("RunDb3 Application loadRunProp() method 001 - Logging DEBUG");
        try {
            input = new FileInputStream(filedir + "/" + filename);
            
            prop.load(input);
    
        } catch (IOException ex) {
        	logger.error(ex.getMessage());
            ex.printStackTrace();
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    public String getRunProp(String propKey) {
    	logger.debug("RunDb3 Application getRunProp() method 001 - Logging DEBUG");
        String propValue = prop.getProperty(propKey);
        return propValue;
    }
    public void updateRunProp(String propKey, String propValue) {
    	logger.debug("RunDb3 Application updateRunProp() method 001 - Logging DEBUG");
        try {
            output = new FileOutputStream(filedir + "/" + filename);
            
            prop.setProperty(propKey,propValue);
            prop.store(output, null);
            
        } catch (IOException ex) {
        	logger.error(ex.getMessage());
            ex.printStackTrace();
        } finally {
            if (output != null) {
                try {
                    output.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

