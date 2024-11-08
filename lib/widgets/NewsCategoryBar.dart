import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsCategoryBar extends StatefulWidget {
  const NewsCategoryBar({Key? key}) : super(key: key);

  @override
  _NewsCategoryBarState createState() => _NewsCategoryBarState();
}

class _NewsCategoryBarState extends State<NewsCategoryBar> {
  String selectedCategory = "All News";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('news').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error loading categories'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No categories available'));
          }

          // Extract unique categories from the Firestore data
          final categories = snapshot.data!.docs
              .map((doc) => doc['category'] as String)
              .toSet()
              .toList();

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                return CategoryButton(
                  text: category,
                  isSelected: selectedCategory == category,
                  onTap: () => _onCategorySelected(category),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: textStyle?.copyWith(
            color: isSelected ? Colors.black : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
