import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Sample data model
class Item {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;

  Item({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
  });
}

// Main App
class MyApp extends StatelessWidget {
  final List<Item> items = List.generate(
    5,
    (index) => Item(
      imageUrl: 'https://via.placeholder.com/150?text=Image+${index + 1}',
      title: 'Title ${index + 1}',
      subtitle: 'Subtitle ${index + 1}',
      description: 'This is a detailed description of item ${index + 1}.',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Card List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Cards'),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return AnimatedCard(item: items[index]);
          },
        ),
      ),
    );
  }
}

// Custom animated card widget
class AnimatedCard extends StatefulWidget {
  final Item item;

  const AnimatedCard({Key? key, required this.item}) : super(key: key);

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.97);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0);
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // You can do something on tap
      },
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.item.imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.item.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(widget.item.subtitle,
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey[700])),
                      SizedBox(height: 8),
                      Text(widget.item.description,
                          style: TextStyle(fontSize: 13)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
