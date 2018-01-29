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
	<form id="receiveForm" name="receiveForm" action="">
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
					<div class="t">邮件信息列表</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>邮件标题</td>
							    <td>内容</td>
							    <td>是否已读</td>
							    <td>时间</td>
							    <td>操作</td>
							</tr>
					<c:forEach items="${list}" var="mail">
						<tr onmouseout="mouseOut(this)" onmouseover="mouseOver(this)">
							<td>${mail.tittle}</td>
						    <td>${mail.content}</td>
						   
						    <c:if test="${mail.isread==0}">
						 <td>未读 </td>
						 
						    </c:if>
						       <c:if test="${mail.isread==1}">
						    <td>已读 </td>
						 
						    </c:if>
						  
						    <td>${mail.time}</td>
						    <td><a href="javascript:void(0)" onclick = "reback(${mail.mid})">还原</a>|<a href="javascript:void(0)" onclick = "del(${mail.mid})">删除</a></td>
						</tr>
					
					
					</c:forEach>
						</table>

					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>

</body>
<script type="text/javascript">
	function mouseOut(obj){
		obj.style.backgroundColor = "white";
	}
	function mouseOver(obj){
		obj.style.backgroundColor = "#999";
	}
	function reback(mid){
		if(window.confirm("确定还原？")){
			$.ajax({
				dataType : "text",
				type : "post",
				url : "${pageContext.request.contextPath}/reEmailPlay.do/"+mid,
				success : function(){
					location.reload();
				}
			});
		}
	}
	function del(mid){
		if(window.confirm("确定删除？")){
			$.ajax({
				dataType : "text",
				type : "post",
				url : "${pageContext.request.contextPath}/delEmailPlay.do/"+mid,
				success : function(){
					location.reload();
				}
			});
		}
	}



</script>
</html>