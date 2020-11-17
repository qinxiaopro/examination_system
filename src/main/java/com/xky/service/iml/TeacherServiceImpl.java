package com.xky.service.iml;

import com.xky.dao.TeacherDao;
import com.xky.domain.Teacher;
import com.xky.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {
//     <link rel="stylesheet" href="${pageContext.request.contextPath}/web_resources/web_lib/layui/css/layui.css"/>
    //            , url: '${pageContext.request.contextPath}/teacher/selectAllTeacher'
    @Autowired
    private TeacherDao teacherDao;

    @Override
    public List<Teacher> selectAllTeacher() {

        return teacherDao.selectAllTeacher();
    }
}
