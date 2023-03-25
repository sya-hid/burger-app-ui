import 'package:fastfood_app/consts.dart';
import 'package:fastfood_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
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
          Positioned(
            top: 25,
            child: Image.asset(
              'assets/dashboard/chef_holding_vegetables.png',
              width: 260,
            ),
          ),
          Positioned(
            top: 100,
            right: 50,
            child: Image.asset(
              'assets/dashboard/bassil.png',
              width: 80,
            ),
          ),
          Positioned(
            top: 300,
            right: 30,
            child: Image.asset(
              'assets/dashboard/chili.png',
              width: 80,
            ),
          ),
          Positioned(
            top: 200,
            left: -30,
            child: Image.asset(
              'assets/dashboard/mushrooms.png',
              width: 100,
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: ClipPath(
              clipper: CustomClip(),
              child: Container(
                color: white,
                padding: const EdgeInsets.only(
                    top: 70, bottom: 65, right: 50, left: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: poppins.copyWith(
                                fontSize: 32, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: 'The Fastest In Delivery ',
                                  style: poppins.copyWith(color: black)),
                              TextSpan(
                                  text: 'Food',
                                  style: poppins.copyWith(color: red)),
                            ])),
                    const SizedBox(height: 25),
                    Text(
                      'Our job is to filling yout tummy with delicious food and fast delivery',
                      textAlign: TextAlign.center,
                      style: poppins.copyWith(fontSize: 14, color: black),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(
                            3,
                            (index) => Container(
                                  width: index == 0 ? 30 : 10,
                                  height: 10,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      color: index == 0 ? orange : grey,
                                      borderRadius: BorderRadius.circular(10)),
                                ))
                      ],
                    ),
                    const SizedBox(height: 30),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      color: red,
                      height: 66,
                      minWidth: 250,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        'Get Started',
                        style: poppins.copyWith(fontSize: 18, color: white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 30);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 30);
    path.quadraticBezierTo(size.width / 2, -30, 0, 30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
