$(function() {
	// tag 입력칸

	var tag = $('.tagString').val();
	var userTags = [];
	if (tag.length != 0) {
		userTags = tag.split(' ');

		for ( var i in userTags) {
			$(".taginput").before(
					'<a class="tagA">' + userTags[i]
							+ '<i class="times grey icon"></i></a>');
		}
	} else {
		$(".tagA").each(function(index) {
			userTags.push($(this).text());
		});
	}

	// tag칸 어디를 입력하든 input태그 포커스
	$('.tagarea').click(function() {
		$('.taginput').focus();
	})

	// taginput에서 엔터를 치면 입력한 태그가 a태그로 감싸짐.
	$(".taginput")
			.keydown(
					function(key) {
						if (key.keyCode == 13) { // 엔터
							event.preventDefault(); // submit 안됨
							var t = $(this).val();
							$(this).val('');

							if (t.length < 2 || t.charAt(0) != '#') {
								alert("#으로 시작하는 2자리 이상의 태그를 입력하세요.")
								return 0;
							}

							if ($.inArray(t, userTags) === -1) { // 중복 내용 체크
								userTags.push(t);
								$(this)
										.before(
												'<a class="tagA">'
														+ t
														+ '<i class="times grey icon"></i></a>');
							} else {
								alert("이미 입력한 태그입니다.")
							}
						}
					});

	// x 아이콘 클릭 시 a태그 제거
	$('.tagarea').on('click', '.times.icon', function() {
		var atag = $(this).parent();
		var index = userTags.indexOf(atag.text());
		userTags.splice(index, 1);
		atag.remove();
	});

	// submit 시 tag들을 input type hidden에 넣어서 보내기
	$('#textarea_form').submit(function(event) {
		var errorText = "";

		if (userTags.length == 0) {
			errorText += "태그를 입력하세요. \n";
		}
		if ($('.memoText').val() == "") {
			errorText += "메모를 입력하세요. \n";
		}

		if (errorText != 0) {
			alert(errorText);
			return false;
		}
		
		var s = userTags.join(' ')

		$('.tagString').val(s)
	});

	// /////////////////////////////////////////////////
	// memo area 부분
	$('.wrap').on('keyup', 'textarea', function(e) {
		var t = $('#mainArticle').scrollTop();
		var ta = $('#mainArticle').innerHeight();
		var d = $('#mainArticle')[0].scrollHeight;

		$(this).css('height', 'auto');
		$(this).height(this.scrollHeight);
		if (t + ta >= d) {
			d = $('#mainArticle')[0].scrollHeight;
			$('#mainArticle').scrollTop(d + 20);
		} else
			$('#mainArticle').scrollTop(t);

	});
	$('.wrap').find('textarea').keyup();

	$('.memo').click(function(event) {
		$('.memoText').focus();
	});

	$('.memoText').focus();

	timer = setInterval(function() {
		$('textarea').trigger('keyup');
	}, 500)

	// 자동 저장 (문제. 커서가 맨앞으로 감)
	// var pastMemoText = $('.memoText').val();
	// timer2 = setInterval(function() {
	// var memoText = $('.memoText').val();
	// if (memoText == "") {
	// alert("메모를 입력해 주세요.")
	// } else if (pastMemoText != memoText) {
	// $('#textarea_form').trigger('submit')
	// pastMemoText = memoText;
	// }
	// }, 5000)

	$(".tagBar").on("click", function(event) {
		event.stopPropagation();
	});

	$('.header.link').on("click", function(event) {
		event.stopPropagation();
	});

	$('.header.link').on("click", function(event) {
		var a = $(this).attr('path');
		location.href = a;
	});
})
