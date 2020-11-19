package com.xky.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/teacher")
public class TeacherNavController {

    @RequestMapping("/add_examination_ui")
    public String addExaminationUI() {
        return "teacher/add_examination";
    }

    @RequestMapping("/index_ui")
    public String indexUI() {
        return "teacher/index";
    }



    @RequestMapping("/add_question_ui")
    public String addQuestionUI() {
        return "teacher/add_question";
    }


    @RequestMapping("/my_question_ui")
    public String myQuestionUI() {
        return "teacher/my_question";
    }


    @RequestMapping("/notice_ui")
    public String noticeUI() {
        return "teacher/notice";
    }

    @RequestMapping("/select_grade_ui")
    public String selectGradeUI() {
        return "select_grade_temp";
    }

    @RequestMapping("/select_student_ui")
    public String selectStudentUI() {
        return "teacher/select_student";
    }


    @RequestMapping("/update_question_ui")
    public String updateQuestionUI() {
        return "teacher/update_question";
    }

    @RequestMapping("/teacherInfo_ui")
    public String teacherInfoUI() {
        return "teacher/teacherInfo";
    }


    @RequestMapping("/update_teacherInfo_ui")
    public String updateTeacherInfoUI() {
        return "teacher/update_teacherInfo";
    }

}
