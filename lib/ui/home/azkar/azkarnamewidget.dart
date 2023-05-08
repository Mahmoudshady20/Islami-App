import 'package:flutter/material.dart';
import 'package:islamirevision/ui/home/azkar/azkardetails.dart';

class AzkarNameWidget extends StatelessWidget {
  String title;
  int index;
  AzkarNameWidget(this.title,this.index);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AzcarDetails.routeName,
        arguments: AzkarContentArgs(title, index)
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
