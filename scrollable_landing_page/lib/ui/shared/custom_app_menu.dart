import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_landing_page/provider/page_provider.dart';
import 'package:scrollable_landing_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isOpen) {
              controller.reverse();
            } else {
              controller.forward();
            }
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              if (isOpen) ...[
                CustomMenuItem(
                    delay: 0,
                    text: 'Home',
                    onPressed: () => pageProvider.goTo(0)),
                CustomMenuItem(
                    delay: 40,
                    text: 'About',
                    onPressed: () => pageProvider.goTo(1)),
                CustomMenuItem(
                    delay: 80,
                    text: 'Princing',
                    onPressed: () => pageProvider.goTo(2)),
                CustomMenuItem(
                    delay: 120,
                    text: 'Contact',
                    onPressed: () => pageProvider.goTo(3)),
                CustomMenuItem(
                    delay: 160,
                    text: 'Location',
                    onPressed: () => pageProvider.goTo(4)),
                const SizedBox(height: 8)
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    super.key,
    required this.isOpen,
    required this.controller,
  });

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text(
            'Menu',
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
          ),
          const Spacer(),
          // Icon(Icons.menu, color: Colors.white)
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
