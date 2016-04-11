package com.web.core.dao;

import com.web.core.orm.Permission;
import com.web.core.util.NetStarDao;

public interface PermissionDao extends NetStarDao<Permission>{
	
	/**
	 * 保存权限信息
	 */
	public void save(Permission pers);

}
