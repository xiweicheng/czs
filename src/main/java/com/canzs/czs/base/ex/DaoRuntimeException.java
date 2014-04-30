/**
 * DaoRuntimeException.java
 */
package com.canzs.czs.base.ex;

/**
 * Dao层异常.
 * 
 * @creation 2013年12月30日 下午6:46:57
 * @modification 2013年12月30日 下午6:46:57
 * @company Skycloud
 * @author xiweicheng
 * @version 1.0
 * 
 */
public class DaoRuntimeException extends RuntimeException {

	/** serialVersionUID [long] */
	private static final long serialVersionUID = -1889032341187591328L;

	public DaoRuntimeException() {
		super();
	}

	public DaoRuntimeException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public DaoRuntimeException(String message, Throwable cause) {
		super(message, cause);
	}

	public DaoRuntimeException(String message) {
		super(message);
	}

	public DaoRuntimeException(Throwable cause) {
		super(cause);
	}

}
