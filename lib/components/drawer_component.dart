import 'package:flutter/material.dart';
import 'package:gym_tracker/components/drawer_item_component.dart';

class DrawerComponent extends StatefulWidget {
  final bool isOpen;
  const DrawerComponent({Key? key, required this.isOpen}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  int _selectedDrawerItem = 0;
  late bool isOpen;

  @override
  void initState() {
    super.initState();
    setState(() {
      isOpen = widget.isOpen;
    });
  }

  void setSelected(int value) {
    setState(() {
      _selectedDrawerItem = value;
    });
  }

  void navigate(String name) {
    Navigator.pushNamed(context, '/${name.toLowerCase()}');
  }

  bool _isSelected(int value) {
    return _selectedDrawerItem == value;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          opacity: isOpen ? 0.5 : 0,
          duration: const Duration(milliseconds: 200),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          top: (isOpen)
              ? MediaQuery.of(context).size.height * 0.2
              : MediaQuery.of(context).size.height,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Color(0xFF383B52),
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Column(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/runs');
                  },
                  child: const Text(
                    'Runs',
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    // return Drawer(
    //   child: ListView(
    //     padding: const EdgeInsets.only(top: 50, bottom: 30),
    //     children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.all(16),
    //         child: Row(
    //           children: <Widget>[
    //             Text(
    //               'Welcome Ricardo.',
    //               style: Theme.of(context).textTheme.headline6,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(left: 20),
    //               child: ClipRRect(
    //                 borderRadius: BorderRadius.circular(20),
    //                 child: const Image(
    //                   image: NetworkImage(
    //                       'https://graph.facebook.com/10216787378497802/picture?height=256&width=256'),
    //                   width: 35,
    //                   height: 35,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       const Divider(
    //         thickness: 1,
    //         indent: 4,
    //         endIndent: 4,
    //       ),
    //       DrawerItemComponent('Login', 1, _isSelected(1), (p0) => null, navigate),
    //       const Divider(
    //         thickness: 1,
    //         indent: 4,
    //         endIndent: 4,
    //       ),
    //       DrawerItemComponent('Runs', 2, _isSelected(2), setSelected, navigate),
    //       // DrawerItemComponent('Menu One', 1, _isSelected(1), setSelected),
    //       // DrawerItemComponent('Menu Two', 2, _isSelected(2), setSelected),
    //       // DrawerItemComponent('Menu Three', 3, _isSelected(3), setSelected),
    //       // DrawerItemComponent('Menu Four', 4, _isSelected(4), setSelected),
    //     ],
    //   ),
    // );
  }
}
