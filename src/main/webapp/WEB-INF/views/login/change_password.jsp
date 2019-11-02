<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.js"></script>

<meta charset="UTF-8">
<title>회원가입</title>

<style type="text/css">
body>.grid {
	height: 100%;
}

.outter.column {
	max-width: 750px;
}

.inner.column {
	max-width: 650px;
}
</style>

<script>
	$(function() {
		$("#changePassword_form").submit(function() {
			$('.error').each(function() {
				$(this).toggleClass('error');
			});

			var errorText = "";

			var userPass = $('#userPass').val();
			if (isEmptyOrWhiteSpace(userPass)) {
				errorText += "비밀번호를 입력하세요. \n";
				$('#userPass').parent().parent().addClass('error')
			}
			var userPass2 = $('#userPass2').val();
			if (isEmptyOrWhiteSpace(userPass2)) {
				errorText += "비밀번호 확인을 입력하세요. \n";
				$('#userPass2').parent().parent().addClass('error')
			}

			if (errorText.length == 0) {
				if (userPass != userPass2) {
					errorText += "비밀번호가 일치하지 않습니다. \n";
					$('#userPass2').parent().parent().addClass('error')
				}
			}

			if (errorText.length != 0) {
				alert(errorText)
				return false;
			}

		})

		function isEmptyOrWhiteSpace(inputValue) {

			if (inputValue == null)
				return true;
			return inputValue.trim().length == 0;
		}

	})
</script>

</head>
<body>

	<div class="ui grid middle aligned center aligned">
		<div class="outter column">

			<h1 class="ui teal header"
				style="font-size: 40px; margin-bottom: 60px;">TAGNOTE</h1>

			<h3 class="ui header teal"
				style="margin: 5px 20px; text-align: left;">비밀번호 변경</h3>
			<div class="ui divider" style="margin: 5px;"></div>

			<div class="ui grid middle aligned center aligned">
				<div class="inner column">

					<form id="changePassword_form" method="post" class="ui form">

						<div class="field" style="text-align: left;">
							<label>비밀번호</label>
							<div class="ui left icon input">
								<i class="lock icon"></i> <input type="password" id="userPass"
									name="userPass" placeholder="새 비밀번호" />
							</div>
						</div>

						<div class="field" style="text-align: left;">
							<label>비밀번호 확인</label>
							<div class="ui left icon input">
								<i class="lock icon"></i> <input type="password" id="userPass2"
									name="userPass2" placeholder="새 비밀번호 확인" />
							</div>
						</div>
					</form>

				</div>
			</div>

			<div class="ui divider"></div>
			<div class="ui container right aligned">
				<button class="ui button teal" type="submit"
					form="changePassword_form">확인</button>
				<button class="ui button" type="button"
					onclick="location.href
				='login'">취소</button>
			</div>

		</div>

	</div>

</body>
</html>