<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title></title>
</head>
<body>
	<nav id="mainNav">

		<div class="navDiv1">
			<button class="ui teal button" data-url="create">새 메모 쓰기</button>
		</div>

		<div class="navDiv2">
			<div class="ui list">
				<a class="item" href="star">
					<div class="fixed ui star rating" data-rating="1"
						data-max-rating="1" style="float: left; margin-right: 9px;"></div>
					<div class="content">
						<b>중요한 메모</b>
					</div>
				</a> <a class="item" href="recent"> <i
					class="icon sticky note outline" style="padding-left: 3px;"></i>
					<div class="content">
						<b>최근본 메모</b>
					</div>
				</a>
			</div>
		</div>

		<div class="navDiv3">
			<div id="target" class="ui styled accordion">

				<%@ include file="nav_bookmark.jsp"%>

				<%@ include file="nav_tags.jsp"%>

			</div>
		</div>

		<div class="navDiv4" style="padding-right: 15px;">

			<a href="trashList"> <i class="icon trash alternate"
				style="margin-right: 10px"></i><b>휴지통</b>
			</a> <span class="navDiv4-trash-span" style="float: right"> <i
				class="icon trash alternate outline small"></i>
			</span>
		</div>

	</nav>

</body>
</html>