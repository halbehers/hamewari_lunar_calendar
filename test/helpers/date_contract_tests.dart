import 'package:flutter_test/flutter_test.dart';
import 'package:hamewari/calendar/date.dart';

typedef DateFactory<T extends Date<T>> =
    T Function(int year, [int month, int day, int hour, int minute]);

void dateContractTests<T extends Date<T>>({
  required String description,
  required DateFactory<T> create,
}) {
  group('Date contract – $description', () {
    late T base;

    setUp(() {
      base = create(2026, 1, 22, 10, 30); // Thursday
    });

    group('Construction & identity', () {
      test('newInstance creates equivalent date', () {
        final copy = base.newInstance(2026, 1, 22, 10, 30);
        expect(copy, equals(base));
        expect(copy.hashCode, equals(base.hashCode));
      });

      test('toString contains date and time', () {
        final s = base.toString();
        expect(s, contains('22/1/2026'));
        expect(s, contains('10:30'));
      });
    });

    group('Star-of helpers', () {
      test('startOfYear resets month/day/time', () {
        final s = base.startOfYear();
        expect(s.year, base.year);
        expect(s.month, 1);
        expect(s.day, 1);
      });

      test('startOfMonth resets day/time', () {
        final s = base.startOfMonth();
        expect(s.year, base.year);
        expect(s.month, base.month);
        expect(s.day, 1);
      });

      test('startOfDay resets time', () {
        final s = base.startOfDay();
        expect(s.hour, 0);
        expect(s.minute, 0);
      });

      test('startOfHour resets minute', () {
        final s = base.startOfHour();
        expect(s.hour, base.hour);
        expect(s.minute, 0);
      });

      test('startOfWeek returns weekday 1', () {
        final s = base.startOfWeek();
        expect(s.weekday, 1);
      });
    });

    group('Date comparison', () {
      test('compareTo returns 0 for equal dates', () {
        final other = create(2026, 1, 22, 10, 30);
        expect(base.compareTo(other), 0);
      });

      test('compareTo orders by year → month → day → hour → minute', () {
        expect(base.compareTo(create(2027)), lessThan(0));
        expect(base.compareTo(create(2026, 2)), lessThan(0));
        expect(base.compareTo(create(2026, 1, 23)), lessThan(0));
        expect(base.compareTo(create(2026, 1, 22, 11)), lessThan(0));
        expect(base.compareTo(create(2026, 1, 22, 10, 31)), lessThan(0));
      });

      test('isSameYear()', () {
        expect(base.isSameYear(create(base.year, 5, 24)), isTrue);
        expect(base.isSameYear(create(base.year + 3, 2, 24)), isFalse);
      });

      test('isSameMonth()', () {
        expect(base.isSameMonth(create(base.year, base.month, 24)), isTrue);
        expect(
          base.isSameMonth(create(base.year, base.month + 2, 24)),
          isFalse,
        );
      });

      test('isSameWeek()', () {
        final startOfWeek = base.startOfWeek(containedInMonth: true);
        expect(
          startOfWeek.isSameWeek(
            create(startOfWeek.year, startOfWeek.month, startOfWeek.day + 2),
          ),
          isTrue,
        );
        expect(
          startOfWeek.isSameWeek(
            create(startOfWeek.year, startOfWeek.month, startOfWeek.day - 1),
          ),
          isFalse,
        );
      });

      test('isSameDay()', () {
        expect(base.isSameDay(create(base.year, base.month, base.day)), isTrue);
        expect(
          base.isSameDay(create(base.year, base.month, base.day + 1)),
          isFalse,
        );
      });

      test('isSameHour()', () {
        expect(
          base.isSameHour(
            create(base.year, base.month, base.day, base.hour, 56),
          ),
          isTrue,
        );
        expect(
          base.isSameHour(
            create(base.year, base.month, base.day, base.hour + 3, 56),
          ),
          isFalse,
        );
      });

      test('isSameMinute()', () {
        expect(
          base.isSameMinute(
            create(base.year, base.month, base.day, base.hour, base.minute),
          ),
          isTrue,
        );
        expect(
          base.isSameMinute(
            create(base.year, base.month, base.day, base.hour, base.minute - 5),
          ),
          isFalse,
        );
      });
    });

    test('withX methods only change one field', () {
      expect(base.withYear(2030).year, 2030);
      expect(base.withMonth(5).month, 5);
      expect(base.withDay(15).day, 15);
      expect(base.withHour(8).hour, 8);
      expect(base.withMinute(45).minute, 45);
    });

    group('Collection helpers', () {
      test('getAllDatesFromWeek returns 7 dates', () {
        final list = base.getAllDatesFromWeek();
        expect(list.length, 7);
        for (final item in list) {
          expect(item.year, base.year);
          expect(item.month, base.month);
        }
      });

      test(
        'getAllStartOfMonthsFromYear returns the right amount of entries',
        () {
          final list = base.getAllStartOfMonthsFromYear();
          expect(list.length, base.numberOfMonths);
          for (final item in list) {
            expect(item.year, base.year);
          }
        },
      );

      test('getDateFromWeekDayIndex maps index to day', () {
        final d = base.getDateFromWeekDayIndex(3);
        expect(d.day, 4);
      });

      test('getStartOfMonthDateFromMonthIndex maps index to month', () {
        final d = base.getStartOfMonthDateFromMonthIndex(5);
        expect(d.month, 6);
      });
    });

    test('isCurrentX flags behave correctly', () {
      final now = base.now;
      final before = base.withYear(2025).withMonth(5).withDay(24);

      expect(now.isToday, isTrue);
      expect(now.isCurrentMonth, isTrue);
      expect(now.isCurrentYear, isTrue);
      expect(now.isCurrentHour, isTrue);
      expect(now.isCurrentMinute, isTrue);
      expect(before.isToday, isFalse);
      expect(before.isCurrentMonth, isFalse);
      expect(before.isCurrentYear, isFalse);
      expect(before.isCurrentHour, isFalse);
      expect(before.isCurrentMinute, isFalse);
    });

    group('daysUntil()', () {
      test('is zero for same day', () {
        expect(base.daysUntil(base), 0);
      });

      test('is positive for future date', () {
        final future = create(2026, 1, 25);
        expect(base.daysUntil(future), 2);
      });
    });

    group('static helpers', () {
      test('isDayActive returns true only when all conditions match', () {
        final now = base.now;
        final before = base.withYear(2025).withMonth(5).withDay(24);
        expect(Date.isDayActive(now), isTrue);
        expect(Date.isDayActive(before), isFalse);
      });
    });
  });
}
