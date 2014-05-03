/**
 * ServiceRuntimeException.java
 */
package com.canzs.czs.base.ex;

/**
 * Controller层异常.
 * 
 * @creation 2013年12月30日 下午6:46:57
 * @modification 2013年12月30日 下午6:46:57
 * @company Canzs
 * @author xiweicheng
 * @version 1.0
 * 
 */
public class ControllerRuntimeException extends RuntimeException {

	/** serialVersionUID [long] */
	private static final long serialVersionUID = -1889032341187591328L;

	public ControllerRuntimeException() {
		super();
	}

	public ControllerRuntimeException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public ControllerRuntimeException(String message, Throwable cause) {
		super(message, cause);
	}

	public ControllerRuntimeException(String message) {
		super(message);
	}

	public ControllerRuntimeException(Throwable cause) {
		super(cause);
	}

}
