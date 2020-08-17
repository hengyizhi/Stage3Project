<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<!-- 用户信息更新弹框 -->
<div style="display:none;padding: 25px" id="updateDiv">
    <form class="layui-form" action="updateCustomer" method="POST" lay-filter = "datafrm">
        <div class="layui-form-item">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-inline">
                <input type=0"text" name="cid" lay-verify="cid" autocomplete="off" placeholder="用户ID" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="cname" lay-verify="cname" autocomplete="off" placeholder="请输入账号" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="pass" autocomplete="off" placeholder="请输入密码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">公司名称</label>
            <div class="layui-input-inline">
                <input type="text" name="nickname"  lay-verify="nickname" autocomplete="off" placeholder="用户的个性名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地址</label>
            <div class="layui-input-inline">
                <input type="text" name="addr"  autocomplete="off" placeholder="请输入正确的地址信息" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">账户金额</label>
            <div class="layui-input-inline">
                <input type="number" name="money"  value="0" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <input type="text" name="cstate"  value="0" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<!-- 弹框 -->


<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
<%--        <button class="layui-btn layui-btn-sm" onclick="window.location.href='insertCustomer.jsp';">新增</button>--%>
        <button class="layui-btn layui-btn-sm" lay-event="add">新增</button>
        <button class="layui-btn layui-btn-sm" lay-event="delete">批量删除</button>
        <button class="layui-btn layui-btn-sm" lay-event="getNumber">选中条目数统计</button>

    </div>
</script>

<script type="text/html" id="barDemo">
    <a id="update" class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a id="del" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<table id="demo" lay-filter="test"></table>
<script>

    layui.use(['table', 'jquery','layer','form'], function(){
        var table = layui.table ;//表格
        var $ = layui.jquery;
        var form = layui.form;
        var layer = layui.layer;

        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 500
            ,url: 'CustomersLayUI/' //数据接口
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            //,page: true //开启分页
            ,id:'CustomerListTable'
            ,cellMinWidth: 50
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'cid', title: 'ID', sort: true, fixed: 'left'}
                ,{field: 'cname', title: '账号'}
                ,{field: 'nickname', title: '公司名称', sort: true}
                ,{field: 'money', title: '账户金额', sort: true}
                ,{field: 'addr', title: '公司地址', }
                ,{field: 'cstate', title: '状态', sort: true}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]]
            ,page: {
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                ,curr: 1 //设定初始在第 1 页
                , groups: 2 //只显示 1 个连续页码
                ,limit:8
                ,limits:[4,8,10,20,25]
            }
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'delete':
                    layer.confirm('确认删除吗', function () {
                        var data = checkStatus.data;

                        layer.alert(JSON.stringify(data));
                        alert(JSON.stringify(data));

                        var temp = document.createElement("form");
                        temp.action = "deleteCustomers";
                        temp.method = "post";
                        temp.style.display = "none";

                        var opt2 = document.createElement("input");
                        opt2.name = "clients";
                        opt2.value = JSON.stringify(data);
                        temp.appendChild(opt2);

                        document.body.appendChild(temp);
                        temp.submit();
                    })
                    break;

                case 'add':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    layer.open({
                        type:2,
                        title:'新增客户',
                        shadeClose:true,
                        shade:0.8,
                        area:['480px', '72%'],
                        shadeClose:false,
                        content:'add.jsp',
                        end:function () {
                            window.location.href='customerTable.jsp',target='content';
                        }
                    })
                    break;

                case 'getNumber':
                    var data = checkStatus.data;
                    layer.msg('选中了'+ data.length + '个');
                    break;
            };
        });


        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'del'){
                // console.log(data.id);
                layer.confirm('是否删除用户' + data.nickname, function(index){
                    $.post("deleteCustomer/" + data.cid , function (res) {
                        if (res == "success") {
                            layer.msg('删除成功',  {time: 1000}, function () {
                                layer.close(index);
                                window.location.href = 'customerTable.jsp', target = 'content';
                            });
                        } else {
                            layer.msg('删除失败', {time:1000}, function () {
                                layer.close(index);
                            });
                        }
                    })

                });
            }else if(obj.event === 'edit'){
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
                //  openUpdate(data);
                layer.open({
                    type: 1,
                    title:"修改信息",
                    content:$("#updateDiv"),
                    area:['550px','450px'],
                    success:function (index) {
                        form.val('datafrm',data);
                    }
                });
            }else if(obj.event === 'save'){
                // layer.alert('编辑行：<br>'+ JSON.stringify(data))
                //  openUpdate(data);
                layer.open({
                    type: 1,
                    title:"新增用户",
                    content:$("#saveDiv"),
                    area:['550px','450px'],
                    success:function (index) {
                        form.val('datafrm',data);
                    }
                });
            }


        });

    });





</script>

</body>
</html>