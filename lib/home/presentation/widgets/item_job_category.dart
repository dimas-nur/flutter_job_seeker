import 'package:flutter/material.dart';

class ItemJobCategory extends StatelessWidget {
  const ItemJobCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Text('Full Time'),
    );
  }
}
