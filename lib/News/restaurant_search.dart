// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:test_dr_github/data/api/api_service.dart';
// import 'package:test_dr_github/data/model/restaurant.dart';
// import 'package:test_dr_github/provider/restaurant_search_provider.dart';
// import 'package:test_dr_github/ui/restaurant_detail_page.dart';
// import 'package:test_dr_github/widgets/search_field.dart';
//
// import '../provider/restaurant_provider.dart';
//
//
//
// // Punya Ananda
// class RestaurantSearch extends StatefulWidget {
//   static const routeName = '/search';
//
//   const RestaurantSearch({Key? key}) : super(key: key);
//   @override
//   _RestaurantSearchState createState() => _RestaurantSearchState();
// }
//
// class _RestaurantSearchState extends State<RestaurantSearch> {
//   final TextEditingController _controller = TextEditingController();
//   String query = "";
//   Widget _searchList(BuildContext context, List<Restaurant> listRestaurant) {
//     return Column(
//       children: [
//         ListView.builder(
//             shrinkWrap: true,
//             scrollDirection: Axis.vertical,
//             itemCount: listRestaurant.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 margin: const EdgeInsets.all(2),
//                 child: ListTile(
//                   selected: true,
//                   horizontalTitleGap: 5,
//                   leading: Hero(
//                     tag: listRestaurant[index].pictureId,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10.0),
//                       child: Image.network(
//                         ApiService.smallImage + listRestaurant[index].pictureId,
//                         height: 80.0,
//                         width: 80.0,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   title: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       listRestaurant[index].name,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                           color: Colors.black),
//                     ),
//                   ),
//                   subtitle: Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: RichText(
//                       text: TextSpan(
//                         children: [
//                           const WidgetSpan(
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 2),
//                               child: Icon(
//                                 Icons.star_rate,
//                                 color: Colors.yellow,
//                                 size: 16,
//                               ),
//                             ),
//                           ),
//                           TextSpan(
//                             text: listRestaurant[index].rating.toStringAsFixed(2),
//                             style: const TextStyle(
//                                 fontSize: 15,
//                                 color: Colors.black),
//                           ),
//                           const WidgetSpan(
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 2),
//                               child: Icon(
//                                 Icons.location_on,
//                                 color: Colors.black,
//                                 size: 16,
//                               ),
//                             ),
//                           ),
//                           TextSpan(
//                             text: listRestaurant[index].city,
//                             style: const TextStyle(
//                                 fontSize: 15,
//                                 color: Colors.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).pushNamed(RestaurantDetailPage.routeName,
//                         arguments: listRestaurant[index].id);
//                   },
//                 ),
//               );
//             }),
//       ],);
//   }
//
//   Widget _buildBody(BuildContext context) {
//     return SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         physics: const NeverScrollableScrollPhysics(),
//         child: Column(children: [
//           SearchField(
//             autofocus: true,
//             controller: _controller,
//           ),
//           query.isNotEmpty
//               ? ChangeNotifierProvider<RestaurantSearchProvider>.value(
//             value: RestaurantSearchProvider(
//                 apiService: ApiService(), query: query),
//             child: Consumer<RestaurantSearchProvider>(
//                 builder: (context, state, _) {
//                   if (state.state == ResultState.Loading) {
//                     return const CircularProgressIndicator();
//                   } else if (state.state == ResultState.NoData) {
//                     return const Center(
//                       child: Text("pencarian anda tidak ditemukan"),
//                     );
//                   } else if (state.state == ResultState.HasData) {
//                     return _searchList(context, state.result.restaurants);
//                   } else if (state.state == ResultState.Error) {
//                     return Center(
//                         child: SizedBox(
//                             height: 200,
//                             width: MediaQuery.of(context).size.width,
//                             child: Center(
//                               child: Column(children: const [
//                                 Text(
//                                     "Oops sepertinya anda terputus dari internet"),
//                                 CircularProgressIndicator()
//                               ]),
//                             )));
//                   } else {
//                     return const Text('');
//                   }
//                 }),
//           )
//               : SizedBox(
//             width: MediaQuery.of(context).size.width,
//           )
//         ])
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() {
//       setState(() {
//         query = _controller.text;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepOrange,
//         title: const Text(
//             'Telusuri Restaurant',
//         style: TextStyle(fontFamily: 'Rockwell')
//         ),
//       ),
//       body: _buildBody(context),
//     );
//   }
// }