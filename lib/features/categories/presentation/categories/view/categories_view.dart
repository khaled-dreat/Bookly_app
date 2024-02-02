import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CategoriesView extends StatelessWidget {
  static const String nameRoute = "CategoriesView";
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: const Gr(),
    );
  }
}

List<String> categoriesList = [
  "Fiction and Novels",
  "Science Fiction",
  "Mystery and Thrillers",
  "Romance",
  "Fantasy",
  "Biography and Memoirs",
  "Self Development",
  "History",
  "Philosophy",
  "Religion and Spirituality",
  "Art and Design",
  "Business and Finance",
  "Travel and Adventure",
  "Health and Wellness",
  "Science and Technology",
  "Politics and Government",
  "Sports and Recreation",
  "Children's Books",
  "Young Adult",
];

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150,
        height: 150,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            child: const Text(
              "Fiction and Novels",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.black54),
            )));
  }
}

class Gr extends StatelessWidget {
  const Gr({super.key});

  @override
  Widget build(BuildContext context) {
    int columnCount = 2;

    return AnimationLimiter(
      child: GridView.count(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.all(15.r),
        crossAxisCount: columnCount,
        children: List.generate(
          categoriesList.length,
          (int index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 500),
              columnCount: columnCount,
              child: ScaleAnimation(
                duration: const Duration(milliseconds: 900),
                curve: Curves.fastLinearToSlowEaseIn,
                child: FadeInAnimation(
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        EdgeInsets.only(bottom: 10.r, left: 8.r, right: 8.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.r),
                      child: Text(categoriesList.elementAt(index),
                          textAlign: TextAlign.center,
                          style: categoriesList.elementAt(index).length == 16
                              ? TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp)
                              : TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp)),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
