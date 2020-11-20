package com.xky.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xky.domain.LayUIAdapter;
import com.xky.domain.Subject;
import com.xky.domain.Teacher;
import com.xky.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/subject")
public class SubjectController {

    @Autowired
    SubjectService subjectService;

    @ResponseBody
    @RequestMapping(value = "/selectAllSubject", produces ={"text/html;charset=UTF-8;", "application/json;"})
    public LayUIAdapter selectAllSubject(int page,int limit) throws Exception{
        PageHelper.startPage(page,limit); //1、通过形参名匹配请求，这里为 1，10；自动帮分页

        List<Subject> subject = subjectService.selectAllSubject();

        PageInfo<Subject> pageInfo = new PageInfo<>(subject);
        //2、把查询出来的结果集信息交给PageInfo,做这一步的原因是要或者总数量，layui要靠返回的总数帮我们完成分页。
        //资料太少，我自己描述的信息可能有误，都是推测。

        LayUIAdapter<Subject> layUIAdapter = new LayUIAdapter<>();
        layUIAdapter.setCode(0);
        layUIAdapter.setCount((int)pageInfo.getTotal()); //3、getTotal get他的总数返回给layui，因为返回值是long要强转成int
        layUIAdapter.setData(subject);
        layUIAdapter.setMsg("ok");
        return layUIAdapter;
    }
}
