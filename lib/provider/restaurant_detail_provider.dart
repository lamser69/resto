import 'package:test_dr_github/data/model/restaurant_detail.dart';
import 'package:test_dr_github/provider/restaurant_provider.dart';
import 'package:test_dr_github/data/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class RestaurantDetailProvider extends ChangeNotifier {

  // RestaurantDetailProvider({required this.id}) {
  //   _fetchRestaurantDetailData();
  // }

  RestaurantDetailProvider({required this.id}){
    _fetchRestaurantDetailData();
  }

  final String id;
  // final BuildContext context;
  late final ApiService apiService;
  // final connectionService = ConnectionService();

  String _message = '';
  late ResultState _state;
  late RestaurantDetail _restaurantDetailResult;

  String get message => _message;
  ResultState get state => _state;
  RestaurantDetail get result => _restaurantDetailResult;

  Future<dynamic> _fetchRestaurantDetailData() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      // final connection = await connectionService.connectionService(context);
      // if (!connection.connected) {
      //   _state = ResultState.NoConnection;
      //   notifyListeners();
      //   return _message = connection.message;
      // }
      final restaurant = await getRestaurantDetail();
      if (restaurant.restaurant == null) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantDetailResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }

  void refresh() {
    _fetchRestaurantDetailData();
    notifyListeners();
  }

  Future<RestaurantDetail> getRestaurantDetail() async {
    final response = await http.get(Uri.parse(ApiService.detail + id));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Ugh, seems like we\'re failed to load the restaurant details');
    }
  }

}
