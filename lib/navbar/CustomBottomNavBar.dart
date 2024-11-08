import 'package:flutter/material.dart';
import '../pages/home_screen.dart';
// import '../pages/video_screen.dart';  // Assuming you have a VideoScreen
// import '../pages/saved_screen.dart';  // Assuming you have a SavedScreen
// import '../pages/notifications_screen.dart';  // Assuming you have a NotificationsScreen

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  // List of pages for each tab
  final List<Widget> _pages = [
    HomeScreen(),  // Home screen

  ];

  // Handle Bottom Navigation Item Taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // FAB Action (You can customize this action)
  void _onFABPressed() {
    // Example: Navigate to a new page or perform some action
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => VideoScreen()), // Example: Navigate to VideoScreen
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages, // Show the corresponding page based on the index
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'ទំព័រដើម',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_call_outlined),
                label: 'វីដេអូ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'រក្សាទុក',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'ដំណឹង',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xff191b28),
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          ),
          Positioned(
            top: -30,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
               onPressed: _onFABPressed,  // Use the FAB action
              child: Icon(Icons.add, color: Colors.white),
              backgroundColor: Color(0xff191b28),
              elevation: 5,
            ),
          ),
        ],
      ),
    );
  }
}
