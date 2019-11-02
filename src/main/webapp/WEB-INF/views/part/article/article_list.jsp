<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title></title>
</head>

</style>
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
						<div class=""
							style="border: 1px solid lightgray; padding: 10px; width: 40px; height: 40px;">
							<div class="ui fitted checkbox">
								<input type="checkbox" class="checkbox_all"> <label></label>
							</div>
						</div>
					</div>
					<div class="thirteen wide column left aligned"
						style="padding-left: 5px;">
						<c:if test="${memos.size() == 0}">
							<button class="ui button basic trash disabled" disabled>삭제</button>
						</c:if>
						<c:if test="${memos.size() > 0}">
							<c:if test="${memos.get(0).delMemo == 1}">

								<button class="ui button basic trash">삭제</button>

							</c:if>
							<c:if test="${memos.get(0).delMemo == 0}">

								<button class="ui button basic restore">복원</button>
								<button class="ui button basic permanentlyDelete">영구삭제</button>

							</c:if>
						</c:if>
					</div>
				</div>

			</div>

		</div>

		<!--  -->

		<div class="artDiv2">

			<table class="ui table selectable">
				<thead class="full-width">
					<tr>
						<th class="one wide">
							<div class="ui checkbox">
								<input type="checkbox" checked> <label></label>
							</div>
						</th>
						<th class="one wide"><div class="fixed ui star rating "
								data-rating="1" data-max-rating="1"></div></th>
						<th class="eleven wide">Tags</th>
						<th class="three wide">Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="memo" items="${memos}">

						<tr data-url="edit?memoNum=${memo.memoNum}"
							data-num="${memo.memoNum}">
							<td class="collapsing">
								<div class="ui checkbox">
									<input type="checkbox" class="inputCheck"> <label></label>
								</div>
							</td>
							<td>
								<div class="ui star rating" data-max-rating="1"
									data-rating="${memo.imptMemo} }"></div>
							</td>
							<td><c:forEach var="tm" items="${memo.tms}">${tm.tag.tagName}&nbsp;&nbsp;</c:forEach></td>
							<td>${memo.memoDate}</td>

						</tr>
					</c:forEach>
				</tbody>

			</table>

		</div>

	</article>
</body>
</html>