import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/calendar/moon_date_formatting.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/theme/app_theme.dart';
import 'package:hamewari/ui/calendar/calendar_motion.dart';
import 'package:hamewari/ui/calendar/calendar_view.dart';
import 'package:hamewari/ui/calendar/year/compact_month.dart';
import 'package:hamewari/ui/headers/calendar_header.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class YearCalendar extends StatefulWidget implements CalendarView {
  const YearCalendar({super.key, required this.date, this.setBackButton});

  final MoonDate date;
  final void Function(CalendarHeaderBackButton?)? setBackButton;

  @override
  State<YearCalendar> createState() => _YearCalendarState();
}

class _YearCalendarState extends State<YearCalendar> {
  late final PageController _pageController;
  late MoonDate _selectedDate;
  final ScrollController _scrollController = ScrollController();
  bool _didAutoScroll = false;
  bool _isProgrammaticPageChange = false;

  @override
  void initState() {
    super.initState();

    _selectedDate = widget.date;

    _pageController = PageController(initialPage: _selectedDate.year);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScroll();
      if (!mounted) return;

      setupBackButton();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void setupBackButton() {
    AppTheme appTheme = context.appTheme;

    widget.setBackButton?.call(
      CalendarHeaderBackButton(
        text: _selectedDate.format(
          context,
          pattern: MoonDateFormat.yearPattern,
        ),
        style: _selectedDate.year == MoonDate.currentYear
            ? appTheme.accentH2
            : appTheme.h2,
      ),
    );
  }

  void _autoScroll() {
    if (_didAutoScroll) return;
    if (!_scrollController.hasClients) return;

    final target = _initialScrollOffset();

    _scrollController.jumpTo(
      target.clamp(0.0, _scrollController.position.maxScrollExtent),
    );

    _didAutoScroll = true;
  }

  double _initialScrollOffset() {
    Month currentMonth = MoonDate.currentMonth;
    if (_selectedDate.year == MoonDate.currentYear) {
      return (currentMonth.monthNumber / 2) * 164;
    }

    return 0;
  }

  void _changeDate(MoonDate date, {bool animate = true}) async {
    setState(() {
      _selectedDate = date;
    });

    setupBackButton();

    if (animate) {
      _isProgrammaticPageChange = true;
      _pageController
          .animateToPage(
            date.year,
            duration: CalendarMotion.pageDuration,
            curve: CalendarMotion.pageCurve,
          )
          .then((_) {
            if (mounted) {
              _isProgrammaticPageChange = false;
            }
          });
    } else {
      _pageController.jumpToPage(date.year);
    }

    if (await Vibration.hasVibrator()) {
      await Vibration.vibrate(preset: VibrationPreset.softPulse);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: Theme.of(context).platform == TargetPlatform.iOS
          ? const BouncingScrollPhysics()
          : const ClampingScrollPhysics(),
      onPageChanged: (index) {
        if (_isProgrammaticPageChange) return;
        _changeDate(MoonDate(index), animate: false);
      },
      itemBuilder: (_, year) {
        List<Widget> months = _selectedDate
            .getAllStartOfMonthsFromYear()
            .map((date) => CompactMonth(date: date))
            .toList();

        return GridView.builder(
          itemCount: months.length,
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 164,
          ),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 16.0),
            child: months[index],
          ),
        );
      },
    );
  }
}
