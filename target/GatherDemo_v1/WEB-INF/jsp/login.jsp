<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>Login | Nadhif - Responsive Admin Template</title>
		
		<!-- Mobile Metas -->
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		
		<!-- Import google fonts -->
        <link href="http://fonts.useso.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css" />
        
		<!-- Favicon and touch icons -->
		<link rel="shortcut icon" href="assets/ico/favicon.ico" type="image/x-icon" />
		<link rel="apple-touch-icon" href="assets/ico/apple-touch-icon.png" />
		<link rel="apple-touch-icon" sizes="57x57" href="<%=$root %>/ico/apple-touch-icon-57x57.png" />
		<link rel="apple-touch-icon" sizes="72x72" href="<%=$root %>/ico/apple-touch-icon-72x72.png" />
		<link rel="apple-touch-icon" sizes="76x76" href="<%=$root %>/ico/apple-touch-icon-76x76.png" />
		<link rel="apple-touch-icon" sizes="114x114" href="<%=$root %>/ico/apple-touch-icon-114x114.png" />
		<link rel="apple-touch-icon" sizes="120x120" href="<%=$root %>/ico/apple-touch-icon-120x120.png" />
		<link rel="apple-touch-icon" sizes="144x144" href="<%=$root %>/ico/apple-touch-icon-144x144.png" />
		<link rel="apple-touch-icon" sizes="152x152" href="<%=$root %>/ico/apple-touch-icon-152x152.png" />
		
	    <!-- start: CSS file-->
		
		<!-- Vendor CSS-->
		<link href="<%=$root %>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=$root %>/vendor/skycons/css/skycons.css" rel="stylesheet" />
		<link href="<%=$root %>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
		
		<!-- Plugins CSS-->		
		
		<!-- Theme CSS -->
		<link href="<%=$root %>/css/jquery.mmenu.css" rel="stylesheet" />
		
		<!-- Page CSS -->		
		<link href="<%=$root %>/css/style.css" rel="stylesheet" />
		<link href="<%=$root %>/css/add-ons.min.css" rel="stylesheet" />
		
		<style>
			footer {
				display: none;
			}
		</style>
		
		<!-- end: CSS file-->	
	    
		
		<%-- <!-- Head Libs -->
		<script src="<%=$root %>/plugins/modernizr/js/modernizr.js"></script> --%>
		
	</head>

	<body>
		<!-- Start: Content -->
		<div class="container-fluid content">
			<div class="row">
				<!-- Main Page -->
				<div class="body-login">
					<div class="center-login">
						<a href="#" class="logo pull-left hidden-xs">
							<img src="<%=$root %>/images/logo.png" height="45" alt="NADHIF Admin" />
						</a>

						<div class="panel panel-login">
							<div class="panel-title-login text-right">
								<h2 class="title"><i class="fa fa-user"></i> 用户登陆</h2>
							</div>
							<div class="panel-body">
								<form action="<%=$root %>/index.do" method="post">
									<div class="form-group">
										<label>账号</label>
										<div class="input-group input-group-icon">
											<input name="userName" type="text" class="form-control bk-noradius" />
											<span class="input-group-addon">
												<span class="icon">
													<i class="fa fa-user"></i>
												</span>
											</span>
										</div>
									</div>

									<div class="form-group">
										<label>密码</label>									
										<div class="input-group input-group-icon">
											<input name="password" type="password" class="form-control bk-noradius" />
											<span class="input-group-addon">
												<span class="icon">
													<i class="fa fa-lock"></i>
												</span>
											</span>
										</div>
									</div>
									<br />
									<div class="row">
										<div class="col-sm-8">
											<div class="checkbox-custom checkbox-default bk-margin-bottom-10">
												<input id="RememberMe" name="rememberme" type="checkbox"/>
												<label for="RememberMe">记住我</label>
											</div>
										</div>
										<div class="col-sm-4 text-right">
											<button type="submit" class="btn btn-primary hidden-xs">登陆</button>
											<button href="index.html" type="submit" class="btn btn-primary btn-block btn-lg visible-xs bk-margin-top-10">登陆</button>
										</div>
									</div>
									<br />
									<div class="text-with-hr">
										<span>or</span>
									</div>
									<br />
									<div class="bk-margin-bottom-10 bk-margin-top-10 text-center">
										<a href="#" class="fa fa-facebook facebook-bg"></a>
										<a href="#" class="fa fa-twitter twitter-bg"></a>
										<a href="#" class="fa fa-linkedin linkedin-bg"></a>
									</div><br />
									<p class="text-center">Don't have an account yet? <a href="page-register.html"><small>Register!</small></a>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- End Main Page -->
		
			</div>
		</div><!--/container-->
		
		
		<!-- start: JavaScript-->
		
		<!-- Vendor JS-->				
		<script src="<%=$root %>/vendor/js/jquery.min.js"></script>
		<script src="<%=$root %>/vendor/js/jquery-2.1.1.min.js"></script>
		<script src="<%=$root %>/vendor/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="<%=$root %>/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="<%=$root %>/vendor/skycons/js/skycons.js"></script>	
		
		<!-- Plugins JS-->
		
		<!-- Theme JS -->		
		<script src="<%=$root %>/js/jquery.mmenu.min.js"></script>
		<script src="<%=$root %>/js/core.min.js"></script>
		
		<!-- Pages JS -->
		<script src="<%=$root %>/js/pages/page-login.js"></script>
		
		<!-- end: JavaScript-->
		
	</body>
	
</html>