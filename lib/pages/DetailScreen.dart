import 'dart:ui';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.04;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: screenHeight * 0.7,
            floating: false,
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.pop(context); // Pops the current screen
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.share, color: Colors.white),
                onPressed: () {
                  // Share functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.bookmark_border, color: Colors.white),
                onPressed: () {
                  // Bookmark functionality
                },
              ),
            ],
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                var top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  title: top <= kToolbarHeight
                      ? Text("")
                      : null,
                  background: Stack(
                    children: [
                      Container(
                        height: screenHeight * 0.7,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/newspic/new3.jpg'), // First image
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/newspic/new3.jpg', // First image
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        bottom: padding,
                        left: padding,
                        right: padding,
                        child: Container(
                          padding: EdgeInsets.all(padding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'សម្តេចតេជោ ហ៊ុន សែន និង សម្តេចកិត្តិព្រឹទ្ធបណ្ឌិត ប៊ុន រ៉ានី',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.06,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.black,
                        padding: EdgeInsets.all(padding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(color: Colors.white, thickness: 1.0),
                            Row(
                              children: [
                                Icon(Icons.access_time, size: screenWidth * 0.04, color: Colors.white),
                                SizedBox(width: screenWidth * 0.01),
                                Text(
                                  'ថ្ងៃព្រហស្បតិ៍ ១៨ កក្កដា ឆ្នាំ ២០២៤',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.04,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              children: [
                                Icon(Icons.lock, size: screenWidth * 0.04, color: Colors.white),
                                SizedBox(width: screenWidth * 0.01),
                                Expanded(
                                  child: Text(
                                    'សម្តេចតេជោ ហ៊ុន សែននិងសម្តេចកិត្តិព្រឹទ្ធបណ្ឌិត ប៊ុន រ៉ានីនៃអង្គការមេត្រីបរិស្ថាន "សម្លាញ់សម្លាញ់" យាងជាតំណាង:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.04,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Remove BackdropFilter from this container

                      Padding(
                        padding: EdgeInsets.all(padding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: screenHeight * 0.02),
                            Text(
                              'Additional Details',
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Text(
                              'Here you can add more details that are scrollable. This section will scroll if the content overflows the screen.',
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                            // Add more text or widgets as needed
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
