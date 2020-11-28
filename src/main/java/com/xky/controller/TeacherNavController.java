package com.xky.controller;

import com.xky.dao.TeacherDao;
import com.xky.domain.QuestionBank;
import com.xky.domain.Teacher;
import com.xky.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherNavController {

    @Autowired
    private TeacherService teacherService;

    @RequestMapping("/add_examination_ui")
    public String addExaminationUI() {
        return "teacher/add_examination";
    }

    @RequestMapping("/index_ui")
    public String indexUI() {
        return "teacher/index";
    }

    @RequestMapping("/examination_ui")
    public String examination_ui() {
        return "teacher/manage_examination";
    }

    @RequestMapping("/add_question_ui")
    public String addQuestionUI() {
        return "teacher/add_question";
    }


    @RequestMapping("/my_question_ui")
    public String myQuestionUI(Model model) {



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
