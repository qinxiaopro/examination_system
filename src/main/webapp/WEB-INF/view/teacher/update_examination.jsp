<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>notic</title>
</head>
<body>

<%@include file="nav.jsp"%>

<div style="margin-left: 210px; margin-top: 10px; ">
    <a href="${pageContext.request.contextPath}/teacher/add_examination_ui">更新考试</a> <br>
</div>
</body>

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
