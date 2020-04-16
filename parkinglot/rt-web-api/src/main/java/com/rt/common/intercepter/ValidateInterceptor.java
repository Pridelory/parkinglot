package com.rt.common.intercepter;

import org.apache.commons.lang.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ValidateInterceptor extends HandlerInterceptorAdapter {

	private static final String ERROR_MESSAGE = "illegal access!";

	private static final Whitelist DEFAULT_WHITELIST = Whitelist.none();

	private Whitelist whitelist = DEFAULT_WHITELIST;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (!isValid(request)) {
			String requestType = request.getHeader("X-Requested-With");
			if (StringUtils.equalsIgnoreCase(requestType, "XMLHttpRequest")) {
				response.addHeader("validateStatus", "accessDenied");
			}
			response.sendError(HttpServletResponse.SC_FORBIDDEN, ERROR_MESSAGE);
			return false;
		}
		return true;
	}

	private boolean isValid(HttpServletRequest request) {
		for (Object values : request.getParameterMap().values()) {
			if (values != null) {
				for (String value : (String[]) values) {
					if (!Jsoup.isValid(value, whitelist)) {
						return false;
					}
				}
			}
		}
		return true;
	}

	public Whitelist getWhitelist() {
		return whitelist;
	}

	public void setWhitelist(Whitelist whitelist) {
		this.whitelist = whitelist;
	}

}