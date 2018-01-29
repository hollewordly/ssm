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
								<td>邮件标题:</td>
							    <td><input type = "text" name = "tittle" value="${mail.tittle}"/></td>
							    </tr>
							  <tr>
								<td>邮件内容:</td>
							    <td><textarea cols="50" rows="8" name = "content">${mail.content}</textarea></td>
							    </tr>
							    <tr>
								<td>发送时间:</td>
							    <td><input type = "text" name = "time" value = "${mail.time}"/></td>
							    </tr>
							    <tr>
								<td>来自:</td>
							    <td><input type = "text" name = "username" value = "${user.username}" /></td>
							    </tr>
							    <tr>
								<td>文件:</td>
								<td>
								<c:if test="${mail.mailfile}==null">
									<p>无附件</p>
								</c:if>
								<c:if test="${mail.mailfile!=null}">
							    	<a href = "${pageContext.request.contextPath}/download.do/${mail.mid}">下载</a>
							    </c:if>
							    </td>
							    </tr>
								<tr>
									<td align="center" colspan="2"><input type = "button" value = "返回" onclick="his()"></td>
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
	function his(){
		location.href="${pageContext.request.contextPath}/receiveEmail.do/${user2.id}";
	}

</script>
</html>