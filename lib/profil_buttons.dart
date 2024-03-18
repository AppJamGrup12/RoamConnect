
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whisper2/lib/user_list.dart';

class ProfilButtons extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Followers Listesi'),
        ),
        body:ListView.builder(
          itemCount: UserList().userList.length,
          itemBuilder: (context, index) {
            // Kullanıcının adını al
            final userName = UserList().userList[index].userName.toString();
            // Kullanıcının konumunu al
            final location = UserList().userList[index].location.toString();
            // Kullanıcının adının ilk harfini büyük harfe dönüştür
            final firstLetter = userName[0].toUpperCase();
            // Rastgele bir renk seç
            final randomColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

            return ListTile(
              title: Row(
                children: [
                  // Kullanıcı adının başına daire ekleyin
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: randomColor,
                    ),
                    child: Center(
                      child: Text(
                        firstLetter,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // İki bileşen arasına boşluk ekleyin
                  // Kullanıcı adını ve konumunu gösteren metin
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userName),
                      Text(location),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
  }

