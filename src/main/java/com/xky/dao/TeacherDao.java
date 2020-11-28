package com.xky.dao;

import com.xky.domain.QuestionBank;
import com.xky.domain.Subject;
import com.xky.domain.Teacher;

import java.util.List;

public interface TeacherDao {
    List<Teacher> selectAllTeacher();

    /**
     * 往题库添加题目
     *
     * @param questionBank 题库
     * @return 受影响的行数
     */
    int insertQuestionBank(QuestionBank questionBank);


    /**
     * 查询所有的科目
     *
     * @return 所有的科目
     */

    List<Subject> selectAllSubject();


    /**
     * 查询当前登录教师所录入的题库
     *
     * @param teacher 当前登录的教师
     * @return 当前登录教师所有录入的题目
     */
    List<QuestionBank> selectCurrentTeacherQuestionBank(Teacher teacher);

}
