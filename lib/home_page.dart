import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   int selectedIndex = 0;
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<Widget> _children = [
//     HomePage(),
//     DiscoverPage(),
//     LibraryPage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: _children[widget.selectedIndex],
//       bottomNavigationBar: FFNavigationBar(
//         theme: FFNavigationBarTheme(
//           barBackgroundColor: Colors.white,
//           selectedItemBorderColor: Colors.yellow,
//           selectedItemBackgroundColor: Colors.green,
//           selectedItemIconColor: Colors.white,
//           selectedItemLabelColor: Colors.black,
//         ),
//         selectedIndex: widget.selectedIndex,
//         onSelectTab: (index) {
//           setState(() {
//             widget.selectedIndex = index;
//           });
//         },
//         items: [
//           FFNavigationBarItem(
//             iconData: Icons.calendar_today,
//             label: 'Schedule',
//           ),
//           FFNavigationBarItem(
//             iconData: Icons.people,
//             label: 'Contacts',
//           ),
//           FFNavigationBarItem(
//             iconData: Icons.attach_money,
//             label: 'Bills',
//           ),
//           FFNavigationBarItem(
//             iconData: Icons.note,
//             label: 'Notes',
//           ),
//           FFNavigationBarItem(
//             iconData: Icons.settings,
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Home"),
    );
  }
}
