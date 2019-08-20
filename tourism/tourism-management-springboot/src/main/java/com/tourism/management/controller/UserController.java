package com.tourism.management.controller;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tourism.management.service.MenuService;
import com.tourism.management.service.RoleService;
import com.tourism.management.service.UserService;
import com.tourism.management.util.FileUtil;

@RequestMapping("user")
@Controller
public class UserController {
	@Autowired
    private UserService userService;
    
	@Autowired
    private MenuService menuService;
    
	@Autowired
    private RoleService roleService;
    
    /**
     * 添加用户信息
     * @param user
     * @return
     */
    @RequestMapping(value = "addUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addUser(@RequestBody Map<String, Object> user, HttpServletRequest request,
        HttpServletResponse response) {
    	
    	user.put("id", FileUtil.getTimestamp());
    	Date date = new Date();       
		//Timestamp nousedate = new Timestamp(date.getTime());
    	user.put("createTime",date);
    	user.put("lastModifyTime",date);
		
		/*由身份证号获取生日和性别
		 * 15位身份证号码：第7、8位为出生年份（两位数），第9、10位为出生月份，第11、12位代表出
		 * 生日期，第15位代表性别，奇数为男，偶数为女。
		 * 
		 * 18位身份证号码：第7、8、9、10位为出生年份（四位数），第11、第12位为出生月份，第13、14位代表出
		 * 生日期，第17位代表性别，奇数为男，偶数为女。
		 * 
		 */
		
		String idCard= (String)user.get("idCard");
		String str = idCard;
		String year=null;
		String month=null;
		String day=null;
		char charSex;
		String strSex=null;
		if(idCard.length()==18)
		{
			year=str.substring(6,10);
			
			str=idCard;
			month=str.substring(10,12);
			
			str=idCard;
			day=str.substring(12,14);
			
			str=idCard;
			charSex=str.charAt(16);
			
		}
		else
		{
			year=str.substring(6,8);
			year="19"+year;
			
			str=idCard;
			month=str.substring(8,10);
			
			str=idCard;
			day=str.substring(10,12);
			
			str=idCard;
			charSex=str.charAt(14);
		}
		String strBirthday=year+"-"+month+"-"+day;
		user.put("birthday",strBirthday);
		strSex=String.valueOf(charSex); 
		
		//性别
		int numSex=Integer.parseInt( strSex );
		if(numSex%2==0){
			user.put("sex","女");
		}else{
			user.put("sex","男");
		}
    	
		//roleId 默认为0，即普通用户
		user.put("roleId", "0");
    	
    	int addUserFlag = userService.addUser(user);
    	Map<String,Object> returnMap = new HashMap<String, Object>();
    	
    	if(addUserFlag == 1) {   //表示新增成功
    		returnMap.put("success", true);
    		returnMap.put("message", "新增用户成功");
    	}else {
    		returnMap.put("success", false);
    		returnMap.put("message", "用户名已存在");
    	}
    	return returnMap;
    }
    
