<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>查询成绩</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web_resources/web_lib/layui/css/layui.css"/>

</head>
<body>

<ul class="layui-nav" >
    <li class="layui-nav-item">
        <a href="">&nbsp;</a>
    </li>
    <li class="layui-nav-item">
        <a href=""></a>
    </li>
    <li class="layui-nav-item" lay-unselect="" style="float: right">
        <a href="javascript:;"><img src="//t.cn/RCzsdCq" class="layui-nav-img" >我</a>
        <dl class="layui-nav-child">
            <dd><a href="javascript:;">修改信息</a></dd>
            <dd><a href="javascript:;">安全管理</a></dd>
            <dd><a href="javascript:;">退出</a></dd>
        </dl>
    </li>
</ul>


<ul class="layui-nav layui-nav-tree layui-inline layui-nav-side" lay-filter="demo" style="margin-right: 20px;  margin-top: 60px">
    <li class="layui-nav-item">
        <a href="javascript:;">班级管理</a>
        <dl class="layui-nav-child">
            <dd><a href="select_student.html" >查询学生</a></dd>
            <dd><a href="select_grade.html">查看成绩</a></dd>
            <dd><a href="notice.html">公告发布</a></dd>
        </dl>
    </li>

    <li class="layui-nav-item layui-nav-itemed">
        <a href="subject.html">科目管理</a>
    </li>

    <li class="layui-nav-item">
        <a href="javascript:;">试题管理</a>
        <dl class="layui-nav-child">
            <dd><a href="update_question.html">修改试题</a></dd>
            <dd><a href="add_question.html">添加试题</a></dd>
            <dd><a href="my_question.html">我的录题</a></dd>
        </dl>
    </li>

    <li class="layui-nav-item">
        <a href="javascript:;">考试管理</a>
        <dl class="layui-nav-child">
            <dd><a href="add_examination.html">添加考试</a></dd>
            <dd><a href="update_examination.html">修改考试</a></dd>
            <dd><a href="delete_examination.html">删除考试</a></dd>
            <dd><a href="select_examination.html">查看考试</a></dd>
            <dd><a href="publish_examination.html">发布考试</a></dd>
        </dl>
    </li>

    <li class="layui-nav-item layui-nav-itemed">
        <a href="select_examinee.html">查询考生</a>
    </li>
</ul>

<!-- 内容 -->
<div style="margin-left: 210px; margin-top: 10px; width: 1280px; height: 500px">

    <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">班级管理</a>
        <a><cite>查询成绩</cite></a>
    </span>
    <br>
    <form class="layui-form layui-inline" action="" style="margin-top: 10px">
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <select name="subjects">
                    <option value="">请选择科目</option>
                    <option value="Java">Java</option>
                    <option value="英语">英语</option>
                    <option value="数学">数学</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="classes">
                    <option value="">请选择班级</option>
                    <option value="软件一班">软件一班</option>
                    <option value="软件二班" disabled="">软件二班</option>

                </select>
            </div>
            <div class="layui-input-inline">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input" placeholder="请输入学生学号">
                    </div>
                </div>
            </div>

            <div class="layui-input-inline">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即查询</button>
                    </div>
                </div>
            </div>
        </div>
    </form>


    <table class="layui-hide" id="test"></table>






</div>


</body>

<script src="${pageContext.request.contextPath}/web_resources/web_lib/layui/layui.js" />

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });


    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });


    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#test'
            , url: '${pageContext.request.contextPath}/teacher/selectAllTeacher'
            ,cols: [[
                {field:'teacherId', width:100, title: '学号', sort: true}
                ,{field:'name', width:150, title: '用户名'}
                ,{field:'gender', width:150, title: 'gender'}
                ,{field:'age', width:150, title: 'age'}
                ,{field:'phone', width:150, title: 'phone'}
                ,{field:'address', width:150, title: 'address'}
                ,{field:'imgPath', width:150, title: 'imgPath'}
            ]]
            ,page: true
            ,toolbar: true
        });


    });
</script>

</html>







