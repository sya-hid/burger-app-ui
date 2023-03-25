import 'package:fastfood_app/consts.dart';
import 'package:fastfood_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.product});
  final ProductModel product;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
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
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: black,
                    size: 18,
                  )),
            ),
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
                      color: white, borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.more_horiz_rounded,
                    color: black,
                    size: 18,
                  )),
              const SizedBox(width: 35),
            ],
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: orange.withAlpha(150),
            child: Image.asset(
              'assets/food pattern.png',
              repeat: ImageRepeat.repeatY,
              color: orange,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(left: 35, right: 35, bottom: 35),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              reverse: true,
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 70),
                  Hero(
                    tag: widget.product.name,
                    child: Image.asset(
                      'assets/${widget.product.imageDetail}',
                      width: 220,
                      height: 310,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                        color: red, borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (quantity > 1) {
                                    quantity--;
                                  }
                                });
                              },
                              child: const Icon(Icons.remove, color: white)),
                          const SizedBox(width: 15),
                          Text(
                            quantity.toString(),
                            style: poppins.copyWith(color: white, fontSize: 18),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: const Icon(Icons.add, color: white))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: poppins.copyWith(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.product.special.name,
                                style: poppins.copyWith(
                                    letterSpacing: 1.1,
                                    fontSize: 14,
                                    color: black.withOpacity(0.7)),
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                'assets/icon/${widget.product.special.image}',
                                width: 14,
                              )
                            ],
                          ),
                        ],
                      ),
                      RichText(
                          text: TextSpan(
                              style:
                                  poppins.copyWith(fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text: '\$',
                                style:
                                    poppins.copyWith(color: red, fontSize: 14)),
                            TextSpan(
                                text: '${widget.product.price}',
                                style: poppins.copyWith(
                                    fontSize: 30, color: black)),
                          ]))
                    ],
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icon/star.png', width: 22),
                          const SizedBox(width: 10),
                          Text(
                            widget.product.rate.toString(),
                            style: poppins.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/icon/fire.png', width: 22),
                          const SizedBox(width: 10),
                          Text(
                            '150 Kcal',
                            style: poppins.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/icon/time.png', width: 22),
                          const SizedBox(width: 10),
                          Text(
                            '5-10 Min',
                            style: poppins.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: black),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  ReadMoreText(
                    widget.product.description,
                    style: poppins.copyWith(
                        fontSize: 14, color: black, height: 1.5),
                    trimMode: TrimMode.Length,
                    trimLength: 100,
                    trimLines: 3,
                    trimCollapsedText: 'Read More',
                    trimExpandedText: 'Read Less',
                    colorClickableText: red,
                    moreStyle: poppins.copyWith(
                        fontWeight: FontWeight.bold, color: red),
                  ),
                  const SizedBox(height: 40),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 66,
                      onPressed: () {},
                      color: red,
                      child: Center(
                        child: Text(
                          'Add to Cart',
                          style: poppins.copyWith(
                              color: white, fontSize: 18, letterSpacing: 1.3),
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
