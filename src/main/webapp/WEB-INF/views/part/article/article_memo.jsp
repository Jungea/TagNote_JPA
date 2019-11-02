<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title></title>
<style type="text/css">
div.tagarea {
	border: 1px solid lightgray;
	border-radius: 3px;
	line-height: 35px;
	padding-left: 5px;
	display: block;
}

a.tagA {
	border: 1px solid #cacacb;
	border-radius: 3px;
	color: #5d5d5d;
	background-color: #e8e8e8;
	height: 15px;
	padding: 3px 10px;
	margin-right: 5px;
}

a.tagA:hover {
	color: #5d5d5d;
}

.taginput {
	border: none;
	margin-left: 5px;
}

.taginput::-webkit-input-placeholder {
	color: silver;
}

.taginput:focus {
	outline: none;
}

.tagA i {
	padding-left: 7px;
}
</style>
</head>

<body>
	<article id="mainArticle">
		<!--  -->

		<div class="artDiv1" id="toTop">

			<div class="ui internally grid center aligned">

				<div class="row" style="padding-bottom: 0px;">

					<div class="three wide column" style="margin-right: 0px;">
						<button id="navColseBtn" class="close ui icon basic button">
							<i class="icon bars"></i>
						</button>
					</div>
					<div class="ten wide column" style="padding-left: 0px;">
						<div class="ui search">
							<div class="ui icon input">
								<input class="prompt" type="text" placeholder="검색"> <i
									class="search icon"></i>
							</div>
							<div class="results"></div>
						</div>
					</div>
					<div class="three wide column"></div>

				</div>

				<div class="row">
					<div class="three wide column">
						<div
							style="border: 1px solid lightgray; width: 40px; height: 40px; padding-top: 9px;">
							<div class="fixed ui star rating huge" data-max-rating="1"></div>
						</div>
					</div>


					<!------------------------------------------------------------------->
					<!-- 저장 버튼  type="submit" form="textarea_form" -->
					<!------------------------------------------------------------------->

					<div class="thirteen wide column left aligned"
						style="padding-left: 5px;">
						<button class="ui button basic" type="submit" form="textarea_form">저장</button>

						<c:if test="${memo.delMemo == 1}">
							<c:if test="${memo.memoNum > 0}">
								<button class="ui button basic" type="button"
									data-url="trashFromMemo?memoNum=${memo.memoNum}">삭제</button>
							</c:if>
							<c:if test="${memo.memoNum == 0}">
								<button class="ui button basic disabled" type="button"
									data-url="trashFromMemo?memoNum=${memo.memoNum}" disabled>삭제</button>
							</c:if>

						</c:if>
						<c:if test="${memo.delMemo == 0}">

							<button class="ui button basic restore"
								data-url="restoreFromMemo?memoNum=${memo.memoNum}">복원</button>

						</c:if>

						<button class="ui button basic" type="button"
							onclick="window.open('add_tag.html', '_blank', 'width=1000, height=600')">태그목록</button>
					</div>
				</div>

			</div>

		</div>

		<!--  -->

		<div class="artDiv2">
			<div class="memo"
				style="height: 100%; background-color: LightYellow;">

				<div class="tagBar"
					style="background-color: white; border-bottom: 1px solid lightgray; width: 100%">


					<div class="fifteen wide field center tagarea"
						style="margin: 10px;">

						<!-- 실질적인 데이터 태그들이 공백으로 나누어짐 (사용자에게 안보여짐)-->
						<input type="hidden" class="tagString" name="tagString"
							value="${memo.tagString}" form="textarea_form" />
						<!-- 사용자에게 보여지는 태그들 -->
						<c:forEach var="tag" items="${memo.tags}">
							<a class="tagA">${tag.tagName}<i class="times grey icon"></i></a>
						</c:forEach>
						<input class="taginput" type="text" placeholder="태그 입력">
					</div>

				</div>


				<form:form id="textarea_form" class="field wrap" method="post"
					modelAttribute="memo">
					<c:if test="${memo.memoNum > 0}">
						<label class="memoDate">최종수정 : ${memo.memoDate}</label>
					</c:if>
					<c:if test="${memo.memoNum == 0}">
						<label class="memoDate">&nbsp;</label>
					</c:if>

					<form:textarea path="memoText" class="memoText"
						style="background-color: LightYellow;" />
				</form:form>
			</div>

		</div>

	</article>
</body>
</html>