import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final Color cardClr;
  ReviewCard({@required this.cardClr});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: cardClr,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromRGBO(190, 194, 206, 1),
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text('Carlos Day'),
                      Text(
                        '5 days ago',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Love it !!!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'I have a chance to my knowledge. Thanks.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
