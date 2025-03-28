import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FinanceSectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {"title": "Créditos", "icon": LucideIcons.wallet},
    {"title": "Seguros", "icon": LucideIcons.shieldCheck},
    {"title": "SOAT", "icon": LucideIcons.fileBadge},
    {"title": "Remesas", "icon": LucideIcons.send},
    {"title": "Aprende con Yape", "icon": LucideIcons.bookOpen},
    {"title": "YapeAhorra", "icon": LucideIcons.piggyBank},
  ];

  FinanceSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7B1FA2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white, size: 28),
          onPressed: () {},
        ),
        title: const Text(
          "Menú",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0.5,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    "Finanzas",
                    style: TextStyle(
                      color: Color(0xFF7B1FA2),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Divider(height: 1, thickness: 0.5),
                ...menuItems.map((item) {
                  final isLast = item == menuItems.last;
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        leading: Icon(
                          item['icon'],
                          color: Colors.purple,
                          size: 28,
                        ),
                        title: Text(
                          item['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        onTap: () {
                          if (item['title'] == "YapeAhorra") {
                            Navigator.pushNamed(context, '/finance_dashboard');
                          }
                        },
                      ),
                      if (!isLast)
                        const Divider(height: 1, indent: 16, endIndent: 16),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
