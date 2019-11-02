<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title></title>
</head>
<style>
.header-userName {
	font-size : 12px;
	float: right;
	margin-right: 10px;
	font-size: 12p;
}
</style>
<body>
	<header id="pageHeader">
		<a href="list" style="color: white !important;">TAGNOTE</a>
		<div class="header-userName">
			<span style="margin-right: 5px;"> ${user.userId} 님</span>
			<button class="ui inverted mini button" data-url="logout">로그아웃</button>
		</div>
	</header>
</body>
</html>