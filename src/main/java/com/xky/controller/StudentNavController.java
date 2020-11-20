package com.xky.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentNavController {

    @RequestMapping("/index_ui")
    public String indexUI() {
        return "student/index";
    }

    @RequestMapping("/signup_examination_ui")
    public String signupExaminationUI() {
        return "student/signup_examination";
    }

    @RequestMapping("/my_examination_ui")
    public String myExaminationUI() {
        return "student/my_examination";
    }

    @RequestMapping("/on-line_my_examination_ui")
    public String onLineMyExaminationUI() {
        return "student/on-line_my_examination";
    }

    @RequestMapping("/test_examination_ui")
    public String testExaminationUI() {
        return "student/test_examination";
    }

    @RequestMapping("/simulation_examination_ui")
    public String simulationExaminationUI() {
        return "student/simulation_examination";
    }

    @RequestMapping("/select_grades_ui")
    public String selectGradesUI() {
        return "student/select_grades";
    }

    @RequestMapping("/confirmation_massage_ui")
    public String confirmationMassageUI() {
        return "student/confirmation_massage";
    }

    @RequestMapping("/update_studentInfo_ui")
    public String updateStudentInfoUI() {
        return "student/update_studentInfo";
    }

}
