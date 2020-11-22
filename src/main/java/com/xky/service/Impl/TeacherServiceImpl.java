package com.xky.service.Impl;

import com.xky.dao.TeacherDao;
import com.xky.domain.Teacher;
import com.xky.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherDao teacherDao;

    @Override
    public List<Teacher> selectAllTeacher() {
        return teacherDao.selectAllTeacher();
    }
}
