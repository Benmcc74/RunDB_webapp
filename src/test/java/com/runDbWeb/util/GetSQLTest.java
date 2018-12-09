package com.runDbWeb.util;

import org.junit.Assert;
import org.junit.Test;

public class GetSQLTest {

	@Test
	public void testGetString() {
		GetSQL getSql = new GetSQL();

		Assert.assertTrue(getSql.getString("AddCourse_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("AddCourse_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("AddCourse_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("AddCourse_sql.txt").substring(0, 6).equals("DELETE"));

		Assert.assertTrue(getSql.getString("AddRun_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("AddRun_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("AddRun_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("AddRun_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("AnnData_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("AnnData_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("AnnData_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("AnnData_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("AnnTtlMiles_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("AnnTtlMiles_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("AnnTtlMiles_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("AnnTtlMiles_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("AnnTtlRuns_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("AnnTtlRuns_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("AnnTtlRuns_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("AnnTtlRuns_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("AnnYears_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("AnnYears_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("AnnYears_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("AnnYears_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("AvgCourseRec_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("AvgCourseRec_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("AvgCourseRec_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("AvgCourseRec_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("BestCourseRec_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("BestCourseRec_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("BestCourseRec_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("BestCourseRec_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("CourseData_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("CourseData_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("CourseData_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("CourseData_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("CourseDesc_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("CourseDesc_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("CourseDesc_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("CourseDesc_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("CourseList_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("CourseList_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("CourseList_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("CourseList_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("CourseMiles_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("CourseMiles_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("CourseMiles_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("CourseMiles_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("CourseTtlRuns_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("CourseTtlRuns_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("CourseTtlRuns_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("CourseTtlRuns_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("DeleteCourse_sql.txt").substring(0, 6).equals("DELETE"));
		Assert.assertFalse(getSql.getString("DeleteCourse_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("DeleteCourse_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("DeleteCourse_sql.txt").substring(0, 6).equals("SELECT"));
		
		Assert.assertTrue(getSql.getString("DeleteRun_sql.txt").substring(0, 6).equals("DELETE"));
		Assert.assertFalse(getSql.getString("DeleteRun_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("DeleteRun_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("DeleteRun_sql.txt").substring(0, 6).equals("SELECT"));
		
		Assert.assertTrue(getSql.getString("LifeData_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("LifeData_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("LifeData_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("LifeData_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("LifeTtlMiles_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("LifeTtlMiles_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("LifeTtlMiles_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("LifeTtlMiles_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("LifeTtlRuns_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("LifeTtlRuns_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("LifeTtlRuns_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("LifeTtlRuns_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("UpdateCourse_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("UpdateCourse_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("UpdateCourse_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("UpdateCourse_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("UpdateRun_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("UpdateRun_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("UpdateRun_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("UpdateRun_sql.txt").substring(0, 6).equals("DELETE"));
		
		Assert.assertTrue(getSql.getString("WorstCourseRec_sql.txt").substring(0, 6).equals("SELECT"));
		Assert.assertFalse(getSql.getString("WorstCourseRec_sql.txt").substring(0, 6).equals("INSERT"));
		Assert.assertFalse(getSql.getString("WorstCourseRec_sql.txt").substring(0, 6).equals("UPDATE"));
		Assert.assertFalse(getSql.getString("WorstCourseRec_sql.txt").substring(0, 6).equals("DELETE"));
	}

}
