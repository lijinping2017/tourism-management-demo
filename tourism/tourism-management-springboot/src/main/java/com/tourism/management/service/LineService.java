package com.tourism.management.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tourism.management.mapper.LineDao;
import com.tourism.management.util.FileUtil;

@Service
@Transactional

public class LineService {
	@Autowired
	private LineDao lineDao;
	
	 /**
     * 添加线路
     * 
     * @param line
     *
     */
    public int addLine(JSONObject lineScheduleJson) {
    	JSONObject lineSchedule = new JSONObject(lineScheduleJson);   //把路线行程json字符串转为对象
    	JSONObject line = lineSchedule.getJSONObject("line");
    	
    	String name = String.valueOf(line.get("name"));
    	List<Map<String, Object>> lineList = this.lineDao.queryLineByName(name);
        if (lineList.size() == 0) {
        	String lineId = String.valueOf(FileUtil.getTimestamp());
        	line.put("id", lineId); 
        	this.lineDao.addLine(line);
        	
        	JSONArray scheduleArray =  lineSchedule.getJSONArray("schedule");

        	for(int i = 0;i< scheduleArray.size(); i++) {
        		Map<String,Object> schedule = scheduleArray.getJSONObject(i);  //获取schedule里的数组对象
        		schedule.put("id",FileUtil.getTimestamp());
        		schedule.put("lineId",lineId);
            	this.lineDao.addSchedule(schedule);
        	} 
        	return 1;
        }
        return -1;
    }
    
    public List<Map<String, Object>> queryLineAll() {
    	return this.lineDao.queryLineAll();  
    }
    
    public Map<String, Object> queryLineById(String id) {
    	return this.lineDao.queryLineById(id);  
    }
    
    public int deleteLineById(String id) {
    	Map<String, Object> lineList = lineDao.queryLineById(id);
        if (lineList == null) {
            return -1;
        } else {
        	 this.lineDao.deleteLineById(id);
        	 return 1;
        }
    }
    
    public List<Map<String, Object>> queryLineScheduleByLineId(String lineId) {
    	return this.lineDao.queryLineScheduleByLineId(lineId);
    }
    
    
    public int updateLine(JSONObject lineJson) {
    	JSONObject lineObj = new JSONObject(lineJson); 
    	JSONObject newline = lineObj.getJSONObject("line");
    	String id = (String)newline.get("id");
    	Map<String, Object> oldline = lineDao.queryLineById(id);
    	if(oldline == null) {
    		return -1;
    	}else {
    		this.lineDao.updateLine(newline);
    		JSONArray lineScheduleArray =  lineObj.getJSONArray("schedule");
    		for(int i = 0;i< lineScheduleArray.size(); i++) {
    			Map<String,Object> newlineSchedule = lineScheduleArray.getJSONObject(i);
    			this.lineDao.updateLineSchedule(newlineSchedule);
    		}
        	return 1;
    	}
    } 
}
