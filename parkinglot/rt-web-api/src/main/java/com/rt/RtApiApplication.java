package com.rt;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement // 启注解事务管理，等同于xml配置方式的 <tx:annotation-driven />
@SpringBootApplication
@EnableCaching
public class RtApiApplication {

	private static Logger logger = LoggerFactory.getLogger(RtApiApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(RtApiApplication.class, args);
        logger.debug("Api启动成功");
	}
}
