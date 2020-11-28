package com.xky.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xky.domain.LayUIAdapter;
import com.xky.domain.QuestionBank;
import com.xky.domain.Subject;
import com.xky.domain.Teacher;
import com.xky.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;


    @ResponseBody
    @RequestMapping(value = "/selectAllTeacher", produces = {"text/html;charset=UTF-8;", "application/json;"})
    public LayUIAdapter selectAllTeacher(int page, int limit) throws Exception {
        PageHelper.startPage(page, limit); //1、通过形参名匹配请求，这里为 1，10；自动帮分页
        List<Teacher> teachers = teacherService.selectAllTeacher();
        PageInfo<Teacher> pageInfo = new PageInfo<>(teachers);
        //2、把查询出来的结果集信息交给PageInfo,做这一步的原因是要或者总数量，layui要靠返回的总数帮我们完成分页。
        //资料太少，我自己描述的信息可能有误，都是推测。
        LayUIAdapter<Teacher> layUIAdapter = new LayUIAdapter<>();
        layUIAdapter.setCode(0);
        layUIAdapter.setCount((int) pageInfo.getTotal()); //3、getTotal get他的总数返回给layui，因为返回值是long要强转成int
        layUIAdapter.setData(teachers);
        layUIAdapter.setMsg("ok");
        return layUIAdapter;
    }


    @ResponseBody
    @RequestMapping("/insertQuestionBank")
    public String insertQuestionBank(QuestionBank questionBank) {

        System.out.println(questionBank.getAnswers());
        int i = teacherService.insertQuestionBank(questionBank);
        return i > 0 ? "ok" : "no";
    }

    @ResponseBody
    @RequestMapping("/getSessionCurrentTeacher")
    public Teacher getSessionCurrentTeacher() {
        // 预留: 登录后再从 session 中获取出来
        Teacher teacher = new Teacher();
        teacher.setTeacherId(7);
        return teacher;
    }

    @ResponseBody
    @RequestMapping("/selectAllSubject")
    public LayUIAdapter selectAllSubject() throws Exception {
        List<Subject> subjects = teacherService.selectAllSubject();
        LayUIAdapter<Subject> layUIAdapter = new LayUIAdapter<>();
        layUIAdapter.setCode(0);
        layUIAdapter.setCount(subjects.size()); //3、getTotal get他的总数返回给layui，因为返回值是long要强转成int
        layUIAdapter.setData(subjects);
        layUIAdapter.setMsg("ok");
        return layUIAdapter;
    }

    @ResponseBody
    @RequestMapping(value = "/currentTeacherQuestionBank",produces = {"text/html;charset=UTF-8;", "application/json;"})
    public LayUIAdapter currentTeacherQuestionBank(int page, int limit) throws Exception {
        PageHelper.startPage(page, limit); //1、通过形参名匹配请求，这里为 1，10；自动帮分页


        Teacher teacher = new Teacher();
        teacher.setTeacherId(7);
        /*
            从 session 中获取出 当前登录的教师 id
         */
        List<QuestionBank> currentTeacherQuestionBank = teacherService.selectCurrentTeacherQuestionBank(teacher);
        PageInfo<QuestionBank> pageInfo = new PageInfo<>(currentTeacherQuestionBank);

        LayUIAdapter<QuestionBank> layUIAdapter = new LayUIAdapter<>();
        layUIAdapter.setCode(0);
        layUIAdapter.setCount((int)pageInfo.getTotal()); //3、getTotal get他的总数返回给layui，因为返回值是long要强转成int
        layUIAdapter.setData(currentTeacherQuestionBank);
        layUIAdapter.setMsg("ok");
        return layUIAdapter;
    }

}
