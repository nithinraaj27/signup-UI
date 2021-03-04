import 'package:flutter/cupertino.dart';

Widget appBar(BuildContext)
{
  return RichText(
      text:TextSpan(
        style: TextStyle(fontSize: 26.0),
        children: [
          TextSpan(
            text: 'Quiz',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff070000)
            )
          ),
        TextSpan(
            text:'Maker',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff2F0BE0)

                ),
             ),
        ],
      ),
  );
}