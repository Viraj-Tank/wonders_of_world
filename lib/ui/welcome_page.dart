import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:wonders_of_world/model/welcome.dart';
import 'package:wonders_of_world/ui/home_page.dart';

import '../widgets/app_text.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) {
          WelcomeModel current = welcomeComponents[index];
          return SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.4,
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width * 0.1, top: size.height * 0.04, right: size.width * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInRight(
                              child: AppText(text: current.title, size: 40, color: Colors.black, fontWeight: FontWeight.w500),
                            ),
                            FadeInLeft(
                              child: AppText(
                                text: current.subTitle,
                                size: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            FadeInUp(
                              delay: const Duration(milliseconds: 400),
                              child: Padding(
                                padding: EdgeInsets.only(top: size.height * 0.02),
                                child: SizedBox(
                                  width: size.width * 0.8,
                                  child: AppText(
                                    text: current.description,
                                    size: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ),
                            ),
                            FadeInUpBig(
                              duration: const Duration(milliseconds: 1100),
                              child: Padding(
                                padding: EdgeInsets.only(top: size.height * 0.08),
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  minWidth: size.width * 0.3,
                                  height: size.height * 0.055,
                                  color: Colors.deepPurpleAccent,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomePage()),
                                    );
                                  },
                                  child: const AppText(
                                    text: "Let's Go",
                                    size: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: List.generate(
                            7,
                            (indexDots) => GestureDetector(
                              onTap: () {
                                pageController.animateToPage(
                                  indexDots,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                );
                              },
                              child: AnimatedContainer(
                                margin: EdgeInsets.only(right: size.width * 0.01, bottom: size.height * 0.008),
                                width: 10,
                                height: index == indexDots ? 55 : 10,
                                duration: const Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == indexDots ? Colors.deepPurpleAccent : const Color.fromARGB(255, 193, 170, 255),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                /// Bottom Images
                FadeInUpBig(
                  duration: const Duration(milliseconds: 1200),
                  child: ShapeOfView(
                    width: size.width,
                    elevation: 4,
                    height: size.height * 0.55,
                    shape: DiagonalShape(
                      position: DiagonalPosition.Top,
                      direction: DiagonalDirection.Right,
                      angle: DiagonalAngle.deg(angle: 8),
                    ),
                    child: Image(
                      image: AssetImage(
                        current.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        scrollDirection: Axis.vertical,
        itemCount: welcomeComponents.length,
      ),
    );
  }
}
