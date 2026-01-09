import 'package:hamewari/db/models/event.dart';
import 'package:hamewari/db/repositories/repository.dart';
import 'package:hamewari/db/services/database_service.dart';

class EventsRepository extends Repository<Event> {
  @override
  String getTable() {
    return DatabaseTable.events;
  }

  @override
  Event newEntity() {
    return Event();
  }
}
