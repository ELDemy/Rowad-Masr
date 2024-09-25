import 'package:flutter/material.dart';
import 'package:to_do_app/core/utiles/app_colors.dart';

class WheelTimePicker extends StatefulWidget {
  final Function(TimeOfDay)? onTimeSelected;

  const WheelTimePicker({super.key, this.onTimeSelected});

  @override
  State<WheelTimePicker> createState() => _WheelTimePickerState();
}

class _WheelTimePickerState extends State<WheelTimePicker> {
  FixedExtentScrollController hourController =
      FixedExtentScrollController(initialItem: 8);
  FixedExtentScrollController minuteController =
      FixedExtentScrollController(initialItem: 20);
  FixedExtentScrollController amPmController =
      FixedExtentScrollController(initialItem: 0);

  int selectedHour = 9;
  int selectedMinute = 20;
  String selectedAmPm = 'AM';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _notifyTimeSelected();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildWheel(
          controller: hourController,
          itemCount: 12,
          onSelectedItemChanged: (index) {
            setState(() {
              selectedHour = index + 1; // Convert to 1-12 hour format
              _notifyTimeSelected();
            });
          },
          itemBuilder: (context, index, selectedIndex) {
            return _buildWheelItem(
              (index + 1).toString().padLeft(2, '0'),
              index == selectedIndex,
            );
          },
        ),
        const Text(
          ":",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, height: 30.1 / 20),
        ),
        _buildWheel(
          controller: minuteController,
          itemCount: 60,
          onSelectedItemChanged: (index) {
            setState(() {
              selectedMinute = index;
              _notifyTimeSelected();
            });
          },
          itemBuilder: (context, index, selectedIndex) {
            return _buildWheelItem(
              index.toString().padLeft(2, '0'),
              index == selectedIndex,
            );
          },
        ),
        _buildWheel(
          controller: amPmController,
          itemCount: 2,
          onSelectedItemChanged: (index) {
            setState(() {
              selectedAmPm = index == 0 ? 'AM' : 'PM';
              _notifyTimeSelected();
            });
          },
          itemBuilder: (context, index, selectedIndex) {
            return _buildWheelItem(
              index == 0 ? 'AM' : 'PM',
              index == selectedIndex,
            );
          },
        ),
      ],
    );
  }

  Widget _buildWheel({
    required FixedExtentScrollController controller,
    required int itemCount,
    required void Function(int) onSelectedItemChanged,
    required Widget Function(BuildContext, int, int) itemBuilder,
  }) {
    return Container(
      width: 64,
      height: 64,
      margin: const EdgeInsets.symmetric(horizontal: 13),
      color: AppColors.darkGreyColor,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 26,
        onSelectedItemChanged: onSelectedItemChanged,
        physics: const FixedExtentScrollPhysics(),
        perspective: 0.005,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            int selectedIndex = controller.selectedItem;
            return itemBuilder(context, index, selectedIndex);
          },
          childCount: itemCount,
        ),
      ),
    );
  }

  Widget _buildWheelItem(String label, bool isSelected) {
    return Center(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isSelected ? 1.0 : 0.1, // Fading effect
        child: Text(
          label,
          style: TextStyle(
            fontSize: isSelected ? 24 : 16, // Larger font for selected item
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _notifyTimeSelected() {
    // Convert to 24-hour format if needed
    int hour = selectedHour;
    if (selectedAmPm == 'PM' && hour != 12) {
      hour += 12;
    } else if (selectedAmPm == 'AM' && hour == 12) {
      hour = 0;
    }

    TimeOfDay selectedTime = TimeOfDay(hour: hour, minute: selectedMinute);

    // Call the callback function if it's not null
    if (widget.onTimeSelected != null) {
      widget.onTimeSelected!(selectedTime);
    }
  }
}
