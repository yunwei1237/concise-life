package com.tcf.entity;
/**
 * 所有的实体类要实现的接口，目的是可以对删除标识作操作
 * @author Administrator
 *
 */
public interface Entity{
	void setIsDelete(Boolean isDelete);
}
