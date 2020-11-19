
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>导航</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web_resources/web_lib/layui/css/layui.css"/>
    <script src="${pageContext.request.contextPath}/web_resources/web_lib/layui/layui.js" />
</head>
<body>
<%@include file="nav.jsp"%>
<!-- 内容 -->
<div style="margin-left: 210px; margin-top: 10px; ">
    <!--  面包屑 -->
    <span class="layui-breadcrumb">
          <a href="/index.html">首页</a>
          <a href="/index.html">班级管理</a>
          <a><cite>查询学生</cite></a>
    </span>

    <table class="layui-hide" id="test" lay-filter="test">

        <script type="text/html" id="toolbarDemo">

            <!--下拉选择框begin-->
            <div class="layui-inline" style="float: left; margin-left: 10px;">
                <div class="layui-input-inline">
                    <select name="modules" lay-verify="required" lay-search="">
                        <option value="">--请选择班级--</option>
                        <option value="1">layer</option>
                        <option value="2">form</option>
                        <option value="3">layim</option>
                        <option value="4">element</option>
                        <option value="5">laytpl</option>
                        <option value="6">upload</option>
                        <option value="7">laydate</option>
                        <option value="8">laypage</option>
                    </select>
                </div>
            </div>  <!--下拉选择框end-->

            <!--            输入学号-->
            <div class="layui-input-block" style="width: 180px;float: left; margin-left: 10px;">
                <input type="text" name="studentId" lay-verify="title" autocomplete="off" placeholder="请输入学号" class="layui-input" >
            </div>

            <button type="button" class="layui-btn  layui-btn-radius layui-btn-normal" style="margin-left: 15px;">查询</button>
            <!--            分页-->
            <div id="demo2"></div>
        </script>


    </table>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>


    <!--    监听事件-->
    <script>
        layui.use('table', function(){
            var table = layui.table;

            table.render({
                elem: '#test'
                ,url:'/test/table/demo1.json'
                ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
                ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                    title: '提示'
                    ,layEvent: 'LAYTABLE_TIPS'
                    ,icon: 'layui-icon-tips'
                }]
                ,title: '用户数据表'
                ,cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true, width:120}
                    ,{field:'username', title:'学生姓名', width:120, edit: 'text'}
                    ,{field:'email', title:'手机号', width:150, edit: 'text', templet: function(res){
                            return '<em>'+ res.email +'</em>'
                        }}
                    ,{field:'sex', title:'性别', width:80, edit: 'text', sort: true}
                    ,{field:'city', title:'地址', width:400}
                    ,{field:'experience', title:'班级', width:120, sort: true}
                    // ,{field:'ip', title:'IP', width:120}
                    // ,{field:'logins', title:'登入次数', width:100, sort: true}
                    // ,{field:'joinTime', title:'加入时间', width:120}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]]
                ,page: true
            });

            //头工具栏事件
            table.on('toolbar(test)', function(obj){
                var checkStatus = table.checkStatus(obj.config.id);
                switch(obj.event){
                    case 'getCheckData':
                        var data = checkStatus.data;
                        layer.alert(JSON.stringify(data));
                        break;
                    case 'getCheckLength':
                        var data = checkStatus.data;
                        layer.msg('选中了：'+ data.length + ' 个');
                        break;
                    case 'isAll':
                        layer.msg(checkStatus.isAll ? '全选': '未全选');
                        break;

                    //自定义头工具栏右侧图标 - 提示
                    case 'LAYTABLE_TIPS':
                        layer.alert('这是工具栏右侧自定义的一个图标按钮');
                        break;
                };
            });

            //监听行工具事件
            table.on('tool(test)', function(obj){
                var data = obj.data;
                //console.log(obj)
                if(obj.event === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        obj.del();
                        layer.close(index);
                    });
                } else if(obj.event === 'edit'){
                    layer.prompt({
                        formType: 2
                        ,value: data.email
                    }, function(value, index){
                        obj.update({
                            email: value
                        });
                        layer.close(index);
                    });
                }
            });
        });
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
</script>

</html>