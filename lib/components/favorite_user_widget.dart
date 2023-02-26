import 'package:chatflutter/screen/chat/message_screen.dart';
import 'package:flutter/material.dart';

class FavoriteUserWidget extends StatelessWidget {
  String? name;
  String? imageUrl;
  int id;
  FavoriteUserWidget({Key? key, this.name, this.imageUrl, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MessageScreen(
                    userId: id,
                    name: name.toString(),
                    imageUrl: imageUrl.toString())),
          );
        },
        child: Column(
          children: [
            CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 22,
                child: CircleAvatar(
                  backgroundImage: NetworkImage((imageUrl == null ||
                          imageUrl!.isEmpty)
                      ? 'http://wh.saas.test/geniusBankWallet/assets/user/img/user.jpg'
                      : 'http://wh.saas.test/geniusBankWallet/assets/images/$imageUrl'),
                  radius: 20,
                )),
            Text(name!.replaceRange(6, name!.length, '...')),
          ],
        ),
      ),
    );
  }
}
