import 'package:flutter/material.dart';
import 'package:kickflip/commons.dart';
import 'package:kickflip/screens/commonElements/appbar.dart';
import 'package:kickflip/screens/commonElements/bottomNavBar.dart';

class GuideBook extends StatelessWidget {
  const GuideBook({super.key, required this.uID});
  final int uID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KickFlipAppBar(showLeading: true),
      body: Center(child: MyText('GuideBookPage')),
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: 3, accountType: 'seller', uID: uID),
    );
  }
}
