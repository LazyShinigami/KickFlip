import 'package:flutter/material.dart';
import 'package:kickflip/screens/commonElements/appbar.dart';
import 'package:kickflip/screens/commonElements/bottomNavBar.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key, required this.uID});
  final int uID;
  final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KickFlipAppBar(showLeading: true),
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _currentIndex, accountType: 'seller', uID: uID),
    );
  }
}
