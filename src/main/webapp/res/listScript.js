$(function() {
	$('.ui.button.trash').click(function(event) {
		var result = confirm('선택한 메모를 삭제하시겠습니까?');
		var memoNumString = checkMemoNum.join(' ');
		if (result) {
			location.href = 'trashChecked?memoNumString=' + memoNumString;
		}
	});

	$('.ui.button.restore').click(function(event) {
		var result = confirm('선택한 메모를 복원하시겠습니까?');
		var memoNumString = checkMemoNum.join(' ');
		if (result) {
			location.href = 'restoreFromTrash?memoNumString=' + memoNumString;
		}
	});

	$('.ui.button.permanentlyDelete').click(function(event) {
		var result = confirm('선택한 메모를 영구삭제하시겠습니까?');
		var memoNumString = checkMemoNum.join(' ');
		if (result) {
			location.href = 'delete?memoNumString=' + memoNumString;
		}
	});

	$('li').on("click", function(event) {
		event.stopPropagation();
	});

	$('.ui.checkbox').on("click", function(event) {
		event.stopPropagation();
	});

	$('.ui.rating').on("click", function(event) {
		event.stopPropagation();
	});

	// 체크박스 전체 선택, 전체 해제
	$('.checkbox_all').click(function() {
		if ($('.checkbox_all').is(':checked')) {
			$('.inputCheck').prop("checked", true);
		} else {
			$('.inputCheck').prop("checked", false);
		}

	})

	var checkMemoNum = [];

	$('.inputCheck')
			.click(
					function() {
						// 체크하면 update
						if ($(this).is(':checked')) {
							checkMemoNum.push($(this).parent().parent()
									.parent().attr("data-num"))
						} else {
							var index = checkMemoNum.indexOf($(this).parent()
									.parent().parent().attr("data-num"));
							checkMemoNum.splice(index, 1);
						}

						// 모든 체크박스가 체크 되었을 경우 checkbox_all 체크
						if ($('.inputCheck:checked').length == $('.inputCheck').length) {
							$('.checkbox_all').prop("checked", true);
						} else {
							$('.checkbox_all').prop("checked", false);
						}

					})

})
