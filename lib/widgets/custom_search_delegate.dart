import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final movies = [
    'Avatar',
    'Zootopia',
    'Big Hero 6',
    'Ant Man',
    'Insidious',
  ];

  final recentMovies = [
    'Insidious',
    'Zootopia',
    'Big Hero 6',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // final suggestionList = query.isEmpty ? recentMovies : movies;

    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(movies[index]),
        );
      },
    );
  }
}
