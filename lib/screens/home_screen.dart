import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = [
    Post(
      userName: 'John Doe',
      userImage: Icons.person,
      postImage: 'images/restaurant_6.jpg',
      likes: 10,
      comments: 5,
      isLiked: false,
      rating: 4.5,
      location: 'Restaurant ABC',
      latitude: 0.0,
      longitude: 0.0,
      review: 'This place is amazing!',
    ),
    Post(
      userName: 'Jane Smith',
      userImage: Icons.person,
      postImage: 'images/restaurant_3.jpg',
      likes: 20,
      comments: 15,
      isLiked: false,
      rating: 4.2,
      location: 'Cafe XYZ',
      latitude: 0.0,
      longitude: 0.0,
      review: 'Great food and ambiance!',
    ),
    // Add more posts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Finds'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildPostItem(posts[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to add new post
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildPostItem(Post post) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(post.userImage),
            ),
            title: Text(post.userName),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              post.postImage,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                        post.isLiked ? Icons.favorite : Icons.favorite_border),
                    color: post.isLiked ? Colors.red : null,
                    onPressed: () {
                      setState(() {
                        post.isLiked = !post.isLiked;
                        if (post.isLiked) {
                          post.likes++;
                        } else {
                          post.likes--;
                        }
                      });
                    },
                  ),
                  Text('${post.likes} Likes'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.comment),
                    onPressed: () {
                      // Add comment functionality here
                    },
                  ),
                  Text('${post.comments} Comments'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _openMap(post.latitude, post.longitude);
                },
                child: Text('Location'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rating: ${post.rating}'),
                Text('Review: ${post.review}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openMap(double latitude, double longitude) async {
    String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open the map';
    }
  }
}

class Post {
  final String userName;
  final IconData userImage;
  final String postImage;
  int likes;
  final int comments;
  bool isLiked;
  final double rating;
  final String location;
  final double latitude;
  final double longitude;
  final String review;

  Post({
    required this.userName,
    required this.userImage,
    required this.postImage,
    required this.likes,
    required this.comments,
    required this.isLiked,
    required this.rating,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.review,
  });
}
