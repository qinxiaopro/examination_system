
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>添加考试</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/web_resources/web_lib/layui/css/layui.css"/>
</head>
<body>


<%@include file="nav.jsp"%>
<!-- 内容 -->
<div style="margin-left: 210px; margin-top: 10px; width: 1280px; height: 500px">

    <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">考试管理</a>
        <a href="">添加考试</a>
        <a><cite>自定义试卷</cite></a>
    </span>
    <br>
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
        </div>

        <div class="layui-form-item">

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>题目选择框</legend>
            </fieldset>
            <div id="test4" class="demo-transfer"></div>
        </div>
    </form>

</div>


</body>

<script>
    layui.use(['transfer', 'layer', 'util'], function(){
        var $ = layui.$
            ,transfer = layui.transfer
            ,layer = layui.layer
            ,util = layui.util;
        //模拟数据
        var data1 = [
            {"value": "1", "title": "李白"}
            ,{"value": "2", "title": "杜甫"}
            ,{"value": "3", "title": "苏轼"}
            ,{"value": "4", "title": "李清照"}
            ,{"value": "5", "title": "鲁迅", "disabled": true}
            ,{"value": "6", "title": "巴金"}
            ,{"value": "7", "title": "冰心"}
            ,{"value": "8", "title": "矛盾"}
            ,{"value": "9", "title": "贤心"}
        ]


        //显示搜索框
        transfer.render({
            elem: '#test4'
            ,data: data1
            ,title: ['选择题目', '已选择题目']
            ,showSearch: true
            ,width: 600
        })

        //批量办法定事件
        util.event('lay-demoTransferActive', {
            getData: function(othis){
                var getData = transfer.getData('key123'); //获取右侧数据
                layer.alert(JSON.stringify(getData));
            }
            ,reload:function(){
                //实例重载
                transfer.reload('key123', {
                    title: ['文人', '喜欢的文人']
                    ,value: ['2', '5', '9']
                    ,showSearch: true
                })
            }
        });

    });
</script>

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
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //常规用法
        laydate.render({
            elem: '#test1'
        });

        //国际版
        laydate.render({
            elem: '#test1-1'
            ,lang: 'en'
        });

        //年选择器
        laydate.render({
            elem: '#test2'
            ,type: 'year'
        });

        //年月选择器
        laydate.render({
            elem: '#test3'
            ,type: 'month'
        });



        //日期时间选择器
        laydate.render({
            elem: '#test5'
            ,type: 'datetime'
        });

        //日期范围
        laydate.render({
            elem: '#test6'
            ,range: true
        });

        //年范围
        laydate.render({
            elem: '#test7'
            ,type: 'year'
            ,range: true
        });

        //年月范围
        laydate.render({
            elem: '#test8'
            ,type: 'month'
            ,range: true
        });

        //时间范围
        laydate.render({
            elem: '#test9'
            ,type: 'time'
            ,range: true
        });

        //日期时间范围
        laydate.render({
            elem: '#test10'
            ,type: 'datetime'
            ,range: true
        });

        //自定义格式
        laydate.render({
            elem: '#test11'
            ,format: 'yyyy年MM月dd日'
        });
        laydate.render({
            elem: '#test12'
            ,format: 'dd/MM/yyyy'
        });
        laydate.render({
            elem: '#test13'
            ,format: 'yyyyMMdd'
        });
        laydate.render({
            elem: '#test14'
            ,type: 'time'
            ,format: 'H点m分'
        });
        laydate.render({
            elem: '#test15'
            ,type: 'month'
            ,range: '~'
            ,format: 'yyyy-MM'
        });
        laydate.render({
            elem: '#test16'
            ,type: 'datetime'
            ,range: '到'
            ,format: 'yyyy年M月d日H时m分s秒'
        });

        //开启公历节日
        laydate.render({
            elem: '#test17'
            ,calendar: true
        });

        //自定义重要日
        laydate.render({
            elem: '#test18'
            ,mark: {
                '0-10-14': '生日'
                ,'0-12-31': '跨年' //每年的日期
                ,'0-0-10': '工资' //每月某天
                ,'0-0-15': '月中'
                ,'2017-8-15': '' //如果为空字符，则默认显示数字+徽章
                ,'2099-10-14': '呵呵'
            }
            ,done: function(value, date){
                if(date.year === 2017 && date.month === 8 && date.date === 15){ //点击2017年8月15日，弹出提示语
                    layer.msg('这一天是：中国人民抗日战争胜利72周年');
                }
            }
        });

        //限定可选日期
        var ins22 = laydate.render({
            elem: '#test-limit1'
            ,min: '2016-10-14'
            ,max: '2080-10-14'
            ,ready: function(){
                ins22.hint('日期可选值设定在 <br> 2016-10-14 到 2080-10-14');
            }
        });

        //前后若干天可选，这里以7天为例
        laydate.render({
            elem: '#test-limit2'
            ,min: -7
            ,max: 7
        });

        //限定可选时间
        laydate.render({
            elem: '#test-limit3'
            ,type: 'time'
            ,min: '09:30:00'
            ,max: '17:30:00'
            ,btns: ['clear', 'confirm']
        });

        //同时绑定多个
        lay('.test-item').each(function(){
            laydate.render({
                elem: this
                ,trigger: 'click'
            });
        });

        //初始赋值
        laydate.render({
            elem: '#test19'
            ,value: '1989-10-14'
            ,isInitValue: true
        });

        //选中后的回调
        laydate.render({
            elem: '#test20'
            ,done: function(value, date){
                layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
            }
        });

        //日期切换的回调
        laydate.render({
            elem: '#test21'
            ,change: function(value, date){
                layer.msg('你选择的日期是：' + value + '<br><br>获得的对象是' + JSON.stringify(date));
            }
        });
        //不出现底部栏
        laydate.render({
            elem: '#test22'
            ,showBottom: false
        });

        //只出现确定按钮
        laydate.render({
            elem: '#test23'
            ,btns: ['confirm']
        });

        //自定义事件
        laydate.render({
            elem: '#test24'
            ,trigger: 'mousedown'
        });

        //点我触发
        laydate.render({
            elem: '#test25'
            ,eventElem: '#test25-1'
            ,trigger: 'click'
        });

        //双击我触发
        lay('#test26-1').on('dblclick', function(){
            laydate.render({
                elem: '#test26'
                ,show: true
                ,closeStop: '#test26-1'
            });
        });

        //日期只读
        laydate.render({
            elem: '#test27'
            ,trigger: 'click'
        });

        //非input元素
        laydate.render({
            elem: '#test28'
        });

        //墨绿主题
        laydate.render({
            elem: '#test29'
            ,theme: 'molv'
        });

        //自定义颜色
        laydate.render({
            elem: '#test30'
            ,theme: '#393D49'
        });

        //格子主题
        laydate.render({
            elem: '#test31'
            ,theme: 'grid'
        });


        //直接嵌套显示
        laydate.render({
            elem: '#test-n1'
            ,position: 'static'
        });
        laydate.render({
            elem: '#test-n2'
            ,position: 'static'
            ,lang: 'en'
        });
        laydate.render({
            elem: '#test-n3'
            ,type: 'month'
            ,position: 'static'
        });
        laydate.render({
            elem: '#test-n4'
            ,type: 'time'
            ,position: 'static'
        });
    });
</script>
</html>