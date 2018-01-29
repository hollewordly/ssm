<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
</head>

<body>
	<jsp:include page="top.jsp"></jsp:include>
	<form id="adduserForm" name="adduserForm" action="">
		<div class="main">
			<div class="global-width">


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="nav" id="nav">
		<div class="t"></div>
		<jsp:include page="left.jsp"></jsp:include>
	</div>
</body>
				</html>

				<div class="action">
					<div class="t">添加账号</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>用户名:</td>
							    <td><input type = "text" id = "username" name = "username"/>
							    <span id = "span1"></span>
							    </td>
							    </tr>
							  <tr>
								<td>密码:</td>
							    <td><input type="password" name = "password"/></td>
							    </tr>
							    <tr>
								<td>年龄:</td>
							    <td><input type = "text" name = "age"/></td>
							    </tr>
							    <tr>
								<td>性别:</td>
							    <td>
							    <select name="gender">
							    	<option value="0">女</option>
							        <option value = "1">男</option>
							    </select>
							    
							    </td>
							    </tr>
							    <tr>
								<td>手机:</td>
							    <td><input type = "text" onblur = "valiPhone(this)" name = "phone"/></td>
							    </tr>
							      <tr>
								<td>地址:</td>
							    <td><input type = "text" name = "address"/></td>
							    </tr>
								<tr>
									<td align="center" colspan="2">
									<input type="submit" value="提交数据"/>
									<input type = "button" value = "返回" onclick="javascript:history.back()"></td>
								</tr>
						</table>

					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>

</body>
<script type="text/javascript">
function valiPhone(phone){
	var reg = /^[0-9]*$/;
	if(!reg.test(phone)){
		"输入格式不对"
	}
}
	//表单校验
	$(function(){
		$("#adduserForm").validate({
			rules : {
				id : "required",
				username : "required",
				password : "required",
				phone : {
					required : true,
					digits : true,
					minlength : 11,
					maxlength : 11
				}
			},
			messages : {
				id : "不能为空",
				username : "不能为空",
				password : "不能为空",
				phone : {
					required : "不能为空",
					digits : "不能有非数字",
					minlength : "长度至少为11",
					maxlength : "长度最多为11",
				}
				
				
			},
			submitHandler : function(){
				$.ajax({
					data : $("#adduserForm").serialize(),
					dataType : "text",
					url : "${pageContext.request.contextPath}/saveManageUser.do",
					success : function(){
						location.href = "${pageContext.request.contextPath}/manageAccount.do"
					}
				});
			}
			
		
		});
		$(function(){
			$("#username").blur(
				function(){
					$.get(
						"${pageContext.request.contextPath}/checkUser.do",
						{"username":this.value},
						function(data){
							if(data!=null){
								var val = data.username;
								$("#span1").html("用户名已被注册");
							}else{
								$("#span1").html("用户名可以使用");
							}	
						},
						"json"
					);
					
				}		
			);
			
			
		});
	})

</script>
</html>