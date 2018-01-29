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
	<form id="sendForm" name="sendForm">
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
					<div class="t">发送邮件</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" width="30%">收件人：</td>
								<td align="left"><select name="uid">
										<option>选择收件人</option>
										<c:forEach items="${userlist}" var="user">
											<option value="${user.id}">${user.username}</option>
										</c:forEach>
								</select> <input type="hidden" name="sender" value="${user2.id}" /></td>
							</tr>
							<tr>
								<td align="right" width="30%">邮件标题：</td>
								<td align="left"><input type="text" name="tittle"
									id="tittle" /> <span style="color: red;">*</span></td>
							</tr>
							<tr>
								<td align="right" width="30%">邮件内容：</td>
								<td align="left"><textarea rows="8" cols="50"
										name="content" id="content"></textarea></td>
							</tr>
							<tr>
								<td align="right" width="30%">上传附件：</td>
								<td align="left"><input type="file" name="mailfile"
									id="mailfile" /><span style="color: red;">*</span>
									<span id="filetip"></span>
									</td>
							</tr>

							<tr>
								<td align="center" colspan="2"><br /> <input type="submit"
									id="save" value="发送邮件" /></td>
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
var max_size = 9437184;

	$(function() {
		$("#sendForm").validate({
							rules : {

								tittle : "required",
								mailfile : "required"
							},
							messages : {

								tittle : "标题不能为空",
								mailfile : "附件不能为空"
							},
							submitHandler : function() {
								var formdata = new FormData(document.getElementById("sendForm"));
								
								$.ajax({
											
											contentType : false,
											processData : false,
											data : formdata,
											dataType : "text",
											type : "post",
											url : "${pageContext.request.contextPath}/saveEmail.do",
											success : function() {
												location.href = "${pageContext.request.contextPath}/sendEmail.do"
											}
										});
							}
						});
		$("#mailfile").change(function(evt) {
			var finput = $(this);
			var files = evt.target.files;
			var output = [];
			for (var i = 0, f; f = files[i]; i++) {
				if (f.size > max_size) {
					alert("不能大于9M");
					$("#filetip").html("* 上传文件不能超过9M");
					$(this).val('');
				}else{
					$("#filetip").html("");
				}
			}
		});
	})
</script>
</html>