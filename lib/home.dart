import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatelessWidget {
  final List<String> _randomImages = [
    'https://picsum.photos/id/1011/200/300',
    'https://picsum.photos/id/1012/200/300',
    'https://picsum.photos/id/1013/200/300',
    'https://picsum.photos/id/1014/200/300',
  ];

  String getRandomImage() {
    final random = Random();
    return _randomImages[random.nextInt(_randomImages.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'June 20th, 8:25 PM',//yarına ayarla
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Recommended',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildImageChip(context, 'Beach'),
                  _buildImageChip(context, 'Sightseeing'),
                  _buildImageChip(context, 'Beautiful beach'),
                  _buildImageChip(context, 'Scenic views'),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Next event: May 23',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Travel Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildImageChip(context, 'Beach'),
                  _buildImageChip(context, 'Sightseeing'),
                  _buildImageChip(context, 'Nature'),
                  _buildImageChip(context, 'Adventure'),
                  _buildImageChip(context, 'Culture'),
                  _buildImageChip(context, 'Food'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageChip(BuildContext context, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(imageUrl: getRandomImage()),
          ),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(getRandomImage()),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final String imageUrl;

  const DetailPage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _rating = 0;
  String _comment = '';
  List<String> _comments = [];

  void _submitRating() {
    setState(() {
      _comments.add('Rating: $_rating, Comment: $_comment');
      _comment = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.imageUrl),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Rating:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (index) {
                      return IconButton(
                        onPressed: () {
                          setState(() {
                            _rating = index + 1;
                          });
                        },
                        icon: Icon(
                          index < _rating ? Icons.star : Icons.star_border,
                          size: 32,
                          color: Colors.amber,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Write your comment...',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _comment = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _submitRating,
                    child: Text('Submit'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Comments:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(_comments.length, (index) {
                        return CommentCard(
                          username: 'User $index',
                          userProfileImage: 'https://via.placeholder.com/40',
                          comment: _comments[index],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  final String comment;
  final String username;
  final String userProfileImage;

  const CommentCard({
    Key? key,
    required this.comment,
    required this.username,
    required this.userProfileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(userProfileImage),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    comment,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}