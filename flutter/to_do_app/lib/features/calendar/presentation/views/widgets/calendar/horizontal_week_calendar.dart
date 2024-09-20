/*
this widget is from horizontal_week_calendar
https://pub.dev/packages/horizontal_week_calendar/install
 */

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:intl/intl.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';

enum WeekStartFrom { Sunday, Monday }

class HorizontalWeekCalendar extends StatefulWidget {
  final WeekStartFrom weekStartFrom;
  final Function(DateTime)? onDateChange;
  final Function(List<DateTime>)? onWeekChange;
  final Color? activeBackgroundColor;
  final Color? inactiveBackgroundColor;
  final Color? disabledBackgroundColor;
  final TextStyle? activeDateNameStyle;
  final TextStyle? activeDateNumberStyle;
  final TextStyle? inactiveTextStyle;
  final TextStyle? disabledTextStyle;
  final Color? activeNavigatorColor;
  final Color? inactiveNavigatorColor;
  final TextStyle? monthStyle;
  final TextStyle? yearStyle;
  final BorderRadiusGeometry? borderRadius;
  final ScrollPhysics? scrollPhysics;
  final bool showNavigationButtons;
  final String? monthFormat;
  final DateTime minDate;
  final DateTime maxDate;
  final DateTime initialDate;
  final bool showTopNavbar;
  final Widget rightNavBarAction;
  final Widget leftNavBarAction;

  const HorizontalWeekCalendar({
    Key? key,
    this.onDateChange,
    this.onWeekChange,
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.disabledBackgroundColor = Colors.grey,
    this.activeDateNameStyle,
    this.activeDateNumberStyle,
    this.inactiveTextStyle,
    this.disabledTextStyle,
    this.activeNavigatorColor,
    this.inactiveNavigatorColor,
    this.monthStyle,
    this.yearStyle,
    this.weekStartFrom = WeekStartFrom.Monday,
    this.borderRadius,
    this.scrollPhysics = const ClampingScrollPhysics(),
    this.showNavigationButtons = true,
    this.monthFormat,
    required this.minDate,
    required this.maxDate,
    required this.initialDate,
    this.showTopNavbar = true,
    this.rightNavBarAction = const SizedBox(),
    this.leftNavBarAction = const SizedBox(),
  }) : super(key: key);

  @override
  State<HorizontalWeekCalendar> createState() => _HorizontalWeekCalendarState();
}

class _HorizontalWeekCalendarState extends State<HorizontalWeekCalendar> {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  final int _initialPage = 1;

  DateTime selectedDate = DateTime.now();
  List<DateTime> currentWeek = [];
  int currentWeekIndex = 0;
  List<List<DateTime>> listOfWeeks = [];

  @override
  void initState() {
    super.initState();
    _initCalendar();
  }

  void _initCalendar() {
    DateTime startOfCurrentWeek = _getStartOfWeek(widget.initialDate);
    currentWeek = List.generate(
      7,
      (index) => startOfCurrentWeek.add(Duration(days: index)),
    );
    listOfWeeks.add(currentWeek);

    _getMorePreviousWeeks();
    _getMoreNextWeeks();
  }

  DateTime _getStartOfWeek(DateTime date) {
    return widget.weekStartFrom == WeekStartFrom.Monday
        ? date.subtract(Duration(days: date.weekday - 1))
        : date.subtract(Duration(days: date.weekday % 7));
  }

  void _getMorePreviousWeeks() {
    DateTime startFrom = listOfWeeks[currentWeekIndex].first;
    List<DateTime> minus7Days = List.generate(
        7, (index) => startFrom.subtract(Duration(days: index + 1)));

    if (minus7Days.first.isAfter(widget.minDate)) {
      listOfWeeks.add(minus7Days.reversed.toList());
    }
  }

  void _getMoreNextWeeks() {
    DateTime startFrom = listOfWeeks[currentWeekIndex].last;
    List<DateTime> plus7Days =
        List.generate(7, (index) => startFrom.add(Duration(days: index + 1)));

    listOfWeeks.insert(0, plus7Days);
    currentWeekIndex = 1;
  }

  void _onDateSelect(DateTime date) {
    setState(() {
      selectedDate = date;
    });
    widget.onDateChange?.call(selectedDate);
  }

  void _onWeekChange(int index) {
    currentWeekIndex = index;
    currentWeek = listOfWeeks[currentWeekIndex];

    if (currentWeekIndex + 1 == listOfWeeks.length) {
      _getMorePreviousWeeks();
    }

    if (index == 0) {
      _getMoreNextWeeks();
      carouselController.nextPage();
    }

    widget.onWeekChange?.call(currentWeek);
    setState(() {});
  }

