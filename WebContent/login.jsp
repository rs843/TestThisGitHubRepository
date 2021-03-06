<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@include file="/common/head.jsp"%>
<link href="<c:url value="/css/root/register.css"/>" type="text/css"
	rel="stylesheet" />
</head>
<body>
	<div align="center">
		<div class="register-title">
			<h2>Welcome to use Share</h2>
		</div>
		<div class="form-content" style="width: 300px">
			<form>
				<input type="text" id="name" placeholder="Name" />
				<br />
				<input type="password" id="pass" placeholder="Password" />
				<br />
				<input type="button" value="Log In" onclick="login()" />
				<input type="button" value="Register" onclick="toRegister()" />
			</form>
		</div>
	</div>
</body>
<%@include file="/common/js_include.jsp"%>
<script type="text/javascript">
	function toRegister() {
		window.location.href = "register.jsp";
	}

	function login() {
		var name = $("#name")[0].value;
		var pass = $("#pass")[0].value;
		if (name == "") {
			alert("Please enter username!");
			return;
		}
		if (pass == "") {
			alert("Please enter password!");
			return;
		}

		$.ajax({
			'url' : 'login',
			'type' : 'post',
			'data' : {
				'name' : name,
				'pass' : pass
			},
			'dataType' : 'json',
			'success' : function(returnData) {
				if (returnData['status'] == 'success') {
					window.location.href = "index.jsp";
				} else {
					alert("Username or password is wrong, please check and try again!");
				}
			}
		});
	}
</script>
</html>