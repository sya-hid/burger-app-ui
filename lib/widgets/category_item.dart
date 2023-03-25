import 'package:fastfood_app/consts.dart';
import 'package:fastfood_app/models/categories_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
    required this.selected,
  }) : super(key: key);

  final Category category;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.only(left: 16, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: selected ? red.withOpacity(0.3) : grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            selected
                ? const BoxShadow(
                    color: red,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(2, 3))
                : const BoxShadow(color: transparent)
          ]),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration:
                const BoxDecoration(color: white, shape: BoxShape.circle),
            child: Image.asset('assets/category/${category.image}',
                width: 18, height: 18),
          ),
          const SizedBox(width: 16),
          Text(
            category.name,
            style: poppins.copyWith(
                color: selected ? white : black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
