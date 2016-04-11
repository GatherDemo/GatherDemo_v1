package com.web.core.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.util.ReflectUtils;
import com.web.core.dao.RoleDao;
import com.web.core.orm.Role;

@Service("roleSVC")
public class RoleSVC {
	
	@Autowired
	private RoleDao dao;
	
	/**
	 * 根据条件查询
	 * @param role
	 * @return
	 */
	public Role select(Role role){
		
		//查询条件
		Example example = new Example(Role.class);
		example.createCriteria()
			.andEqualTo("id",role.getId())  //id
			.andEqualTo("rolename",role.getRolename());  //角色名称
		dao.selectByExample(example);
		return null;
	}
	
	/**
	 * 查询全部
	 * @param role
	 * @return
	 */
	public List<Role> queryList(){
		List<Role> list = dao.selectAll();
		return list;
	}
	
	
	/**
	 * 保存角色
	 * @param role
	 */
	public void save(Role role){
		if(role != null){
			//dao.insert(role);
			dao.save(role);
		}
	}
	
	/**
	 * 更新角色
	 * @param role
	 */
	public void update(Role role){
		if(role != null){
			Role o_role = dao.selectByPrimaryKey(role.getId());
			ReflectUtils.copy(o_role, role, true);
			Example example = new Example(Role.class);
			example.createCriteria().andEqualTo("id",role.getId());
			
			dao.updateByExample(o_role, example);
		}
	}
	
}
