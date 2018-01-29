<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
	</head>
	
	<body>
		<jsp:include page="top.jsp"></jsp:include>
		<form id="userEditForm" name="userEditForm" action="saveuser.do" method="post">
		<input type="hidden" name="u.id" value="26"/>
		<input type="hidden" name="u.sex" value="2" id="u_sex"/>
		<input type="hidden" name="u.supper" value="0" id="u_supper"/>
		<div class="main">
			<div class="global-width">
				
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	</head>
  
  <body>
    <div class="nav" id="nav">
					<div class="t"></div>
					<jsp:include page="left.jsp"></jsp:include>
				</div>
  </body>
</html>
 
					<div class="action">
						<div class="t">
							个人信息
						</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td align="right" width="30%">用户名:</td>
									<td  align="left"><input type="text" name="username" value="${user2.username}" id="username"/>
									<input type = "hidden" name = "id" value = "${user2.id}"/>
									<span style="color:red;">*</span>
									<span id = "span1"></span>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">密码:</td>
									<td  align="left"><input type="password" name="password" value="${user2.password}" id="password"/>
									<span style = "color:red;">*</span></td>
								</tr>
								
								<tr >
									<td align="center" colspan="2"><br/><input type="submit" value="保存数据"/>
									<input type="button" value="返回" onclick="javascript:history.back()" />
									</td>
								</tr>
								
								</table>
								
						</div>
					</div>
			</div>
		</div>
		</form>
		<div class="copyright">
			Copyright &nbsp; &copy; &nbsp; 
		</div>
 
	</body>
	<script type="text/javascript">
		//表单验证
		$(function(){
		$("#userEditForm").validate({
			rules : {
				username : "required",
				password : "required",
			},
			message : {
				 username : "不能为空",
				 password : "不能为空",
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