package kr.or.ddit.config.spring;

import org.codehaus.plexus.component.annotations.Component;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

//@Service , @Rpository 두 이노테이션을 대상으로 스캔
@Configuration
@ComponentScan(basePackages = "kr.or.ddit", useDefaultFilters = false, // 이거 꼭하는게 좋음
		includeFilters = @Filter(type = FilterType.ANNOTATION, classes = { Service.class, Repository.class, Component.class, ComponentScan.class}))
//@ImportResource({"classpath:kr/or/ddit/config/spring/application-schedules.xml"})
public class RootContext {

}
