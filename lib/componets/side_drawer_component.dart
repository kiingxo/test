import 'package:flutter/material.dart';

class SideDrawerComponent extends StatefulWidget {
  final int index;
  final ValueChanged<int> onItemSelected;
  const SideDrawerComponent({
    super.key,
    required this.index,
    required this.onItemSelected,
  });

  @override
  State<SideDrawerComponent> createState() => _SideDrawerComponentState();
}

class _SideDrawerComponentState extends State<SideDrawerComponent> {
  final items = <({
    IconData icon,
    String text,
  })>[
    (
      icon: Icons.menu,
      text: 'Dashboard',
    ),
    (
      icon: Icons.people,
      text: 'employees',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey,
          ),
          right: BorderSide(
            color: Colors.grey,
          ),
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Column(
        children: [
          for (final (index, item) in items.enumerate())
            Expanded(
              child: DrawerTileAtom(
                icon: item.icon,
                label: item.text,
                isSelected: index == widget.index,
                onTap: () {
                  widget.onItemSelected(index);
                },
              ),
            ),
        ],
      ),
    );
  }
}

extension Enumerate<T> on List<T> {
  List<(int, T)> enumerate() {
    return List.generate(length, (index) => (index, this[index]));
  }
}

class DrawerTileAtom extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const DrawerTileAtom({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.blueAccent : Colors.grey,
            ),
            const SizedBox(width: 13),
            Text(
              label,
              style: TextStyle(
                fontSize: isSelected ? 17 : 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
