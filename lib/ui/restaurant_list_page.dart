import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:search_page/search_page.dart';
import 'package:test_dr_github/News/restaurant_search.dart';
import 'package:test_dr_github/provider/restaurant_provider.dart';
import 'package:test_dr_github/widgets/search_restaurant.dart';
import 'package:test_dr_github/widgets/card_restorant.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);


  Widget _buildList() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Text(
                "Recommendation restaurant for you!",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              padding: const EdgeInsets.all(10.0),
            ),
            Expanded(
              child: Consumer<RestaurantProvider>(
                builder: (context, state, _) {
                  if (state.state == ResultState.Loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.state == ResultState.HasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.result.restaurants.length,
                      itemBuilder: (context, index) {
                        var restaurant = state.result.restaurants[index];
                        return CardRestaurant(restaurant: restaurant);
                      },
                    );
                  } else if (state.state == ResultState.NoData) {
                    return Center(child: Text(state.message));
                  } else if (state.state == ResultState.Error) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text(''));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
            "Restaurant App",
            style: TextStyle(
                fontFamily: 'Rockwell',
                color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pushNamed(context, RestaurantSearch.routeName),
            // onPressed: () => Navigator.pushNamed(context, SearchPag.routeName),
            // onPressed: () => Navigator.pushNamed(context, RestaurantSearch.routeName),
          ),
        ],
      ),
      body: _buildList(),
    );
  }
}
