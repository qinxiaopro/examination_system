<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>导航</title>
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
            <dd><a href="${pageContext.request.contextPath}/student/update_studentInfo_ui">修改信息</a></dd>
            <dd><a href="javascript:;">安全管理</a></dd>
            <dd><a href="javascript:;">退出</a></dd>
        </dl>
    </li>
</ul>


<ul class="layui-nav layui-nav-tree layui-inline layui-nav-side" lay-filter="demo"
    style="margin-right: 20px;  margin-top: 60px">

    <li class="layui-nav-item">
        <a href="${pageContext.request.contextPath}/student/index_ui">查看公告</a>
    </li>

    <li class="layui-nav-item">
        <a href="${pageContext.request.contextPath}/student/signup_examination_ui">报名考试</a>
    </li>


    <li class="layui-nav-item layui-nav-itemed">
        <a href="${pageContext.request.contextPath}/student/my_examination_ui">我的考试</a>
    </li>

    <li class="layui-nav-item">
        <a href="${pageContext.request.contextPath}/student/on-line_my_examination_ui">在线考试</a>
    </li>


    <li class="layui-nav-item">
        <a href="javascript:;">考模练习</a>
        <dl class="layui-nav-child">
            <dd><a href="${pageContext.request.contextPath}/student/test_examination_ui">测验考试</a></dd>
            <dd><a href="${pageContext.request.contextPath}/student/simulation_examination_ui">模拟考试</a></dd>
        </dl>
    </li>

    <li class="layui-nav-item layui-nav-itemed">
        <a href="${pageContext.request.contextPath}/student/select_grades_ui">查看成绩</a>
    </li>
</ul>


</body>
<script src="${pageContext.request.contextPath}/web_resources/web_lib/layui/layui.js" />
<script src="${pageContext.request.contextPath}/web_resources/web_lib/jquery.js"></script>

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