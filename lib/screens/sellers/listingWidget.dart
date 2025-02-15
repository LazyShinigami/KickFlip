import 'package:flutter/material.dart';
import 'package:kickflip/commons.dart';
import 'package:kickflip/screens/sellers/listingDetailView.dart';
import 'package:kickflip/screens/sellers/models.dart';

class ListingWidget extends StatelessWidget {
  const ListingWidget({super.key, required this.product, required this.uID});
  final int uID;
  final SellerProductListItem product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListingDetailView(product: product, uID: uID),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            top: BorderSide(width: 0.25, color: Colors.grey),
            left: BorderSide(width: 0.25, color: Colors.grey),
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5),
              color: Color(0x6A9E9E9E),
              blurRadius: 3,
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              height: 75,
              width: 75,
              color: Colors.grey,
            ),
            const SizedBox(width: 10),

            // Details - name & desc
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: MyText(
                          product.name,
                          size: 13,
                          weight: FontWeight.bold,
                          spacing: 1.5,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: 5),
                      MyText(
                        '[ ${product.status[0].toUpperCase()}${product.status.substring(1)} ]',
                        size: 12,
                        weight: FontWeight.bold,
                        spacing: 1,
                        color: (product.status == 'listed')
                            ? Colors.green // if listed
                            : (product.status == 'sold')
                                ? Colors.grey // if sold
                                : Colors.yellow[700], // if to be verified,
                      ),
                    ],
                  ),
                  const SizedBox(height: 2.5),
                  MyText(
                    product.desc,
                    size: 12.5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