    //修改用户密码
    @RequestMapping(value = "updateUserPassword", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateUserPassword(@RequestBody Map<String, Object> user, HttpServletRequest request,
            HttpServletResponse response) {
        int result = userService.updateUserPassword(user);
        Map<String, Object> returnObj = new HashMap<String, Object>();
        	
        if(result == 1) {
        	returnObj.put("success",true);
        	returnObj.put("message", "修改密码成功");
        	returnObj.put("data", null);
        }else {
    		returnObj.put("success",false);
    		returnObj.put("message", "找不到相应的用户信息");
    		returnObj.put("data", null);
    		return returnObj;
        }
        return returnObj;
    }
    
    //修改用户信息
    @RequestMapping(value = "updateUser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateUser(@RequestBody Map<String, Object> user, HttpServletRequest request,
            HttpServletResponse response) {
    	int result = userService.updateUser(user);
        Map<String, Object> returnObj = new HashMap<String, Object>();
        	
        if(result == 1) {
        	returnObj.put("success",true);
        	returnObj.put("message", "修改信息成功");
        	returnObj.put("data", null);
        }else {
    		returnObj.put("success",false);
    		returnObj.put("message", "找不到相应的用户信息");
    		returnObj.put("data", null);
    		return returnObj;
        }
        return returnObj;
    }
    
    
    /**
     * 登录接口
     * @param user
     * @param 对象具体参数name、password
     * @return
     */
    @RequestMapping(value = "queryUserByNamePwd", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryUserByNamePwd(@RequestBody Map<String, Object> user, HttpServletRequest request,
        HttpServletResponse response) {
    	
    	Map<String, Object> userObj = userService.queryUserByNamePwd(user);
    	Map<String,Object> returnMap = new HashMap<String, Object>();    	
    	
    	if(userObj!=null){
    		String roleId = (String)userObj.get("roleId");
        	List<Map<String, Object>> roleList = roleService.queryRoleByRole(roleId);
        	for(int i = 0;i<roleList.size();i++){
        		Map<String, Object> item = roleList.get(i);//获取roleList数组下的第i下标的值
            	if(userObj.get("roleId").equals(item.get("id"))) {
            		userObj.put("roleId",(String)item.get("id"));
            		userObj.put("roleName",(String)item.get("name"));
            	}
        	}
        	List<Map<String, Object>> menuList = menuService.queryMenusByRole(roleId);
        	/*userObj.remove("password");*/
        	Map<String,Object> userMap = new HashMap<String, Object>();
        	userMap.put("user", userObj);
        	userMap.put("menu", menuList);
        	
        	returnMap.put("success", true);
        	returnMap.put("message", "查找用户成功");
        	returnMap.put("data", userMap);
        	
    	}else{
    		returnMap.put("success", false);
        	returnMap.put("message", "查找用户失败");
        	returnMap.put("data", null);
    	}
    	return returnMap;
    }
    
    /**
     * 
     * @param userId
     * @return
     */
    @RequestMapping(value = "queryUserById/{userId}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> queryUserById(@PathVariable String userId, HttpServletRequest request,
        HttpServletResponse response) {
    	Map<String, Object> userObj= userService.queryUserById(userId);
    	Map<String,Object> returnMap = new HashMap<String, Object>();
    	if(userObj!=null) {
        	returnMap.put("success", true);
        	returnMap.put("message", "查找用户成功");
        	returnMap.put("data", userObj);
    	}else{
    		returnMap.put("success", false);
        	returnMap.put("message", "查找用户失败");
        	returnMap.put("data", null);
    	}
	return returnMap;
    }
    
    /**
     *
     * @param userName
     * @return
     */
    @RequestMapping(value = "queryUserByName/{userName}", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> queryUserByName(@PathVariable String userName, HttpServletRequest request,
        HttpServletResponse response) {
    	List<Map<String, Object>> userObj = userService.queryUserByName(userName);
    	for(int i = 0; i< userObj.size(); i++) {
    		userObj.get(i).remove("password");
    	}
    	return userObj;
    }
    
	/**
     * 获取所有的用户列表
     * @return
     */
    @RequestMapping(value = "queryUserAll", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> queryUserAll(HttpServletRequest request,
            HttpServletResponse response) {

    	Map<String,Object> returnMap = new HashMap<String, Object>();

    	try{
    		List<Map<String, Object>> userArray = userService.queryUserAll();

        	returnMap.put("success", true);
        	returnMap.put("message", "查找所有用户成功");
        	returnMap.put("data", userArray);
    	}catch(Exception e){
    		returnMap.put("success", false);
    		returnMap.put("message", "查找所有用户失败");
    		returnMap.put("data", null);
    	}
    	return returnMap;
    }
    
  //通过用户id修改用户roleId
    @RequestMapping(value = "updataUserRoleId", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updataUserRoleId(@RequestBody List<Map<String, Object>> userArray, HttpServletRequest request,
            HttpServletResponse response) {
    	int result = userService.updataUserRoleId(userArray);
        Map<String, Object> returnObj = new HashMap<String, Object>();
        	
        if(result == 1) {
        	returnObj.put("success",true);
        	returnObj.put("message", "修改用户成功");
        	returnObj.put("data", null);
        }else {
    		returnObj.put("success",false);
    		returnObj.put("message", "修改用户失败");
    		returnObj.put("data", null);
    		return returnObj;
        }
        return returnObj;
    }
}
