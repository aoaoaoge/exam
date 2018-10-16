package com.pan.exam.service.admin;

import com.pan.exam.dao.admin.ExamPaperDao;

public class ExamPaperService {
	private ExamPaperDao ed =new ExamPaperDao();
	/**
	 * 新增试卷
	 * @param testpaper_name	试卷名
	 * @param methodOfPaper		组卷方式
	 * @param paperType			试卷类型
	 * @param passScoer			及格分
	 * @param score				总分
	 * @param time				时间
	 * @return
	 */
	public boolean addExamPaper(String testpaper_name,String methodOfPaper,String paperType,String passScore,String score,String time) {
			
			
		return false;
	}
	public boolean addExamPaper_Question(String testpaper_name,String[] qusetionnum,String[] points){
		
		
		return false;
	}
	public boolean addExamPaperQuestion(String testpaper_name,String methodOfPaper,String paperType,String passScore,String score,String time,String[] qusetionnum,String[] points) {
			if(this.addExamPaper(testpaper_name, methodOfPaper, paperType, passScore, score, time) && this.addExamPaper_Question(testpaper_name, qusetionnum, points)){
				return true;
			}
		return false;
	}
	/**
	 * 判断试题数量是否足够
	 * @param qusetionNum	输入的每种是题的数量
	 * @return
	 */
	public boolean countQuestion(String[] qusetionNum) {
		
		for(int i=0;i<qusetionNum.length;i++)
		{	
			if(qusetionNum[i]!=null && qusetionNum[i]!=""){
				int qusetionCount = ed.countQuestionByQuestionType(i+1);
				if(Integer.parseInt(qusetionNum[i])>qusetionCount){
					return false;
				}
			}
		}		
		return true;
	}
}
