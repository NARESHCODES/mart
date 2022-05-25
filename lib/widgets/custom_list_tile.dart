import 'package:flutter/material.dart';
import 'package:mart/util/app_color.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomListTile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppColor.primaryColor)),
          onPressed: () {},
          child: const Text(
            "SEE ALL",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
