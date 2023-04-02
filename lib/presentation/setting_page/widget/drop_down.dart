import 'package:flutter/material.dart';
import 'package:weather/util/dtx.dart';

class PopupMenu<T> extends StatefulWidget {
  final List<T> items;
  T selectedItem;
  final int selectedIndex;
  final void Function(dynamic, int) onSelect;

  PopupMenu({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelect,
  }) : selectedItem = items[selectedIndex];

  @override
  State<StatefulWidget> createState() {
    return _PopupMenuState();
  }
}

class _PopupMenuState<T> extends State<PopupMenu<T>> {

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuWrapper<T>>(
      itemBuilder: (context) {
        return widget.items
            .mapIndexed((e, i) => PopupMenuItem(
          value: MenuWrapper(i, e),
          child: Text(e.toString()),
        ))
            .toList();
      },
      onSelected: (e) {
        widget.onSelect(e.elem, e.index);
        setState(() {
          widget.selectedItem = e.elem;
        });
      },
      child: Row(
        children: [
          Text(widget.selectedItem.toString()),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }

}


class MenuWrapper<T> {
  final int index;
  final T elem;

  MenuWrapper(this.index, this.elem);
}
