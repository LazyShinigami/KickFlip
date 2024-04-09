import 'package:flutter/material.dart';
import 'package:kickflip/screens/buyers/bidsScreen.dart';
import 'package:kickflip/screens/buyers/buyerHomepage.dart';
import 'package:kickflip/screens/commonElements/profile.dart';
import 'package:kickflip/screens/buyers/searchPage.dart';
import 'package:kickflip/screens/sellers/addListingPage.dart';
import 'package:kickflip/screens/sellers/allListingsPage.dart';
import 'package:kickflip/screens/sellers/models.dart';
import 'package:kickflip/screens/sellers/sellerHomepage.dart';
import 'package:kickflip/screens/sellers/sellerProfilePage.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar(
      {super.key,
      required this.selectedIndex,
      this.accountType,
      required this.uID}) {
    accountType ??= 'buyer';
  }
  int selectedIndex;
  String? accountType;
  int uID;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState(uID);
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  _CustomBottomNavigationBarState(this.uID);
  int uID;

  @override
  Widget build(BuildContext context) {
    // print('ACC TYPE: ${widget.accountType}');

    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: const DecorationImage(
          image: AssetImage('assets/graphics/op-03.jpeg'),
          fit: BoxFit.cover,
        ),
        boxShadow: const [
          BoxShadow(color: Color(0xFFB1B1B1), spreadRadius: 0.5, blurRadius: 4),
          BoxShadow(color: Color(0xFFDBDADA), spreadRadius: 0.5, blurRadius: 4)
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 7.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
            size: 32.5,
          ),
          elevation: 50,
          unselectedItemColor: const Color(0xFFD2D2D2),
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: (widget.accountType == 'buyer')
                  ? const Icon(Icons.search_rounded)
                  : const Icon(Icons.add_rounded),
              label: (widget.accountType == 'buyer') ? 'Bids' : 'Add Listing',
            ),
            BottomNavigationBarItem(
              icon: (widget.accountType == 'buyer')
                  ? const Icon(Icons.currency_rupee_outlined)
                  : Image.asset(
                      'assets/all_icons/listings.png',
                      height: 25,
                      color: Colors.white,
                    ),
              label: (widget.accountType == 'buyer') ? 'Bids' : 'My Listings',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Account',
            ),
          ],
          currentIndex: widget.selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: (index) {
            print("Button tapped -- $index");
            widget.selectedIndex = index;
            if (index == 0) {
              (widget.accountType == 'buyer')
                  ? BuyerPageRouter(context: context, uID: uID)
                      .navigateToBuyerHomepage()
                  : SellerPageRouter(context: context, uID: uID)
                      .navigateToSellerHomepage();
            }
            if (index == 1) {
              (widget.accountType == 'buyer')
                  ? BuyerPageRouter(context: context, uID: uID)
                      .navigateToSearchPage()
                  : SellerPageRouter(context: context, uID: uID)
                      .navigateToAddListingPage();
            }
            if (index == 2) {
              (widget.accountType == 'buyer')
                  ? BuyerPageRouter(context: context, uID: uID)
                      .navigateToBidsScreen()
                  : SellerPageRouter(context: context, uID: uID)
                      .navigateToAllListingsPage();
            }
            if (index == 3) {
              (widget.accountType == 'buyer')
                  ? BuyerPageRouter(context: context, uID: uID)
                      .navigateToBuyerProfilePage('buyer')
                  : SellerPageRouter(context: context, uID: uID)
                      .navigateToSellerProfilePage();
            }
            setState(() {});
          },
        ),
      ),
    );
  }
}

class SellerPageRouter {
  SellerPageRouter({required this.context, required this.uID});

  final BuildContext context;
  int uID;
  void navigateToSellerHomepage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SellerHomepage(
          uID: uID,
        ),
      ),
    );
  }

  void navigateToAddListingPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AddListingPage(uID: uID),
      ),
    );
  }

  void navigateToAllListingsPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SellerAllListingsPage(uID: uID),
      ),
    );
  }

  void navigateToSellerProfilePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(accountType: 'seller', uID: uID),
      ),
    );
  }
}

class BuyerPageRouter {
  BuyerPageRouter({required this.context, required this.uID});

  final BuildContext context;
  int uID;

  void navigateToBuyerHomepage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BuyerHomepage(uID: uID),
      ),
    );
  }

  void navigateToSearchPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(
          uID: uID,
        ),
      ),
    );
  }

  void navigateToBidsScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BidsScreen(uID: uID),
      ),
    );
  }

  void navigateToBuyerProfilePage(String type) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          accountType: 'buyer',
          uID: uID,
        ),
      ),
    );
  }
}
