// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AzkarContent extends StatelessWidget {
  String content;
  String number;
  AzkarContent(this.content, this.number, {super.key});

  bool isrun = false;

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    if(isrun==false){
       counter = int.parse(number);
    }
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: (){
                final value = ClipboardData(text: content);
                Clipboard.setData(value);
              },
              icon : Icon(Icons.copy,color: Theme.of(context).dividerColor),
            ),
            StatefulBuilder(
               builder: (context, setState) => InkWell(
                onTap: (){
                  setState(() {
                    isrun = true;
                    if(counter>0){
                      counter--;
                    }
                  });
                },
                onLongPress: (){
                  setState(() {
                    isrun = false;
                    counter = int.parse(number);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 8,
                    left: 4,
                    right: 4
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB29786),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  height: MediaQuery.of(context).size.height*.15,
                  width: MediaQuery.of(context).size.width*.8,
                  child: Center(
                    child: Text(
                      '$counter',
                    style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
