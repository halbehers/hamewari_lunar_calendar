enum Month {
  magnetic(1, "Magnetic"),
  lunar(2, "Lunar"),
  electric(3, "Electric"),
  selfExistent(4, "Self-Existent"),
  harmonic(5, "Harmonic"),
  rhythmic(6, "Rhythmic"),
  resonant(7, "Resonant"),
  galactic(8, "Galactic"),
  solar(9, "Solar"),
  planetary(10, "Planetary"),
  spectral(11, "Spectral"),
  crystal(12, "Crystal"),
  cosmic(13, "Cosmic");

  const Month(this.monthNumber, this.name);

  final int monthNumber;
  final String name;
}

class MonthManager {
  
  MonthManager._privateConstructor();
  static final MonthManager instance = MonthManager._privateConstructor();

  List<Month> get months {
    return Month.values;
  }

  Month getMonthByNumber(int monthNumber) {
    return Month.values[monthNumber - 1];
  }
}