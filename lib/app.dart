import 'package:flutter/material.dart';
import 'package:utag_mobile/common/thin_icons_icons.dart';
import 'package:utag_mobile/navigation/fab_bottom_app_bar.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class UTagApp extends StatefulWidget {
  UTagApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UTagApp createState() => _UTagApp();
}

class _UTagApp extends State<UTagApp> with TickerProviderStateMixin {
  String _lastSelected = 'TAB: 0';


  void _selectedTab(int index) {
    setState(() {
          _lastSelected = 'TAB: ${index}';
        });
    
  }

  void _selectedFab() {
    setState(() {
          _lastSelected = 'TAB: 10';
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          _lastSelected,
          style: TextStyle(fontSize: 32.0),
        ),
      ),
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        selectedColor: Color.fromRGBO(78, 84, 200, 1),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: ThinIcons.book, text: 'Ankets'),
          FABBottomAppBarItem(iconData: ThinIcons.users, text: 'Friends'),
          FABBottomAppBarItem(iconData: ThinIcons.user, text: 'Profile'),
          FABBottomAppBarItem(iconData: ThinIcons.cog, text: 'Settings'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularGradientButton(
                 child: Icon(ThinIcons.diamond),
                 callback: _selectedFab,
                 gradient: Gradients.buildGradient(Alignment(-1, 0), Alignment(0.5, 0.5), [Color.fromRGBO(78, 84, 200, 1), Color.fromRGBO(143, 148, 251, 1)]),
           ),
    );
  }
}