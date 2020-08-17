<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<!-- 弹框 -->
<div style="display:none;padding: 25px" id="updateDiv">
    <form class="layui-form" action="updateApp" method="POST" lay-filter = "datafrm">
        <div class="layui-form-item">
            <label class="layui-form-label">应用ID</label>
            <div class="layui-input-inline">
                <input type="text" name="appid" lay-verify="appid" autocomplete="off" placeholder="请输入应用ID" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">客户ID</label>
            <div class="layui-input-inline">
                <input type="text" name="cid" lay-verify="cid" autocomplete="off" placeholder="请输入客户ID" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">应用名称</label>
            <div class="layui-input-inline">
                <input type="text" name="appname" lay-verify="appname" autocomplete="off" placeholder="请输入应用名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">appkey</label>
            <div class="layui-input-inline">
                <input type="text" name="appkey"  lay-verify="appkey" autocomplete="off" placeholder="appkey" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密钥</label>
            <div class="layui-input-inline">
                <input type="text" name="appsecret"  autocomplete="off" placeholder="请输入正确的密钥" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">回调地址</label>
            <div class="layui-input-inline">
                <input type="text" name="appurl"  value="0" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">日调用量限制</label>
            <div class="layui-input-inline">
                <input type="text" name="linit"  value="0" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">描述</label>
            <div class="layui-input-inline">
                <input type="text" name="appdesc"  value="0" autocomplete="off" class="layui-input">
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
        <button class="layui-btn layui-btn-sm" onclick="window.location.href='insertApp.jsp';">新增</button>
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
            ,url: 'AppsLayUI/' //数据接口
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            //,page: true //开启分页
            ,id:'AppListTable'
            ,cellMinWidth: 50
            ,cols: [[ //表头
                {field: 'appid', title: 'ID', sort: true, fixed: 'left'}
                ,{field: 'cid', title: '公司ID'}
                ,{field: 'appname', title: '应用名称'}
                ,{field: 'appkey', title: 'appKey'}
                ,{field: 'appsecret', title: '密钥'}
                ,{field: 'appurl', title: '回调地址'}
                ,{field: 'linit', title: '日调用量限制', sort: true}
                ,{field: 'appdesc', title: '描述'}
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

        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'del'){
                // console.log(data.id);
                layer.confirm('是否删除用户' + data.appname, function(index){
                    $.post("deleteApp/" + data.appid , function (res) {
                        if (res == "success") {
                            layer.msg('删除成功',  {time: 1000}, function () {
                                layer.close(index);
                                window.location.href = 'appTable.jsp', target = 'content';
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
            }


        });

    });



</script>

</body>
</html>