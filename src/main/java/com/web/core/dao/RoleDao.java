package com.web.core.dao;

import com.web.core.orm.Role;
import com.web.core.util.NetStarDao;

public interface RoleDao extends NetStarDao<Role> {
	
	/**
	 * ±£´æ½ÇÉ«
	 * @param role
	 */
	public void save(Role role);
	
}
