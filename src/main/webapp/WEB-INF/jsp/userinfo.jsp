<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>办公自动化管理系统</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
		<script>
	/* 	window.onload = function(){
			var uv = "${user2.gender}";
			var options = document.getElementById("sex").getElementsByTagName("option");
			for(var i=0;i<options.length;i++){
				if(options[i].value==nv){
					options[i].selected = true;
				}
			}
			
			
		}
		 */	
		
			function goback(){
				history.go(-1);
			}
		</script>
		
	</head>
	
	<body>
		<jsp:include page="top.jsp"></jsp:include>
		<form id="infoForm" name="infoForm" action="${pageContext.request.contextPath}/saveinfo.do" method="post">
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
									<td align="right" width="30%">昵称：</td><td  align="left">
									<input type="text" name="username" value="${user2.username}" id="nickname"/>
									<span style="color:red;">*</span>
									<input type="hidden" name="id" value="${user2.id}">
									</td>
								
								</tr>
							<tr>
								<td align="right" width="30%">年龄：</td>
								<td align="left"><input type="text" name="age"
									value="${user2.age}" id="age" /></td>
							</tr>
							<tr>
					<td align="right" width="30%">性别：</td>
									<td align="left">
					<c:if test="${user2.gender==0}">
							<select name="gender">
								<option value="0">女</option>
								<option value="1">男</option>
							</select>

					</c:if> 
					<c:if test="${user2.gender==1}">
							<select name="gender">
								<option value="1">男</option>
								<option value="0">女</option>
							</select>
						</c:if></td>
							</tr>
							<tr >
									<td align="right" width="30%">手机：</td>
									<td  align="left"><input type="text" onblur = "valiPhone(this)" name="phone" value="${user2.phone}" id="phone"/>
									<span style="color:red;">*</span>
									</td>
								</tr>
								<tr >
									<td align="right" width="30%">地址：</td><td  align="left"><input type="text" name="address" value="${user2.address}"  id="address"/></td>
								</tr>
								<tr >
									<td align="center" colspan="2"><br/>
									<input type="submit"  id="save" value="保存设置" />
									<input type="button"  id="save" value="返回" onclick="goback()" /></td>
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
	function valiPhone(phone){
		var reg = /^[0-9]*$/;
		if(!reg.test(phone)){
			"输入格式不对"
		}
	}
	//表单校验
	$(function() {
		$("#infoForm").validate({
			rules : {
				username : "required",
				phone : {
					required : true,
					digits : true,
					minlength : 11,
				}
			},
			messages : {
				username : "姓名不能为空",
				phone : {
					required : "不能为空",
					digits : "格式不对",
					minlength : "长度不对",
				}
			}
		});
	})
	
	
	
	</script>

</html>