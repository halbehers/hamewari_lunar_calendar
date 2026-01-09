import 'package:hamewari/db/models/setting.dart';
import 'package:hamewari/db/repositories/repository.dart';
import 'package:hamewari/db/services/database_service.dart';

class SettingsRepository extends Repository<Setting> {
  @override
  String getTable() {
    return DatabaseTable.settings;
  }

  @override
  Setting newEntity() {
    return Setting();
  }
}
