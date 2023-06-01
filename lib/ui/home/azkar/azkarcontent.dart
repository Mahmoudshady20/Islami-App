import 'package:flutter/material.dart';

class AzkarContent extends StatefulWidget {
  String content;
  String number;
  AzkarContent(this.content, this.number);

  @override
  State<AzkarContent> createState() => _AzkarContentState();
}

class _AzkarContentState extends State<AzkarContent> {
  bool isrun = false;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    if(isrun==false){
       counter = int.parse(widget.number);
    }
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            widget.content,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        InkWell(
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
              counter = int.parse(widget.number);
            });
          },
          child: Container(
            margin: EdgeInsets.only(
              bottom: 8,
              left: 8,
              right: 8
            ),
            decoration: BoxDecoration(
              color: Color(0xFFB29786),
              borderRadius: BorderRadius.circular(15)
            ),
            height: MediaQuery.of(context).size.height*.15,
            width: double.infinity,
            child: Center(
              child: Text(
                '$counter',
              style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        )
      ],
    );
  }
}
