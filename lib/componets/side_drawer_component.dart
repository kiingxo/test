import 'package:flutter/material.dart';

class SideDrawerComponent extends StatefulWidget {
  final int index;
  final ValueChanged<int> onItemSelected;

  const SideDrawerComponent({
    Key? key,
    required this.index,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  _SideDrawerComponentState createState() => _SideDrawerComponentState();
}

class _SideDrawerComponentState extends State<SideDrawerComponent> {
  final items = [
    {'image': 'assets/bold/category.png', 'text': 'Dashboard'},
    {'image': 'assets/bold/user.png', 'text': 'Employees'},
    {'image': 'assets/bold/information.png', 'text': 'Help & Support'},
    {'image': 'assets/bold/logout.png', 'text': 'Log Out'},
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final item in items)
            Column(
              children: [
                DrawerTileAtom(
                  image: item['image'] as String,
                  label: item['text'] as String,
                  isSelected: items.indexOf(item) == widget.index,
                  onTap: () {
                    widget.onItemSelected(items.indexOf(item));
                  },
                ),
                const SizedBox(height: 10),
                if (item['text'] == 'Help & Support')
                  const SizedBox(height: 20),
              ],
            ),
          const Spacer(),
          Row(
            children: [
              _buildCircleAvatar(),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'John',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildCircleAvatar() {
    return const CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage('assets/bold/user.png'),
    );
  }
}

class DrawerTileAtom extends StatelessWidget {
  final bool isSelected;
  final String image;
  final String label;
  final VoidCallback onTap;

  const DrawerTileAtom({
    Key? key,
    required this.image,
    required this.isSelected,
    required this.label,
    required this.onTap,
  }) : super(key: key);

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
            Image.asset(
              image,
              color: isSelected ? Colors.blueAccent : Colors.grey,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 13),
            Text(
              label,
              style: TextStyle(
                fontSize: isSelected ? 17 : 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
