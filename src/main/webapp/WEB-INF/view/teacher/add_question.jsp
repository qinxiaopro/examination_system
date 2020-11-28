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

<%@include file="nav.jsp" %>
<!-- 内容 -->
<div style="margin-left: 210px; margin-top: 10px; ">
    <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">试题管理</a>
        <a href="">添加试题</a>
      </span>
    <div style="margin-top: 50px; width:800px;">
        <form class="layui-form" id="data-form">
            <div class="layui-form-item">
                <label class="layui-form-label">题目</label>
                <div class="layui-input-block">
                    <input type="text" name="title" id="question" required lay-verify="required" placeholder="请输入题目"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">类型</label>
                <div class="layui-input-inline">
                    <select name="type" id="type" lay-verify="required">
                        <option value="nullSelect">选择题型</option>
                        <option value="single">单选题</option>
                        <option value="multiple">多选题</option>
                        <option value="2">填空题</option>
                    </select>
                </div>

                <label class="layui-form-label">科目</label>
                <div class="layui-input-inline">
                    <select id="subjectId">
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">正确答案</label>
                <div class="layui-input-block">
                    <input type="text" name="trueAnswer" id="trueAnswer" required lay-verify="required"
                           placeholder="请输入正确答案"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div id="all-option">
                <div class="layui-form-item">
                    <label class="layui-form-label">选项</label>
                    <div class="layui-input-block">
                        <input type="text" name="option-1" required lay-verify="required" placeholder="请输入答案选项"
                               autocomplete="off" class="layui-input option">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">选项</label>
                    <div class="layui-input-block">
                        <input type="text" name="option-2" required lay-verify="required" placeholder="请输入答案选项"
                               autocomplete="off" class="layui-input option">
                    </div>
                </div>
                <div class="layui-form-item" id="clone-Node">
                    <label class="layui-form-label">选项</label>
                    <div class="layui-input-block">
                        <input type="text" name="option-3" required lay-verify="required" placeholder="请输入答案选项"
                               autocomplete="off" class="layui-input option">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">选项</label>
                    <div class="layui-input-block">
                        <input type="text" name="option-4" required lay-verify="required" placeholder="请输入答案选项"
                               autocomplete="off" class="layui-input option">
                    </div>
                </div>
            </div>
            <div class="layui-form-item icon_style">
                <div class="layui-input-block">
                    <span><a href="#" onclick="add_input()"><i class="layui-icon layui-icon-add-circle"
                                                               style="font-size: 30px; color: #1E9FFF;"></i></a></span>
                    <span><a href="#" onclick="cut_input()"><i class="layui-icon layui-icon-reduce-circle"
                                                               style="font-size: 30px; color: #1E9FFF;"></i> </a></span>
                </div>
            </div>
        </form>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" id="btn">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">清空</button>
            </div>
        </div>

    </div>

</div>
</body>
<script src="${pageContext.request.contextPath}/web_resources/web_lib/jquery.min.js"></script>
<script>

    $(function () {
        let alldate
        $.ajax({
            // 获取教师 id
            url: "${pageContext.request.contextPath}/teacher/selectAllSubject",
            type: 'POST',
            dataType: 'json',
            async: false,
            data: {},
            success: function (data) {
                alldate = data.data;
            }
        })

        for (let i = 0; i < alldate.length; i++) {
            $("#subjectId").append("<option value='" + alldate[i].subjectId + "'>" + alldate[i].name + "</option>");
        }
    })


    ;(function () {
        let btn = document.getElementById('btn')
        btn.addEventListener('click', function (e) {
            $.ajax({
                // 获取教师 id
                url: "${pageContext.request.contextPath}/teacher/getSessionCurrentTeacher",
                type: 'POST',
                data: {},
                success: function (data) {
                    // 传入教师 teacherId
                    insertQuestionBank(data.teacherId);
                }
            })
        })
    }());

    function insertQuestionBank(teacherId) {
        // 获取题目也答案
        let question = $('#question').val();
        let answers = '';
        let trueAnswer = $('#trueAnswer').val();
        let type = $("#type").find("option:selected").val();
        let subjectId = $("#subjectId").find("option:selected").val();
        $('.option').each(function () {
            answers += ($(this).val()) + '`'
        })

        $.ajax({
            url: "${pageContext.request.contextPath}/teacher/insertQuestionBank",
            type: "POST",
            data: {
                question: question,
                answers: answers,
                trueAnswer: trueAnswer,
                type: type,
                subjectId: subjectId,
                teacherId: teacherId,
                available: 1
            },
            success: function (data) {
                if (data == 'ok') {
                    alert("添加成功")
                } else {
                    alert("添加失败")
                }
            }

        })
    }


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
        newNode.children[1].firstElementChild.setAttribute("class", "option layui-input"); // 修改一下name 值，避免name 重复
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