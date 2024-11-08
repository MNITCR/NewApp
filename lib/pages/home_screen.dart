import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import '../widgets/NewsCategoryBar.dart';
// import '../widgets/news_screen.dart';
import '../ widgets/news_screen.dart';
import 'SearchPage.dart';
import 'SettingsScreen.dart';
import 'YouTubeVideoScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: null,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          SizedBox(width: 16),
        ],
        flexibleSpace: Center(
          child: Text(
            "New 24H",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xff191b28),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(Icons.fireplace, color: Colors.white),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "ព័ត៌មានពេញនិយម",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      Text(
                        "មើល​បន្ថែម",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 370, // Set a specific height for NewsScreen
                child: NewsScreen(),
              ),
            ),
          ),
          // Wrap ElevatedButton in SliverToBoxAdapter
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 10.0),
          //     child: Center(
          //       child: ElevatedButton(
          //         onPressed: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) =>
          //                   YouTubeVideoScreen(videoId: 'BBAyRBTfsOU'), // Only the video ID
          //             ),
          //           );
          //         },
          //         child: Text(
          //           'Watch Video',
          //           style: TextStyle(color: Colors.white),
          //         ),
          //         style: ElevatedButton.styleFrom(
          //           padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          //           textStyle: TextStyle(fontSize: 18),
          //           backgroundColor: Colors.black,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xff191b28),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(Icons.fireplace, color: Colors.white),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "ព័ត៌មានពេញនិយម",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      Text(
                        "មើល​បន្ថែម",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
