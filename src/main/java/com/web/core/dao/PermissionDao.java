package com.web.core.dao;

import com.web.core.orm.Permission;
import com.web.core.util.NetStarDao;

public interface PermissionDao extends NetStarDao<Permission>{
	
	/**
	 * ����Ȩ����Ϣ
	 */
	public void save(Permission pers);

}
