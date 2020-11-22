<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web_resources/web_lib/layui/css/layui.css"/>
</head>
<body>
<ul class="layui-nav">
    <li class="layui-nav-item">
        <a href="">&nbsp;</a>
    </li>
    <li class="layui-nav-item">
        <a href=""></a>
    </li>
    <li class="layui-nav-item" lay-unselect="" style="float: right">
        <a href="javascript:;"><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
        <dl class="layui-nav-child">
            <dd><a href="javascript:;">修改信息</a></dd>
            <dd><a href="javascript:;">安全管理</a></dd>
            <dd><a href="javascript:;">退出</a></dd>
        </dl>
    </li>
</ul>


<ul class="layui-nav layui-nav-tree layui-inline layui-nav-side" lay-filter="demo"
    style="margin-right: 20px; margin-top: 60px">
    <li class="layui-nav-item">
        <a href="javascript:;">班级管理</a>
        <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/teacher/select_student_ui">查询学生</a></dd>

            <dd><a href="${pageContext.request.contextPath}/teacher/select_grade_ui">查看成绩</a></dd>

            <dd><a href="${pageContext.request.contextPath}/teacher/notice_ui">公告发布</a></dd>
        </dl>
    </li>

    <li class="layui-nav-item layui-nav-itemed">
        <a href="${pageContext.request.contextPath}/teacher/subject_ui">科目管理</a>
    </li>

    <li class="layui-nav-item">
        <a href="javascript:;">试题管理</a>
        <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/teacher/update_question_ui">修改试题</a></dd>
            <dd><a href="${pageContext.request.contextPath}/teacher/add_question_ui">添加试题</a></dd>
            <dd><a href="${pageContext.request.contextPath}/teacher/my_question_ui">我的录题</a></dd>
        </dl>
    </li>

    <li class="layui-nav-item">
        <a href="javascript:;">考试管理</a>
        <dl class="layui-nav-child">
            <%--            <dd><a href="${pageContext.request.contextPath}/teacher/add_examination_ui">添加考试</a></dd>--%>
            <dd><a href="${pageContext.request.contextPath}/teacher/examination_ui">操作</a></dd>


            <%--            <dd><a href="${pageContext.request.contextPath}/teacher/update_examination_ui">修改考试</a></dd>--%>
            <%--            <dd><a href="${pageContext.request.contextPath}/teacher/delete_examination_ui">删除考试</a></dd>--%>
            <%--            <dd><a href="${pageContext.request.contextPath}/teacher/select_examination_ui">查看考试</a></dd>--%>
            <%--            <dd><a href="${pageContext.request.contextPath}/teacher/publish_examination_ui">发布考试</a></dd>--%>

        </dl>
    </li>

    <li class="layui-nav-item layui-nav-itemed">
        <a href="${pageContext.request.contextPath}/teacher/select_examinee_ui">查询考生</a>
    </li>
</ul>

</body>
<script src="${pageContext.request.contextPath}/web_resources/web_lib/layui/layui.js"/>

<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>


</html>
