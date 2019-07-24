package kr.or.ddit.testenv;


import javax.annotation.Resource;
import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.ddit.config.spring.ApplicationContext;
import kr.or.ddit.config.spring.ApplicationDatasource;
import kr.or.ddit.config.spring.ApplicationInterceptor;
import kr.or.ddit.config.spring.RootContext;



@ContextConfiguration(classes = {RootContext.class, ApplicationContext.class, ApplicationDatasource.class})
@RunWith(SpringJUnit4ClassRunner.class)

public class LogicTestEnv{
	
	@Resource(name ="datasource")
	private DataSource datasource;
	@Before
	public void setup() {
//		ResourceDatabasePopulator rdp = new ResourceDatabasePopulator();
//		rdp.setContinueOnError(false);
//		rdp.addScript(new ClassPathResource("kr/or/ddit/testenv/dbInit.sql"));
//		rdp.addScript(new ClassPathResource("kr/or/ddit/testenv/dailyInit.sql"));
//		DatabasePopulatorUtils.execute(rdp, datasource);
	}
	
	
	@Ignore
	@Test
	public void test() {}

}
