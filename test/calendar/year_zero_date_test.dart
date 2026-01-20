import 'package:flutter_test/flutter_test.dart';
import 'package:hamewari/calendar/year_zero_date.dart';

void main() {
  group('YearZeroDate', () {
    late YearZeroDate base;

    setUp(() {
      base = YearZeroDate(0, 5, 14);
    });

    // ============================================================
    group('Structure invariants', () {
      test('supports exactly 13 months', () {
        for (int m = 1; m <= 13; m++) {
          expect(() => YearZeroDate(0, m, 1), returnsNormally);
        }

        expect(() => YearZeroDate(0, 14, 1), throwsArgumentError);
      });

      test('each month has exactly 28 days', () {
        for (int d = 1; d <= 28; d++) {
          expect(() => YearZeroDate(0, 1, d), returnsNormally);
        }

        expect(() => YearZeroDate(0, 1, 29), throwsArgumentError);
      });
    });

    // ============================================================
    group('Week structure', () {
      test('weekday is always between 1 and 7', () {
        for (int d = 1; d <= 28; d++) {
          final date = YearZeroDate(0, 1, d);
          expect(date.weekday, inInclusiveRange(1, 7));
        }
      });

      test('every month starts on weekday 1', () {
        for (int m = 1; m <= 13; m++) {
          final date = YearZeroDate(0, m, 1);
          expect(date.weekday, 1);
        }
      });

      test('weekday repeats every 7 days', () {
        for (int d = 1; d <= 21; d++) {
          final a = YearZeroDate(0, 1, d);
          final b = YearZeroDate(0, 1, d + 7);
          expect(a.weekday, b.weekday);
        }
      });
    });

    // ============================================================
    group('Start-of-X semantics', () {
      test('startOfWeek always lands on weekday 1', () {
        for (int d = 1; d <= 28; d++) {
          final date = YearZeroDate(0, 3, d);
          final start = date.startOfWeek();
          expect(start.weekday, 1);
        }
      });

      test('startOfMonth resets day to 1', () {
        final start = base.startOfMonth();
        expect(start.day, 1);
        expect(start.month, base.month);
      });

      test('startOfYear resets month and day to 1', () {
        final start = base.startOfYear();
        expect(start.month, 1);
        expect(start.day, 1);
      });
    });

    // ============================================================
    group('Date arithmetic', () {
      test('adding 28 days advances exactly one month', () {
        final next = base.addDays(28);
        expect(next.month, base.month + 1);
        expect(next.day, base.day);
      });

      test('adding 7 days preserves weekday', () {
        final later = base.addDays(7);
        expect(later.weekday, base.weekday);
      });

      test('addWeeks is equivalent to addDays * 7', () {
        final byWeeks = base.addWeeks(3);
        final byDays = base.addDays(21);
        expect(byWeeks, byDays);
      });

      test('month rollover after month 13 advances year', () {
        final date = YearZeroDate(0, 13, 28).addDays(1);
        expect(date.year, 1);
        expect(date.month, 1);
        expect(date.day, 1);
      });
    });

    // ============================================================
    group('Leap year rules', () {
      test('leap year occurs every 4 years', () {
        expect(base.isLeapYear(0), isTrue);
        expect(base.isLeapYear(1), isFalse);
        expect(base.isLeapYear(2), isFalse);
        expect(base.isLeapYear(3), isFalse);
        expect(base.isLeapYear(4), isTrue);
      });
    });

    // ============================================================
    group('Zero Day isolation', () {
      test('YearZeroDate cannot represent Zero Day', () {
        expect(() => YearZeroDate(0, 0, 0), throwsArgumentError);
      });

      test('isZeroDay is always false for regular dates', () {
        expect(base.isZeroDay, isFalse);
      });
    });

    // ============================================================
    group('Comparison & equality', () {
      test('dates are totally ordered', () {
        final a = YearZeroDate(0, 1, 1);
        final b = YearZeroDate(0, 1, 2);
        final c = YearZeroDate(0, 2, 1);

        expect(a.compareTo(b), lessThan(0));
        expect(b.compareTo(c), lessThan(0));
        expect(a.compareTo(c), lessThan(0));
      });

      test('equality is structural', () {
        expect(YearZeroDate(1, 3, 10), YearZeroDate(1, 3, 10));
      });
    });
  });

  group('Arithmetic helpers', () {
    group('addDays()', () {
      test('advances the date correctly within a month', () {
        final base = YearZeroDate(2, 5, 10);
        final result = base.addDays(5);
        expect(result.day, 15);
        expect(result.month, 5);
        expect(result.year, 2);
      });

      test('rolls over to next month', () {
        final base = YearZeroDate(2, 5, 28);
        final result = base.addDays(3);
        expect(result.day, 3);
        expect(result.month, 6);
        expect(result.year, 2);
      });

      test('rolls over to next year', () {
        final base = YearZeroDate(2, 13, 28);
        final result = base.addDays(1);
        expect(result.day, 1);
        expect(result.month, 1);
        expect(result.year, 3);
      });
    });

    group('subtractDays()', () {
      test('moves date backward within a month', () {
        final base = YearZeroDate(2, 5, 10);
        final result = base.subtractDays(5);
        expect(result.day, 5);
        expect(result.month, 5);
        expect(result.year, 2);
      });

      test('rolls back to previous month', () {
        final base = YearZeroDate(2, 5, 3);
        final result = base.subtractDays(5);
        expect(result.day, 26);
        expect(result.month, 4);
        expect(result.year, 2);
      });

      test('rolls back to previous year', () {
        final base = YearZeroDate(2, 1, 1);
        final result = base.subtractDays(1);
        expect(result.day, 28);
        expect(result.month, 13);
        expect(result.year, 1);
      });
    });

    group('addWeeks()', () {
      test('advances by multiples of 7 days', () {
        final base = YearZeroDate(2, 5, 10);
        final result = base.addWeeks(2);
        expect(result.day, 24);
        expect(result.month, 5);
        expect(result.year, 2);
      });
    });

    group('subtractWeeks()', () {
      test('rolls back to previous month', () {
        final base = YearZeroDate(2, 5, 10);
        final result = base.subtractWeeks(2);
        expect(result.day, 24);
        expect(result.month, 4);
        expect(result.year, 2);
      });
    });

    group('addMonths()', () {
      test('rolls over within year', () {
        final base = YearZeroDate(2, 5, 10);
        final result = base.addMonths(3);
        expect(result.month, 8);
        expect(result.day, 10);
        expect(result.year, 2);
      });

      test('rolls over to next year', () {
        final base = YearZeroDate(2, 11, 10);
        final result = base.addMonths(3);
        expect(result.month, 1);
        expect(result.day, 10);
        expect(result.year, 3);
      });
    });

    group('subtractMonths()', () {
      test('rolls back within year', () {
        final base = YearZeroDate(2, 5, 10);
        final result = base.subtractMonths(3);
        expect(result.month, 2);
        expect(result.day, 10);
        expect(result.year, 2);
      });

      test('rolls back to previous year', () {
        final base = YearZeroDate(2, 2, 10);
        final result = base.subtractMonths(3);
        expect(result.month, 12);
        expect(result.day, 10);
        expect(result.year, 1);
      });
    });

    group('addHours()', () {
      test('increments day when hour exceeds 23', () {
        final base = YearZeroDate(2, 5, 10, 20);
        final result = base.addHours(5);
        expect(result.hour, 1);
        expect(result.day, 11);
        expect(result.month, 5);
      });
    });

    group('subtractHours()', () {
      test('decrements day when hour goes below 0', () {
        final base = YearZeroDate(2, 5, 10, 2);
        final result = base.subtractHours(5);
        expect(result.hour, 21);
        expect(result.day, 9);
        expect(result.month, 5);
      });
    });

    group('addMinutes()', () {
      test('increments hour and day when minutes exceed 59', () {
        final base = YearZeroDate(2, 5, 10, 22, 50);
        final result = base.addMinutes(15);
        expect(result.hour, 23);
        expect(result.minute, 5);
        expect(result.day, 10);
      });
    });

    group('subtractMinutes()', () {
      test('decrements hour and day when minutes go below 0', () {
        final base = YearZeroDate(2, 5, 10, 0, 10);
        final result = base.subtractMinutes(20);
        expect(result.hour, 23);
        expect(result.minute, 50);
        expect(result.day, 9);
      });
    });
  });
}
