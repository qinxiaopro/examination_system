package com.xky.controller;

import com.xky.domain.LayUIAdapter;
import com.xky.domain.Teacher;
import com.xky.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;


    @ResponseBody
    @RequestMapping("/selectAllTeacher")
    public LayUIAdapter selectAllTeacher() throws Exception {
        List<Teacher> teachers = teacherService.selectAllTeacher();
        LayUIAdapter<Teacher> layUIAdapter = new LayUIAdapter<>();
        layUIAdapter.setCode(0);
        layUIAdapter.setCount(teachers.size());
        layUIAdapter.setData(teachers);
        layUIAdapter.setMsg("ok");
        return layUIAdapter;
    }

    @RequestMapping("/gradeUI")
    public String gradeUI() {
        return "teacher/select_grade";
    }

}
