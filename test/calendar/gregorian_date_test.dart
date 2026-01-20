import 'package:flutter_test/flutter_test.dart';
import 'package:hamewari/calendar/gregorian_date.dart';

import '../helpers/date_contract_tests.dart';

void main() {
  dateContractTests<GregorianDate>(
    description: 'GregorianDate',
    create: (y, [m = 1, d = 1, h = 0, min = 0]) =>
        GregorianDate(y, m, d, h, min),
  );

  group('GregorianDate now', () {
    test('Gregorian now is equal to DateTime now', () {
      final gd = GregorianDate.now(); // Monday
      final dt = DateTime.now(); // Monday
      expect(gd.year, equals(dt.year));
      expect(gd.month, equals(dt.month));
      expect(gd.day, equals(dt.day));
    });
  });

  group('GregorianDate weekday getter', () {
    test('Monday is 1', () {
      final date = GregorianDate(2026, 1, 19); // Monday
      expect(date.weekday, equals(1));
    });

    test('Sunday is 7', () {
      final date = GregorianDate(2026, 1, 25); // Sunday
      expect(date.weekday, equals(7));
    });

    test('weekday matches known historical dates', () {
      final cases = {
        GregorianDate(1969, 7, 20): 7, // Moon landing Sunday
        GregorianDate(2000, 1, 1): 6, // Saturday
        GregorianDate(2024, 2, 29): 4, // Thursday
      };

      for (final entry in cases.entries) {
        expect(entry.key.weekday, entry.value);
      }
    });
  });

  group('leap year rules', () {
    test('2024 is leap year', () {
      expect(GregorianDate(2024).isLeapYear(2024), isTrue);
    });

    test('1900 is NOT leap year', () {
      expect(GregorianDate(1900).isLeapYear(1900), isFalse);
    });

    test('2000 IS leap year', () {
      expect(GregorianDate(2000).isLeapYear(2000), isTrue);
    });
  });

  group('numberOfDaysInMonth()', () {
    test('February in leap year', () {
      final date = GregorianDate(2024, 2, 1);
      expect(date.numberOfDaysInMonth(2024, 2), equals(29));
    });

    test('February in non-leap year', () {
      final date = GregorianDate(2025, 2, 1);
      expect(date.numberOfDaysInMonth(2025, 2), equals(28));
    });

    test('April has 30 days', () {
      final date = GregorianDate(2025, 4, 1);
      expect(date.numberOfDaysInMonth(2025, 4), equals(30));
    });
  });

  group('startOfWeek()', () {
    test('past year', () {
      final date = GregorianDate(2026, 1, 3);
      final startOfWeek = date.startOfWeek();

      expect(startOfWeek.day, equals(29));
      expect(startOfWeek.month, equals(12));
      expect(startOfWeek.year, equals(2025));
      expect(startOfWeek.weekday, equals(1));
    });

    test('middle of month', () {
      final date = GregorianDate(2026, 1, 23);
      final startOfWeek = date.startOfWeek();

      expect(startOfWeek.day, equals(19));
      expect(startOfWeek.month, equals(1));
      expect(startOfWeek.year, equals(2026));
      expect(startOfWeek.weekday, equals(1));
    });

    test('contained beginning of month', () {
      final date = GregorianDate(2026, 1, 3);
      final startOfWeek = date.startOfWeek(containedInMonth: true);

      expect(startOfWeek.day, equals(1));
      expect(startOfWeek.month, equals(1));
      expect(startOfWeek.year, equals(2026));
      expect(startOfWeek.weekday, equals(4));
    });

    test('contained middle of month', () {
      final date = GregorianDate(2026, 1, 23);
      final startOfWeek = date.startOfWeek(containedInMonth: true);

      expect(startOfWeek.day, equals(19));
      expect(startOfWeek.month, equals(1));
      expect(startOfWeek.year, equals(2026));
      expect(startOfWeek.weekday, equals(1));
    });
  });

  group('getAllDatesFromWeek()', () {
    test('past year', () {
      final date = GregorianDate(2026, 1, 3);
      final datesFromWeek = date.getAllDatesFromWeek();

      expect(datesFromWeek.length, 7);
    });

    test('middle of month', () {
      final date = GregorianDate(2026, 1, 23);
      final datesFromWeek = date.getAllDatesFromWeek();

      expect(datesFromWeek.length, 7);
    });

    test('end of month', () {
      final date = GregorianDate(2026, 1, 29);
      final datesFromWeek = date.getAllDatesFromWeek();

      expect(datesFromWeek.length, 7);
    });

    test('contained beginning of month', () {
      final date = GregorianDate(2026, 1, 3);
      final datesFromWeek = date.getAllDatesFromWeek(containedInMonth: true);

      expect(datesFromWeek.length, 4);
    });

    test('contained middle of month', () {
      final date = GregorianDate(2026, 1, 23);
      final datesFromWeek = date.getAllDatesFromWeek(containedInMonth: true);

      expect(datesFromWeek.length, 7);
    });

    test('contained end of month', () {
      final date = GregorianDate(2026, 1, 29);
      final datesFromWeek = date.getAllDatesFromWeek(containedInMonth: true);

      expect(datesFromWeek.length, 6);
    });
  });

  group('Arithmetic helpers', () {
    group('addDays()', () {
      test('advances the date correctly within a month', () {
        final base = GregorianDate(2026, 5, 10);
        final result = base.addDays(5);
        expect(result.day, 15);
        expect(result.month, 5);
        expect(result.year, 2026);
      });

      test('rolls over to next month', () {
        final base = GregorianDate(2026, 5, 28);
        final result = base.addDays(3);
        expect(result.day, 31);
        expect(result.month, 5);
        expect(result.year, 2026);
      });

      test('rolls over to next year', () {
        final base = GregorianDate(2026, 12, 31);
        final result = base.addDays(1);
        expect(result.day, 1);
        expect(result.month, 1);
        expect(result.year, 2027);
      });
    });

    group('subtractDays()', () {
      test('moves date backward within a month', () {
        final base = GregorianDate(2026, 5, 10);
        final result = base.subtractDays(5);
        expect(result.day, 5);
        expect(result.month, 5);
        expect(result.year, 2026);
      });

      test('rolls back to previous month', () {
        final base = GregorianDate(2026, 5, 3);
        final result = base.subtractDays(5);
        expect(result.day, 28);
        expect(result.month, 4);
        expect(result.year, 2026);
      });

      test('rolls back to previous year', () {
        final base = GregorianDate(2026, 1, 1);
        final result = base.subtractDays(1);
        expect(result.day, 31);
        expect(result.month, 12);
        expect(result.year, 2025);
      });
    });

    group('addWeeks()', () {
      test('advances by multiples of 7 days', () {
        final base = GregorianDate(2026, 5, 10);
        final result = base.addWeeks(2);
        expect(result.day, 24);
        expect(result.month, 5);
        expect(result.year, 2026);
      });
    });

    group('subtractWeeks()', () {
      test('moves backward by multiples of 7 days', () {
        final base = GregorianDate(2026, 5, 10);
        final result = base.subtractWeeks(2);
        expect(result.day, 26);
        expect(result.month, 4);
        expect(result.year, 2026);
      });
    });

    group('addMonths()', () {
      test('rolls over within year', () {
        final base = GregorianDate(2026, 5, 10);
        final result = base.addMonths(3);
        expect(result.month, 8);
        expect(result.day, 10);
        expect(result.year, 2026);
      });

      test('rolls over to next year', () {
        final base = GregorianDate(2026, 11, 10);
        final result = base.addMonths(3);
        expect(result.month, 2);
        expect(result.day, 10);
        expect(result.year, 2027);
      });
    });

    group('subtractMonths()', () {
      test('rolls back within year', () {
        final base = GregorianDate(2026, 5, 10);
        final result = base.subtractMonths(3);
        expect(result.month, 2);
        expect(result.day, 10);
        expect(result.year, 2026);
      });

      test('rolls back to previous year', () {
        final base = GregorianDate(2026, 2, 10);
        final result = base.subtractMonths(3);
        expect(result.month, 11);
        expect(result.day, 10);
        expect(result.year, 2025);
      });
    });

    group('addHours()', () {
      test('increments day when hour exceeds 23', () {
        final base = GregorianDate(2026, 5, 10, 20);
        final result = base.addHours(5);
        expect(result.hour, 1);
        expect(result.day, 11);
        expect(result.month, 5);
      });
    });

    group('subtractHours()', () {
      test('decrements day when hour goes below 0', () {
        final base = GregorianDate(2026, 5, 10, 2);
        final result = base.subtractHours(5);
        expect(result.hour, 21);
        expect(result.day, 9);
        expect(result.month, 5);
      });
    });

    group('addMinutes()', () {
      test('increments hour and day when minutes exceed 59', () {
        final base = GregorianDate(2026, 5, 10, 22, 50);
        final result = base.addMinutes(15);
        expect(result.hour, 23);
        expect(result.minute, 5);
        expect(result.day, 10);
      });
    });

    group('subtractMinutes()', () {
      test('decrements hour and day when minutes go below 0', () {
        final base = GregorianDate(2026, 5, 10, 0, 10);
        final result = base.subtractMinutes(20);
        expect(result.hour, 23);
        expect(result.minute, 50);
        expect(result.day, 9);
      });
    });
  });
}
