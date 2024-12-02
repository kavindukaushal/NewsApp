import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import 'home_screen.dart';

class CategorySelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select News Category')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Sports'),
            onTap: () {
              Provider.of<NewsProvider>(context, listen: false).fetchNewsByCategory('sports');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Business'),
            onTap: () {
              Provider.of<NewsProvider>(context, listen: false).fetchNewsByCategory('business');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Health'),
            onTap: () {
              Provider.of<NewsProvider>(context, listen: false).fetchNewsByCategory('health');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Technology'),
            onTap: () {
              Provider.of<NewsProvider>(context, listen: false).fetchNewsByCategory('technology');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
