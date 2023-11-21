<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/resource/style/style.css">
<title>효율적인 소비 - CashFlow</title>
</head>
<body>
	<div class="container">
		<div class="align-right py-3 border-line">
			<a href="${pageContext.servletContext.contextPath }/index" style="float:left;">#</a>
			<a href="${pageContext.servletContext.contextPath }/my/profile">
				<img src="${pageContext.servletContext.contextPath }${sessionScope.logonUserAvatar.imageUrl }" style="width: 36px; vertical-align: middle;"/>
			</a>
			<b>${sessionScope.logonUser.nickname }</b>님 로그온 중 | 
			<a href="${pageContext.servletContext.contextPath }/user/logout/handle">로그아웃</a>
		</div>
	</div>
</body>
</html>
