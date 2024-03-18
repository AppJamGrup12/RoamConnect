import 'package:flutter/material.dart';
import 'package:whisper2/profil_buttons.dart';

import 'lib/user_list.dart';
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://picsum.photos/200/300'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Doe',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Mesaj butonuna basıldığında yeni bir sayfaya geçiş yapılır
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>ProfilButtons(),
                            ),
                          );
                        },
                        child: Text('Fallowers'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Bağlantı Kur butonuna basıldığında snackbar mesajı gösterilir
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Bağlantı Kuruldu'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: Text('Bağlantı Kur'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Yüklenen Resimler',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildImage('https://picsum.photos/200/300?1'),
                  _buildImage('https://picsum.photos/200/300?2'),
                  _buildImage('https://picsum.photos/200/300?3'),
                  _buildImage('https://picsum.photos/200/300?4'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          width: 150,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


