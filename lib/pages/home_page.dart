import 'package:fastfood_app/consts.dart';
import 'package:fastfood_app/models/categories_model.dart';
import 'package:fastfood_app/models/product_model.dart';
import 'package:fastfood_app/pages/detail_page.dart';
import 'package:fastfood_app/widgets/category_item.dart';
import 'package:fastfood_app/widgets/product_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 80,
        leading: Row(
          children: [
            const SizedBox(width: 35),
            Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(10)),
                child: Image.asset('assets/icon/dash.png')),
          ],
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: red,
              size: 18,
            ),
            const SizedBox(width: 5),
            Text(
              'California, US',
              style: poppins.copyWith(fontSize: 16, color: black),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: orange,
              size: 18,
            )
          ],
        ),
        actions: [
          Row(
            children: [
              Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: grey, borderRadius: BorderRadius.circular(10)),
                  child: Image.asset('assets/profile.png')),
              const SizedBox(width: 35),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: orange.withAlpha(150),
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                style: poppins.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                      text: 'The Fastest In Delivery ',
                                      style: poppins.copyWith(color: black)),
                                  TextSpan(
                                      text: 'Food',
                                      style: poppins.copyWith(color: red)),
                                ])),
                        const SizedBox(height: 10),
                        Container(
                            decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                            child: Text(
                              'Order Now',
                              style:
                                  poppins.copyWith(color: white, fontSize: 14),
                            ))
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/courier.png',
                    width: 140,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              'Categories',
              style: poppins.copyWith(
                  color: black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...List.generate(
                    categories.length,
                    (index) => Padding(
                          padding: index == 0
                              ? const EdgeInsets.only(left: 35, right: 20)
                              : index == categories.length - 1
                                  ? const EdgeInsets.only(right: 35)
                                  : const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentCategory = index;
                              });
                            },
                            child: CategoryItem(
                              category: categories[index],
                              selected: currentCategory == index,
                            ),
                          ),
                        ))
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Now',
                  style: poppins.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      'View All',
                      style: poppins.copyWith(color: orange, fontSize: 14),
                    ),
                    const SizedBox(width: 5),
                    Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: white,
                          size: 10,
                        ))
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 10),
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                    products.length,
                    (index) => Padding(
                          padding: index == 0
                              ? const EdgeInsets.only(left: 35, right: 20)
                              : const EdgeInsets.only(right: 35),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(seconds: 1),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DetailPage(
                                            product: products[index],
                                          )));
                            },
                            child: ProductItem(
                              product: products[index],
                            ),
                          ),
                        ))
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: white,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                Icons.home_filled,
                color: red,
                size: 30,
              ),
              const Icon(
                Icons.favorite_outline_rounded,
                color: grey,
                size: 30,
              ),
              Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: red,
                      boxShadow: [
                        BoxShadow(
                            color: red.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3))
                      ]),
                  child: const Icon(Icons.search, color: white)),
              const Icon(
                Icons.notifications_outlined,
                color: grey,
                size: 30,
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: grey,
                    size: 30,
                  ),
                  Positioned(
                    top: -4,
                    right: 0,
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: red, shape: BoxShape.circle),
                        child: Text(
                          '3',
                          style: poppins.copyWith(color: white, fontSize: 12),
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
