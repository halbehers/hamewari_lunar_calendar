import 'package:hamewari/db/models/model.dart';

class Event extends Model<Event> {
  String name = "";
  DateTime startingAt = DateTime.now();
  DateTime endingAt = DateTime.now();

  @override
  Map<String, Object?> getValuesMap() {
    return {"name": name, "starting_at": startingAt, "ending_at": endingAt};
  }

  @override
  Event fillFromValues(Map<String, Object?> values) {
    if (values["id"] != null) {
      id = values["id"] as int;
    }
    if (values["name"] != null) {
      name = values["name"] as String;
    }
    if (values["starting_at"] != null) {
      startingAt = values["starting_at"] as DateTime;
    }
    if (values["ending_at"] != null) {
      endingAt = values["ending_at"] as DateTime;
    }
    return this;
  }
}
