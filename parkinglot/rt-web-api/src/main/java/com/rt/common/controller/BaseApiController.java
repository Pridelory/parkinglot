package com.rt.common.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BaseApiController {
    private static final Logger LOGGER = LoggerFactory.getLogger(BaseApiController.class);


    /**
     * 带参重定向
     *
     * @param path
     * @return
     */
    protected String redirect(String path) {
        return "redirect:" + path;
    }

    /**
     * 不带参重定向
     *
     * @param response
     * @param path
     * @return
     */
    protected String redirect(HttpServletResponse response, String path) {
        try {
            response.sendRedirect(path);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getPageNum(int start,int pageSize){
        int totalPageNum = (start + pageSize - 1) / pageSize;
        return totalPageNum+1;
    }


}
