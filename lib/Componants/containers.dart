import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final title;
  final Color color;
  final VoidCallback onPress;


  const MyButton({Key? key, 
    this.title,
    this.color=const Color(0xffa5a5a5),
    required this.onPress,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Container(
            height: 40,
            margin: EdgeInsets.all(10),

            decoration:
                BoxDecoration(shape: BoxShape.rectangle,color: color,
                    boxShadow: const[BoxShadow(
                      color: Colors.black87,
                      blurRadius: 20,
                    ),
                    ]



                ),


            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
