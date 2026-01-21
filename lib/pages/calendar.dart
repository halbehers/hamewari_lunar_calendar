import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/buttons/main_page_selector.dart';
import 'package:hamewari/ui/calendar/calendar_context.dart';
import 'package:hamewari/ui/calendar/calendar_view_factory.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';
import 'package:hamewari/main.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final PageController _pageController;
  bool _controllerInitialized = false;
  bool _isProgrammaticPageChange = false;

  late int? _selectedViewIndex;
  MoonDate _selectedDate = MoonDate.now();
  CalendarHeaderBackButton? _backButton;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final settingsProvider = context.watch<SettingsProvider>();

    if (!settingsProvider.initialized || _controllerInitialized) return;

    _selectedViewIndex = settingsProvider.selectedCalendarViewIndex;
    _pageController = PageController(
      initialPage: settingsProvider.selectedCalendarViewIndex,
    );

    _controllerInitialized = true;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _changeView(
    int newViewIndex,
    MoonDate? newDate, {
    bool? animate,
  }) async {
    final bool isSameView = newViewIndex == _selectedViewIndex;
    final bool isSameDate = newDate == null || newDate == _selectedDate;

    if (isSameView && isSameDate) return;

    setState(() {
      if (!isSameView) _selectedViewIndex = newViewIndex;
      if (!isSameDate) _selectedDate = newDate;
    });

    if (!isSameView) {
      if (animate ?? true) {
        _isProgrammaticPageChange = true;
        _pageController
            .animateToPage(
              newViewIndex,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOutCubic,
            )
            .then((_) {
              if (mounted) {
                _isProgrammaticPageChange = false;
              }
            });
      } else {
        _pageController.jumpToPage(newViewIndex);
      }
      final SettingsProvider settingsProvider = Provider.of<SettingsProvider>(
        context,
        listen: false,
      );

      settingsProvider.setSelectedCalendarViewIndex(newViewIndex);

      if (await Vibration.hasVibrator()) {
        await Vibration.vibrate(preset: VibrationPreset.softPulse);
      }
    }
  }

  void setBackButton(CalendarHeaderBackButton? backButton) {
    setState(() {
      _backButton = backButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = context.appTheme;

    if (!_controllerInitialized) {
      return const SizedBox(); // Todo: add loader
    }

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      appBar: CalendarHeader(
        selectedViewIndex: _selectedViewIndex!,
        backButton: _backButton,
        onViewIndexChanged: (index) => _changeView(index, _selectedDate),
      ),
      body: PageView(
        controller: _pageController,
        physics: Theme.of(context).platform == TargetPlatform.iOS
            ? const BouncingScrollPhysics()
            : const ClampingScrollPhysics(),
        onPageChanged: (index) {
          if (_isProgrammaticPageChange) return;

          _changeView(index, _selectedDate, animate: false);
        },
        children: CalendarViewFactory.all(date: _selectedDate)
            .map(
              (view) => Provider<CalendarController>(
                create: (_) => CalendarController(
                  selectView:
                      ({
                        required int viewIndex,
                        MoonDate? date,
                        bool? animate,
                      }) => _changeView(viewIndex, date, animate: animate),
                  selectDate: ({required MoonDate date}) =>
                      _changeView(_selectedViewIndex ?? 0, date),
                  setBackButton: setBackButton,
                ),
                child: view,
              ),
            )
            .toList(),
      ),
      floatingActionButton: const MainPageSelector(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