  bool _isBackDisabled() {
    return listOfWeeks[currentWeekIndex].first.isAtSameMomentAs(widget.minDate);
  }

  bool _isNextDisabled() {
    return listOfWeeks[currentWeekIndex].last.isAtSameMomentAs(widget.maxDate);
  }

  Color _dateColor(DateTime currentDate, ThemeData theme) {
    return DateFormat('dd-MM-yyyy').format(currentDate) ==
            DateFormat('dd-MM-yyyy').format(selectedDate)
        ? widget.activeBackgroundColor ?? theme.primaryColor
        : _isWithinRange(currentDate)
            ? widget.inactiveBackgroundColor ??
                theme.primaryColor.withOpacity(.2)
            : widget.disabledBackgroundColor ?? Colors.grey;
  }

  bool _isWithinRange(DateTime date) {
    return date.isAfter(widget.minDate) && date.isBefore(widget.maxDate);
  }

  TextStyle _dayTextStyle(
      DateTime currentDate, ThemeData theme, TextStyle? textStyle) {
    return DateFormat('dd-MM-yyyy').format(currentDate) ==
            DateFormat('dd-MM-yyyy').format(selectedDate)
        ? textStyle ?? theme.textTheme.titleLarge!
        : _isWithinRange(currentDate)
            ? widget.inactiveTextStyle ?? textStyle!
            : widget.disabledTextStyle ?? textStyle!;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return currentWeek.isEmpty
        ? const SizedBox()
        : Container(
            decoration: const BoxDecoration(
              color: AppColors.greyBackgroundColor,
            ),
            height: 107,
            child: Column(
              children: [
                if (widget.showTopNavbar) _buildTopNavBar(theme),
                _buildCarouselSlider(theme),
              ],
            ),
          );
  }

  Widget _buildTopNavBar(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, left: 24, right: 24, bottom: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavBarButton(_isBackDisabled(), widget.leftNavBarAction,
              carouselController.nextPage),
          _buildMonthAndYearText(theme),
          _buildNavBarButton(_isNextDisabled(), widget.rightNavBarAction,
              carouselController.previousPage),
        ],
      ),
    );
  }

  GestureDetector _buildNavBarButton(
      bool isDisabled, Widget action, VoidCallback onTap) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: action,
    );
  }

  Column _buildMonthAndYearText(ThemeData theme) {
    return Column(
      children: [
        Text(
          widget.monthFormat?.isEmpty ?? true
              ? DateFormat('MMMM').format(currentWeek.first).toUpperCase()
              : DateFormat(widget.monthFormat!).format(currentWeek.first),
          style: widget.monthStyle ??
              theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400, color: theme.primaryColor),
        ),
        Text(
          DateFormat('yyyy').format(currentWeek.first),
          style: widget.yearStyle ??
              theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold, color: theme.primaryColor),
        ),
      ],
    );
  }

  CarouselSlider _buildCarouselSlider(ThemeData theme) {
    return CarouselSlider(
      controller: carouselController,
      items: [
        for (int ind = 0; ind < listOfWeeks.length; ind++)
          _buildWeekRow(ind, theme),
      ],
      options: CarouselOptions(
        initialPage: _initialPage,
        scrollPhysics: widget.scrollPhysics,
        height: 52,
        viewportFraction: .94,
        enableInfiniteScroll: false,
        reverse: true,
        onPageChanged: (index, reason) {
          _onWeekChange(index);
        },
      ),
    );
  }

  SizedBox _buildWeekRow(int ind, ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int weekIndex = 0;
              weekIndex < listOfWeeks[ind].length;
              weekIndex++)
            _buildDayItem(listOfWeeks[ind][weekIndex], theme, weekIndex),
        ],
      ),
    );
  }

  GestureDetector _buildDayItem(
      DateTime currentDate, ThemeData theme, int weekIndex) {
    return GestureDetector(
      onTap:
          _isWithinRange(currentDate) ? () => _onDateSelect(currentDate) : null,
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(minWidth: 39),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          color: _dateColor(currentDate, theme),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              DateFormat('EEE').format(currentDate).toUpperCase(),
              style:
                  _dayTextStyle(currentDate, theme, widget.activeDateNameStyle)
                      .copyWith(
                color: weekIndex == 0 || weekIndex == 6
                    ? Colors.red
                    : Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              (int.parse(DateFormat('dd').format(currentDate).toString()))
                  .toString(),
              style: _dayTextStyle(
                  currentDate, theme, widget.activeDateNumberStyle),
            ),
            // SizedBox(height: 1),
            // weekIndex == 1
            //     ? const Icon(Icons.circle, size: 4)
            //     : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
