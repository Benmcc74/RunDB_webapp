package com.runDbWeb.business;

import java.util.ArrayList;

import org.junit.Assert;
import org.junit.Test;

public class CourseRecordTest {

	@Test
	public void testCalcCrseBestTime() {
		CourseRecord crseRec = new CourseRecord();
    	LifetimeRecord lifetimeRec = new LifetimeRecord();
        ArrayList<ArrayList<String>> lifeRuns = lifetimeRec.getLifetimeData();
        ArrayList<ArrayList<String>> lifeRecs = lifetimeRec.getLifetimeRecs(lifeRuns);

        for(int rec = 0; rec <lifeRecs.size(); rec++) {
			int id = Integer.parseInt(lifeRecs.get(rec).get(0));
			Assert.assertTrue(crseRec.calcCrseBestTime(id).size() == 2);
			Assert.assertFalse(crseRec.calcCrseBestTime(id).get(0).equals("NoData"));
			Assert.assertFalse(crseRec.calcCrseBestTime(id).get(1).equals("NoData"));
		}

		Assert.assertTrue(crseRec.calcCrseBestTime(0).get(0).equals("NoData"));
		Assert.assertTrue(crseRec.calcCrseBestTime(0).get(1).equals("NoData"));

		Assert.assertTrue(crseRec.calcCrseBestTime(9999).get(0).equals("NoData"));
		Assert.assertTrue(crseRec.calcCrseBestTime(9999).get(1).equals("NoData"));
	}

	@Test
	public void testCalcCrseWorstTime() {
		CourseRecord crseRec = new CourseRecord();
    	LifetimeRecord lifetimeRec = new LifetimeRecord();
        ArrayList<ArrayList<String>> lifeRuns = lifetimeRec.getLifetimeData();
        ArrayList<ArrayList<String>> lifeRecs = lifetimeRec.getLifetimeRecs(lifeRuns);

        for(int rec = 0; rec <lifeRecs.size(); rec++) {
			int id = Integer.parseInt(lifeRecs.get(rec).get(0));
			Assert.assertTrue(crseRec.calcCrseWorstTime(id).size() == 2);
			Assert.assertFalse(crseRec.calcCrseWorstTime(id).get(0).equals("NoData"));
			Assert.assertFalse(crseRec.calcCrseWorstTime(id).get(1).equals("NoData"));
		}

		Assert.assertTrue(crseRec.calcCrseWorstTime(0).get(0).equals("NoData"));
		Assert.assertTrue(crseRec.calcCrseWorstTime(0).get(1).equals("NoData"));

		Assert.assertTrue(crseRec.calcCrseWorstTime(9999).get(0).equals("NoData"));
		Assert.assertTrue(crseRec.calcCrseWorstTime(9999).get(1).equals("NoData"));
	}

	@Test
	public void testCalcCrseAvgTime() {
		CourseRecord crseRec = new CourseRecord();
    	LifetimeRecord lifetimeRec = new LifetimeRecord();
        ArrayList<ArrayList<String>> lifeRuns = lifetimeRec.getLifetimeData();
        ArrayList<ArrayList<String>> lifeRecs = lifetimeRec.getLifetimeRecs(lifeRuns);

        for(int rec = 0; rec <lifeRecs.size(); rec++) {
			int id = Integer.parseInt(lifeRecs.get(rec).get(0));
			Assert.assertFalse(crseRec.calcCrseAvgTime(id).equals("NoData"));
		}
			
		Assert.assertTrue(crseRec.calcCrseAvgTime(0).equals("NoData"));

		Assert.assertTrue(crseRec.calcCrseAvgTime(9999).equals("NoData"));
	}

	@Test
	public void testGetCrseData() {
		CourseRecord crseRec = new CourseRecord();
    	LifetimeRecord lifetimeRec = new LifetimeRecord();
        ArrayList<ArrayList<String>> lifeRuns = lifetimeRec.getLifetimeData();
        ArrayList<ArrayList<String>> lifeRecs = lifetimeRec.getLifetimeRecs(lifeRuns);

        for(int rec = 0; rec <lifeRecs.size(); rec++) {
			int id = Integer.parseInt(lifeRecs.get(rec).get(0));
			Assert.assertTrue(crseRec.getCrseData(id).size() > 0);
			Assert.assertTrue(crseRec.getCrseData(id).get(0).size() == 5);
		}

		Assert.assertTrue(crseRec.getCrseData(0).size() == 0);

		Assert.assertTrue(crseRec.getCrseData(9999).size() == 0);
	}

	@Test
	public void testCalcTotalRuns() {
		CourseRecord crseRec = new CourseRecord();
    	LifetimeRecord lifetimeRec = new LifetimeRecord();
        ArrayList<ArrayList<String>> lifeRuns = lifetimeRec.getLifetimeData();
        ArrayList<ArrayList<String>> lifeRecs = lifetimeRec.getLifetimeRecs(lifeRuns);

        for(int rec = 0; rec <lifeRecs.size(); rec++) {
			int id = Integer.parseInt(lifeRecs.get(rec).get(0));
			Assert.assertTrue(Integer.parseInt(crseRec.calcTotalRuns(id)) > 0);
		}

		Assert.assertFalse(Integer.parseInt(crseRec.calcTotalRuns(0)) > 0);
		
		Assert.assertFalse(Integer.parseInt(crseRec.calcTotalRuns(9999)) > 0);
	}

	@Test
	public void testGetCourseDesc() {
		CourseRecord crseRec = new CourseRecord();
    	LifetimeRecord lifetimeRec = new LifetimeRecord();
        ArrayList<ArrayList<String>> lifeRuns = lifetimeRec.getLifetimeData();
        ArrayList<ArrayList<String>> lifeRecs = lifetimeRec.getLifetimeRecs(lifeRuns);

        for(int rec = 0; rec <lifeRecs.size(); rec++) {
			int id = Integer.parseInt(lifeRecs.get(rec).get(0));
			Assert.assertFalse(crseRec.getCourseDesc(id).equals("NoData"));
		}

		Assert.assertTrue(crseRec.getCourseDesc(0).equals("NoData"));

		Assert.assertTrue(crseRec.getCourseDesc(9999).equals("NoData"));
	}

	@Test
	public void testGetCourseMileage() {
		CourseRecord crseRec = new CourseRecord();
    	LifetimeRecord lifetimeRec = new LifetimeRecord();
        ArrayList<ArrayList<String>> lifeRuns = lifetimeRec.getLifetimeData();
        ArrayList<ArrayList<String>> lifeRecs = lifetimeRec.getLifetimeRecs(lifeRuns);

        for(int rec = 0; rec <lifeRecs.size(); rec++) {
			int id = Integer.parseInt(lifeRecs.get(rec).get(0));
			Assert.assertFalse(crseRec.getCourseMileage(id).equals("NoData"));
		}

		Assert.assertTrue(crseRec.getCourseMileage(0).equals("NoData"));

		Assert.assertTrue(crseRec.getCourseMileage(9999).equals("NoData"));
	}

}
