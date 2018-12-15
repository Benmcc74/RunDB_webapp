package com.runDbWeb.gui;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.runDbWeb.business.*;
import com.runDbWeb.util.*;



@WebServlet(
        name = "runServlet",
        urlPatterns = {"/runs"},
        loadOnStartup = 1
)
public class RunServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RunServlet() {
        super();
        initProp();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null)
            action = "front";
        switch(action)
        {
    		case "addRun":
    			this.addRun(request, response);
    			break;
    		case "updateRun":
    			this.updateRun(request, response);
    			break;
    		case "deleteRun":
    			this.deleteRun(request, response);
    			break;
    		case "addCourse":
    			this.addCourse(request, response);
    			break;
    		case "updateCourse":
    			this.updateCourse(request, response);
    			break;
    		case "deleteCourse":
    			this.deleteCourse(request, response);
    			break;
    		case "annualDetail":
    			this.showAnnualDetail(request, response);
    			break;
    		case "courseDetail":
    			this.showCourseDetail(request, response);
    			break;
    		case "lifeDetail":
    			this.showLifeDetail(request, response);
    			break;
    		case "front":
    			default:
    			this.frontPage(request, response);
    			break;
    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null)
            action = "front";
        switch(action)
        {
        	case "addRun":
        		this.postRun(request, response);
        		break;
        	case "updateRun":
        		this.postUpdateRun(request, response);
        		break;
        	case "deleteRun":
        		this.postDeleteRun(request, response);
        		break;
        	case "addCourse":
        		this.postCourse(request, response);
        		break;
        	case "updateCourse":
        		this.postUpdateCourse(request, response);
        		break;
        	case "deleteCourse":
        		this.postDeleteCourse(request, response);
        		break;
        	case "annualDetail":
        		this.showAnnualDetail(request, response);
        		break;
    		case "courseDetail":
    			this.showCourseDetail(request, response);
    			break;
        	case "lifeDetail":
        		this.showLifeDetail(request, response);
        		break;
        	case "front":
        		default:
                this.frontPage(request, response);
                break;
        }
	}

    private void frontPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RunDBWebProperties prp = new RunDBWebProperties();
        prp.loadRunProp();
        String env = prp.getRunProp("db.host");
        request.setAttribute("env", env);
        
    	request.getRequestDispatcher("/WEB-INF/jsp/view/frontPage.jsp").forward(request, response);
    }

    private void showLifeDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	LifetimeRecord lifetimeRec = new LifetimeRecord();
        ArrayList<ArrayList<String>> lifeRuns = lifetimeRec.getLifetimeData();
        ArrayList<ArrayList<String>> lifeRecs = lifetimeRec.getLifetimeRecs(lifeRuns);

        request.setAttribute("lifeRec", lifetimeRec);
        request.setAttribute("lifeRuns", lifeRuns);
        request.setAttribute("lifeRecs", lifeRecs);

    	request.getRequestDispatcher("/WEB-INF/jsp/view/showLifeDetail.jsp").forward(request, response);
    }

    private void showCourseDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	CourseRecord crec = new CourseRecord();
        request.setAttribute("cRec", crec);
       
        Course course = new Course();
        ArrayList<ArrayList<String>> crseList = course.getCrseList();
        request.setAttribute("crseList", crseList);

        String selCrse = request.getParameter("courses");
        if(selCrse == null)
            selCrse = crseList.get(0).get(0);

        request.setAttribute("selCrse", selCrse);
        ArrayList<ArrayList<String>> crseRuns = crec.getCrseData(Integer.parseInt(selCrse));
        request.setAttribute("crseRuns", crseRuns);
        
        request.getRequestDispatcher("/WEB-INF/jsp/view/showCourseDetail.jsp").forward(request, response);
    }

    private void showAnnualDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	AnnualRecord annualRec = new AnnualRecord();
        request.setAttribute("annRec", annualRec);

        String selYear = request.getParameter("years");
        if(selYear == null)
            selYear = annualRec.getYearList().get(0);

        request.setAttribute("selYear", selYear);

        ArrayList<ArrayList<String>> arecRuns = annualRec.getAnnualData(selYear);
        ArrayList<ArrayList<String>> arecRecs = annualRec.getAnnualRecs(arecRuns);
        request.setAttribute("arecRuns", arecRuns);
        request.setAttribute("arecRecs", arecRecs);
        
        request.getRequestDispatcher("/WEB-INF/jsp/view/showAnnualDetail.jsp").forward(request, response);
    }

    private void addRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	LifetimeRecord lifetimeRec = new LifetimeRecord();
        ArrayList<ArrayList<String>> lifeRuns = lifetimeRec.getLifetimeData();
        request.setAttribute("lifeRuns", lifeRuns);

        Course course = new Course();
        ArrayList<ArrayList<String>> crseList = course.getCrseList();
        request.setAttribute("crseList", crseList);
        
    	request.getRequestDispatcher("/WEB-INF/jsp/view/addRun.jsp").forward(request, response);
    }

    private void postRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	Run run = new Run();
    	int crse = Integer.parseInt(request.getParameter("course"));
    	String runDate = request.getParameter("year") + "-" + (request.getParameter("month").length()==1 ? "0" + request.getParameter("month") : request.getParameter("month")) + 
    			"-" + (request.getParameter("day").length()==1 ? "0" + request.getParameter("day") : request.getParameter("day")); 
    	String runTime = request.getParameter("hours") + ":" + (request.getParameter("mins").length()==1 ? "0" + request.getParameter("mins") : request.getParameter("mins")) + 
    			":" + (request.getParameter("secs").length()==1 ? "0" + request.getParameter("secs") : request.getParameter("secs"));
    	
    	run.addRun(crse, runDate, runTime); 
    	
    	LifetimeRecord lifetimeRec = new LifetimeRecord();
        ArrayList<ArrayList<String>> lifeRuns = lifetimeRec.getLifetimeData();
        request.setAttribute("lifeRuns", lifeRuns);

        Course course = new Course();
        ArrayList<ArrayList<String>> crseList = course.getCrseList();
        request.setAttribute("crseList", crseList);
        
    	request.getRequestDispatcher("/WEB-INF/jsp/view/addRun.jsp").forward(request, response);
    }

    private void updateRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	LifetimeRecord lifetimeRec = new LifetimeRecord();
        ArrayList<ArrayList<String>> lifeRuns = lifetimeRec.getLifetimeData();
        request.setAttribute("lifeRuns", lifeRuns);

        Course course = new Course();
        ArrayList<ArrayList<String>> crseList = course.getCrseList();
        request.setAttribute("crseList", crseList);
        
    	request.getRequestDispatcher("/WEB-INF/jsp/view/updateRun.jsp").forward(request, response);
    }

    private void postUpdateRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	Run run = new Run();
    	int crse = Integer.parseInt(request.getParameter("course"));
    	String runDate = request.getParameter("year") + "-" + (request.getParameter("month").length()==1 ? "0" + request.getParameter("month") : request.getParameter("month")) + 
    			"-" + (request.getParameter("day").length()==1 ? "0" + request.getParameter("day") : request.getParameter("day")); 
    	String runTime = request.getParameter("hours") + ":" + (request.getParameter("mins").length()==1 ? "0" + request.getParameter("mins") : request.getParameter("mins")) + 
    			":" + (request.getParameter("secs").length()==1 ? "0" + request.getParameter("secs") : request.getParameter("secs"));
    	int runId = Integer.parseInt(request.getParameter("runId"));
    	
    	run.updateRun(runId, crse, runDate, runTime); 
    	
    	LifetimeRecord lifetimeRec = new LifetimeRecord();
        ArrayList<ArrayList<String>> lifeRuns = lifetimeRec.getLifetimeData();
        request.setAttribute("lifeRuns", lifeRuns);

        Course course = new Course();
        ArrayList<ArrayList<String>> crseList = course.getCrseList();
        request.setAttribute("crseList", crseList);
        
    	request.getRequestDispatcher("/WEB-INF/jsp/view/updateRun.jsp").forward(request, response);
    }

    private void postDeleteRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	Run run = new Run();
    	int runId = Integer.parseInt(request.getParameter("runId"));
    	
    	run.deleteRun(runId); 
    	
    	LifetimeRecord lifetimeRec = new LifetimeRecord();
        ArrayList<ArrayList<String>> lifeRuns = lifetimeRec.getLifetimeData();
        request.setAttribute("lifeRuns", lifeRuns);

        Course course = new Course();
        ArrayList<ArrayList<String>> crseList = course.getCrseList();
        request.setAttribute("crseList", crseList);
        
    	request.getRequestDispatcher("/WEB-INF/jsp/view/deleteRun.jsp").forward(request, response);
    }

    private void deleteRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	LifetimeRecord lifetimeRec = new LifetimeRecord();
        ArrayList<ArrayList<String>> lifeRuns = lifetimeRec.getLifetimeData();
        request.setAttribute("lifeRuns", lifeRuns);

        Course course = new Course();
        ArrayList<ArrayList<String>> crseList = course.getCrseList();
        request.setAttribute("crseList", crseList);
        
    	request.getRequestDispatcher("/WEB-INF/jsp/view/deleteRun.jsp").forward(request, response);
    }

    private void addCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Course course = new Course();
        ArrayList<ArrayList<String>> crseList = course.getCrseList();
        request.setAttribute("crseList", crseList);
        
    	request.getRequestDispatcher("/WEB-INF/jsp/view/addCourse.jsp").forward(request, response);
    }

    private void postCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	Course crse = new Course();
    	String crseDesc = request.getParameter("crseDesc");
    	Double crseMiles = Double.parseDouble(request.getParameter("crseMiles"));
    	
    	crse.addCourse(crseDesc, crseMiles); 
    	
        ArrayList<ArrayList<String>> crseList = crse.getCrseList();
        request.setAttribute("crseList", crseList);
        
    	request.getRequestDispatcher("/WEB-INF/jsp/view/addCourse.jsp").forward(request, response);
    }

    private void updateCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Course course = new Course();
        ArrayList<ArrayList<String>> crseList = course.getCrseList();
        request.setAttribute("crseList", crseList);
        
    	request.getRequestDispatcher("/WEB-INF/jsp/view/updateCourse.jsp").forward(request, response);
    }

    private void postUpdateCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	Course crse = new Course();
    	String crseDesc = request.getParameter("crseDesc");
    	Double crseMiles = Double.parseDouble(request.getParameter("crseMiles"));
    	int crseId = Integer.parseInt(request.getParameter("crseId"));
    	
    	crse.updateCourse(crseId, crseDesc, crseMiles); 
    	
        Course course = new Course();
        ArrayList<ArrayList<String>> crseList = course.getCrseList();
        request.setAttribute("crseList", crseList);
        
    	request.getRequestDispatcher("/WEB-INF/jsp/view/updateCourse.jsp").forward(request, response);
    }

    private void deleteCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Course course = new Course();
        ArrayList<ArrayList<String>> crseList = course.getCrseList();
        request.setAttribute("crseList", crseList);
        request.setAttribute("delFailed", false);
        
    	request.getRequestDispatcher("/WEB-INF/jsp/view/deleteCourse.jsp").forward(request, response);
    }

    private void postDeleteCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	CourseRecord crseRec = new CourseRecord();
    	Course crse = new Course();
    	int crseId = Integer.parseInt(request.getParameter("crseId"));
		request.setAttribute("delCrseId", crseId);
    	if(!crseRec.calcTotalRuns(crseId).equals("NoData")) {
    		if(Integer.parseInt(crseRec.calcTotalRuns(crseId)) > 0) {
        		request.setAttribute("delFailed", true);
    		} else {
                request.setAttribute("delFailed", false);
            	crse.deleteCourse(crseId); 
    		}
    	} else {
            request.setAttribute("delFailed", false);
        	crse.deleteCourse(crseId); 
    	}
    	
    	
        ArrayList<ArrayList<String>> crseList = crse.getCrseList();
        request.setAttribute("crseList", crseList);
        
    	request.getRequestDispatcher("/WEB-INF/jsp/view/deleteCourse.jsp").forward(request, response);
    }


    private void initProp() {
    	RunDBWebProperties prp = new RunDBWebProperties();
        prp.loadRunProp();
    }

}
