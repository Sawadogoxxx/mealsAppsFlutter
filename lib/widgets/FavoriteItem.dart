import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/model/Meal.dart';
import 'package:recipes/provider/MealsProvider.dart';
import 'package:recipes/utils/constants.dart';

class FavoriteItem extends StatefulWidget {
  const FavoriteItem({super.key, required this.meal});
  final Meal meal;
  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    MealFavoriotesProdider provider =
        Provider.of<MealFavoriotesProdider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(7),
      child: IconButton(onPressed: () {
        setState(() {
          provider.addFavorite(widget.meal);
        });
      }, icon: Consumer<MealFavoriotesProdider>(
        builder: (context, value, child) {
          return !value.isFavoriteMeal(widget.meal)
              ? const Icon(
                  Icons.favorite_border,
                  color: appColor,
                  size: 33,
                )
              : const Icon(
                  Icons.favorite,
                  color: appColor,
                  size: 33,
                );
        },
      )),
    );
  }
}
