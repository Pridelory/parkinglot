package com.rt.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * @author monkey_lwy@163.com
 * @date 2019-03-14 12:11
 * @desc
 */
@Component
@ConfigurationProperties(prefix = "jpush")
public class ConfigBeanProp {

    private String appkey;
    private String masterSecret;

    public String getAppkey() {
        return appkey;
    }

    public void setAppkey(String appkey) {
        this.appkey = appkey;
    }

    public String getMasterSecret() {
        return masterSecret;
    }

    public void setMasterSecret(String masterSecret) {
        this.masterSecret = masterSecret;
    }
}
