import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/ui/calendar/week/hour.dart';
import 'package:hamewari/ui/calendar/week/time_indicator.dart';

class DayCalendar extends StatefulWidget {
  const DayCalendar({super.key, required this.date});

  final MoonDate date;

  @override
  State<DayCalendar> createState() => _DayCalendarState();
}

class _DayCalendarState extends State<DayCalendar> {
  late Timer _timer;
  late final ValueNotifier<DateTime> _now;

  final ScrollController _scrollController = ScrollController();

  bool _didAutoScroll = false;

  double get _currentTimeOffset {
    final now = _now.value;
    final minutesSinceMidnight = now.hour * 60 + now.minute;
    return (minutesSinceMidnight / 60) * hourRowHeight;
  }

  @override
  void initState() {
    super.initState();
    _now = ValueNotifier(DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 15), (_) {
      _now.value = DateTime.now();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScroll();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _now.dispose();
    _scrollController.dispose();
    super.dispose();
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
    final offset = 64.0;

    if (widget.date.isToday) {
      final now = _now.value;
      final seconds = now.hour * 3600 + now.minute * 60 + now.second;
      return (seconds / 3600) * hourRowHeight - offset;
    }

    return 9 * hourRowHeight - offset;
  }

  Widget _buildHoursList() {
    return ListView(
      controller: _scrollController,
      children: [
        ...List.generate(25, (hour) {
          return Hour(hour: hour);
        }),
        const SizedBox(height: 64.0),
      ],
    );
  }

  Widget _buildTimeIndicatorOverlay() {
    return Positioned(
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: Listenable.merge([_scrollController, _now]),
        builder: (_, _) {
          final double offset =
              _currentTimeOffset -
              (_scrollController.hasClients ? _scrollController.offset : 0.0);
          final double cleanedOffset = offset > 0 ? offset : 0;

          return Transform.translate(
            offset: Offset(0, cleanedOffset),
            // ignore: prefer_const_constructors
            child: offset < -6 ? null : TimeIndicator(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isActive = widget.date.isToday;

    return Expanded(
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          _buildHoursList(),
          if (isActive) _buildTimeIndicatorOverlay(),
        ],
      ),
    );
  }
}
