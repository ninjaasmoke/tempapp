import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  final pageController = PageController(initialPage: 0);
  final int _itemCount = 5;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181827),
      appBar: AppBar(
        backgroundColor: Color(0xff181827),
        iconTheme: IconThemeData(color: Color(0xffe8e8e8)),
        centerTitle: true,
        title: Text(
          "PageView",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xff121212),
              height: MediaQuery.of(context).size.height * .45,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemCount: _itemCount,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      child: Text(
                        'STEP ${index + 1}',
                        style: TextStyle(
                          fontSize: 42,
                        ),
                      ),
                    ),
                  );
                },
                controller: pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .45,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Color(0xff121212),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                              margin: EdgeInsets.only(bottom: 12),
                              height: 2,
                              width: 170,
                              child: LinearProgressIndicator(
                                value: (_currentIndex / 4),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.blueGrey),
                                backgroundColor: Colors.grey[200],
                              )),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: getIndicators(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            color: Colors.grey[200],
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeOut);
                            }),
                        FlatButton(
                          color: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)),
                          onPressed: () {
                            pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeOut);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Next Page",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xffe8e8e8)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getIndicators() {
    List<Widget> _indicators = [];
    for (var i = 0; i < _itemCount; i++) {
      _indicators.add(Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: getIndiColor(i),
        ),
        margin: EdgeInsets.all(12),
        height: 24,
        width: 24,
        child: getIndiChild(i),
      ));
    }
    return _indicators;
  }

  Widget getIndiChild(int i) {
    if (_currentIndex > i)
      return Center(
        child: Icon(
          Icons.done,
          size: 20,
          color: Colors.white,
        ),
      );
    else
      return Container();
  }

  Color getIndiColor(int i) {
    if (_currentIndex >= i)
      return Colors.blueGrey;
    else
      return Colors.grey[200];
  }
}
