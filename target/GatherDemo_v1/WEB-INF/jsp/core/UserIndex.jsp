<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<script type="text/javascript">
	$(function(){
		pageInit();
	});
	
	
	function pageInit(){
		jQuery("#grid-table").jqGrid({
			url:"<%=$root %>/sys/userList.do",
			datatype:"json",
			colNames:['选择','账号','性别','邮箱','是否激活','最后登录时间'],
			colModel:[
			          {name:'id',index:'id',checkBox:true},
			          {name:'username',index:'username',width:90},
			          {name:'sex',index:'sex',width:90},
			          {name:'email',index:'email',width:180},
			          {name:'ifactivate',index:'ifactivate',width:80},
			          {name:'lastlogintime',index:'lastlogintime',width:120}
			          ],
			rowNum:10,
			rowList:[10,15,20],
			pager:'#pager2',
			sortname:'id',
			mtype:'post',
			viewrecords:true,
			sortorder:'desc',
			caption:'JSON实例'
		});
		jQuery("#grid-pager").jqGrid('navGrid','#pager2',{edit:false,add:false,del:false});
	}
	
</script>
</head>
<body>
	<table id="grid-table"></table>
	<div id="grid-pager"></div>
</body>
</html>