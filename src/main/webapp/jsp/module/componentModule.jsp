<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>component 模块</title>

<!-- common.jsp -->
<jsp:include page="/jsp/baseJsp/extJsp.jsp"></jsp:include>

<script type="text/javascript" src="js/componentModule.js?v=<%=Math.random()%>"></script>

</head>
<body>

<div id="abc" style="display: block;">
	<h1>
		this is a title
	</h1>
	<blockquote>this is a blockquote</blockquote>
	<ul>
		<li>apple</li>
		<li>orange</li>
		<li>banana</li>
	</ul>
</div>


</body>
<script type="text/javascript">
    
</script>
</html>