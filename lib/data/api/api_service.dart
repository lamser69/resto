import 'dart:convert';
import 'package:test_dr_github/data/model/restaurant.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static const baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const list = baseUrl + 'list';
  static const detail = baseUrl + 'detail/';
  static const search = baseUrl + 'search?q=';
  static const smallImage = baseUrl + 'images/small/';
  static const mediumImage = baseUrl + 'images/medium/';
  static const largeImage = baseUrl + 'images/large/';

  Future<RestaurantResult> getRestaurants() async {
    final response = await http.get(Uri.parse(list));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load restaurants');
    }
  }

  // // Punya Fadil
  // Future<SearchResto> searchRestaurant(String query) async {
  //   final response = await http.get(Uri.parse(baseUrl + "/search?q=" + query));
  //   if (response.statusCode == 200) {
  //     return SearchResto.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to Search');
  //   }
  // }


  Future<SearchResto> getSearchRestaurant(String query) async {
    final response = await http.get(Uri.parse(baseUrl + "search?q=$query"));
    // final response = await http.get(Uri.parse(baseUrl + search + "query"));
    if (response.statusCode == 200) {
      return SearchResto.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load search restaurant list');
    }
  }

  // Future<SearchResto> searchRestaurant(String query) async {
  //   final response = await http.get(Uri.parse(baseUrl + "/search?q=" + query));
  //   if (response.statusCode == 200) {
  //     return SearchResto.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to Search');
  //   }
  // }
}