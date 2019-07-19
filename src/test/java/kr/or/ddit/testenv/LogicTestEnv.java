package kr.or.ddit.testenv;


import javax.annotation.Resource;
import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import jdk.nashorn.internal.ir.annotations.Ignore;

//@ContextConfiguration(classes = {RootContext.class, 
//								ApplicationDatasource_dev.class, 
//								ApplicationTransaction.class
//								})

@ContextConfiguration({"classpath:kr/or/ddit/config/spring/application-datasource-dev.xml",
	   "classpath:kr/or/ddit/config/spring/application-transaction.xml",
	   "classpath:kr/or/ddit/config/spring/root-context.xml"})
@RunWith(SpringJUnit4ClassRunner.class)

public class LogicTestEnv{
	
	@Resource(name ="datasource")
	private DataSource datasource;
	@Before
	public void setup() {
		ResourceDatabasePopulator rdp = new ResourceDatabasePopulator();
		rdp.setContinueOnError(false);
//		rdp.addScript(new ClassPathResource("kr/or/ddit/testenv/dbInit.sql"));
//		rdp.addScript(new ClassPathResource("kr/or/ddit/testenv/dailyInit.sql"));
		DatabasePopulatorUtils.execute(rdp, datasource);
	}
	
	
	@Ignore
	@Test
	public void test() {}

}
