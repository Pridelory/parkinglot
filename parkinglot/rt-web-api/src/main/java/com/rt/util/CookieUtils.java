package com.rt.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ClassName:  CookieUtils
 * @Description:  
 * @author:  <a href="liuyafengwy@163.com">luffy</a>
 * @date:  2019/2/16 10:58
 */
public class CookieUtils {
    static Logger logger = LoggerFactory.getLogger(CookieUtils.class);

    private CookieUtils() {
    }

    public static Cookie getCookie(HttpServletRequest request, String name) {
        Cookie cookies[] = request.getCookies();
        if (cookies == null || name == null || name.length() == 0)
            return null;
        Cookie cookie = null;
        for (int i = 0; i < cookies.length; i++) {
            if (!cookies[i].getName().equals(name))
                continue;
            cookie = cookies[i];
            if (request.getServerName().equals(cookie.getDomain()))
                break;
        }
        return cookie;
    }

    public static void deleteCookie(HttpServletRequest request,
                                    HttpServletResponse response, Cookie cookie, String domain,
                                    String path) {
        if (cookie != null) {
            /*
             * String path = request.getContextPath() != null ?
             * request.getContextPath() : "/"; if("".equals(path)) path = "/";
             */
            cookie.setDomain(domain);
            cookie.setPath(path);
            cookie.setValue("");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }

    public static void deleteCookie(HttpServletRequest request,
                                    HttpServletResponse response, Cookie cookie) {
        if (cookie != null) {
            String path = request.getContextPath() != null ? request
                    .getContextPath() : "/";
            if ("".equals(path))
                path = "/";
            cookie.setPath(path);
            cookie.setValue("");
            // cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }

    public static void deleteCookie(HttpServletResponse response,
                                    Cookie cookie, String domain, String path) {
        if (cookie != null) {
            cookie.setDomain(domain);
            cookie.setPath(path);
            cookie.setValue("");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }
    public static void setCookie(HttpServletRequest request, HttpServletResponse response, String name, String value) {
        setCookie(request, response, name, value, 0x278d00);
    }


    public static void setCookie(HttpServletRequest request, HttpServletResponse response, String name, String value, int maxAge) {
        if (value == null)
            value = "";
        String path = request.getContextPath() != null ? request
                .getContextPath() : "/";
        if ("".equals(path))
            path = "/";
        Cookie cookie = new Cookie(name, value);
        cookie.setPath(path);
        cookie.setVersion(1);
        cookie.setMaxAge(maxAge);
        response.addCookie(cookie);
    }

    public static void setSaveCookie(HttpServletRequest request,
                                     HttpServletResponse response, String name, String value, int maxAge) {
        if (value == null)
            value = "";
        String path = request.getContextPath() != null ? request
                .getContextPath() : "/";
        if ("".equals(path))
            path = "/";
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAge);
        cookie.setVersion(1);
        cookie.setPath(path);
        response.addCookie(cookie);
    }



    public static void setSessionCookie(HttpServletResponse response,
                                        String name, String value, String domain, String path) {
        if (value == null)
            value = "";
        Cookie cookie = new Cookie(name, value);
        cookie.setDomain(domain);
        cookie.setPath(path);
        response.addCookie(cookie);
    }
}