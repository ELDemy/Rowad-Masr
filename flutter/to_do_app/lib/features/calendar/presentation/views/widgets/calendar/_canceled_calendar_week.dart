// import 'package:flutter/material.dart';
// import 'package:flutter_calendar_week/flutter_calendar_week.dart';
// import 'package:intl/intl.dart';
// import 'package:to_do_app/core/utiles/app_colors.dart';
//
// class CalenderWeek extends StatefulWidget {
//   const CalenderWeek({super.key});
//
//   @override
//   State<CalenderWeek> createState() => _CalenderWeekState();
// }
//
// class _CalenderWeekState extends State<CalenderWeek> {
//   late CalendarWeekController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = CalendarWeekController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CalendarWeek(
//       backgroundColor: AppColors.greyBackgroundColor,
//       controller: _controller, // Use the persistent controller
//       height: 200,
//       showMonth: true,
//       minDate: DateTime.now().add(
//         const Duration(days: -365),
//       ),
//       maxDate: DateTime.now().add(
//         const Duration(days: 365),
//       ),
//       onDatePressed: (DateTime datetime) {
//         // Do something
//       },
//       onDateLongPressed: (DateTime datetime) {
//         // Do something
//       },
//       onWeekChanged: () {
//         // Do something
//       },
//       dayShapeBorder: BoxShape.rectangle,
//       dateBackgroundColor: const Color(0xff272727),
//       dateStyle: const TextStyle(),
//       dayOfWeekStyle: const TextStyle(backgroundColor: Color(0xff272727)),
//       dayOfWeek: const ["FRI", "SAT", 'SUN', 'MON', "TUE", "WED", "THU"],
//       weekendsIndexes: const [1, 2],
//       monthViewBuilder: (DateTime time) => Align(
//         alignment: FractionalOffset.center,
//         child: Container(
//           margin: const EdgeInsets.only(top: 7, bottom: 9),
//           child: Column(
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(bottom: 2),
//                 child: Text(
//                   DateFormat.MMMM().format(time),
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               Text(
//                 DateFormat.y().format(time),
//                 overflow: TextOverflow.ellipsis,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   color: Color(0xFFAFAFAF),
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       decorations: [
//         DecorationItem(
//           decorationAlignment: FractionalOffset.bottomRight,
//           date: DateTime.now(),
//           decoration: const Icon(
//             Icons.today,
//             color: Colors.blue,
//           ),
//         ),
//         DecorationItem(
//           date: DateTime.now().add(const Duration(days: 2)),
//           decoration: const Text(
//             'Holiday',
//             style: TextStyle(
//               color: Colors.brown,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
