import 'package:behesht_services/presentation/services_icons.dart';
import 'package:behesht_services/view/Akhbar.dart';
import 'package:behesht_services/view/arzesh_afzoode.dart';
import 'package:behesht_services/view/home_page/with_network/services_from_network.dart';
import 'package:behesht_services/view/motevafiyan.dart';
import 'package:behesht_services/view/peygiri.dart';
import 'package:flutter/material.dart';

class HomePageNetwork extends StatefulWidget {
  const HomePageNetwork({Key? key}) : super(key: key);

  @override
  State<HomePageNetwork> createState() => _HomePageNetworkState();
}

class _HomePageNetworkState extends State<HomePageNetwork> {

  int _selectedIndex = 2;

  final List<Widget> _children = [
    const ArzeshAfzoode(),
    const Peygiri(),
    const ServicesFromNetwork(),
    const Motevafiyan(),
    const Akhbar()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                  icon: Icon(Icons.contacts,
                    color: Colors.white,),
                  label: 'ارزش افزوده',
                  backgroundColor: Colors.green
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.content_paste_search,
                      color: Colors.white),
                  label: 'پیگیزی',
                  backgroundColor: Colors.green
              ),
              const BottomNavigationBarItem(
                  icon: Icon(ServicesIcon.layers,
                      color: Colors.white),
                  label: 'خذمات',
                  backgroundColor: Colors.green
              ),
              BottomNavigationBarItem(
                  icon: Image.asset("assets/image/tomb_icon.png",
                    width: 35,
                    color: Colors.white,),
                  label: 'متوفیان',
                  backgroundColor: Colors.green
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper,
                      color: Colors.white),
                  label: 'اخبار',
                  backgroundColor: Colors.green
              ),
            ],
            type: BottomNavigationBarType.shifting,
            backgroundColor: Colors.green,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            iconSize: 25,
            onTap: _onItemTapped,
            elevation: 5),
        body: _children[_selectedIndex]
    );
  }
}

