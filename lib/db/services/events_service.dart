import 'package:hamewari/db/models/event.dart';
import 'package:hamewari/db/repositories/events_repository.dart';
import 'package:hamewari/db/repositories/repository.dart';
import 'package:hamewari/db/services/service.dart';

class EventsService extends Service<Event> {
  @override
  Repository<Event> newRepository() {
    return EventsRepository();
  }
}
