import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:path_provider/path_provider.dart';

class EpubPage extends StatefulWidget {
  @override
  _EpubPageState createState() => _EpubPageState();
}

class _EpubPageState extends State<EpubPage> {
  bool loading = false;
  Dio dio = new Dio();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    downloadFile();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: loading
              ? CircularProgressIndicator()
              : FlatButton(
                  onPressed: () async {
                    // Directory appDocDir =
                    //     await getApplicationDocumentsDirectory();
                    // print('$appDocDir');

                    // String iosBookPath = '${appDocDir.path}/book.epub';
                    String iosBookPath = 'assets/book.epub';
                    // print(iosBookPath);
                    String androidBookPath = 'assets/book.epub';
                    EpubViewer.setConfig(
                        themeColor: Theme.of(context).primaryColor,
                        identifier: "iosBook",
                        scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                        allowSharing: true,
                        enableTts: true,
                        nightMode: true);
                    EpubViewer.open(
                      Platform.isAndroid ? androidBookPath : iosBookPath,
                      lastLocation: EpubLocator.fromJson({
                        "bookId": "1",
                        "href": "/OEBPS/ch06.xhtml",
                        "created": 1539934158390,
                        "locations": {
                          "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
                        }
                      }),
                    );

                    await EpubViewer.openAsset(
                      'assets/book.epubb',
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
                    EpubViewer.locatorStream.listen((locator) {
                      print(
                          'LOCATOR: ${EpubLocator.fromJson(jsonDecode(locator))}');
                    });
                  },
                  child: Container(
                    child: Text('open epub'),
                  ),
                ),
        ),
      ),
    );
  }

  Future downloadFile() async {
    print('download1');
    await startDownload();

    // PermissionStatus permission = await PermissionHandler()
    //     .checkPermissionStatus(PermissionGroup.storage);
    //
    // if (permission != PermissionStatus.granted) {
    //   await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    //   await startDownload();
    // } else {
    //   await startDownload();
    // }
  }

  Future startDownload() async {
    Directory appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    String path = 'assets/book.epub';
    File file = File(path);
//    await file.delete();

    if (!File(path).existsSync()) {
      await file.create();
      await dio.download(
        'https://github.com/FolioReader/FolioReaderKit/raw/master/Example/'
        'Shared/Sample%20eBooks/The%20Silver%20Chair.epub',
        path,
        deleteOnError: false,
        onReceiveProgress: (receivedBytes, totalBytes) {
          print((receivedBytes / totalBytes * 100).toStringAsFixed(0));
          //Check if download is complete and close the alert dialog
          if (receivedBytes == totalBytes) {
            loading = false;
            setState(() {});
          }
        },
      );
    } else {
      loading = false;
      setState(() {});
    }
  }
}
