<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>修改个人信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web_resources/web_lib/layui/css/layui.css"/>

    <style>
        .input_space input {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .icon_style {
            text-align: center;
        }

        .icon_style span {
            margin: 20px 50px 100px 50px;
        }
    </style>
</head>
<body>
<%@include file="nav.jsp"%>

<!-- 内容 -->
<div style="margin-left: 210px; margin-top: 10px; ">
    <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">修改学生个人信息</a>
      </span>
    <div style="margin-top: 50px; width:800px;">
        <div style="margin-top: 30px; width:800px;">
            <form class="layui-form" action="" id="data-form">
                <div style=float:left>
                    <div class="layui-form-item">
                        <label class="layui-form-label">学号</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required lay-verify="required" placeholder="学号"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required lay-verify="required" placeholder="姓名"
                                   autocomplete="off" class="layui-input">
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
                            <input type="text" name="title" required lay-verify="required" placeholder="年龄"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div style="float: right">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="margin-top: 35px;">照片</label>
                        <div class="layui-input-block">

                            <button type="button" class="layui-btn" id="addlog">
                                <i class="layui-icon">&#xe67c;</i>点击上传图片
                            </button>
                            <img id="Teacherlog" src="../../web_resources/web_lib/layui/images/default_log.png"
                                 style="width:100px;height:100px;">

                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">手机号码</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required lay-verify="required" placeholder="手机号码"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">地址</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required lay-verify="required" placeholder="地址"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button id="addbtn" class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">清空</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

<script src="${pageContext.request.contextPath}/web_resources/web_lib/layui/layui.js"></script>
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

    //Demo
    layui.use('form', function () {
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
    //上传图片
    layui.use('upload', function () {
        var upload = layui.upload;

        //执行实例
        var uploadInst = upload.render({
            elem: '#addlog'
            , url: '/api/upload/'
            , auto: false //选择文件后不自动上传
            , bindAction: '#testListAction' //指向一个按钮触发上传
            , choose: function (obj) {
                //将每次选择的文件追加到文件队列
                var files = obj.pushFile();

                //预读本地文件，如果是多文件，则会遍历。(不支持ie8/9)
                obj.preview(function (index, file, result) {
                    console.log(index); //得到文件索引
                    console.log(file); //得到文件对象
                    console.log(result); //得到文件base64编码，比如图片
                    var TeacherlogEle = document.getElementById("Teacherlog");
                    TeacherlogEle.setAttribute("src", result);//预览上传的图片
                    //obj.resetFile(index, file, '123.jpg'); //重命名文件名，layui 2.3.0 开始新增
                    //这里还可以做一些 append 文件列表 DOM 的操作
                    //obj.upload(index, file); //对上传失败的单个文件重新上传，一般在某个事件中使用
                    //delete files[index]; //删除列表中对应的文件，一般在某个事件中使用
                });
            }
        });
    });
</script>
</html>