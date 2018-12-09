package com.runDbWeb.util;

import org.junit.Assert;
import org.junit.Test;

public class RunDBWebPropertiesTest {

	@Test
	public void testGetRunProp() {
		RunDBWebProperties runDbWebProp = new RunDBWebProperties();
		runDbWebProp.loadRunProp();

		Assert.assertTrue(runDbWebProp.getRunProp("db.host").length() > 0);
		Assert.assertTrue(runDbWebProp.getRunProp("db.user").length() > 0);
		Assert.assertTrue(runDbWebProp.getRunProp("db.password").length() > 0);

		Assert.assertTrue(runDbWebProp.getRunProp("rundb2.sql.dir").length() > 0);

		Assert.assertTrue(runDbWebProp.getRunProp("date.regex").length() > 0);
		Assert.assertTrue(runDbWebProp.getRunProp("time.regex").length() > 0);
		Assert.assertTrue(runDbWebProp.getRunProp("miles.regex").length() > 0);

		Assert.assertTrue(runDbWebProp.getRunProp("err.msg.invalid.date").length() > 0);
		Assert.assertTrue(runDbWebProp.getRunProp("err.msg.invalid.time").length() > 0);
		Assert.assertTrue(runDbWebProp.getRunProp("err.msg.invalid.miles").length() > 0);

		Assert.assertTrue(runDbWebProp.getRunProp("err.msg.updRun.no.selection").length() > 0);
		Assert.assertTrue(runDbWebProp.getRunProp("err.msg.delRun.no.selection").length() > 0);
		Assert.assertTrue(runDbWebProp.getRunProp("err.msg.updCrse.no.selection").length() > 0);
		Assert.assertTrue(runDbWebProp.getRunProp("err.msg.delCrse.no.selection").length() > 0);

		Assert.assertTrue(runDbWebProp.getRunProp("err.msg.addCrse.no.desc").length() > 0);
		Assert.assertTrue(runDbWebProp.getRunProp("err.msg.addCrse.no.miles").length() > 0);
		Assert.assertTrue(runDbWebProp.getRunProp("err.msg.updCrse.no.desc").length() > 0);
		Assert.assertTrue(runDbWebProp.getRunProp("err.msg.updCrse.no.miles").length() > 0);
	}

}
