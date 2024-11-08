// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../newDetailed/detail.dart';
//
// class Newslist extends StatelessWidget {
//   const Newslist({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('news')
//           .where('category', isEqualTo: 'technology')
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Center(child: Text('No technology news available.'));
//         }
//
//         final newsItems = snapshot.data!.docs;
//
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: newsItems.length,
//             itemBuilder: (context, index) {
//               final newsItem = newsItems[index].data() as Map<String, dynamic>;
//
//               // Use null-aware operators to safely access fields
//               final imageUrl = newsItem['imageUrls'] as String? ?? 'https://via.placeholder.com/150';
//               final title = newsItem['title'] as String? ?? 'No title available';
//               final infoTitle = newsItem['infoTitle'] as String? ?? 'No info title available';
//               final infoText = newsItem['infoText'] as String? ?? 'No detailed information available';
//               final time = newsItem['time']?.toDate().toString() ?? 'No time available';
//               final subtitle = newsItem['subtitle'] as String? ?? 'No subtitle available';
//
//               final newsContainer = Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.3),
//                       spreadRadius: 3,
//                       blurRadius: 5,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(15.0),
//                       child: Image.network(
//                         imageUrl,
//                         width: MediaQuery.of(context).size.width * 0.4,
//                         height: MediaQuery.of(context).size.width * 0.3,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10.0),
//                             child: Text(
//                               title,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: MediaQuery.of(context).size.width * 0.04,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 3,
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           Text(
//                             subtitle,
//                             style: TextStyle(
//                               fontSize: MediaQuery.of(context).size.width * 0.035,
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.access_time,
//                                     size: MediaQuery.of(context).size.width * 0.035,
//                                     color: Colors.black,
//                                   ),
//                                   SizedBox(width: 5),
//                                   Text(
//                                     time,
//                                     style: TextStyle(
//                                       fontSize: MediaQuery.of(context).size.width * 0.035,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.more_vert_outlined),
//                                 onPressed: () {
//                                   // Handle more options here
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => DetailScreen(
//                         title: infoTitle,
//                         infoText: infoText,
//                         imageUrl: imageUrl,
//                         time: time,
//                       ),
//                     ),
//                   );
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: newsContainer,
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
