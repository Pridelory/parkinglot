package com.rt.common.config;

import com.rt.common.intercepter.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.util.List;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Autowired
    private CommonIntercepter commonIntercepter;


    @Autowired
    private ApiIntercepter apiIntercepter;

    /**
     * 添加fastJsonHttpMessageConverter到converters
     */
    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
//		converters.add(fastJsonHttpMessageConverter());
    }

    /**
     * 添加拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(commonIntercepter).addPathPatterns("/**");
        registry.addInterceptor(apiIntercepter).addPathPatterns("/api/**")
                .excludePathPatterns("/api/customer/register", "/api/customer/login");
        super.addInterceptors(registry);
    }


}
