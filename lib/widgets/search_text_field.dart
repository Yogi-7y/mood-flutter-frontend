import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.grey.withOpacity(.16),
      child: Container(
        child: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(width: 0.8),
              ),
              hintText: 'Search Songs...',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(.7),
              ),
              prefixIcon: Icon(
                Icons.search,
                size: 30.0,
                color: Colors.white.withOpacity(0.7),
              ),
              suffixIcon: Icon(
                Icons.clear,
                color: Colors.white.withOpacity(.5),
              )),
        ),
      ),
    );
  }
}
