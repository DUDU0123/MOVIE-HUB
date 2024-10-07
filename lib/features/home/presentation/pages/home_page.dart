import 'package:flutter/material.dart';
import 'package:movie_hub/core/common_widgets/text_widget_common.dart';
import 'package:movie_hub/features/home/presentation/widgets/home_menu.dart';
import 'package:movie_hub/features/home/presentation/widgets/movie_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidgetCommon(text: "Movie HuB"),
        actions: [
          homeMenu(),
        ],
      ),
      body: const MovieListWidget(),
    );
  }
}
