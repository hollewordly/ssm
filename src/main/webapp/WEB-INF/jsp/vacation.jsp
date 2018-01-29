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
					<div class="t">休假信息列表</div>
					<div class="pages">
					<!-- 	<div>

							<input type="button" value="申请休假" onclick="apply()" />

						</div> -->
						<c:if test="${user2.isadmin==0}">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>申请人</td>
									<td>开始时间</td>
									<td>结束时间</td>
									<td>天数</td>
									<td>审批状态</td>
									<td>原因</td>
								</tr>
						
								<c:forEach items="${vacationlist}" var="vacation">
									<tr onmouseout="mouseOut(this)" onmouseover="mouseOver(this)">
										<td>${vacation.username}</td>
										<td>${vacation.begin}</td>
										<td>${vacation.end}</td>
										<td>${vacation.day}</td>
										<c:if test="${vacation.isapprove==0}">
											<td><b>未审核</b></td>
										</c:if>
										<c:if test="${vacation.isapprove==1}">
											<td>已审核</td>
										</c:if>
										<td>${vacation.reason}</td>
										
									</tr>
								</c:forEach>
							</table>
							<div style="margin-top: 20px;">
								<input type="button" onclick="apply()" value="申请休假" />
							</div>
						</c:if>
						<c:if test="${user2.isadmin==1}">
							<table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>申请人</td>
									<td>开始时间</td>
									<td>结束时间</td>
									<td>天数</td>
									<td>审批状态</td>
									<td>原因</td>
									<td>操作</td>
								</tr>
								<c:forEach items="${vacationlist}" var="vacation">
									<tr onmouseout="mouseOut(this)" onmouseover="mouseOver(this)">
										<td>${vacation.username}</td>
										<td>${vacation.begin}</td>
										<td>${vacation.end}</td>
										<td>${vacation.day}</td>
										<c:if test="${vacation.isapprove==0}">
											<td>未审核</td>
											<td>${vacation.reason}</td>
											<td><a href="javascript:void(0)"
												onclick="appr(${vacation.vid})">[审核]</a></td>
										</c:if>
										<c:if test="${vacation.isapprove==1}">
											<td>已审核</td>
											<td>${vacation.reason}</td>
										</c:if>
										<c:if test="${vacation.isapprove==2}">
											<td>审核拒绝</td>
											<td>${vacation.reason}</td>
										</c:if>

									</tr>
								</c:forEach>
							</table>
							<div style="margin-top: 20px;">
								<input type="button" onclick="apply()" value="申请休假" />
							</div>
						</c:if>
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
	function apply(){
		location.href = "${pageContext.request.contextPath}/apply.do"
	}
	function appr(id){
		location.href = "${pageContext.request.contextPath}/appr.do/"+id;
	}


</script>
</html>