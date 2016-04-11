package com.web.base.ctrl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.web.base.orm.Page;
import com.web.base.orm.Result;
import com.web.base.orm.User;
import com.web.core.orm.Role;
import com.web.core.orm.Subscriber;
import com.web.core.svc.RoleSVC;
import com.web.core.svc.SubscriberSVC;

@Controller
@RequestMapping("/")
public class CoreCTRL {

	@Autowired
	private SubscriberSVC useSVC;
	
	@Autowired
	private RoleSVC roleSVC;
	
	@RequestMapping(value="index",method=RequestMethod.GET)
	public String Index(){
		return "/login";
	}
	
	@RequestMapping(value="/unauthor")
	public String unauthor(){
		return "/unauthor";
	}
	
	public static final String FileDir = "uploadfile/";
	
	/**
	 * �û���¼
	 * @param user
	 * @param request
	 * @return
	 * @throws IOException 
	 */ 
	@RequestMapping(value="index",method=RequestMethod.POST)
	public String login(String userName,String password,Model model) throws IOException{
		
		/*plupload.setRequest(request);
		//�ļ��洢·��  
        File dir = new File(plupload.getRequest().getSession().getServletContext().getRealPath("/") + FileDir);
		System.out.println("�ļ��洢·��========"+dir.getPath());
        try{
        	PluploadUtil.upload(plupload, dir);
        	//�ж��ļ��Ƿ��ϴ��ɹ������ֳɿ���ļ��Ƿ�ȫ���ϴ���ɣ�  
            if (PluploadUtil.isUploadFinish(plupload)) {  
                System.out.println(plupload.getName() + "----");
            }  
        	
        }catch(IllegalStateException e){
        	e.printStackTrace();
        }*/
        
		Subject subject=SecurityUtils.getSubject();
		UsernamePasswordToken token=new UsernamePasswordToken(userName,password);
		try{
			subject.login(token);
			return "/index";
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("errorMsg", "�û�����������");
			return "/login";
		}
	}
	
	@RequestMapping(value="user/index",method=RequestMethod.GET)
	public String userPage(User user,Model model){
		
		//��ҳ
		PageHelper.startPage(1, 10);
		List<Role> list = roleSVC.queryList();
		for (Role role : list) {
			System.out.println("---------------------"+role.getRolename()+"--------------------");
		}
		model.addAttribute("msg", user.getNickName());
		return "/success";
	}
	
	@RequestMapping(value="upload",method=RequestMethod.GET)
	public String upload1(){
		return "/index";
	}
	
	/**----------------------------------�û�����--------------------------------------**/
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value = "sys/userIndex", method = RequestMethod.GET)
	public String userIndex(){
		return "/core/UserIndex";
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="sys/userList",method = RequestMethod.POST)
	public @ResponseBody Page<Subscriber> userList(Subscriber sub,int page,int rows,User user){
		
		com.github.pagehelper.Page<Object> pg = PageHelper.startPage(page,rows);
		
		//List<Subscriber> list = useSVC.queryList(new Subscriber());
		Map<String,String> map = new HashMap<String,String>();
		map.put("username", "".equals(sub.getUsername())?null:sub.getUsername());
		map.put("nickname", "".equals(sub.getNickname())?null:sub.getNickname());
		List<Subscriber> list = useSVC.queryListByXml(map);
		
		Page<Subscriber> pages = new Page<Subscriber>();
		pages.setRows(list);
		
		pages.setPageNumber(page);
		pages.setPageSize(pg.getPageSize());
		pages.setTotal(pg.getTotal());  
		return pages;
	}
	
	/**
	 * �޸��û�״̬
	 * @param id
	 * @param ifactivate
	 * @param ifspeak
	 */
	@RequestMapping(value="sys/editActivity",method = RequestMethod.POST)
	public @ResponseBody Result changeActivity(String id,String ifactivate,String ifspeak){
		ifspeak = "1".equals(ifactivate)?"1".toString():ifspeak;
		Result r = useSVC.editActivity(id, ifactivate, ifspeak);
		return r;
	}
	
}
