import 'package:flutter/material.dart';
import 'package:kickflip/commons.dart';
import 'package:kickflip/screens/commonElements/appbar.dart';
import 'package:kickflip/screens/commonElements/bottomNavBar.dart';
import 'package:kickflip/screens/sellers/listingWidget.dart';
import 'package:kickflip/screens/sellers/models.dart';

class SellerAllListingsPage extends StatelessWidget {
  const SellerAllListingsPage({super.key, required this.uID});
  final int uID;
  final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    // Get results on monthly basis
    List<SellerProductListItem> productList = // dummy data
        [
      SellerProductListItem(
        pID: 32423324,
        sID: 1234,
        price: 4000,
        status: 'sold',
        bidders: [1000, 2000, 5000, 3400, 2500],
        name: 'Jordans Belfsdlvnsdjlnsdnvsdnvlsdnvast',
        desc:
            'some weird long ass description talking about the shoe maybe? Maybe it\'s materials and such are included in this.',
      ),
      SellerProductListItem(
        pID: 43364634,
        sID: 1234,
        status: 'listed',
        bidders: [],
        name: 'Jordans Belfast',
        desc:
            'some weird long ass description talking about the shoe maybe? Maybe it\'s materials and such are included in this.',
      ),
      SellerProductListItem(
        pID: 95659843,
        sID: 1234,
        status: 'to-be-verified',
        bidders: [],
        name: 'Jordans Belfast - to-be-verified',
        desc:
            'some weird long ass description talking about the shoe maybe? Maybe it\'s materials and such are included in this.',
      ),
      SellerProductListItem(
        pID: 32525249,
        sID: 1234,
        price: 10000,
        status: 'sold',
        bidders: [1000, 2000, 5000, 3400, 2500],
        name: 'Jordans Belfast - Another',
        desc:
            'some weird long ass description talking about the shoe maybe? Maybe it\'s materials and such are included in this.',
      ),
      SellerProductListItem(
        pID: 35362554,
        sID: 1234,
        price: 2500,
        status: 'sold',
        bidders: [32000, 12000, 5000, 3400, 2500],
        name: 'Jordans Belfast Yet Another',
        desc:
            'some weird long ass description talking about the shoe maybe? Maybe it\'s materials and such are included in this.',
      ),
      SellerProductListItem(
        pID: 35226262,
        sID: 1234,
        status: 'listed',
        bidders: [],
        name: 'No bids testing item',
        desc:
            'some weird long ass description talking about the shoe maybe? Maybe it\'s materials and such are included in this.',
      ),
      SellerProductListItem(
        pID: 79398533,
        sID: 1234,
        status: 'to-be-verified',
        bidders: [1000, 3000, 2500],
        name: 'Jordans Belfast',
        desc:
            'some weird long ass description talking about the shoe maybe? Maybe it\'s materials and such are included in this.',
      ),
      SellerProductListItem(
        pID: 35252522,
        sID: 1234,
        price: 6000,
        status: 'sold',
        bidders: [1000, 1000, 1000, 1000, 1000],
        name: 'Jordans Belfast - Dummy for straight line',
        desc:
            'some weird long ass description talking about the shoe maybe? Maybe it\'s materials and such are included in this.',
      ),
      SellerProductListItem(
        pID: 45645664,
        sID: 1234,
        status: 'listed',
        bidders: [2000, 2000, 5000, 5000, 2000],
        name: 'Jordans Belfast Hello',
        desc:
            'some weird long ass description talking about the shoe maybe? Maybe it\'s materials and such are included in this.',
      ),
      SellerProductListItem(
        pID: 32423444,
        sID: 1234,
        status: 'listed',
        bidders: [1000, 1200, 5000, 3400, 2300, 5300, 6000, 7000],
        name: 'Jordans Belfast ehhhhh',
        desc:
            'some weird long ass description talking about the shoe maybe? Maybe it\'s materials and such are included in this.',
      ),
      SellerProductListItem(
        pID: 23432432,
        sID: 1234,
        price: 2000,
        status: 'sold',
        bidders: [30000, 30300, 1500, 5000, 3000, 500],
        name: 'Jordans Belfast Newwwwww Version',
        desc:
            'some weird long ass description talking about the shoe maybe? Maybe it\'s materials and such are included in this.',
      ),
    ];
    return Scaffold(
      appBar: KickFlipAppBar(showLeading: false),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              MyText(
                'View and manage your products',
                weight: FontWeight.bold,
                spacing: 2,
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < productList.length; i++)
                ListingWidget(product: productList[i], uID: uID),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _currentIndex, accountType: 'seller', uID: uID),
    );
  }
}
