import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mood_frontend/screens/chat_screen.dart';
import '../screens/pick_image_screen.dart';

class CustomFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      children: [
        SpeedDialChild(
          child: Icon(Icons.camera_front),
          label: 'Image Picker',
          onTap: () {
            Navigator.pushNamed(context, ImagePickerScreen.id);
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.chat_bubble),
          label: 'Chat',
          onTap: () {
            print('tapped');
            Navigator.pushNamed(context, ChatScreen.id);
          },
        )
      ],
      animatedIcon: AnimatedIcons.menu_close,
      overlayColor: Color(0xFF0d0d0d),
      overlayOpacity: 0.2,
      curve: Curves.bounceIn,
      // backgroundColor: Colors.red,
    );
  }
}
