import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[...apiServices];

List<SingleChildWidget> apiServices = <SingleChildWidget>[
  Provider.value(value: ""),
  // Provider.value(
  //   value: PostApi(
  //     Dio(
  //       BaseOptions(
  //         contentType: "application/json",
  //         baseUrl: 'https://jsonplaceholder.typicode.com',
  //       ),
  //     ),
  //   ),
  // ),
];
