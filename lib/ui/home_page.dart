import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dr_github/data/api/api_service.dart';
import 'package:test_dr_github/provider/restaurant_provider.dart';
import 'package:test_dr_github/ui/restaurant_list_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantProvider>(
      create: (_) => RestaurantProvider(context, ApiService()),
      child: RestaurantListPage(),
    );
  }
}
