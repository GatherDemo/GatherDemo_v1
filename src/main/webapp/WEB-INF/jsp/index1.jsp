<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页</title>
<style type="text/css">
	body{ font-size: 12px;}
	body,p,div{ padding: 0; margin: 0;}
	.wraper{ padding: 30px 0;}
	.btn-wraper{ text-align: center;}
	.btn-wraper input{ margin: 0 10px;}
	#file-list{ width: 350px; margin: 20px auto;}
	#file-list li{ margin-bottom: 10px;}
	.file-name{ line-height: 30px;}
	.progress{ height: 4px; font-size: 0; line-height: 4px; background: orange; width: 0;}
	.tip1{text-align: center; font-size:14px; padding-top:10px;}
    .tip2{text-align: center; font-size:12px; padding-top:10px; color:#b00}
    .catalogue{ position: fixed; _position:absolute; _width:200px; left: 0; top: 0; border: 1px solid #ccc;padding: 10px; background: #eee}
    .catalogue a{ line-height: 30px; color: #0c0}
    .catalogue li{ padding: 0; margin: 0; list-style: none;}
</style>
</head>
<body>
<div class="font-div">
	<form action="<%=$root %>/index.do" method="post" enctype="multipart/form-data">
	<table class="tab">
		<tr class="tab-tr">
			<th>用户名</th>
			<td><input type="text" name="userName" class="form-control" style="width:250px;"/></td>
		</tr>
		<tr class="tab-tr">
			<th>密&nbsp;&nbsp;&nbsp;码</th>
			<td><input type="password" name="password" class="form-control" style="width:250px;"/></td>
		</tr>
		<tr class="tab-tr">
			<td colspan="2">
				<div class="wraper">
					<div class="btn-wraper">
						<input type="button" value="选择文件..." id="browse" />
						<input type="button" value="开始上传" id="upload-btn" />
					</div>
					<ul id="file-list"></ul>
				</div>
			</td>
		</tr>
		<tr class="tab-tr">
			<td colspan="2">
				<input type="submit" value="login" id="submit"/><font color="red">${errorMsg }</font>
			</td>
		</tr>
	</table>
	</form>
</div>
<script type="text/javascript">  
var uploader = new plupload.Uploader({ //实例化一个plupload上传对象
	browse_button : 'browse',
	url : '<%=$root %>/file/upload.do',
	flash_swf_url : '<%=$root %>/js/plupload/Moxie.swf',
	silverlight_xap_url : '<%=$root %>/js/plupload/Moxie.xap',
	multipart:true,
	init:{
		FilesAdded:function(uploader,files){
			for(var i = 0, len = files.length; i<len; i++){
				var file_name = files[i].name; //文件名
				var file_size = files[i].size; //文件大小
				//构造html来更新UI
				var html = '<li id="file-' + files[i].id +'"><p class="file-name">' + file_name 
				+'&nbsp;|&nbsp;'+plupload.formatSize(file_size)
				+'&nbsp;|&nbsp;fileId===='+files[i].id+'</p><p class="progress"></p></li>';
				$(html).appendTo('#file-list');
			}
			uploader.start(); //开始上传
		},
		UploadProgress:function(uploader,file){
			$('#file-'+file.id+' .progress').css('width',file.percent + '%');//控制进度条
		},
		FileUploaded:function(uploader,files,res){
			alert(res.response);
			var obj = $.parseJSON(res.response);
			alert("obj.data.id===================="+obj.data.id);
		}
	}
});
uploader.init(); //初始化 

//绑定文件添加进队列事件
/* uploader.bind('FilesAdded',function(uploader,files){
	for(var i = 0, len = files.length; i<len; i++){
		var file_name = files[i].name; //文件名
		var file_size = files[i].size; //文件大小
		//构造html来更新UI
		var html = '<li id="file-' + files[i].id +'"><p class="file-name">' + file_name 
		+'&nbsp;|&nbsp;'+plupload.formatSize(file_size)
		+'&nbsp;|&nbsp;'+files[i].id+'</p><p class="progress"></p></li>';
		$(html).appendTo('#file-list');
	}
}); */

//绑定文件上传进度事件
/* uploader.bind('UploadProgress',function(uploader,file){
	$('#file-'+file.id+' .progress').css('width',file.percent + '%');//控制进度条
}); */

//上传按钮
/* $('#upload-btn').click(function(){
	uploader.start(); //开始上传
}); */

</script>
</body>
</html>