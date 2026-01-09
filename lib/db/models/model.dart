abstract class Model<T extends Model<T>> {
  int? _id;

  int? get id => _id;
  set id(int value) => _id = value;

  Map<String, Object?> getValuesMap();

  T fillFromValues(Map<String, Object?> values);
}