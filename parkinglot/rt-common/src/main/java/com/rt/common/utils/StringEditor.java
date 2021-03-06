package com.rt.common.utils;

import org.apache.commons.lang.StringUtils;

import java.beans.PropertyEditorSupport;

public class StringEditor extends PropertyEditorSupport {

	private boolean emptyAsNull;

	public StringEditor(boolean emptyAsNull) {
		this.emptyAsNull = emptyAsNull;
	}

	@Override
	public String getAsText() {
		Object value = getValue();
		return value != null ? value.toString() : StringUtils.EMPTY;
	}

	@Override
	public void setAsText(String text) {
		if (emptyAsNull && StringUtils.isEmpty(text)) {
			setValue(null);
		} else {
			setValue(text);
		}
	}

}