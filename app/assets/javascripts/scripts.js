$(function () {

	$("div.alert").delay(1500).fadeOut("slow");

	$('.rating').raty( { path: '/assets/images', scoreName: 'comment[rating]' });
	$('.rated').raty({ path: '/assets/images',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });


});
