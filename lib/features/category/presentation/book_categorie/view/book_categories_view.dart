import '../../../../../core/widgets/images/costom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BookCategoriesView extends StatelessWidget {
  static const String nameRoute = "BookCategoriesView";
  const BookCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookCategoriesViewBody(),
    );
  }
}

class BookCategoriesViewBody extends StatelessWidget {
  const BookCategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 230),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return const CostomBookImage(
              image:
                  "https://scontent.fjrs2-2.fna.fbcdn.net/v/t39.30808-6/419339470_704059315202351_7860119078169063731_n.jpg?stp=dst-jpg_p843x403&_nc_cat=102&ccb=1-7&_nc_sid=3635dc&_nc_ohc=K72w8bkRNuYAX_huJsq&_nc_oc=AQnic0actuzbqBopMka1LUWvVkzDqMKYNbSfK2Y0ZmnKeIcLh5luL_WSyiUwzzXEyKA&_nc_ht=scontent.fjrs2-2.fna&oh=00_AfCvC08D7lY305xTOu5Ywc1x10eSxakn2CCdv-ua-IWKJQ&oe=65B6BBEC",
              height: 170,
              width: 100);
        },
      ),
    );
  }
}
