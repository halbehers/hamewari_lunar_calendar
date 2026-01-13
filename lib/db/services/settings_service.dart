import 'package:hamewari/db/models/setting.dart';
import 'package:hamewari/db/repositories/repository.dart';
import 'package:hamewari/db/repositories/settings_repository.dart';
import 'package:hamewari/db/services/service.dart';

class SettingsService extends Service<Setting> {
  static String selectedCalendarViewId = "selected-calendar-view";
  static String displayMenuCaptionsId = "display-menu-caption";
  static String selectedThemeModeId = "selected-theme-mode";
  static String selectedLocaleId = "selected-locale";

  @override
  Repository<Setting> newRepository() {
    return SettingsRepository();
  }

  void setupByName(
    String name,
    String value, {
    SettingValueType? valueType,
  }) async {
    final List<Setting> existingSetting = await repository.findBy(
      where: "name = ?",
      whereArgs: [name],
    );
    if (existingSetting.isEmpty) {
      final Setting newEntity = Setting();
      newEntity.name = name;
      newEntity.value = value;
      newEntity.valueType = valueType ?? SettingValueType.string;
      await create(newEntity);
    } else {
      final Setting entity = existingSetting.first;
      entity.value = value;
      entity.valueType = valueType ?? SettingValueType.string;
      await update(entity);
    }
  }

  Future<Setting?> findByName(String name) async {
    return (await repository.findBy(
      where: "name = ?",
      whereArgs: [name],
    )).firstOrNull;
  }
}
