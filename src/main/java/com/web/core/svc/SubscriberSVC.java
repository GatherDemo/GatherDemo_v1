package com.web.core.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.util.CryptUtils;
import com.util.ReflectUtils;
import com.web.base.orm.Result;
import com.web.core.dao.SubscriberDao;
import com.web.core.orm.Subscriber;

@Service("subscriberSVC")
public class SubscriberSVC {
	
	@Autowired
	private SubscriberDao subDao;
	
	/**
	 * 根据用户名称查询
	 * @param userName
	 * @return
	 */
	public Subscriber getUserByName(String userName){
		if(userName != null){
			Subscriber sub =  subDao.getByUserName(userName);
			if(sub!=null){
				return sub;
			}
			return null;
		}
		return null;
	}
	
	/**
	 * 根据用户名查询角色
	 * @param userName
	 * @return
	 */
	public Set<String> getRoles(String userName){
		if(userName != null){
			Set<String> roles =  subDao.getRoles(userName);
			if(roles.size()>0){
				return roles;
			}
			return null;
		}
		return null;
	}
	
	/**
	 * 根据用户帐号查询权限
	 * @param userName
	 * @return
	 */
	public Set<String> getPermissions(String userName){
		if(userName != null){
			Set<String> permissions = subDao.getPermissions(userName);
			if(permissions.size()>0){
				return permissions;
			}
			return null;
		}
		return null;
	}
	
	/**
	 * 保存用户信息
	 * @param sub
	 */
	public void save(Subscriber sub){
		if(sub != null){
			sub.setPassword(CryptUtils.encode(sub.getPassword()));  //密码加密
			subDao.save(sub);
		}
	} 
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public Subscriber findOne(String id){
		if(id != null || !"".equals(id)){
			Subscriber sub = subDao.findOne(id);
			return sub;
		}
		return null;
	}
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public List<Subscriber> queryList(Subscriber sub){
		if(sub != null){
			Example example = new Example(Subscriber.class);
			/*if(sub == null){
				example.createCriteria()
				.andEqualTo("roleid",sub.getRoleid())  //id
				.andEqualTo("sex",sub.getSex())  //性别
				.andEqualTo("ifactivate",sub.getIfactivate())  //是否激活
				.andEqualTo("lastlogintime",sub.getLastlogintime());
			}*/
			List<Subscriber> subList = subDao.selectByExample(example);
			return subList;
		}
		return null;
	}
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public List<Subscriber> queryListByXml(Map<String,String> map){
		List<Subscriber> subList = subDao.queryList(map);
		return subList;
	}
	
	/**
	 * 根据id删除
	 * @param id
	 */
	public void delete(String id){
		if(id != null || !"".equals(id)){
			subDao.delete(id);
		}
	}
	
	/**
	 * 更新数据
	 * @param sub
	 */
	public void update(Subscriber sub){
		if(sub != null){
			Subscriber O_sub = subDao.findOne(sub.getId());
			if(O_sub != null){
				ReflectUtils.copy(O_sub, sub, true);
				subDao.update(O_sub);
			}
		}
	}
	
	public Result editActivity(String id,String ifactivate,String ifspeak){
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("ifactivate", ifactivate);
		map.put("ifspeak", ifspeak);
		try{
			subDao.editActivity(map);
			return Result.ok();
		}catch(Exception e){
			e.printStackTrace();
			return Result.error("操作错误！");
		}
	}

}
