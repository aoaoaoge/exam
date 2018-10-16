package com.pan.exam.service.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pan.exam.dao.user.RdmExeDao;
import com.pan.exam.entity.Option;
import com.pan.exam.entity.TestQuestions;

public class RdmExeService {

	RdmExeDao exedao = new RdmExeDao();
	int count = exedao.pageCount();
	int num=10;
	int[] rdmquesid=randomCommon(1, count, num);	
	/**
	 * 查询题目
	 * 
	 * @param int
	 *            page,int size
	 * @return
	 */
	public Map<String, Object> tm(int page, int size ) {
		
		
		List<TestQuestions> users = exedao.queryAllUsersOnpage(page, size, rdmquesid);
		//
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", users);//
		map.put("count", num);
		return map;
	}

	/**
	 * 根据题目查询对应选项
	 * 
	 * @param testquestion_id
	 * @return
	 */
	public Map<String, Object> xx(String testquestion_id) {
		List<Option> option = exedao.queryoption(testquestion_id);
		Map<String, Object> map = new HashMap<>();
		map.put("option", option);
		return map;
	}

	// 获取随机数
	public static int[] randomCommon(int min, int max, int n) {
		if (n > (max - min + 1) || max < min) {
			return null;
		}
		int[] result = new int[n];
		int count = 0;
		while (count < n) {
			int num = (int) (Math.random() * (max - min)) + min;
			boolean flag = true;
			for (int j = 0; j < n; j++) {
				if (num == result[j]) {
					flag = false;
					break;
				}
			}
			if (flag) {
				result[count] = num;
				count++;
			}
		}
		return result;
	}
}
