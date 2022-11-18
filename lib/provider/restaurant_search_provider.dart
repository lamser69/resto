import 'package:flutter/cupertino.dart';
import 'package:test_dr_github/data/api/api_service.dart';
import 'package:test_dr_github/data/model/restaurant.dart';
import 'package:test_dr_github/provider/restaurant_provider.dart';

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiService apiService;
  late final String query;

  RestaurantSearchProvider({required this.apiService, required this.query}) {
    _fetchAllRestaurant();
  }

  // late RestaurantResult _restaurantSearchResult;
  late SearchResto _restaurantSearchResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  // RestaurantResult get result => _restaurantSearchResult;
  SearchResto get result => _restaurantSearchResult;

  ResultState get state => _state;

  set updateQuery(String query) {
    this.query = query;
    notifyListeners();
  }

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      // = await apiService.getSearchRestaurant(query);
      final restaurant = await apiService.getSearchRestaurant(query);
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.NoQuery;
        notifyListeners();
        return _message = "not found";
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantSearchResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return "Error --> $e";
    }
  }
}