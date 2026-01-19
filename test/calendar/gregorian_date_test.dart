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
}
