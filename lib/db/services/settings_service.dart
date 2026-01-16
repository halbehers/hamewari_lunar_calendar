import 'package:hamewari/db/models/setting.dart';
import 'package:hamewari/db/repositories/repository.dart';
import 'package:hamewari/db/repositories/settings_repository.dart';
import 'package:hamewari/db/services/service.dart';

class SettingsService extends Service<Setting> {
  static String selectedCalendarViewIndexId = "selected-calendar-view-index";
  static String displayMenuCaptionsId = "display-menu-caption";
  static String selectedThemeModeId = "selected-theme-mode";
  static String selectedLocaleId = "selected-locale";

  @override
  Repository<Setting> newRepository() {
    return SettingsRepository();
  }

  void setupByName<T>(
    String name,
    T value, {
    SettingValueType? valueType,
  }) async {
    final List<Setting> existingSetting = await repository.findBy(
      where: "name = ?",
      whereArgs: [name],
    );
    if (existingSetting.isEmpty) {
      final Setting newEntity = Setting();
      newEntity.name = name;
      newEntity.value = value.toString();
      newEntity.valueType = valueType ?? SettingValueType.string;
      await create(newEntity);
    } else {
      final Setting entity = existingSetting.first;
      entity.value = value.toString();
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
