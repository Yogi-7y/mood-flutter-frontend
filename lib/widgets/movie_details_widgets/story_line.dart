import 'package:flutter/material.dart';

class StoryLine extends StatelessWidget {
  final String storyline;
  StoryLine({this.storyline});
  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Storyline',
          style: textTheme.subhead.copyWith(
              fontSize: 22.0,
              color: Colors.yellow,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 8.0),
        Text(
          storyline,
          style: textTheme.body1.copyWith(
            color: Colors.white.withOpacity(.7),
            fontSize: 18.0,
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: [
        //     Text(
        //       'more',
        //       style: textTheme.body1
        //           .copyWith(fontSize: 16.0, color: theme.accentColor),
        //     ),
        //     Icon(
        //       Icons.keyboard_arrow_down,
        //       size: 18.0,
        //       color: theme.accentColor,
        //     ),
        //   ],
        // )
      ],
    );
  }
}
