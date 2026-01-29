// import 'dart:ui';

// import 'package:hamewari/calendar/date.dart';
// import 'package:hamewari/calendar/date_formatter.dart';
// import 'package:sweph/sweph.dart';

// class AstrologicalMoonDate extends Date<AstrologicalMoonDate> {
//   final DateTime utc;

//   AstrologicalMoonDate._internal(
//     this.utc,
//     int year,
//     int month,
//     int day,
//     int hour,
//     int minute,
//   ) : super(year, month, day, hour, minute);

//   factory AstrologicalMoonDate.fromUtc(DateTime utc) {
//     final u = utc.toUtc();
//     return AstrologicalMoonDate._internal(
//       u,
//       u.year,
//       u.month,
//       u.day,
//       u.hour,
//       u.minute,
//     );
//   }

//   @override
//   AstrologicalMoonDate newInstance(
//     int year, [
//     int month = 1,
//     int day = 1,
//     int hour = 0,
//     int minute = 0,
//   ]) {
//     return AstrologicalMoonDate.fromUtc(
//       DateTime.utc(year, month, day, hour, minute),
//     );
//   }

//   @override
//   AstrologicalMoonDate get now =>
//       AstrologicalMoonDate.fromUtc(DateTime.now().toUtc());

//   @override
//   int get numberOfMonths => 13;

//   @override
//   int get numberOfDaysInWeek => 7;

//   // TODO
//   @override
//   int get numberOfHoursInDay => 24;

//   // TODO
//   @override
//   int get numberOfMinutesInHour => 60;

//   double get _julianDay {
//     return Sweph.swe_julday(
//       utc.year,
//       utc.month,
//       utc.day,
//       utc.hour + utc.minute / 60.0,
//       CalendarType.SE_GREG_CAL,
//     );
//   }

//   double _planetLongitude(HeavenlyBody planet) {
//     final result = Sweph.swe_calc_ut(
//       _julianDay,
//       planet,
//       SwephFlag.SEFLG_SWIEPH,
//     );
//     return result.longitude; // 0..360
//   }

//   double get moonLongitude => _planetLongitude(HeavenlyBody.SE_MOON);
//   double get sunLongitude => _planetLongitude(HeavenlyBody.SE_SUN);

//   /// Elongation Moon–Sun (0° = New Moon)
//   double get lunarElongation {
//     final diff = moonLongitude - sunLongitude;
//     return (diff + 360) % 360;
//   }

//   /// Lunar day index since last lunar transit
//   ///
//   /// One lunar day ≈ 24h 50m
//   int get lunarDayIndex {
//     const lunarDayLength = 24.0 + 50.0 / 60.0;
//     final hours = utc.hour + utc.minute / 60.0;
//     return (hours / lunarDayLength).floor();
//   }

//   @override
//   AstrologicalMoonDate startOfDay() {
//     // Start of current tidal lunar day
//     const lunarDayLengthHours = 24.0 + 50.0 / 60.0;

//     final totalMinutes = utc.hour * 60 + utc.minute;
//     final lunarMinutes = (lunarDayLengthHours * 60).round();

//     final offset = totalMinutes % lunarMinutes;

//     return AstrologicalMoonDate.fromUtc(
//       utc.subtract(Duration(minutes: offset)),
//     );
//   }

//   @override
//   AstrologicalMoonDate startOfMonth() {
//     // Walk backward to last New Moon
//     var jd = _julianDay;
//     const step = 0.5; // half-day resolution

//     while (true) {
//       final moon = Sweph.swe_calc_ut(
//         jd,
//         HeavenlyBody.SE_MOON,
//         SwephFlag.SEFLG_SWIEPH,
//       ).longitude;
//       final sun = Sweph.swe_calc_ut(
//         jd,
//         HeavenlyBody.SE_SUN,
//         SwephFlag.SEFLG_SWIEPH,
//       ).longitude;
//       final elongation = (moon - sun + 360) % 360;

//       if (elongation < 1.0) {
//         final dt = Sweph.swe_revjul(jd, CalendarType.SE_GREG_CAL);
//         return AstrologicalMoonDate.fromUtc(
//           DateTime.utc(dt.year, dt.month, dt.day),
//         );
//       }

//       jd -= step;
//     }
//   }

//   @override
//   int get weekday => utc.weekday;

//   @override
//   bool isLeapYear(int year) => false;

//   @override
//   int numberOfDaysInMonth(int year, int month) {
//     // Not meaningful — kept for compatibility
//     return 30;
//   }

//   @override
//   DateFormatter<AstrologicalMoonDate> newFormatter(
//     String pattern,
//     Locale? locale,
//   ) {
//     throw UnimplementedError();
//   }
// }
