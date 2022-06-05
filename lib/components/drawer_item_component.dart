import 'package:flutter/material.dart';

// TODO: Maybe this can be stateless?
class DrawerItemComponent extends StatefulWidget {
  final String label;
  final int index;
  final bool isSelected;
  final Function(int) setSelected;
  final Function() navigate;

  const DrawerItemComponent(
      this.label, this.index, this.isSelected, this.setSelected, this.navigate,
      {Key? key})
      : super(key: key);

  @override
  State<DrawerItemComponent> createState() => _DrawerItemComponentState();
}

class _DrawerItemComponentState extends State<DrawerItemComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        title: Text(
          widget.label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        selected: widget.isSelected,
        selectedTileColor: Colors.blue[100],
        selectedColor: Colors.blue[900],
        style: ListTileStyle.list,
        onTap: () {
          widget.setSelected(widget.index);
          widget.navigate();
        },
      ),
    );
  }
}
