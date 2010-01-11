/**
 * @author Nickolay
 */


$(document).ready(function() {

	var date = new Date();
	var d    = date.getDate();
	var m    = date.getMonth();
	var y    = date.getFullYear();
	
	var startDate = new Date();
	startDate.setDate(1);
	startDate.setMonth(0);
	startDate.setYear(2010);
	
	var endDate = new Date();
	endDate.setDate(31);
	endDate.setMonth(3);
	endDate.setYear(2010);
	
	//alert(endDate.toDateString());
	
	$('#calendar').fullCalendar({
		firstDay: 1,
		events: "/calendar/get",
		monthNames: ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
		monthNamesShort: ["Янв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек"],
		dayNames: ["Воскресение", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"],
		dayNamesShort: ["Вск", "Пнд", "Втр", "Cрд", "Чтв", "Птн", "Сбт"],
		/*start: startDate,
		end: endDate,
		visStart: startDate,
		visEnd: endDate,*/
		dayClick: function(dayDate, allDay, jsEvent, view) {
			alert(dayDate.toDateString());
		},
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,basicWeek,basicDay'
		},
		buttonText: {
	        prev: 'Предыдущий',      // left triangle
	        next: 'Следующий',      // right triangle
	        prevYear: 'Предыдущий год', // <<
	        nextYear: 'Следующий год', // >>
	        today: 'Сегодня',
	        month: 'Месяц',
	        week: 'Неделя',
	        day: 'День'
		},
		editable: false,
		events: '/calendar/get'
	});
});
