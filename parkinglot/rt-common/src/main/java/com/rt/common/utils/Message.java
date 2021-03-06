package com.rt.common.utils;


import java.io.Serializable;

public class Message implements Serializable {


	public enum Type {
		success,
		warn,
		error
	}

	private Type type;

	private String content;

	public Message() {
	}

	public Message(Type type, String content) {
		this.type = type;
		this.content = content;
	}

	public Message(Type type, String content, Object... args) {
		this.type = type;
		this.content = SpringUtils.getMessage(content, args);
	}

	public static Message success(String content, Object... args) {
		return new Message(Type.success, content, args);
	}

	public static Message warn(String content, Object... args) {
		return new Message(Type.warn, content, args);
	}

	public static Message error(){
		return error("shop.message.error");
	}

	public static Message ok(){
		return success("shop.message.success");
	}
	public static Message error(String content, Object... args) {
		return new Message(Type.error, content, args);
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return SpringUtils.getMessage(content);
	}

}