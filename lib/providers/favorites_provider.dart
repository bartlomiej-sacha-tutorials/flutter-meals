import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      // Consider the following code:

      // var paint =
      // Paint()
      // ..color = Colors.black
      // ..strokeCap = StrokeCap.round
      // ..strokeWidth = 5.0;
      // content_copy
      // The constructor, Paint(), returns a Paint object. The code that follows the cascade notation operates on this object, ignoring any values that might be returned.

      // The previous example is equivalent to this code:

      // var paint = Paint();
      // paint.color = Colors.black;
      // paint.strokeCap = StrokeCap.round;
      // paint.strokeWidth = 5.0;

      // state = List.from(state)..remove(meal);

      state = state.where((stateMeal) => stateMeal.id != meal.id).toList();
      return false;
    } else {
      // state = List.from(state)..add(meal);
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
      return FavoriteMealsNotifier();
    });
