package com.rt.common.intercepter;

import com.rt.common.exception.ParameterException;
import com.rt.common.utils.sign.Md5SecurityUtil;
import com.rt.modules.parkinglot.entity.enums.UserTypeEnum;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 接口拦截器,校验参数
 */
@Component
public class ApiIntercepter implements HandlerInterceptor {

    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        String token = request.getParameter("token");
        if (StringUtils.isEmpty(token)) {
            throw new ParameterException(101, "token can not be null");
        }
        if (null == redisTemplate.opsForValue().get(token)) {
            throw new ParameterException(102, "invalid token");
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        request.setAttribute("ctx", request.getContextPath());
    }

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {

    }
}
