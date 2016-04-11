package com.web.core.inter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;

import com.web.base.orm.User;
import com.web.core.orm.Subscriber;
import com.web.core.svc.SessionContext;

public class ArgumentResolver implements WebArgumentResolver {
	
	public final static String SESSION_KEY = "SESSION_USER";
	
	@Autowired
	private SessionContext context;

	@Override
	public Object resolveArgument(MethodParameter methodParameter,
			NativeWebRequest webRequest) throws Exception {
		//HttpServletRequest request = webRequest.getNativeRequest(HttpServletRequest.class);
		if(methodParameter.getParameterType().equals(User.class)){
			//通过线程用户获取用户信息
			User user = context.getCurrentUser();
			if(user!=null){
				return user;
			}
		}
		return WebArgumentResolver.UNRESOLVED;
	}
	
	public User AutoFinesh(Subscriber subscriber){
		User user = new User();
		user.setId(subscriber.getId());
		user.setName(subscriber.getUsername());
		user.setNickName(subscriber.getNickname());
		user.setIcon(subscriber.getIcon());
		user.setIfSpeak(subscriber.getIfspeak());
		user.setPhoneNum(subscriber.getPhonenum());
		user.setLastLoginTime(subscriber.getLastlogintime());
		user.setSex(subscriber.getSex());
		user.setEmail(subscriber.getEmail());
		return user;
	}

}
