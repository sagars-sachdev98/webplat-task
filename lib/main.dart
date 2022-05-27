import 'package:flutter/material.dart';
import 'package:webplat_task/view/graph_tree.view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tree view hierarchy',
      home: GraphView(),
      theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.blue,
              secondary: const Color(0xff59b55c),
              error:const Color(0xffb20000),
              onInverseSurface: const Color(0xffd43790)),
          textTheme:
              const TextTheme(bodyText2: TextStyle(color: Color(0xff59b55c)))),
    );
  }
}
