<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>insert</title>
</head>
<body>
    <h1>this is insert page.</h1>

    <form action="saveApp" method="post">
        应用ID:<input type="text" name="appid"><p/>
        客户ID:<input type="text" name="cid" ><p/>
        应用名称:<input type="text" name="appname" ><p/>
        appKey:<input type="text" name="appkey"><p/>
        密钥:<input type="text" name="appsecret" ><p/>
        回调地址:<input type="text" name="appurl" ><p/>
        日调用量限制:<input type="text" name="linit" ><p/>
        描述:<input type="text" name="appdesc" ><p/>
        <input type="submit" value="提交"><p/>
    </form>

</body>
</html>
