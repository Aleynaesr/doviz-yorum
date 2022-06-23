import 'package:flutter/material.dart';
import '../../view/comment/view/comment_page.dart';
import '../../view/converter/view/converter_page.dart';
import '../../view/market/view/market_page.dart';
import '../../view/portfolio/view/portfolio_page.dart';
import '../../view/profile/view/profile_page.dart';
import 'constants.dart';

class RouterPage extends StatefulWidget {
  const RouterPage({Key? key}) : super(key: key);

  @override
  _RouterPageState createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  int currentTab = 2;

  final List<Widget> screens = [
    const PortfolioPage(),
    const MarketPage(),
    const ConverterPage(),
    const CommentPage(),
    const ProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const ConverterPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          color: primary,
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    setState(() {
                      currentScreen = const PortfolioPage();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.business_center_outlined,
                        color: currentTab == 0 ? orange : white,
                      ),
                      Text("Portföy",
                          style: TextStyle(
                              color: currentTab == 0 ? orange : white,
                              fontSize: 11))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    setState(() {
                      currentScreen = const MarketPage();
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.auto_graph_outlined,
                        color: currentTab == 1 ? orange : white,
                      ),
                      Text("Piyasalar",
                          style: TextStyle(
                              color: currentTab == 1 ? orange : white,
                              fontSize: 11))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    setState(() {
                      currentScreen = const ConverterPage();
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.calculate_outlined,
                        color: currentTab == 2 ? orange : white,
                      ),
                      Text("Çevirici",
                          style: TextStyle(
                              color: currentTab == 2 ? orange : white,
                              fontSize: 11))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    setState(() {
                      currentScreen = const CommentPage();
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.insert_comment_outlined,
                        color: currentTab == 3 ? orange : white,
                      ),
                      Text("Yorumlar",
                          style: TextStyle(
                              color: currentTab == 3 ? orange : white,
                              fontSize: 11))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    setState(() {
                      currentScreen = const ProfilePage();
                      currentTab = 4;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.person,
                        color: currentTab == 4 ? orange : white,
                      ),
                      Text("Profil",
                          style: TextStyle(
                              color: currentTab == 4 ? orange : white,
                              fontSize: 11))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
