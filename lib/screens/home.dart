import 'dart:async';
import 'dart:io';
import 'package:mahglobal/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  bool _showAppbar = true;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final _key = UniqueKey();
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: primary,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.5),
            child: AppBar(
              elevation: 50.0,
              centerTitle: false,
              backgroundColor: primary,
              automaticallyImplyLeading: false, // hides leading widget
              // flexibleSpace: SomeWidget(),
            )),
        body: Stack(
          children: [
            WebView(
              gestureNavigationEnabled: true,
              key: _key,
              initialUrl: "https://mahglobal.com.ng/login",
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
              onProgress: (int progress) {
                isLoading = true;
                // print('WebView is loading (progress : $progress%)');
              },
              onPageStarted: (String url) {
                if (url == "https://mahglobal.com.ng" ||
                    url == "https://mahglobal.com.ng/" ||
                    url.contains("login") ||
                    url.contains("register")) {
                  setState(() {
                    _showAppbar = false;
                  });
                } else {
                  setState(() {
                    _showAppbar = true;
                  });
                }
                // print("dshdghghdfghfghfghfghrfghrfghrf");
                // print('Page started loading: $url');
                // print("dshdghghdfghfghfghfghrfghrfghrf");
              },
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            ),
            isLoading
                ? Center(
                    // child: CircularProgressIndicator(),
                    child: new Stack(
                      children: [
                        new Opacity(
                          opacity: 0.9,
                          child: ModalBarrier(
                              dismissible: false, color: Colors.white),
                        ),
                        new Center(
                          child: new SpinKitFadingCircle(
                            color: primary,
                            size: 50.0,
                          ),
                        ),
                      ],
                    ),
                  )
                : Stack(),
          ],
        ),
        bottomNavigationBar: _showAppbar
            ? BottomAppBar(
                elevation: 50.0,
                color: primary,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/Home', (Route<dynamic> route) => false);
                        },
                        child: Container(
                          child:
                              Icon(Icons.refresh, color: primary, size: 30.0),
                          // padding: EdgeInsets.all(0.5),
                          margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/Dashboard', (Route<dynamic> route) => false);
                        },
                        child: Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: 110,
                            height: 30,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Icon(Icons.home, color: primary, size: 25.0),
                                Text(
                                  "Dashboard",
                                  style: TextStyle(
                                    color: primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Text(''),
      );
}
