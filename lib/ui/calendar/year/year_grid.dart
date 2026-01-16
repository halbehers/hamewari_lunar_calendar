import 'package:flutter/material.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/ui/calendar/calendar_view.dart';
import 'package:hamewari/ui/calendar/year/compact_month.dart';

class YearGrid extends StatefulWidget implements CalendarView {
  const YearGrid({super.key, required this.date});

  final MoonDate date;

  @override
  State<YearGrid> createState() => _YearCalendarState();
}

class _YearCalendarState extends State<YearGrid> {
  final ScrollController _scrollController = ScrollController();
  bool _didAutoScroll = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScroll();
    });
  }

  @override
  void dispose() {
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
    Month currentMonth = MoonDate.currentMonth;
    if (widget.date.year == MoonDate.currentYear) {
      return (currentMonth.monthNumber / 2) * 164;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> months = widget.date
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
  }
}
