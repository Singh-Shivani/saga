import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';

class EpubPage extends StatefulWidget {
  @override
  _EpubPageState createState() => _EpubPageState();
}

class _EpubPageState extends State<EpubPage> {
  bool loading = false;
  Dio dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 30),
              child: GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios,
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),
            Center(
              child: loading
                  ? CircularProgressIndicator()
                  : GestureDetector(
                      onTap: () async {
                        EpubViewer.setConfig(
                          themeColor: Theme.of(context).primaryColor,
                          identifier: "Book",
                          scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                          allowSharing: true,
                          enableTts: true,
                          // nightMode: true,
                        );

                        await EpubViewer.openAsset(
                          'assets/book.epub',
                          lastLocation: EpubLocator.fromJson({
                            "bookId": "1",
                            "href": "/OEBPS/ch06.xhtml",
                            "created": 1539934158390,
                            "locations": {
                              "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
                            }
                          }),
                        );
                        // get current locator
                        EpubViewer.locatorStream.listen(
                          (locator) {
                            print('LOCATOR: ${EpubLocator.fromJson(
                              jsonDecode(locator),
                            )}');
                          },
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.4),
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Read the Book',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
