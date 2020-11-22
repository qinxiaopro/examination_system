package com.xky.dao;

import com.xky.domain.Subject;
import com.xky.domain.Teacher;

import java.util.List;

public interface SubjectDao {
//    获取所有可用科目列表
    List<Subject> selectAllSubject();
    Subject selectSubjectById(Integer id);
}
