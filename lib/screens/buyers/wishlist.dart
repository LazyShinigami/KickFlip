import 'package:flutter/material.dart';
import 'package:kickflip/commons.dart';
import 'package:kickflip/screens/commonElements/appbar.dart';
import 'package:kickflip/screens/commonElements/bottomNavBar.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key, required this.uID});
  final int uID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KickFlipAppBar(showLeading: true),
      body: Center(
        child: MyText('Wishlist Page'),
      ),
      bottomNavigationBar:
          CustomBottomNavigationBar(selectedIndex: 3, uID: uID),
    );
  }
}
