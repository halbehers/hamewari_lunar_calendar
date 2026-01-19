abstract class Date<T extends Date<T>> implements Comparable<T> {
  int year = 1971;
  int month = 1;
  int day = 1;
  int hour = 0;
  int minute = 0;

  Date(int year, [int month = 1, int day = 1, int hour = 0, int minute = 0])
    : this._internal(year, month, day, hour, minute);

  T newInstance(
    int year, [
    int month = 1,
    int day = 1,
    int hour = 0,
    int minute = 0,
  ]);

  Date._internal(this.year, this.month, this.day, this.hour, this.minute);

  T get now;

  int get weekday;

  int get numberOfMonths;

  bool isLeapYear(int year);

  int numberOfDaysInMonth(int year, int month);

  DateTime toDateTime() {
    return DateTime(year, month, day, hour, minute);
  }

  T startOfYear() {
    return newInstance(year);
  }

  T startOfMonth() {
    return newInstance(year, month);
  }

  T startOfWeek() {
    final int delta = weekday - 1;

    return subtractDays(delta);
  }

  T startOfDay() {
    return newInstance(year, month, day);
  }

  T startOfHour() {
    return newInstance(year, month, day, hour);
  }

  @override
  int compareTo(T other) {
    final yearCompare = year.compareTo(other.year);
    if (yearCompare != 0) return yearCompare;
    final monthCompare = month.compareTo(other.month);
    if (monthCompare != 0) return monthCompare;
    final dayCompare = day.compareTo(other.day);
    if (dayCompare != 0) return dayCompare;
    final hourCompare = hour.compareTo(other.hour);
    if (hourCompare != 0) return hourCompare;

    return minute.compareTo(other.minute);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is T &&
          year == other.year &&
          month == other.month &&
          day == other.day &&
          hour == other.hour &&
          minute == other.minute;

  @override
  int get hashCode => Object.hash(year, month, day, hour, minute);

  @override
  String toString() =>
      '[Date] $day/$month/$year ${hour.toString().padLeft(2)}:${minute.toString().padLeft(2)}';

  bool get isCurrentYear => isSameYear(now);
  bool get isCurrentMonth => isSameMonth(now);
  bool get isCurrentWeek => isSameWeek(now);
  bool get isToday => isSameDay(now);
  bool get isCurrentHour => isSameHour(now);
  bool get isCurrentMinute => isSameMinute(now);

  bool isSameYear(T other) {
    return year == other.year;
  }

  bool isSameMonth(T other) {
    return year == other.year && month == other.month;
  }

  bool isSameWeek(T other) {
    // TODO
    return year == other.year && month == other.month;
  }

  bool isSameDay(T other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameHour(T other) {
    return year == other.year &&
        month == other.month &&
        day == other.day &&
        hour == other.hour;
  }

  bool isSameMinute(T other) {
    return year == other.year &&
        month == other.month &&
        day == other.day &&
        hour == other.hour &&
        minute == other.minute;
  }

  List<T> getAllDatesFromWeek() {
    // TODO
    return List.generate(7, (int index) => newInstance(year, month, index + 1));
  }

  List<T> getAllStartOfMonthsFromYear() {
    return List.generate(
      numberOfMonths,
      (int index) => newInstance(year, index + 1),
    );
  }

  T getDateFromWeekDayIndex(int index) {
    return newInstance(year, month, index + 1);
  }

  T getStartOfMonthDateFromMonthIndex(int index) {
    return newInstance(year, index + 1);
  }

  T withYear(int year) {
    return newInstance(year, month, day, hour, minute);
  }

  T withMonth(int month) {
    return newInstance(year, month, day, hour, minute);
  }

  T withDay(int day) {
    return newInstance(year, month, day, hour, minute);
  }

  T withHour(int hour) {
    return newInstance(year, month, day, hour, minute);
  }

  T withMinute(int minute) {
    return newInstance(year, month, day, hour, minute);
  }

  T addMonths(int delta) {
    return newInstance(year, (month + delta) % 12, day, hour, minute);
  }

  T addWeeks(int delta) {
    return newInstance(year, month, (day + delta * 7) % 31, hour, minute);
  }

  T addDays(int delta) {
    return newInstance(year, month, (day + delta) % 7, hour, minute);
  }

  T addHours(int delta) {
    return newInstance(year, month, day, (hour + delta) % 24, minute);
  }

  T subtractDays(int days) {
    int y = year;
    int m = month;
    int d = day;

    int remaining = days;

    while (remaining > 0) {
      if (d > 1) {
        d--;
      } else {
        m--;
        if (m == 0) {
          m = 12;
          y--;
        }
        d = numberOfDaysInMonth(y, m);
      }
      remaining--;
    }

    return newInstance(y, m, d);
  }

  T addMinutes(int delta) {
    return newInstance(year, month, day, hour, (minute + delta) % 60);
  }

  int daysUntil(Date other) {
    final a = toDateTime().toUtc();
    final b = other.toDateTime().toUtc();
    return b.difference(a).inDays;
  }

  static bool isDayActive(Date date) {
    return date.isCurrentMonth && date.isCurrentWeek && date.isToday;
  }
}
