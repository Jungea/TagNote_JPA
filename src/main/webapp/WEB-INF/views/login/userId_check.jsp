<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.js"></script>

<script type="text/javascript">
	function setParentText() {
		opener.document.getElementById("userId").value = document
				.getElementById("userId").value;
		window.close();
	}

	$(function() {
		var refresh = $("#refresh").val();
		var checkFiled = $("#userId").val();
		if (checkFiled.length > 0) {
			setParentText();
		} else if (refresh.length > 0) {
			alert("이미 사용중인 아이디입니다.")
		}

		$("#userIdCheck_form").submit(function() {
			$('.error').each(function() {
				$(this).toggleClass('error');
			});

			var errorText = "";

			var userId = $('#userId').val();
			if (isEmptyOrWhiteSpace(userId)) {
				errorText += "아이디를 입력하세요. \n";
				$('#userId').parent().parent().addClass('error')
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

<style type="text/css">
body>.grid {
	height: 100%;
}

.column {
	max-width: 400px;
}

a {
	color: black;
}
</style>
</head>
<body>
	<div class="ui grid middle aligned center aligned">
		<div class="column">
			<h3 class="ui teal header" style="margin-top: 15px">아이디 중복 확인</h3>

			<div class="ui grid middle aligned center aligned">
				<div class="inner column">
					<form method="post" class="ui form" action="userIdCheck"
						id="userIdCheck_form">
						<div class="ui segment">
							<div class="field" style="text-align: left;">
								<label>아이디</label>
								<div class="ui left icon input">
									<i class="user icon"></i> <input type="text" id="userId"
										name="userId" placeholder="아이디" value="${userId}" />
								</div>
							</div>
							<input type="hidden" id="refresh" name="refresh"
								value="${refresh}" />
							<div class="ui container right aligned">
								<button class="ui button teal" type="submit">확인</button>
								<button class="ui button" type="button" onclick="window.close()">취소</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>

	</div>
</body>
</html>