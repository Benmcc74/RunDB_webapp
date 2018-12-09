package com.runDbWeb.business;

import java.util.Calendar;

import org.junit.Assert;
import org.junit.Test;

public class AnnualRecordTest {

	@Test
	public void testGetTotalRuns() {
		AnnualRecord annualRecord = new AnnualRecord();
		Assert.assertFalse(Integer.parseInt(annualRecord.getTotalRuns("1996")) > 0);
		Assert.assertFalse(Integer.parseInt(annualRecord.getTotalRuns("2074")) > 0);
		int year = 2008;
		while (year <= Calendar.getInstance().get(Calendar.YEAR)) {
			Assert.assertTrue(Integer.parseInt(annualRecord.getTotalRuns(Integer.toString(year))) >= 0);
			year++;
		}
	}

	@Test
	public void testGetTotalMiles() {
		AnnualRecord annualRecord = new AnnualRecord();
		Assert.assertTrue(annualRecord.getTotalMiles("1996").equals("NoData"));
		Assert.assertTrue(annualRecord.getTotalMiles("2074").equals("NoData"));
		int year = 2008;
		while (year <= Calendar.getInstance().get(Calendar.YEAR)) {
			Assert.assertTrue(Float.parseFloat(annualRecord.getTotalMiles(Integer.toString(year))) >= 0);
			year++;
		} 
	}

	@Test
	public void testGetAnnualData() {
		AnnualRecord annualRecord = new AnnualRecord();
		Assert.assertFalse(annualRecord.getAnnualData("1996").size() > 0);
		Assert.assertFalse(annualRecord.getAnnualData("2074").size() > 0);
		int year = 2008;
		while (year < Calendar.getInstance().get(Calendar.YEAR)) {
			Assert.assertTrue(annualRecord.getAnnualData(Integer.toString(year)).size() > 0);
			year++;
		}
	}

	@Test
	public void testGetAnnualRecs() {
		AnnualRecord annualRecord = new AnnualRecord();
		Assert.assertFalse(annualRecord.getAnnualRecs(annualRecord.getAnnualData("1996")).size() > 0);
		Assert.assertFalse(annualRecord.getAnnualRecs(annualRecord.getAnnualData("2074")).size() > 0);
		int year = 2008;
		while (year < Calendar.getInstance().get(Calendar.YEAR)) {
			Assert.assertTrue(annualRecord.getAnnualRecs(annualRecord.getAnnualData(Integer.toString(year))).size() >= 0);
			year++;
		}
	}

	@Test
	public void testGetYearList() {
		AnnualRecord annualRecord = new AnnualRecord();
		Assert.assertFalse(annualRecord.getYearList().size() == 0);
		Assert.assertTrue(annualRecord.getYearList().size() >= Calendar.getInstance().get(Calendar.YEAR) - 2007);
	}

}
