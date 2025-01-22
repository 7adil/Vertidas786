import 'package:flutter/material.dart';

import 'buttons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  // This method builds a navigation button
  Widget _buildNavigationButton(BuildContext context, String label, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(
        label,
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            'Vertidas',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // Wrap the Row with a SingleChildScrollView for horizontal scrolling
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _buildNavigationButton(context, 'HOW IT WORKS', '/howItWorks'),
                // _buildNavigationButton(context, 'PRICING', '/pricing'),
                // _buildNavigationButton(context, 'TECHNOLOGY', '/technology'),
                _buildNavigationButton(context, 'ABOUT', '/about'),
                _buildNavigationButton(context, 'FAQ', '/faq'),
                const ColorfulOvalButton(label: 'Vertidas', route: '/labwearOS'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
