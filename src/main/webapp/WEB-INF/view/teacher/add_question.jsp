
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>导航</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web_resources/web_lib/layui/css/layui.css"/>
    <style>
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
        <a href="">试题管理</a>
        <a href="">添加试题</a>
      </span>
    <div style="margin-top: 50px; width:800px;">
        <form class="layui-form" action="" id="data-form">
            <div class="layui-form-item">
                <label class="layui-form-label">题目</label>
                <div class="layui-input-block">
                    <input type="text" name="title" required lay-verify="required" placeholder="请输入题目"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">类型</label>
                <div class="layui-input-inline">
                    <select name="city" lay-verify="required">
                        <option value="">选择题型</option>
                        <option value="0">单选题</option>
                        <option value="1">多选题</option>
                        <option value="2">填空题</option>
                        <option value="3">判断题</option>
                    </select>
                </div>

                <label class="layui-form-label">科目</label>
                <div class="layui-input-inline">
                    <select name="city" lay-verify="required">
                        <option value="">选择科目</option>
                        <option value="0">大学英语I</option>
                        <option value="1">大学英语II</option>
                        <option value="2">数据结构</option>
                        <option value="3">UML建模</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">正确答案</label>
                <div class="layui-input-block">
                    <input type="text" name="Tanswer" required lay-verify="required" placeholder="请输入正确答案"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div id="all-option">
                <div class="layui-form-item">
                    <label class="layui-form-label">选项</label>
                    <div class="layui-input-block">
                        <input type="text" name="option1" required lay-verify="required" placeholder="请输入答案选项"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">选项</label>
                    <div class="layui-input-block">
                        <input type="text" name="option2" required lay-verify="required" placeholder="请输入答案选项"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" id="clone-Node">
                    <label class="layui-form-label">选项</label>
                    <div class="layui-input-block">
                        <input type="text" name="option3" required lay-verify="required" placeholder="请输入答案选项"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">选项</label>
                    <div class="layui-input-block">
                        <input type="text" name="option4" required lay-verify="required" placeholder="请输入答案选项"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item icon_style">
                <div class="layui-input-block">
                    <span><a href="#" onclick="add_input()"><i class="layui-icon layui-icon-add-circle"
                                                               style="font-size: 30px; color: #1E9FFF;"></i></a></i></span>
                    <span><a href="#" onclick="cut_input()"><i class="layui-icon layui-icon-reduce-circle"
                                                               style="font-size: 30px; color: #1E9FFF;"></i> </a></i></span>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">清空</button>
                </div>
            </div>
        </form>
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
    layui.use('form', function () {
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });

    //动态添加or删除答案选项
    var i = 5;//input name起始值
    function add_input() {
        var cloneNode = document.getElementById("clone-Node");//被克隆的节点
        var newNode = cloneNode.cloneNode(true);//克隆出新的节点
        //修改新节点input name 的值
        newNode.children[1].firstElementChild.setAttribute("name", "option" + i); // 修改一下name 值，避免name 重复
        i = i + 1;
        cloneNode.parentNode.appendChild(newNode);//克隆的节点追加到父节点
    }

    function cut_input() {
        i -= 1;//删除div时 name i动态更改
        var all_option = document.getElementById("all-option");//获取父节点
        var cloneNode = document.getElementById("clone-Node");//被克隆的节点
        var lastElementChild = all_option.lastElementChild;//获取父节点最后的节点
        if (lastElementChild != cloneNode) {//只允许删除到只有三个答案选项
            lastElementChild.remove();//删除这个div
        } else return false;
    }
</script>
</html>