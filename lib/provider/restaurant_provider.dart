import 'package:test_dr_github/data/model/restaurant.dart';
import 'package:test_dr_github/data/api/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum ResultState { Loading, NoData, HasData, Error, NoConnection, NoQuery }

class RestaurantProvider extends ChangeNotifier {
  final BuildContext context;

  late final ApiService apiService;

  String _message = '';
  String _query = '';
  late ResultState _state;
  late RestaurantResult _restaurantResult;

  String get message => _message;
  String get query => _query;
  ResultState get state => _state;
  RestaurantResult get result => _restaurantResult;


  RestaurantProvider(this.context, this.apiService) {
    _fetchRestaurantData();
  }

  void refresh() {
    _query = query;
    _fetchRestaurantData();
    notifyListeners();
  }

  void setQuery(String query) {
    _query = query;
    _fetchRestaurantData();
    notifyListeners();
  }

  Future<dynamic> _fetchRestaurantData() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await getRestaurantData(apiService);
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }

Future<RestaurantResult> getRestaurantData(ApiService apiService) async {
    String api;
    var value = '';
    if (query.isEmpty || query == value) {
      api = ApiService.list;
    } else {
      api = ApiService.search + query;
    }
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to Load Restaurant Data");
    }
  }
}
