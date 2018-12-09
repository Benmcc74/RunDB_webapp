package com.runDbWeb.business;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import org.junit.Test;


@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class RunTest {

	@Test
	public void test_1_AddRun() {
		Run run = new Run();
		LifetimeRecord lifeRec = new LifetimeRecord();
		
		int ttlRuns = Integer.parseInt(lifeRec.getTotalRuns());
		run.addRun(1, "2034-02-26", "00:59:59"); 
		Assert.assertTrue(Integer.parseInt(lifeRec.getTotalRuns()) == ttlRuns + 1);
	}

	@Test
	public void test_2_UpdateRun() {
		Run run = new Run();
		LifetimeRecord lifeRec = new LifetimeRecord();
		
		int ttlRuns = Integer.parseInt(lifeRec.getTotalRuns());
		int runId = Integer.parseInt(lifeRec.getLifetimeData().get(0).get(5));
		run.updateRun(runId, 1, "2030-02-26", "00:59:59"); 
		Assert.assertTrue(Integer.parseInt(lifeRec.getTotalRuns()) == ttlRuns);
	}

	@Test
	public void test_3_DeleteRun() {
		Run run = new Run();
		LifetimeRecord lifeRec = new LifetimeRecord();
		
		int ttlRuns = Integer.parseInt(lifeRec.getTotalRuns());
		int runId = Integer.parseInt(lifeRec.getLifetimeData().get(0).get(5));
		run.deleteRun(runId); 
		Assert.assertTrue(Integer.parseInt(lifeRec.getTotalRuns()) == ttlRuns - 1);
	}

}
