import 'package:hamewari/db/models/setting.dart';
import 'package:hamewari/db/repositories/repository.dart';
import 'package:hamewari/db/repositories/settings_repository.dart';
import 'package:hamewari/db/services/service.dart';

class SettingsService extends Service<Setting>{
  
  @override
  Repository<Setting> newRepository() {
    return SettingsRepository();
  }

}