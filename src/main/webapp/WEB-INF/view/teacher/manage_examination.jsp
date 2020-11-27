<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>试题管理</title>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/web_resources/web_lib/layui/css/layui.css"/>--%>
    <%--    <script src="${pageContext.request.contextPath}/web_resources/web_lib/layui/layui.js"/>--%>
    <%--    <script src="${pageContext.request.contextPath}/web_resources/web_lib/jquery.min.js"/>--%>

</head>
<body>
<%@include file="nav.jsp" %>
<!-- 内容 -->
<div style="margin-left: 210px; margin-top: 10px; width: 1280px; height: 500px">

    <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">试题管理</a>
        <a><cite>操作</cite></a>
    </span>
    <br>
    <div style="margin-top:30px; width:800px;">
        <form class="layui-form layui-inline" action="" style="margin-top: 10px">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input"
                                   placeholder="请输入考试id">
                        </div>
                    </div>
                </div>
                <div class="layui-input-inline">
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="date" name="email" lay-verify="email" autocomplete="off" class="layui-input"
                                   placeholder="请输入学生学号">
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

        <div class="layui-row" style="float: right;margin-top: 10px;margin-right: 40px;">
            <div class="layui-input-inline">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <a onclick="openAddExam()" class="layui-btn layui-btn-normal" lay-submit="" lay-filter="demo1">添加考试</a>
                    </div>
                </div>
            </div>

        </div>

        <!--    添加考试页面弹出层开始-->
        <div id="tests" style="display: none">
            <form class="layui-form layui-inline" action="" style="margin-top: 10px">
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <select name="subjects">
                            <option value="">请选择考试科目</option>
                            <option value="Java">Java</option>
                            <option value="英语">英语</option>
                            <option value="数学">数学</option>
                        </select>
                    </div>
                    <div class="layui-inline" style="margin-left: -10px">
                        <label class="layui-form-label">考试日期：</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
                        </div>
                    </div>

                    <div class="layui-inline" style="margin-left: -40px">
                        <label class="layui-form-label">时间范围</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="test9" placeholder=" - ">
                        </div>
                    </div>

                    <div class="layui-inline" style="margin-left: 50px">
                        <div class="layui-input-inline">
                            <input type="submit" class="layui-btn layui-btn-normal" id="btnadd" value="提交">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                        <legend>题目选择框</legend>
                    </fieldset>
                    <div id="test4" class="demo-transfer"></div>
                </div>
            </form>

        </div>
        <!--    添加考试页面弹出层结束-->

    </div>
    <table class="layui-hide" id="test" lay-filter="test"></table>
    <%--    表格操作按钮集--%>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="detail">查看</a>
        <a id="publish" class="layui-btn layui-btn-warm layui-btn-xs" lay-event="detail" onclick="pub()">发布</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <!--添加考试js 开始-->
    <script>
        layui.use(['transfer', 'layer', 'util'], function () {
            var $ = layui.$
                , transfer = layui.transfer
                , layer = layui.layer
                , util = layui.util;
            //模拟数据
            var data1 = [
                {"value": "1", "title": "李白"}
                , {"value": "2", "title": "杜甫"}
                , {"value": "3", "title": "苏轼"}
                , {"value": "4", "title": "李清照"}
                , {"value": "5", "title": "鲁迅", "disabled": true}
                , {"value": "6", "title": "巴金"}
                , {"value": "7", "title": "冰心"}
                , {"value": "8", "title": "矛盾"}
                , {"value": "9", "title": "贤心"}
            ]


            //显示搜索框
            transfer.render({
                elem: '#test4'
                , data: data1
                , title: ['选择题目', '已选择题目']
                , showSearch: true
                , width: 600
            })

            //批量办法定事件
            util.event('lay-demoTransferActive', {
                getData: function (othis) {
                    var getData = transfer.getData('key123'); //获取右侧数据
                    layer.alert(JSON.stringify(getData));
                }
                , reload: function () {
                    //实例重载
                    transfer.reload('key123', {
                        title: ['文人', '喜欢的文人']
                        , value: ['2', '5', '9']
                        , showSearch: true
                    })
                }
            });

        });
    </script>
    <script>
        layui.use('laydate', function () {
            var laydate = layui.laydate;

            //常规用法
            laydate.render({
                elem: '#test1'
            });

            //国际版
            laydate.render({
                elem: '#test1-1'
                , lang: 'en'
            });

            //年选择器
            laydate.render({
                elem: '#test2'
                , type: 'year'
            });

            //年月选择器
            laydate.render({
                elem: '#test3'
                , type: 'month'
            });


            //日期时间选择器
            laydate.render({
                elem: '#test5'
                , type: 'datetime'
            });

            //日期范围
            laydate.render({
                elem: '#test6'
                , range: true
            });

            //年范围
            laydate.render({
                elem: '#test7'
                , type: 'year'
                , range: true
            });

            //年月范围
            laydate.render({
                elem: '#test8'
                , type: 'month'
                , range: true
            });

            //时间范围
            laydate.render({
                elem: '#test9'
                , type: 'time'
                , range: true
            });

            //日期时间范围
            laydate.render({
                elem: '#test10'
                , type: 'datetime'
                , range: true
            });

            //自定义格式
            laydate.render({
                elem: '#test11'
                , format: 'yyyy年MM月dd日'
            });
            laydate.render({
                elem: '#test12'
                , format: 'dd/MM/yyyy'
            });
            laydate.render({
                elem: '#test13'
                , format: 'yyyyMMdd'
            });
            laydate.render({
                elem: '#test14'
                , type: 'time'
                , format: 'H点m分'
            });
            laydate.render({
                elem: '#test15'
                , type: 'month'
                , range: '~'
                , format: 'yyyy-MM'
            });
            laydate.render({
                elem: '#test16'
                , type: 'datetime'
                , range: '到'
                , format: 'yyyy年M月d日H时m分s秒'
            });

            //开启公历节日
            laydate.render({
                elem: '#test17'
                , calendar: true
            });

            //自定义重要日
            laydate.render({
                elem: '#test18'
                , mark: {
                    '0-10-14': '生日'
                    , '0-12-31': '跨年' //每年的日期
                    , '0-0-10': '工资' //每月某天
                    , '0-0-15': '月中'
                    , '2017-8-15': '' //如果为空字符，则默认显示数字+徽章
                    , '2099-10-14': '呵呵'
                }
                , done: function (value, date) {
                    if (date.year === 2017 && date.month === 8 && date.date === 15) { //点击2017年8月15日，弹出提示语
                        layer.msg('这一天是：中国人民抗日战争胜利72周年');
                    }
                }
            });

            //限定可选日期
            var ins22 = laydate.render({
                elem: '#test-limit1'
                , min: '2016-10-14'
                , max: '2080-10-14'
                , ready: function () {
                    ins22.hint('日期可选值设定在 <br> 2016-10-14 到 2080-10-14');
                }
            });

            //前后若干天可选，这里以7天为例
            laydate.render({
                elem: '#test-limit2'
                , min: -7
                , max: 7
            });

            //限定可选时间
            laydate.render({
                elem: '#test-limit3'
                , type: 'time'
                , min: '09:30:00'
                , max: '17:30:00'
                , btns: ['clear', 'confirm']
            });

            //同时绑定多个
            lay('.test-item').each(function () {
                laydate.render({
                    elem: this
                    , trigger: 'click'
                });
            });

            //初始赋值
            laydate.render({
                elem: '#test19'
                , value: '1989-10-14'
                , isInitValue: true
            });

            //选中后的回调
            laydate.render({
                elem: '#test20'
                , done: function (value, date) {
                    layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
                }
            });

            //日期切换的回调
            laydate.render({
                elem: '#test21'
                , change: function (value, date) {
                    layer.msg('你选择的日期是：' + value + '<br><br>获得的对象是' + JSON.stringify(date));
                }
            });
            //不出现底部栏
            laydate.render({
                elem: '#test22'
                , showBottom: false
            });

            //只出现确定按钮
            laydate.render({
                elem: '#test23'
                , btns: ['confirm']
            });

            //自定义事件
            laydate.render({
                elem: '#test24'
                , trigger: 'mousedown'
            });

            //点我触发
            laydate.render({
                elem: '#test25'
                , eventElem: '#test25-1'
                , trigger: 'click'
            });

            //双击我触发
            lay('#test26-1').on('dblclick', function () {
                laydate.render({
                    elem: '#test26'
                    , show: true
                    , closeStop: '#test26-1'
                });
            });

            //日期只读
            laydate.render({
                elem: '#test27'
                , trigger: 'click'
            });

            //非input元素
            laydate.render({
                elem: '#test28'
            });

            //墨绿主题
            laydate.render({
                elem: '#test29'
                , theme: 'molv'
            });

            //自定义颜色
            laydate.render({
                elem: '#test30'
                , theme: '#393D49'
            });

            //格子主题
            laydate.render({
                elem: '#test31'
                , theme: 'grid'
            });


            //直接嵌套显示
            laydate.render({
                elem: '#test-n1'
                , position: 'static'
            });
            laydate.render({
                elem: '#test-n2'
                , position: 'static'
                , lang: 'en'
            });
            laydate.render({
                elem: '#test-n3'
                , type: 'month'
                , position: 'static'
            });
            laydate.render({
                elem: '#test-n4'
                , type: 'time'
                , position: 'static'
            });
        });
    </script>
    <!--添加考试js 结束-->
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
        layui.use('table', function () {
            var table = layui.table;
            table.render({
                elem: '#test'
                , url: '${pageContext.request.contextPath}/examination/selectAllExamination'
                , defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                    title: '提示'
                    , layEvent: 'LAYTABLE_TIPS'
                    , icon: 'layui-icon-tips'
                }]
                , title: '用户数据表'
                , cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'examinationId', title: 'ID', width: 100, fixed: 'left', unresize: true, sort: true}
                    , {field: 'subjectName', title: '科目名称', width: 120, edit: 'text'}
                    , {
                        field: 'date',
                        title: '开始日期',
                        width: 200,
                        templet: "<div>{{layui.util.toDateString(d.ordertime, 'yyyy年MM月dd日')}}</div>"
                    }
                    , {field: 'startTime', title: '开始时间', width: 200}
                    , {field: 'endTime', title: '结束时间', width: 200}
                    , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 380}
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

        //取消发布的操作..
        function pub() {
            //测试弹出
            alert(document.getElementById("publish").innerHTML = '取消发布');
        }

        <!--打开添加考试页面-->
        function openAddExam() {
            var $ = layui.jquery;
            layer.open({
                type: 1,
                area: ['1300px', '600px'],
                shadeClose: true,
                title: '添加考试',
                content: $("#tests"),
                shade: 0,
            });

        }

        //监听弹出层表单提交事件...

    </script>
</div>
</body>
</html>