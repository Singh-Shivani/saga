import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Column(
                  children: [
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back_ios),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'A',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(Icons.search),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Devine:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'Walk to the city',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                        "Lorem Ipsum is simply dummy text of the printing and\n typesetting industry. Lorem Ipsum\n has been the industry's\n\n standard dummy text ever since the 1500s\n"
                        " when an unknown printer took a\n galley of type and scrambled it to make a type specimen book.\n It has survived not only five centuries, but also the leap\n\n into electronic typesetting, remaining essentially unchanged.\n"
                        " when an unknown printer took a galley of type and\n scrambled it to make a type specimen book.\n It has survived not\n only five centuries, but also the \nleap into electronic typesetting, remaining essentially unchanged.\n\n"
                        "Lorem Ipsum is simply dummy text\n\n of the printing and\n typesetting industry. Lorem Ipsum\n has been the industry's\n\n standard dummy text ever since the 1500s\n")
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
