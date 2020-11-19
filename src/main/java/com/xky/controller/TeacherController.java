package com.xky.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
    @RequestMapping(value = "/selectAllTeacher", produces ={"text/html;charset=UTF-8;", "application/json;"})
    public LayUIAdapter selectAllTeacher(int page,int limit) throws Exception {

        PageHelper.startPage(page,limit); //1、通过形参名匹配请求，这里为 1，10；自动帮分页

        List<Teacher> teachers = teacherService.selectAllTeacher();

        PageInfo<Teacher> pageInfo = new PageInfo<>(teachers);
        //2、把查询出来的结果集信息交给PageInfo,做这一步的原因是要或者总数量，layui要靠返回的总数帮我们完成分页。
        //资料太少，我自己描述的信息可能有误，都是推测。

        LayUIAdapter<Teacher> layUIAdapter = new LayUIAdapter<>();
        layUIAdapter.setCode(0);
        layUIAdapter.setCount((int)pageInfo.getTotal()); //3、getTotal get他的总数返回给layui，因为返回值是long要强转成int
        layUIAdapter.setData(teachers);
        layUIAdapter.setMsg("ok");
        return layUIAdapter;
    }

    @RequestMapping("/gradeUI")
    public String gradeUI() {
//        return "teacher/select_grade";
        return "teacher/notice";
    }

}
