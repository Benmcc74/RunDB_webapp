package com.runDbWeb.business;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import org.junit.Test;


@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CourseTest {

	@Test
	public void test_1_AddCourse() {
		Course course = new Course();
		int origSize = course.getCrseList().size();
		course.addCourse("Fast New661 Course", 99.66);
		Assert.assertTrue(course.getCrseList().size() == origSize + 1);
	}

	@Test
	public void test_2_UpdateCourse() {
		Course course = new Course();
		int origSize = course.getCrseList().size();
		int crseId = Integer.parseInt(course.getCrseList().get(0).get(0));
		course.updateCourse(crseId, "Updated 22Course Description", 66.99);
		Assert.assertTrue(course.getCrseList().size() == origSize);
	}

	@Test
	public void test_3_DeleteCourse() {
		Course course = new Course();
		int origSize = course.getCrseList().size();
		int crseId = Integer.parseInt(course.getCrseList().get(0).get(0));
		course.deleteCourse(crseId);
		Assert.assertTrue(course.getCrseList().size() == (origSize - 1));
	}

	@Test
	public void test_4_GetCrseList() {
		Course course = new Course();
		Assert.assertTrue(course.getCrseList().size() > 0);
	}

}
