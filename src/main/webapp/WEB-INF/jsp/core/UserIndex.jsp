<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../jsp/base/easyui.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<script type="text/javascript">
$(function(){
	$('#grid').datagrid({
		url:'<%=$root %>/sys/userList.do',/* title:'项目信息表', */
		pagination:true,
		singleSelect:false,
		rownumbers:true,
		striped:true,
		fitColumns:true,
		columns:[[
		    {field:'id',title:'项目id',checkbox:true},
	  		{field:'username',title:'账号',width:100,align:'center',editor:{
	  			type:'validatebox',options:{required:true}
	  		}},
			{field:'nickname',title:'昵称',width:100,align:'center',editor:{
				type:'validatebox',options:{required:true}
			}},
			{field:'roleName',title:'权限',width:80,align:'center'},
			{field:'sex',title:'性别',width:50,align:'center',formatter:function(v,r,i){
				return (v=="0"?"男":"女");
			}},
			{field:'age',title:'年龄',width:100,align:'center'},
			{field:'lastlogintime',title:'最后登陆时间',width:120,align:'left'/* ,formatter:function(v){
				var unixTimestamp = new Date(v);  
                return unixTimestamp.toLocaleString();
			} */},
			{field:'cz',title:'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作',width:150,align:'left',formatter:function(v,r,l){
				var btn = '';
				if(r.ifactivate=='0'){
					btn = '<a class="start" onClick="editValid(\''+r.id+'\',1)" href="javascript:void(0)" data-options="selected:true" style="margin:0px 10px 0px 10px;">启用</a>';
					if(r.ifspeak=='0'){
						btn += '<a class="shutup" onClick="editShutup(\''+r.id+'\',\''+r.ifactivate+'\',1)" href="javascript:void(0)" data-options="selected:true">禁言</a>';
					}else{
						btn += '<a class="shutup" onClick="editShutup(\''+r.id+'\',\''+r.ifactivate+'\',0)" href="javascript:void(0)">禁言</a>';
					}
				}else{
					btn = '<a class="start" onClick="editValid(\''+r.id+'\',0)" href="javascript:void(0)" style="margin:0px 10px 0px 10px;">启用</a>';
				}
                return btn;
			}}
		]],
		toolbar:[{
			text:'添加',iconCls:'icon-add',handler:function(){
				
			}
		},'-',{
			text: '修改', iconCls: 'icon-edit', handler: function () {
                var row = $("#grid").datagrid('getSelected');
                if (row !=null) {
                    
                }else{
                	$.messager.alert("操作提示","请选择！","error");
                	return;
                }
			}
		}, '-', {
            text: '删除', iconCls: 'icon-remove', handler: function () {
                var rows = $("#grid").datagrid('getSelections');
                if(rows != null){
                	
                }else{
                	$.messager.alert("操作提示","请选择！","error");
                	return;
                }
            }
        }],  
        onLoadSuccess:function(data){  
            $('.start').linkbutton({text:'激活',plain:true,iconCls:'icon-ok',toggle:true});
            $('.shutup').linkbutton({text:'可发言',plain:true,iconCls:'icon-no',toggle:true});
        }
	});
	
});

//是否禁用或启用
function editValid(id,type){
	$.post("<%=$root %>/sys/editActivity.do", { "id": id,"ifactivate":type},function(r){
	       if(r.code<0) return $.messager.alert("操作提示", r.msg,"error");
	       
	       $.messager.show({
               title: "操作提示",
               msg: "操作成功！",
               showType: 'slide',
               timeout: 2000
           });
		   $('#grid').datagrid('reload');
	}, "json");
}

//是否禁言
function editShutup(id,privilege,type){
	if(privilege=='0'){
		$.post("<%=$root %>/sys/editActivity.do", { "id": id,"ifactivate":privilege,"ifspeak":type},function(r){
			if(r.code<0) return $.messager.alert("操作提示", r.msg,"error");
		}, "json");
	}
}

//查询
function toSearch(){
	var params = $('#form').serializeArray();
	var obj = new Object();
	$.each(params,function(i,v){
		obj[v.name] = v.value;
	});
	
	$('#grid').datagrid('load',obj);
}

//清空
function toClean(){
	$('#form').form('clear');
}
</script>
<style type="text/css">
.tab{
	width:auto;
	margin-left:20px;
	margin-right: 20px;
}
.tab tr{
	padding:2px 0px 2px 0px;
}
.tab tr th{
	padding:0px 5px 0px 5px;
	font-size:12px;
}

</style>
</head>
<body>
	<div class="easyui-panel" title="项目信息表">
		<div style="padding:10px 20px 5px 20px; background-color: #F4F4F4;">
	    <form id="form">
	    	<table cellpadding="5" class="tab">
	    		<tr>
	    			<th>帐号:</th>
	    			<td><input type="text" class="easyui-textbox" name="username" id="username"/></td>
	    			<th>昵称:</th>
	    			<td><input type="text" class="easyui-textbox" name="nickname" id="nickname"/></td>
	    			<td></td>
	    		</tr>
	    		<tr>
	    			<th>角色:</th>
	    			<td><input type="text" class="easyui-textbox" /></td>
	    			<th>性别:</th>
	    			<td><input type="text" class="easyui-textbox" /></td>
	    			<td>
	    				<a href="javascript:void(0);" class="easyui-linkbutton" onClick="toSearch()" iconCls="icon-search" style="width:80px; margin-left:20px; margin-right:20px;">查询</a>
	    				<a href="javascript:void(0);" class="easyui-linkbutton" onClick="toClean()" iconCls="icon-remove" style="width:80px;">清空</a>
	    			</td>
	    		</tr>
	    	</table>
		</form>
		</div>
		<table id="grid"></table>
	</div>
</body>
</html>