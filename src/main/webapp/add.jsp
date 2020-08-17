<%--
  Created by IntelliJ IDEA.
  User: 76347
  Date: 2020/7/29
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
</head>
<body>
<table class="layui-hide" id="test" lay-filter="test"></table>


<form id="save-client" class="layui-form" lay-filter="example">
    <div class="layui-form-item">
        <label class="layui-form-label">ID</label>
        <div class="layui-input-block">
            <input name="cid" class="layui-input client-input" type="text" placeholder="请输入ID" autocomplete="off"
                   lay-verify="title">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-block">
            <input name="cname" class="layui-input client-input" type="text" placeholder="请输入账号" autocomplete="off"
                   lay-verify="title">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input name="password" class="layui-input client-input" type="password" placeholder="请输入密码"
                   autocomplete="off" lay-verify="pass">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">公司名称</label>
        <div class="layui-input-block">
            <input name="nickname" class="layui-input client-input" type="text" placeholder="请输入公司名称" autocomplete="off"
                   lay-verify="required" lay-reqText="公司名称不能为空。">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">账户金额</label>
        <div class="layui-input-block">
            <input name="money" class="layui-input client-input" type="number" placeholder="请输入账户金额" autocomplete="off"
                   lay-verify="money">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">公司地址</label>
        <div class="layui-input-block">
            <input name="addr" class="layui-input client-input" type="text" placeholder="请输入公司地址" autocomplete="off"
                   lay-verify="required" lay-reqText="公司地址不能为空">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input name="cstate" title="有效" type="radio" checked="" value="1">
            <input name="cstate" title="无效" type="radio" value="0">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="save-btn" class="layui-btn" type="submit" lay-filter="demo1" lay-submit="">立即提交</button>
            <button class="layui-btn layui-btn-primary" type="reset">重置</button>
        </div>
    </div>
</form>
<script src="layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form', 'jquery', 'layer'], function () {
        var form = layui.form
            , $ = layui.jquery
            , layer = layui.layer


        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '账号至少得5个字符';
                }
            }
            , pass: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ]
            , money: function (value) {
                if (value < 0)
                    return '账户金额只能为正数。';
            }
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
            console.log(data.field);

            $.post("saveCustomer", {
                cid:data.field.cid,
                cname:data.field.cname,
                password:data.field.password,
                nickname:data.field.nickname,
                money:data.field.money,
                addr:data.field.addr,
                cstate:data.field.cstate
            }, function (res) {

                if (res == "success") {
                    alert("添加成功")
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    setTimeout(function () { parent.layer.close(index) }, 100);//延迟
                }
            });
            return false;
        });
    });
</script>

</body>
</html>
