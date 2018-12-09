package com.runDbWeb.business;

import org.junit.Assert;
import org.junit.Test;

public class LifetimeRecordTest {

	@Test
	public void testGetTotalRuns() {
		LifetimeRecord lifeRec = new LifetimeRecord();
		Assert.assertTrue(Integer.parseInt(lifeRec.getTotalRuns()) > 0);
	}

	@Test
	public void testGetTotalMiles() {
		LifetimeRecord lifeRec = new LifetimeRecord();
		Assert.assertTrue(Float.parseFloat(lifeRec.getTotalMiles()) > 0);
	}

	@Test
	public void testGetLifetimeData() {
		LifetimeRecord lifeRec = new LifetimeRecord();
		int ttlRuns = Integer.parseInt(lifeRec.getTotalRuns());
		
		Assert.assertTrue(lifeRec.getLifetimeData().size() == ttlRuns);
		Assert.assertTrue(lifeRec.getLifetimeData().get(0).size() == 6);
		for(int i = 0; i < ttlRuns; i++) {
			Assert.assertTrue(lifeRec.getLifetimeData().get(i).size() == 6);
		}
		
	}

	@Test
	public void testGetLifetimeRecs() {
		LifetimeRecord lifeRec = new LifetimeRecord();
		Course course = new Course();
		int noCourses = course.getCrseList().size();
		
		Assert.assertTrue(lifeRec.getLifetimeRecs(lifeRec.getLifetimeData()).size() <= noCourses);
		Assert.assertTrue(lifeRec.getLifetimeRecs(lifeRec.getLifetimeData()).get(0).size() == 9);
	}

}
