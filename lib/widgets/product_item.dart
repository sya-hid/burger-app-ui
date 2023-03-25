import 'package:fastfood_app/consts.dart';
import 'package:fastfood_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(2, 5))
              ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: product.name,
                child: Image.asset(
                  'assets/${product.imageCard}',
                  width: 120,
                  height: 110,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product.name,
                maxLines: 1,
                style: poppins.copyWith(
                    color: black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.special.name,
                    style: poppins.copyWith(
                        letterSpacing: 1.1,
                        fontSize: 14,
                        color: black.withOpacity(0.7)),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/icon/${product.special.image}',
                    width: 14,
                  )
                ],
              ),
              const SizedBox(height: 20),
              RichText(
                  text: TextSpan(
                      style: poppins.copyWith(fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: '\$',
                        style: poppins.copyWith(color: red, fontSize: 14)),
                    TextSpan(
                        text: '${product.price}',
                        style: poppins.copyWith(fontSize: 22, color: black)),
                  ]))
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 5,
          child: Container(
              width: 22,
              height: 22,
              padding: const EdgeInsets.all(5),
              decoration:
                  const BoxDecoration(color: grey, shape: BoxShape.circle),
              child: Image.asset('assets/icon/fire.png')),
        )
      ],
    );
  }
}
