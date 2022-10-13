import 'package:flutter/material.dart';

import '../../../utils/constant_utils.dart';

class EmptyNoteScreen extends StatelessWidget {
  const EmptyNoteScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          addVerticalSpace(30),
          Image.asset(ImagePath.homeImage),
          addVerticalSpace(10),
          Text(
            'Create your first note !',
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 25),
          )
        ],
      ),
    );
  }
}
