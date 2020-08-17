<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="https://cdn.bootcdn.net/ajax/libs/layui/2.5.6/layui.js"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<table id="demo" lay-filter="test"></table>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 312
            ,url: 'StarsLayUI/' //数据接口
            //,page: true //开启分页
            ,cols: [[ //表头
                {field: 'sid', title: 'ID', width:180, sort: true, fixed: 'left'}
                ,{field: 'sname', title: '用户名', width:180}
                ,{field: 'sex', title: '性别', width:180, sort: true}
                ,{field: 'country', title: '城市', width:180}
                ,{field: 'salary', title: '薪酬', width: 177}
                ,{field: 'color', title: '标记', width: 180, sort: true}
            ]]
            ,page: {
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                ,curr: 1 //设定初始在第 1 页
                , groups: 2 //只显示 1 个连续页码
                ,limit:4
                ,limits:[4,8,10,20,25]
            }
        });

    });
</script>

</body>
</html>