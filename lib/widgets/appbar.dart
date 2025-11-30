import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(),
      title: Center(
        child: Text('Register', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      actions: [
        IconButton(icon: Icon(Icons.notifications_outlined), onPressed: () {}),
        IconButton(icon: Icon(Icons.search), onPressed: () => {}),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
