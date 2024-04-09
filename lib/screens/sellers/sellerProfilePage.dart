import 'package:flutter/material.dart';
import 'package:kickflip/commons.dart';
import 'package:kickflip/constants.dart';
import 'package:kickflip/screens/commonElements/appbar.dart';
import 'package:kickflip/screens/commonElements/authPageController.dart';
import 'package:kickflip/screens/buyers/bidsScreen.dart';
import 'package:kickflip/screens/commonElements/bottomNavBar.dart';
import 'package:kickflip/screens/commonElements/notifications.dart';
import 'package:kickflip/screens/buyers/orders.dart';
import 'package:kickflip/screens/buyers/wishlist.dart';

class SellerProfilePage extends StatelessWidget {
  const SellerProfilePage({super.key, required this.uID});
  final int uID;
  final int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    // print('----->>> ${MediaQuery.of(context).size.width * 0.3}');
    return Scaffold(
      appBar: KickFlipAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              // Profile Details
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                  color: ThemeColors().light,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(500),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: const Placeholder(),
                    ),
                    const SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          "Hi,",
                          size: 14,
                          spacing: 2,
                        ),
                        MyText(
                          'Seller\'s Name',
                          weight: FontWeight.bold,
                          size: 18,
                          spacing: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('Edit details functionality called');
                          },
                          child: const Icon(
                            Icons.edit_rounded,
                            size: 20,
                            color: Color(0xD46A6A6A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Other options
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                  color: ThemeColors().light,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HotWidgets(
                          title: 'Your Bids',
                          icon: const Icon(
                            Icons.currency_rupee_rounded,
                          ),
                          onTapFunction: () {
                            print('Your bids button pressed');
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BidsScreen(uID: uID),
                              ),
                            );
                          },
                        ),
                        HotWidgets(
                          title: 'Orders',
                          icon: const Icon(Icons.shopping_bag_rounded),
                          onTapFunction: () {
                            print('Orders button pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrdersPage(uID: uID),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HotWidgets(
                          title: 'Feedback',
                          icon: const Icon(Icons.favorite_rounded),
                          onTapFunction: () {
                            print('Wishlist button pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WishlistPage(uID: uID),
                              ),
                            );
                          },
                        ),
                        HotWidgets(
                          title: 'Notifications',
                          icon: const Icon(Icons.notifications_on_rounded),
                          onTapFunction: () {
                            print('Notifications button pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NotificationsPage(uID: uID),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Account Settings
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                  color: ThemeColors().light,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText('Account Settings',
                        size: 16, weight: FontWeight.bold, spacing: 1.5),

                    // Logout
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        print("Logout functionality called");
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthPageHandler()),
                            (route) => false);
                      },
                      child: Row(
                        children: [
                          MyText(
                            'Logout',
                            spacing: 1,
                            size: 14,
                            weight: FontWeight.w500,
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.logout_rounded,
                            size: 20,
                          )
                        ],
                      ),
                    ),

                    // Reset Password
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        print("Reset password functionality called");
                      },
                      child: Row(
                        children: [
                          MyText(
                            'Reset Password',
                            spacing: 1,
                            size: 14,
                            weight: FontWeight.w500,
                          ),
                          const SizedBox(width: 5),
                          const Icon(Icons.restart_alt_rounded, size: 20)
                        ],
                      ),
                    ),

                    // Delete Account
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        print("Delete account functionality called");
                      },
                      child: Row(
                        children: [
                          MyText(
                            'Delete account',
                            spacing: 1,
                            size: 14,
                            color: Colors.red,
                            weight: FontWeight.w500,
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.delete_rounded,
                            size: 20,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Contact us section
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                  color: ThemeColors().light,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText('Contact Us...',
                        size: 16, weight: FontWeight.bold, spacing: 1.5),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Instagram
                        GestureDetector(
                          onTap: () {
                            print('Instagram button pressed');
                          },
                          child: Image.asset(
                            'assets/socials/instagram.png',
                            height: 30,
                            width: 30,
                          ),
                        ),

                        // Snapchat
                        GestureDetector(
                          onTap: () {
                            print('Snapchat button pressed');
                          },
                          child: Image.asset(
                            'assets/socials/snapchat.png',
                            height: 30,
                            width: 30,
                          ),
                        ),

                        // E-mail
                        GestureDetector(
                          onTap: () {
                            print('E-mail button pressed');
                          },
                          child: Image.asset(
                            'assets/socials/email.png',
                            height: 30,
                            width: 30,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex, accountType: 'seller', uID: uID),
    );
  }
}

class HotWidgets extends StatelessWidget {
  HotWidgets(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTapFunction});
  String title;
  Widget icon;
  Function onTapFunction;
  String? accountType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        width: CommonFunctions()
            .maxSize(127.5, MediaQuery.of(context).size.width * 0.384),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            MyText(title, size: 12, weight: FontWeight.bold, spacing: 1.5),
          ],
        ),
      ),
    );
  }
}
