<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>panelTest</title>

<!-- common jsp -->
<jsp:include page="/jsp/baseJsp/extJsp.jsp"></jsp:include>

<!-- js -->
<script type="text/javascript" src="js/panelTest.js?v=<%=Math.random()%>"></script>

</head>
<body>

</body>
<script>
	

    var prdDepartNameStore = Ext.create('Ext.data.Store', {
        fields : [ 'value', 'text' ],
        data : [ {
            "value" : "软件",
            "text" : "软件"
        }, {
            "value" : "信息产品",
            "text" : "信息产品"
        }, {
            "value" : "系统集成",
            "text" : "系统集成"
        } ]
    });

    
</script>

</html>