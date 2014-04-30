/**
 * ServiceRuntimeException.java
 */
package com.canzs.czs.base.ex;

/**
 * Service层异常.
 * 
 * @creation 2013年12月30日 下午6:46:57
 * @modification 2013年12月30日 下午6:46:57
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public class ServiceRuntimeException extends RuntimeException {

	/** serialVersionUID [long] */
	private static final long serialVersionUID = -1889032341187591328L;

	public ServiceRuntimeException() {
		super();
	}

	public ServiceRuntimeException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public ServiceRuntimeException(String message, Throwable cause) {
		super(message, cause);
	}

	public ServiceRuntimeException(String message) {
		super(message);
	}

	public ServiceRuntimeException(Throwable cause) {
		super(cause);
	}

}
