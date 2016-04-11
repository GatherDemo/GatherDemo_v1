package com.web.core.dao;

import javax.servlet.http.HttpServletRequest;

import com.web.base.orm.User;

/**
 * ϵͳ������
 * @author Acer
 */
public interface Context {
	
	/**
	 * <p>
	 * ע�� ��ֵ
	 * </p>
	 * 
	 * @param request
	 * @return boolean
	 */
	boolean signOut(HttpServletRequest request);
	
	/**
	 * <p>
	 * ˢ�»Ự
	 * </p>
	 * 
	 * @param request
	 */
	void refresh(HttpServletRequest request);

	/**
	 * <p>
	 * ��ȡ�Ự�û�
	 * </p>
	 * 
	 * @param request
	 * @return User
	 */
	User getUser(HttpServletRequest request);

	/**
	 * <p>
	 * ��ȡ��ǰ�߳��е��û�
	 * </p>
	 * 
	 * @return User
	 */
	User getCurrentUser();

	/**
	 * <p>
	 * �ͷ��߳��û�
	 * </p>
	 */
	void releaseCurrentUser();

	/**
	 * <p>
	 * ע���߳��û�
	 * </p>
	 * 
	 * @param user
	 */
	void registCurrentUser(User user);

}
