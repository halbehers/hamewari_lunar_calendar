import 'package:flutter/material.dart';
import 'package:hamewari/calendar/date.dart';
import 'package:hamewari/l10n/calendar/calendar_localizations.dart';
import 'package:hamewari/main.dart';
import 'package:hamewari/ui/calendar/year/compact_month.dart';

class YearGrid extends StatefulWidget {
  const YearGrid({super.key, required this.date});

  final Date<dynamic> date;

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
    return ((widget.date.month / 2).round() - 1) * 164;
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final t = CalendarLocalizations.of(context)!;
    List<Widget> months = widget.date
        .getAllStartOfMonthsFromYear()
        .map((date) => CompactMonth(date: date))
        .toList();

    return Stack(
      children: [
        GridView.builder(
          itemCount: months.length + 2,
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 164,
          ),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 16.0),
            child: index < months.length
                ? months[index]
                : const SizedBox(height: 64),
          ),
        ),
        if (widget.date.hasOutOfCalendarDays)
          ...widget.date.outOfCalendarDaysBounds.map(
            (bounds) => Positioned(
              top:
                  ((((bounds as OutOfCalendarDayBounds<Date<dynamic>>)
                                      .start
                                      .month /
                                  2)
                              .round() -
                          1) *
                      164) -
                  (_scrollController.hasClients
                      ? _scrollController.offset
                      : 0.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 8.0,
                ),
                decoration: BoxDecoration(
                  // color: appTheme.accentBackgroundColor,
                  borderRadius: BorderRadius.circular(16.0),
                  border: BoxBorder.all(color: appTheme.accentColor),
                ),
                child: Text(t.zero_day, style: appTheme.smallText),
              ),
            ),
          ),
      ],
    );
  }
}
