/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.runDbWeb.util;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 * @author Ben McCarthy
 */
public class GetSQL {

	private Logger logger = LogManager.getLogger(GetSQL.class);
	
    private RunDBWebProperties prp;

    public GetSQL() {
    	logger.info("RunDb3 Application GetSQL() constructor 001 - Logging INFO");
        init();
    }

    public final void init() {
    	logger.debug("RunDb3 Application init() method 001 - Logging DEBUG");
        prp = new RunDBWebProperties();
        prp.loadRunProp();
    }

    public String getString(String filename) {
    	logger.debug("RunDb3 Application getString() method 001 - Logging DEBUG");
        String command = new String();
        try {
        String dir = prp.getRunProp("rundb2.sql.dir");
        command = new String(Files.readAllBytes(Paths.get(dir + "/" + filename)));
        } catch (IOException e) {
        	logger.error(e.getMessage());
            e.printStackTrace();
        }
        return command;
    }
}
