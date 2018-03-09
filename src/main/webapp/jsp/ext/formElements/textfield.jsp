<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>textfield</title>

<jsp:include page="/jsp/baseJsp/extJsp.jsp"></jsp:include>

<script type="text/javascript" src="js/textfield.js?v=<%=Math.random()%>"></script>

</head>
<body>

</body>
<script type="text/javascript">
    Ext.onReady(function(){
        Ext.Msg.alert("提示：", 3);
    });
</script>
</html>