import 'package:flutter/material.dart';
import 'dart:math';



class FriendAddScreen extends StatefulWidget {
  @override
  _FriendAddScreenState createState() => _FriendAddScreenState();
}

class _FriendAddScreenState extends State<FriendAddScreen> {
  List<Friend> _friendsList = [
    Friend('John Doe', 25, 'Merhaba, ben John!'),
    Friend('Jane Smith', 28, 'Selam, ben Jane!'),
    Friend('David Brown', 30, 'Hey, ben David!'),
    Friend('Emily Johnson', 27, 'Merhaba, ben Emily!'),
    Friend('Michael Wilson', 29, 'Merhaba, ben Michael!'),
    Friend('Olivia Davis', 26, 'Merhaba, ben Olivia!'),
    Friend('William Anderson', 31, 'Merhaba, ben William!'),
    Friend('Sophia Martinez', 24, 'Merhaba, ben Sophia!'),
    Friend('James Thomas', 32, 'Merhaba, ben James!'),
    Friend('Emma Wilson', 33, 'Merhaba, ben Emma!'),
    Friend('Daniel Anderson', 34, 'Merhaba, ben Daniel!'),
    Friend('Ava Johnson', 35, 'Merhaba, ben Ava!'),
    Friend('Ava Johnsons', 35, 'Merhaba, ben Ava!'),
    Friend('Ava Johnsson', 35, 'Merhaba, ben Ava!'),
    Friend('Ava Johnsson', 35, 'Merhaba, ben Ava!'),
    Friend('Ava Johsnson', 35, 'Merhaba, ben Ava!'),
    Friend('Ava Joshnson', 35, 'Merhaba, ben Ava!')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arkadaş Ekle'),
      ),
      body: ListView.builder(
        itemCount: _friendsList.length,
        itemBuilder: (context, index) {
          return _buildFriendTile(_friendsList[index]);
        },
      ),
    );
  }

  Widget _buildFriendTile(Friend friend) {
    String imageUrl = friend.imageUrl; // Her arkadaş için aynı resim URL'sini kullan

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: friend.isRequested ? Colors.grey : Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(
          friend.name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yaş: ${friend.age}',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              friend.description,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        trailing: GestureDetector(
          onTap: () {
            setState(() {
              friend.isRequested = true;
            });
            _showRequestSentDialog(friend.name);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: friend.isRequested ? Colors.grey : Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              friend.isRequested ? 'İstek Gönderildi' : 'Arkadaşlık İsteği Gönder',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showRequestSentDialog(String friendName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Arkadaşlık İsteği Gönderildi'),
          content: Text('Arkadaşlık isteği ${friendName}\'e başarıyla gönderildi.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }
}

class Friend {
  final String name;
  final int age;
  final String description;
  final String imageUrl; // Her arkadaş için resim URL'si tutacak
  bool isRequested = false; // Arkadaşlık isteği gönderildi mi?

  Friend(this.name, this.age, this.description)
      : imageUrl = 'https://picsum.photos/200/300?random=${Random().nextInt(1000)}';
}
