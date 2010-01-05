var AdminDataJSUtil = (function($) {
	return {

		buildOptionsFromArray: function(array, element) {
			element.append($('<option></option>'));
			for (i in array) {
				$('<option></option>').append(array[i][0]).attr('value', array[i][1]).appendTo(element);
			}
			element.attr('disabled', false);
		},

		colorizeRows: function() {
			$('.colorize tr:odd').addClass('odd');
			$('.colorize tr:even').addClass('even');
		},

		// returns date in string format
		// example: 07-September-2009  
		dateToString: function(date) {
			var month = (date.getMonth() + 1).toString();
			var day = date.getDate().toString();
			//days between 1 and 9 should have 0 before them
			if (day.length == 1) day = '0' + day;
			var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
			return day + "-" + months[month - 1] + "-" + date.getFullYear();
		},

		random_number: function() {
			var maxVal = 100000000;
			var minVal = 1;
			var randVal = minVal + (Math.random() * (maxVal - minVal));
			return Math.round(randVal);
		}

	}; // return
})(jQuery);

