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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
</head>

<body>
	<jsp:include page="top.jsp"></jsp:include>
	<form id="applyForm" name="applyForm" action="">
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
					<div class="t">休假审核</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>姓名:</td>
							<td><input type="text" name = "username" value = "${vacation.username}"/></td>
						</tr>
						<tr>
							<td>开始时间:</td>
							<td><input type="text" name = "begin" value = "${vacation.begin}"/></td>
						</tr>
						<tr>
							<td>结束时间:</td>
							<td><input type="text" name = "end" value = "${vacation.end}"/></td>
						</tr>
						<tr>
							<td>请假天数:</td>
							<td><input type="text" name = "day" value = "${vacation.day}"/></td>
						</tr>
						<tr>
							<td>请假原因:</td>
							<td><textarea name = "reason" >${vacation.reason}</textarea></td>
						</tr>
						<tr>
							<td>审核人:</td>
							<td><input type="text" name = "username" value = "${user2.username}"/></td>
						</tr>
							<tr>
								<td><input type = "button" value = "审核通过" onclick = "pass(${vacation.vid},${user2.id})"/></td>
								
								<td><input type = "button" value = "审核不通过" onclick = "fail(${vacation.vid},${user2.id})"/></td>
							
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
	function pass(vid,id){
		$.ajax({
			dataType : "text",
			type : "post",
			url : "${pageContext.request.contextPath}/pass.do/"+vid,
			success : function(){
				location.href = "${pageContext.request.contextPath}/vacation.do/"+id;	
			}
			
		});
		
	}
	function fail(vid,id){
		$.ajax({
			dataType : "text",
			type : "post",
			url : "${pageContext.request.contextPath}/fail.do/"+vid,
			success : function(){
				location.href = "${pageContext.request.contextPath}/vacation.do/"+id;
			}
		})
	}


</script>
</html>