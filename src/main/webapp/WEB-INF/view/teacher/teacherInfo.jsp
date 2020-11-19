
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>导航</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web_resources/web_lib/layui/css/layui.css"/>
    <style>
        .input_space input{
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .icon_style{
            text-align: center;
        }
        .icon_style span{
            margin:20px 50px 100px 50px;
        }
    </style>
</head>
<body>

<%@include file="nav.jsp"%>

<!-- 内容 -->
<div style="margin-left: 210px; margin-top: 10px; ">
    <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">教师个人信息</a>
      </span>
    <div style="margin-top: 50px; width:800px;">
        <div style="margin-top: 30px; width:800px;">
            <form class="layui-form" action="" id="data-form">
                <div style=float:left>
                    <div class="layui-form-item">
                        <label class="layui-form-label">职工号</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required  lay-verify="required" placeholder="职工号" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required  lay-verify="required" placeholder="姓名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="nan" title="男">
                            <input type="radio" name="sex" value="nv" title="女" checked>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">年龄</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required  lay-verify="required" placeholder="年龄" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div style="float: right">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="margin-top: 35px;">照片</label>
                        <div class="layui-input-block">
                            <img src="../../web_resources/web_lib/layui/images/default_log.png" style="width:100px;height:100px;">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">手机号码</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required  lay-verify="required" placeholder="手机号码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">地址</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required  lay-verify="required" placeholder="地址" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                </div>

            </form>
        </div>
    </div>
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

    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</html>