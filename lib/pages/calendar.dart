import 'package:flutter/material.dart';
import 'package:hamewari/providers/settings_provider.dart';
import 'package:hamewari/ui/buttons/main_page_selector.dart';
import 'package:hamewari/ui/calendar/calendar_view.dart';
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
  late int _selectedViewIndex;
  bool _isProgrammaticPageChange = false;
  CalendarHeaderBackButton? _backButton;

  @override
  void initState() {
    super.initState();

    final settingsProvider = Provider.of<SettingsProvider>(
      context,
      listen: false,
    );

    _selectedViewIndex = settingsProvider.selectedCalendarViewIndex;

    _pageController = PageController(initialPage: _selectedViewIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _changeView(
    int newViewIndex, {
    required SettingsProvider settingsProvider,
    bool animate = true,
  }) async {
    if (newViewIndex == _selectedViewIndex) return;

    setState(() {
      _selectedViewIndex = newViewIndex;
    });

    if (animate) {
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

    settingsProvider.setSelectedCalendarViewIndex(
      newViewIndex,
      persistChange: false,
    );

    if (await Vibration.hasVibrator()) {
      await Vibration.vibrate(preset: VibrationPreset.softPulse);
    }
  }

  void setBackButton(CalendarHeaderBackButton? backButton) {
    setState(() {
      _backButton = backButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final settingsProvider = context.watch<SettingsProvider>();

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      appBar: CalendarHeader(
        selectedViewIndex: _selectedViewIndex,
        backButton: _backButton,
        onViewIndexChanged: (index) =>
            _changeView(index, settingsProvider: settingsProvider),
      ),
      body: PageView(
        controller: _pageController,
        physics: Theme.of(context).platform == TargetPlatform.iOS
            ? const BouncingScrollPhysics()
            : const ClampingScrollPhysics(),
        onPageChanged: (index) {
          if (_isProgrammaticPageChange) return;

          _changeView(
            index,
            settingsProvider: settingsProvider,
            animate: false,
          );
        },
        children: CalendarView.all(setBackButton: setBackButton),
      ),
      floatingActionButton: const MainPageSelector(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
