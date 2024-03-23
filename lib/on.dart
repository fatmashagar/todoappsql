

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todoappsql/cachhelper.dart';
import 'package:todoappsql/main.dart';

class on extends StatelessWidget {
  on({super.key});
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: PageView.builder(
          controller: controller,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 20),
                    child: GestureDetector(
                        onTap: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        child: index == a.onboeadscreen.length - 1
                            ? const Text('')
                            : const Text(
                          "Skip",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                Center(
                    child: Image(
                      image: AssetImage(
                        a.onboeadscreen[index].imgurl,
                      ),
                      height: 350,
                    )),
                const SizedBox(
                  height: 55,
                ),
                Text(
                  "${a.onboeadscreen[index].title}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "${a.onboeadscreen[index].subtitle}",
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15.0, top: 80, bottom: 30),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const SlideEffect(
                        spacing: 15.0,
                        radius: 15,
                        strokeWidth: 1.5,
                        dotColor: Colors.black,
                        activeDotColor: Colors.orange),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await cachehelper()
                        .savedata(key: 'onboarding', value: true)
                        .then((value) => {
                      print("hj"),
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  TodoScreen()))
                    });
                  },
                  child: index == a.onboeadscreen.length - 1
                      ? Padding(
                    padding: const EdgeInsets.all(15),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(15)),
                        child: InkWell(child: const Center(child: Text("Get Started"),),onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoScreen()));
                        },),
                      ),
                    ),
                  )
                      : const Text(" "),
                )
              ],
            );
          },
          itemCount: 3,
        ));
  }
}

class a {
  final String imgurl;
  final String title;
  final String subtitle;
  static List<a> onboeadscreen = [
    a(
        imgurl: "assets/img.png",
        title: "Welcome Todo App",
        subtitle: "Organize your tasks and boost productivity"),
    a(
        imgurl: "assets/img_1.png",
        title: "Get Started in 3 Easy Steps!",
        subtitle: "Add tasks, set due dates, and manage priorities"),
    a(
        imgurl: "assets/img_2.png",
        title: "Make ToDo Your Own!",
        subtitle: "Personalize themes , categories , and set reminders"),
  ];

  a({required this.imgurl, required this.title, required this.subtitle});
}
