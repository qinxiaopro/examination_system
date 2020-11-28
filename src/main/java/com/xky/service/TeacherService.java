package com.xky.service;

import com.xky.domain.QuestionBank;
import com.xky.domain.Subject;
import com.xky.domain.Teacher;

import java.util.List;

public interface TeacherService {
    List<Subject> selectAllSubject();
    List<Teacher> selectAllTeacher();
    int insertQuestionBank(QuestionBank questionBank);
    List<QuestionBank> selectCurrentTeacherQuestionBank(Teacher teacher);

}
