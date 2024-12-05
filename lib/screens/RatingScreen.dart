import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RatingScreen extends StatefulWidget {
  final String articleTitle;

  RatingScreen({required this.articleTitle});

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 0;

  @override
  void initState() {
    super.initState();
    _loadRating();  // Load the saved rating when the screen starts
  }

  // Load the saved rating from SharedPreferences
  void _loadRating() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double savedRating = prefs.getDouble('rating_${widget.articleTitle}') ?? 0.0;

    setState(() {
      _rating = savedRating;
    });
  }

  // Update the rating when a star is tapped
  void _setRating(double rating) {
    setState(() {
      _rating = rating;
    });
  }

  // Save the feedback
  void _submitFeedback() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('rating_${widget.articleTitle}', _rating);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('You rated "${widget.articleTitle}" with $_rating stars'),
    ));

    Navigator.pop(context); // Close the rating screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Article: ${widget.articleTitle}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Rate this article',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.amber,
                    size: 40,
                  ),
                  onPressed: () => _setRating(index + 1.0),
                );
              }),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitFeedback,
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
