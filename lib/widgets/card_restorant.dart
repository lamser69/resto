import 'package:test_dr_github/ui/restaurant_detail_page.dart';
import 'package:test_dr_github/data/model/restaurant.dart';
import 'package:test_dr_github/data/api/api_service.dart';
import 'package:flutter/material.dart';


class CardRestaurant extends StatelessWidget {

  CardRestaurant({required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailPage.routeName,
              arguments: restaurant.id);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Hero(
                  tag: Image.network(
                    ApiService.smallImage + restaurant.pictureId,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      ApiService.smallImage + restaurant.pictureId,
                      height: 80.0,
                      width: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        restaurant.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star_rate,
                          color: Colors.yellow,
                        ),
                        Text(restaurant.rating.toStringAsFixed(2)),
                      ]),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.redAccent,
                        ),
                        Text(restaurant.city)
                      ]),
                    const SizedBox(height: 10.0,)
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
