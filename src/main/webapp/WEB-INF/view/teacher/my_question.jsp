<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>导航</title>
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
        <a href="">试题管理</a>
      </span>
    <div style="margin-top: 30px;margin-left: 20px;">


        <table class="layui-hide" id="test" lay-filter="test">
            <script type="text/html" id="toolbarDemo">
                <div style="margin-top:1px; width: 800px;">
                    <form class="layui-form" action="" id="data-form">
                        <div class="layui-form-item">
                            <label class="layui-form-label">试题id</label>
                            <div class="layui-input-inline">
                                <input type="text" name="title" required lay-verify="required" placeholder="请输入试题id"
                                       autocomplete="off" class="layui-input">
                            </div>
                            <label class="layui-form-label">题目id</label>
                            <div class="layui-input-inline">
                                <input type="text" name="title" required lay-verify="required" placeholder="请输入题目id"
                                       autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-input-inline" style="float:right;margin-right:50px;">
                            <span>
                                <button class="layui-btn-normal" type="submit" id="btn"
                                        style="border: none;background:none"><i
                                        class="layui-icon layui-icon-search"
                                        style="font-size: 35px;">
                                    </i>
                            </button>
                            </span>
                            </div>
                        </div>
                    </form>
                </div>

            </script>
        </table>

        <!--    分页-->
        <div id="test1"></div>
    </div>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
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
    //动态表格
    layui.use('table', function () {
        var table = layui.table;

        table.render({
            elem: '#test'
            , url: '/test/table/demo1.json'
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                , layEvent: 'LAYTABLE_TIPS'
                , icon: 'layui-icon-tips'
            }]
            , title: '用户数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', width: 80, fixed: 'left', unresize: true, sort: true, width: 120}
                , {field: 'username', title: '试题id', width: 120, edit: 'text'}
                , {
                    field: 'email', title: '题库id', width: 150, edit: 'text', templet: function (res) {
                        return '<em>' + res.email + '</em>'
                    }
                }
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
            ]]
            , page: true
        });

        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                layer.prompt({
                    formType: 2
                    , value: data.email
                }, function (value, index) {
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
        });
    });

    layui.use('laypage', function () {
        var laypage = layui.laypage;
        //执行一个laypage实例
        laypage.render({
            elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
            , count: 50 //数据总数，从服务端得到
        });
    });
</script>
</html>
