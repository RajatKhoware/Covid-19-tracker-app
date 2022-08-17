import 'package:flutter/material.dart';
import 'package:flutter_covid_ui/screens/states/widgets/region_tab_bar.dart';
import '../screens/guide/guide.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List _screen = [
    const GuideScreen(),
    const RegionTabBar(),
    // const CountryList(),
    // const Scaffold(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 15.0,
        items: [
          Icons.home,
          Icons.insert_chart,
          // Icons.event_note,
          //Icons.info
        ]
            .asMap()
            .map(
              (key, value) => MapEntry(
                key,
                BottomNavigationBarItem(
                  label: "",
                  icon: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: _currentIndex == key
                          ? Colors.blue[600]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(value),
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}

// 	import 'package:flutter/material.dart';

// class BottomNavBar extends StatefulWidget {
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   final List _screens = [
//     Scaffold(),
//     Scaffold(),
//     Scaffold(),
//     Scaffold(),
//   ];
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) => setState(() => _currentIndex = index),
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.grey,
//         elevation: 0.0,
//         items: [Icons.home, Icons.insert_chart, Icons.event_note, Icons.info]
//             .asMap()
//             .map((key, value) => MapEntry(
//                   key,
//                   BottomNavigationBarItem(
//                     label: '',
//                     icon: Container(
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 6.0,
//                         horizontal: 16.0,
//                       ),
//                       decoration: BoxDecoration(
//                         color: _currentIndex == key
//                             ? Colors.blue[600]
//                             : Colors.transparent,
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       child: Icon(value),
//                     ),
//                   ),
//                 ))
//             .values
//             .toList(),
//       ),
//     );
//   }
// }