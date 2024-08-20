import 'package:flutter/material.dart';
import 'package:islamirevision/ui/home/azkar/azkardetails.dart';

class AzkarNameWidget extends StatelessWidget {
  final String title;
  final int index;
  const AzkarNameWidget(this.title,this.index, {super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AzkarDetails.routeName,
        arguments: AzkarContentArgs(title, index)
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
