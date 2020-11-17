package com.xky.dao;

import com.xky.domain.Teacher;

import java.util.List;

public interface TeacherDao {
    List<Teacher> selectAllTeacher();

    int insertTeacher(Teacher teacher);
}
