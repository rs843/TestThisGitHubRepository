<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@include file="/common/head.jsp"%>
<link href="<c:url value="/css/root/new_comment.css"/>" type="text/css"
	rel="stylesheet" />
</head>
<body>
	<%@include file="/common/top.jsp"%>
	<div>
		<form>
			<input id="comment" type="text" />
			<input id="open" type="button" value="Open" />
			<input id="file" type="file" accept="image/*" style="display: none"
				multiple="multiple" onchange="upload()"/>
		</form>
	</div>
	
	<div>
		<div><img src="<c:url value="/resource/Avatar.jpg"/>"/></div>
		<div><img src="<c:url value="/resource/Avatar.jpg"/>"/></div>
	</div>
</body>
<%@include file="/common/js_include.jsp"%>
<script type="text/javascript">
	$(function(){
		$('#open').on('click', function() {
			$('#file').trigger('click');
		});

		$('#file').fileupload({
			'url' : 'uploadFile', 	// this is the mapped name of the servlet writing into 
									// the annotation
			'type' : 'POST',
			'dataType' : 'json',
			'done' : function(e, data) {
				alert(data.result.status);
			}
		});
	});

	function toRegister() {
		window.location.href = 'register.jsp';
	}

	function login() {
		$.ajax({
			'url' : 'login',
			'type' : 'get',
			'data' : {
				'name' : $('#name')[0].value,
				'pass' : $('#pass')[0].value
			},
			'dataType' : 'json',
			'success' : function(returnData) {
				alert(returnData['status']);
			}
		});
	}
</script>
</html>