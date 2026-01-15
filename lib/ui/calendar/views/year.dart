import 'package:flutter/material.dart';
import 'package:hamewari/calendar/calendar_manager.dart';
import 'package:hamewari/calendar/moon_date.dart';
import 'package:hamewari/ui/calendar/compact_month.dart';

class YearView extends StatefulWidget {
  const YearView({super.key});

  @override
  State<YearView> createState() => _YearViewState();
}

class _YearViewState extends State<YearView> {
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

    return (currentMonth.monthNumber / 2) * 164;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> months = CalendarManager.instance.months
        .map((month) => CompactMonth(month: month))
        .toList();

    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: GridView.builder(
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
      ),
    );
  }
}
