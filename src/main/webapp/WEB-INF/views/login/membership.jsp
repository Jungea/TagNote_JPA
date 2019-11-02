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
		$("#membership_form").submit(function() {
			$('.error').each(function() {
				$(this).toggleClass('error');
			});

			var errorText = "";

			var userId = $('#userId').val();
			if (isEmptyOrWhiteSpace(userId)) {
				errorText += "아이디를 입력하세요. \n";
				$('#userId').parent().parent().addClass('error')
			}
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

			if (errorText.length < 15) {
				if (userPass != userPass2) {
					errorText += "비밀번호가 일치하지 않습니다. \n";
					$('#userPass2').parent().parent().addClass('error')
				}
			}

			var passFindAnsr = $('#passFindAnsr').val();
			if (isEmptyOrWhiteSpace(passFindAnsr)) {
				errorText += "비밀번호 찾기 답변을 입력하세요. \n";
				$('#passFindAnsr').parent().parent().addClass('error')
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

<script type="text/javascript">
	var openWin;

	function openChild() {
		// window.name = "부모창 이름"; 
		window.name = "parentForm";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("userIdCheck", "childForm",
				"width=500, height=250, resizable = no, scrollbars = no");
	}
</script>

</head>
<body>

	<div class="ui grid middle aligned center aligned">
		<div class="outter column">

			<h1 class="ui teal header"
				style="font-size: 40px; margin-bottom: 60px;">TAGNOTE</h1>

			<h3 class="ui header teal"
				style="margin: 5px 20px; text-align: left;">회원가입</h3>
			<div class="ui divider" style="margin: 5px;"></div>

			<div class="ui grid middle aligned center aligned">
				<div class="inner column">

					<form:form id="membership_form" method="post" class="ui form"
						modelAttribute="user">

						<div class="field" style="text-align: left;">
							<label>아이디</label>
							<div class="two fields">
								<div class="inputId thirteen wide field">
									<div class="ui left icon input">
										<i class="user icon"></i>
										<form:input path="userId" placeholder="중복확인 클릭"
											readonly="true" />
									</div>
								</div>
								<div class="three wide field">
									<button class="overlap ui button fluid teal" type="button"
										onclick="openChild()">중복확인</button>
								</div>
							</div>
						</div>

						<div class="field" style="text-align: left;">
							<label>비밀번호</label>
							<div class="ui left icon input">
								<i class="lock icon"></i>
								<form:password path="userPass" placeholder="비밀번호" />
							</div>
						</div>

						<div class="field" style="text-align: left;">
							<label>비밀번호 확인</label>
							<div class="ui left icon input">
								<i class="lock icon"></i> <input type="password" id="userPass2"
									name="userPass2" value="" placeholder="비밀번호 확인">
							</div>
						</div>

						<div class="field" style="text-align: left;">
							<label>비밀번호 찾기 질문</label>
							<form:select class="ui dropdown" path="passFindQust">
								<form:option value="1" label="나의 보물 제 1호는?" />
								<form:option value="2" label="내가 가장 좋아하는 색깔은?" />
								<form:option value="3" label="나의 인생 좌우명은?" />
								<form:option value="4" label="내가 나온 초등학교 이름은?" />
								<form:option value="5" label="나의 장래희망은?" />
							</form:select>

						</div>

						<div class="field" style="text-align: left;">
							<label>비밀번호 찾기 답변</label>
							<div class="ui left icon input">
								<i class="exclamation icon"></i>
								<form:input path="passFindAnsr" placeholder="비밀번호 찾기 답변" />
							</div>
						</div>

					</form:form>

				</div>
			</div>

			<div class="ui divider"></div>
			<div class="ui container right aligned">
				<button class="ui button teal" type="submit" form="membership_form">가입</button>
				<button class="ui button" type="button"
					onclick="location.href
				='login'">취소</button>
			</div>

		</div>

	</div>

	<script>
		$('.ui.dropdown').dropdown();
	</script>

</body>
</html>