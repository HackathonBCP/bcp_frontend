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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Menú",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, size: 28, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "Finanzas",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return _menuItem(
                    menuItems[index]["title"],
                    menuItems[index]["icon"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(String title, IconData iconData) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      shadowColor: Colors.black45,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Colors.purple.shade100, Colors.purple.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: 36, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
