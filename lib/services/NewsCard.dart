import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsCard extends StatelessWidget {
  final List<DocumentSnapshot> newsItems;

  NewsCard({required this.newsItems});

  @override
  Widget build(BuildContext context) {
    // Filter the news items to include only those with the category "breakingNew"
    final breakingNewsItems = newsItems.where((item) {
      final data = item.data() as Map<String, dynamic>? ?? {};
      return data['category'] == 'breakingNew';
    }).toList();

    if (breakingNewsItems.isEmpty) {
      return Center(child: Text('No breaking news available.'));
    }

    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Carousel slider with filtered breaking news items
          CarouselSlider.builder(
            itemCount: breakingNewsItems.length,
            options: CarouselOptions(
              height: 320,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
            ),
            itemBuilder: (context, index, realIdx) {
              final data = breakingNewsItems[index].data() as Map<String, dynamic>? ?? {};

              final String title = data['title'] ?? 'No Title';
              final String subtitle = data['subtitle'] ?? '';
              final Timestamp time = data['time'] ?? Timestamp.now();
              final String formattedTime = DateFormat.yMMMd().add_jm().format(time.toDate());

              final List<String> imageUrls = (data['imageUrls'] is String)
                  ? [data['imageUrls']]
                  : (data['imageUrls'] as List<dynamic>?)?.cast<String>() ?? [
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQq8rRXu_m5FAcZWKEyLzHBYM8KFuUfwKuLEw&s'
              ];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrls.first,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: Text(
                              'Image could not be loaded',
                              style: TextStyle(fontSize: 14, color: Colors.red),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          subtitle,
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Published: $formattedTime',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
