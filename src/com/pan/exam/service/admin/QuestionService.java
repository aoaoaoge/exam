package com.pan.exam.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pan.exam.dao.admin.QuestionDao;
import com.pan.exam.entity.Question;
/**
 * 试题管理模块业务持久层
 * @author Administrator
 *
 */
public class QuestionService {
	private QuestionDao qd = new QuestionDao();
	public boolean addQuestion(String questionType,String questionContent,String rightAnswer,String source,String examPoint,String keyword,String analysis) {
		return qd.addQuestion(questionType, questionContent, rightAnswer, source, examPoint, keyword, analysis);
	}
	public boolean addOption(String questionContent,String[] optionContents){
		return qd.addOption(questionContent, optionContents);
	}
	public boolean addQuestion_KnoledgePoint(String questionContent,List<String> knoledgePointName){
		return qd.addQuestion_KnoledgePoint(questionContent, knoledgePointName);
	}
	/**
	 *添加试题
	 * @param questionType
	 * @param questionContent
	 * @param rightAnswer
	 * @param source
	 * @param examPoint
	 * @param keyword
	 * @param analysis
	 * @param optionContents
	 * @param knoledgePointName
	 * @return
	 */
	public boolean add_question(String questionType,String questionContent,String rightAnswer,String source,String examPoint,String keyword,String analysis,String[] optionContents,String[] knowledgePoints){
		boolean res = false;
		List<String> fieldNames = new ArrayList<>();
		List<String> kpNames = new ArrayList<>();
		//对知识点进行分割
		for (String kp : knowledgePoints) {
			String [] field_kp = kp.split(">");
			fieldNames.add(field_kp[0]);
			kpNames.add(field_kp[1]);
		}
		boolean res1 = this.addQuestion(questionType, questionContent, rightAnswer, source, examPoint, keyword, analysis);
		//答案表增加
		boolean res2 = this.addOption(questionContent, optionContents);
		//试题知识点中间表增加
		boolean res3 = this.addQuestion_KnoledgePoint(questionContent, kpNames);
		//System.out.println(res);
		if(res1 && res2 && res3){
			res = true;
			return res;
		}
		else return res;
	}
	/**
	 * 通过题库名查询所有试题
	 * @param Fname
	 * @return
	 */
	public Map<String, Object> showQuestByFieldName(int pageno,String fName){
		Map<String, Object> map = new HashMap<>();
		List<Question> list = qd.showQuestByFieldName(pageno, fName);
		int count = qd.countQuestByFieldName(fName);
		map.put("questions", list);
		map.put("count_questions", count);
		return map;
	}
	/**
	 * 通过知识点名查询所有试题
	 * @param Fname
	 * @return
	 */
	public Map<String, Object> shwoQusetionsByPoint(int pageno,String knowledgePointName){
		Map<String, Object> map = new HashMap<>();
		List<Question> list = qd.shwoQusetionsByPoint(pageno, knowledgePointName);
		int count = qd.countQusetionsByPoint(knowledgePointName);
		map.put("questions", list);
		map.put("count_questions", count);
		return map;
	}
	/**
	 * 更新试题类型
	 * @param qid
	 * @param knowledgePointName
	 * @return 成功或失败
	 */
	public boolean updateQusertion(int qid,String knowledgePointName){
		return qd.updateQusertion(qid, knowledgePointName);
	}
}
