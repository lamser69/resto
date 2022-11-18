import 'dart:convert';

class RestaurantResult {
  RestaurantResult({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  bool error;
  String message;
  int count;
  List<Restaurant> restaurants;

  factory RestaurantResult.fromJson(Map<String, dynamic> json) =>
      RestaurantResult(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "count": count,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: json["rating"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
  };
}


// Fadil punya
class SearchResto {
  SearchResto({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  bool error;
  int founded;
  List<Restaurant> restaurants;

  factory SearchResto.fromJson(Map<String, dynamic> json) => SearchResto(
    error: json["error"],
    founded: json["founded"],
    restaurants: List<Restaurant>.from(
        json["restaurants"].map((x) => Restaurant.fromJson(x))),
  );
}



// // => Ananda
// class RestaurantSearchResult {
//   late bool error;
//   late int founded;
//   late List<Restaurant> restaurantList;
//
//   RestaurantSearchResult(
//       {required this.error,
//         required this.founded,
//         required this.restaurantList});
//
//   RestaurantSearchResult.fromJson(Map<String, dynamic> restaurant) {
//     error = restaurant["error"];
//     founded = restaurant["founded"];
//     restaurantList = parseRestaurant(jsonDecode(restaurant["restaurants"]));
//   }
// }
//
// List<Restaurant> parseRestaurant(String? json) {
//   if (json == null) {
//     return [];
//   }
//
//   final List parsed = jsonDecode(json);
//   return parsed.map((json) => Restaurant.fromJson(json)).toList();
// }



// class RestaurantSearchResult {
//   late bool error;
//   late int founded;
//   late List<Restaurant> restaurantList;
//
//   RestaurantSearchResult({required this.error,
//     required this.founded,
//     required this.restaurantList});
//
//   // RestaurantSearchResult.fromJson(Map<String, dynamic> restaurant) {
//   //   error = restaurant["error"];
//   //   founded = restaurant["founded"];
//   //   restaurantList = parseRestaurants (jsonEncode(restaurant["restaurants"]));
//   // }
//   factory RestaurantSearchResult.fromJson(Map<String, dynamic> json) =>
//       RestaurantSearchResult(
//           error: json["error"],
//           founded: json["message"],
//
//           restaurantList: List<Restaurant>.from(
//               json["restaurants"].map(x) => Restaurant.fromJson(x))
//   );
// }



  // factory RestaurantResult.fromJson(Map<String, dynamic> json) =>
  //     RestaurantResult(
  //       error: json["error"],
  //       message: json["message"],
  //       count: json["count"],
  //       restaurants: List<Restaurant>.from(
  //           json["restaurants"].map((x) => Restaurant.fromJson(x))),
  //     );
// }
