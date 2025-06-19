import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:smartpath/controller/student_controller/home/calendar/holiday_controller.dart';

CalendarDatePicker2 calendarWidget({
  required List<DateTime?> datesList,
  required List<DateTime> holidays,
  required Holiday holiday,
}) {
  return CalendarDatePicker2(
    config: CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.single,
      dayBuilder: ({
        required DateTime date,
        BoxDecoration? decoration,
        bool? isDisabled,
        bool? isSelected,
        bool? isToday,
        TextStyle? textStyle,
      }) {
        // Here it will be checked whether this day is a weekend or a special holiday to mark it.
        final isManualHoliday = holidays.any(
          (holiday) =>
              holiday.year == date.year &&
              holiday.month == date.month &&
              holiday.day == date.day,
        );
        final isWeekend =
            date.weekday == DateTime.friday ||
            date.weekday == DateTime.saturday;
        final isHoliday = isManualHoliday || isWeekend;
        Color backgroundColor = Colors.transparent;
        Color textColor = Colors.black;
        if (isSelected == true) {
          backgroundColor = Colors.indigo;
          textColor = Colors.white;
        } else if (isHoliday) {
          backgroundColor = Colors.green;
          textColor = Colors.white;
        } else if (isToday == true) {
          backgroundColor = Colors.grey.shade300;
          textColor = Colors.black;
        }
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '${date.day}',
            style: TextStyle(
              color: textColor,
              fontWeight: isToday == true ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      },
    ),
    value: datesList,
    onValueChanged: (dates) {
      // This will check if this day is a weekend or special holiday to show nothing
      main:
      for (var i = 0; i < dates.length; i++) {
        for (var j = 0; j < holidays.length; j++) {
          if (dates[i] == holidays[j] ||
              dates[i].weekday == DateTime.friday ||
              dates[i].weekday == DateTime.saturday) {
            holiday.isHoliday();
            break main;
          } else {
            holiday.isNotHoliday();
          }
        }
      }
      datesList = dates;
    },
  );
}
