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
        return "teacher/select_grade";
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

    @RequestMapping("/update_examination_ui")
    public String updateExaminationUI() {
        return "teacher/update_examination";
    }


    @RequestMapping("/update_teacherInfo_ui")
    public String updateTeacherInfoUI() {
        return "teacher/update_teacherInfo";
    }

    @RequestMapping("/select_examinee_ui")
    public String selectExamineeUI() {
        System.out.println("e");
        System.out.println("h");
        return "teacher/select_examinee";
    }

    @RequestMapping("/subject_ui")
    public String subjectUi() {
        return "teacher/subject";
    }

    @RequestMapping("/delete_examination_ui")
    public String deleteExaminationUi() {
        return "teacher/delete_examination";
    }

    @RequestMapping("/select_examination_ui")
    public String selectExaminationUi() {
        return "teacher/select_examination";
    }


    @RequestMapping("/publish_examination_ui")
    public String publishExaminationUi() {
        return "teacher/publish_examination";
    }


}
