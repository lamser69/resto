
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dr_github/data/api/api_service.dart';
import 'package:test_dr_github/provider/restaurant_detail_provider.dart';
import 'package:test_dr_github/provider/restaurant_provider.dart';

class RestaurantDetailPage extends StatefulWidget {
  RestaurantDetailPage({required this.id});

  static const routeName = "/detail_page";
  final String id;

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantDetailProvider>(
      create: (_) => RestaurantDetailProvider(id: widget.id),
      child: Scaffold(
        body: Consumer<RestaurantDetailProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.Loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.state == ResultState.HasData) {
              return Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.red,
                    title: Text(
                      state.result.restaurant.name,
                    )),
                body: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(ApiService.largeImage +
                                  state.result.restaurant.pictureId),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        color: Colors.redAccent),
                                    Text(state.result.restaurant.city),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(children: [
                                  const Icon(Icons.star_rate,
                                      color: Colors.yellow),
                                  Text(state.result.restaurant.rating
                                      .toStringAsFixed(2))
                                ]),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  "Description",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              Text(
                                state.result.restaurant.description,
                                style: const TextStyle(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text("sdaads"),
                              
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        children: [
                                          const Text('Foods',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Container(
                                            color: Colors.white,
                                            height: 200.0,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Column(
                                                children: state.result
                                                    .restaurant.menus.foods
                                                    .map((food) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20.0),
                                                          child:
                                                              Column(children: [
                                                            Text(food.name),
                                                          ]),
                                                        ))
                                                    .toList(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Column(children: [
                                        const Text('Drinks',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Container(
                                          color: Colors.white,
                                          height: 200.0,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              children: state.result.restaurant
                                                  .menus.drinks
                                                  .map((food) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
                                                        child:
                                                            Column(children: [
                                                          Text(food.name),
                                                        ]),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ]),
                            ]),
                      ),
                    ),
                  ]),
                ),
              );
            } else if (state.state == ResultState.NoData) {
              return Center(child: Text(state.message));
            } else if (state.state == ResultState.Error) {
              return Center(child: Text(state.message));
            } else if (state.state == ResultState.NoConnection) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () => state.refresh(),
                      child: const Text('Refresh'),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: Text(''));
            }
          },
        ),
      ),
    );
  }
}
