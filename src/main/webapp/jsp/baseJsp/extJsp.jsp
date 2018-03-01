<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String randomVer = Math.random() + ""; // 随机数
%>

<script>
var contextPath = "<%=request.getContextPath()%>"; // 项目根目录
</script>

<!-- extjs 样式 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/extjs/resources/ext-theme-neptune/ext-theme-neptune-all.css"></link>
<!-- 自定义样式 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/customStyle.css"></link>

<!-- 图标 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/file/icon/css/font-awesome.css" />

<!-- 重写滚动条 -->
<%--<link rel="stylesheet" href="<%=request.getContextPath()%>/css/rewriteScroll.css"> --%>
<!-- extjs javascript -->
<script type="text/javascript" src="<%=request.getContextPath()%>/extjs/ext-all.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/extjs/locale/ext-lang-zh_CN.js"></script>

<!-- 自定义 -->
<<script type="text/javascript" src="<%=request.getContextPath()%>/jsiframe/customjs/customTreeSelect.js?v=<%=Math.random()%>" ></script>

