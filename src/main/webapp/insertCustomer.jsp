<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>insert</title>
</head>
<body>
    <h1>this is insert page.</h1>

    <form action="saveCustomer" method="post">
        ID:<input type="text" name="cid"><p/>
        账号:<input type="text" name="cname" ><p/>
        密码:<input type="password" name="password" ><p/>
        公司:<input type="text" name="nickname"><p/>
        账户金额:<input type="text" name="money" ><p/>
        地址:<input type="text" name="addr" ><p/>
        状态:<input type="text" name="cstate" ><p/>
        <input type="submit" value="提交"><p/>
    </form>

</body>
</html>
