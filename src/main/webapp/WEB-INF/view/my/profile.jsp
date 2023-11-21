<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/resource/style/style.css">
<title>프로필수정 - CashFlow</title>
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
		<div class="px-5 py-2 align-center mt-6">
			<div >
				<p class="xxlarge-font">프로필 수정</p>
				<div>닉네임과 성별을 포함한 정보들을 수정하실 수 있습니다.</div>
			</div>
			<div>
				<form class="login-form align-left" method="post"
					action="${pageContext.servletContext.contextPath }/user/join/handle">
					<h3 class="my-3 black-white px-1">현재 사용중인 프로필</h3>
					<div class="my-2">
						<label class="w100 bold">닉네임</label> <input type="text"
							class="large-font w100" name="nickname"
							value="${tempUser.nickname }" />
					</div>
					<div class="my-2">
						<label class="w100 bold">탄생년도</label> <select name="birth"
							class="large-font w100">
							<option></option>
							<c:forEach var="year" begin="1923" end="2023">
								<option ${tempUser.birth eq year ? 'selected':'' }>${year }</option>
							</c:forEach>
						</select>
					</div>
					<div class="my-2">
						<span class="w100 bold">성별</span>
						<div style="display: inline-block;">
							<input type="radio" name="gender" value="M" id="male"
								${tempUser.gender eq 'M' ? 'checked' : '' } required /><label
								for="male">남성</label>
						</div>
						<div style="display: inline-block;">
							<input type="radio" name="gender" value="F" id="female"
								${tempUser.gender eq 'F' ? 'checked' : '' } required /><label
								for="female">여성</label>
						</div>
						<div style="display: inline-block;">
							<input type="radio" name="gender" value="" id="unknown"
								${tempUser.gender eq '' ? 'checked' : '' } required /><label
								for="unknown">비공개</label>
						</div>
					</div>
					<div class="my-2">
						<label class="w100 bold">아바타</label>
						<div class="align-center">
							<c:forEach var="one" items="${avatars }">
								<div style="display: inline-block;">
									<div>
										<label for="${one.id }-radio"><img
											src="${pageContext.servletContext.contextPath }${one.imageUrl}"
											style="width: 110px" /> </label>
									</div>
									<div>
										<input type="radio" name="avatarId" value="${one.id }"
											id="${one.id }-radio"
											${tempUser.avatarId eq one.id ? 'checked' : '' } />
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="my-5">
						<button class="py-3 black-white large-font w100">수정하기</button>
					</div>
				</form>
			</div>
		</div>

	</div>
</body>
</html>
