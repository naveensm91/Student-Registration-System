package bean;

import java.sql.Date;

/**
 * The Class Logs.
 */
/**
 * @author naveen
 *
 */
public class Logs {
	
	/** The log id. */
	private long logId;
	
	/** The who. */
	private String who;
	
	/** The time. */
	private Date time;
	
	/** The table name. */
	private String tableName;
	
	/** The operation. */
	private String operation;
	
	/** The key value. */
	private String keyValue;
	/**
	 * Gets the log id.
	 
	 *
	 * @return the logId
	 */
	public long getLogId() {
		return logId;
	}

	/**
	 * Sets the log id.
	 *
	 * @param logId            the logId to set
	 */
	public void setLogId(long logId) {
		this.logId = logId;
	}

	/**
	 * Gets the who.
	 *
	 * @return the who
	 */
	public String getWho() {
		return who;
	}

	/**
	 * Sets the who.
	 *
	 * @param who            the who to set
	 */
	public void setWho(String who) {
		this.who = who;
	}

	/**
	 * Gets the time.
	 *
	 * @return the time
	 */
	public Date getTime() {
		return time;
	}

	/**
	 * Sets the time.
	 *
	 * @param time            the time to set
	 */
	public void setTime(Date time) {
		this.time = time;
	}

	/**
	 * Gets the table name.
	 *
	 * @return the tableName
	 */
	public String getTableName() {
		return tableName;
	}

	/**
	 * Sets the table name.
	 *
	 * @param tableName            the tableName to set
	 */
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	/**
	 * Gets the operation.
	 *
	 * @return the operation
	 */
	public String getOperation() {
		return operation;
	}

	/**
	 * Sets the operation.
	 *
	 * @param operation            the operation to set
	 */
	public void setOperation(String operation) {
		this.operation = operation;
	}

	/**
	 * Gets the key value.
	 *
	 * @return the keyValue
	 */
	public String getKeyValue() {
		return keyValue;
	}

	/**
	 * Sets the key value.
	 *
	 * @param keyValue            the keyValue to set
	 */
	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}

	
}
