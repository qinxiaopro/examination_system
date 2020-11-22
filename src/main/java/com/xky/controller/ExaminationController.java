package com.xky.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xky.domain.Examination;
import com.xky.domain.LayUIAdapter;
import com.xky.service.ExaminationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/examination")
public class ExaminationController {
    @Autowired
    private ExaminationService examinationService;
    @ResponseBody
    @RequestMapping(value="/selectAllExamination", produces ={"text/html;charset=UTF-8;", "application/json;"})
    public LayUIAdapter selectAllSubject(int page,int limit) throws Exception{
        PageHelper.startPage(page,limit); //1、通过形参名匹配请求，这里为 1，10；自动帮分页
        List<Examination> examination = examinationService.selectAllExamination_list();
        System.out.println(examination.toString());

        PageInfo<Examination> pageInfo = new PageInfo<>(examination);
        //2、把查询出来的结果集信息交给PageInfo,做这一步的原因是要或者总数量，layui要靠返回的总数帮我们完成分页。
        //资料太少，我自己描述的信息可能有误，都是推测。

        LayUIAdapter<Examination> layUIAdapter = new LayUIAdapter<>();
        layUIAdapter.setCode(0);
        layUIAdapter.setCount((int)pageInfo.getTotal()); //3、getTotal get他的总数返回给layui，因为返回值是long要强转成int
        layUIAdapter.setData(examination);
        layUIAdapter.setMsg("ok");
        return layUIAdapter;
    }
    @RequestMapping("index")
    public void show(){
        System.out.println("kkkkkkkkk");
    }
}
