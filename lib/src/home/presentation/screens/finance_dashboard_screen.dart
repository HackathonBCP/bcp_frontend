import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FinanceDashboardScreen extends StatefulWidget {
  const FinanceDashboardScreen({super.key});

  @override
  State<FinanceDashboardScreen> createState() => _FinanceDashboardScreenState();
}

class _FinanceDashboardScreenState extends State<FinanceDashboardScreen> {
  final List<Map<String, dynamic>> menuItems = [
    {
      "title": "Ahorro Automático",
      "subtitle": "Guarda S/5 diarios y gana insignias",
      "amount": "S/ 5.00 por día",
      "icon": LucideIcons.piggyBank,
      "iconColor": Colors.green,
      "glowColor": Colors.purpleAccent.withOpacity(0.3),
      "route": "/automate_save_settings",
    },
    {
      "title": "Reto 30 días",
      "subtitle": "¡Únete al desafío y gana recompensas!",
      "amount": "12 días completados",
      "icon": LucideIcons.target,
      "iconColor": Colors.blue,
      "glowColor": Colors.pinkAccent.withOpacity(0.3),
      "route": "/challenge",
    },
    {
      "title": "Ahorro con Amigas",
      "subtitle": "Ahorren y motivense juntas",
      "amount": "S/ 400 ahorrados",
      "icon": LucideIcons.users,
      "iconColor": Colors.orange,
      "glowColor": Colors.deepPurple.withOpacity(0.3),
      "route": "/save_with_friends",
    },
    {
      "title": "Tu coach financiero",
      "subtitle": "Resuelve dudas y mejora tus hábitos",
      "amount": "Proyecciones basadas en tu historial",
      "icon": LucideIcons.helpCircle,
      "iconColor": Colors.deepPurple,
      "glowColor": Colors.deepPurple.withOpacity(0.3),
      "route": "/chat",
    },
    {
      "title": "Fondo de Emergencia",
      "subtitle": "Accede a microcréditos respaldados",
      "amount": "Hasta S/ 1,000 disponible",
      "icon": LucideIcons.shieldCheck,
      "iconColor": Colors.red,
      "glowColor": Colors.pink.withOpacity(0.3),
      "route": "/emergency-fund",
    },
    {
      "title": "Beneficios Desbloqueados",
      "subtitle": "¡Descuentos en Rappi, Uber y más!",
      "amount": "3 recompensas nuevas",
      "icon": LucideIcons.gift,
      "iconColor": Colors.pink,
      "glowColor": Colors.pinkAccent.withOpacity(0.3),
      "route": "/benefits",
    },
  ];

  void _navigateToRoute(BuildContext context, String? route) {
    if (route != null && route.isNotEmpty) {
      Navigator.pushNamed(context, route);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ruta no disponible')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF5FF),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "Finanzas",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ).animate().fadeIn(duration: 300.ms).slideX(begin: -0.1),
            centerTitle: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: _buildHeader()
                .animate()
                .fadeIn(duration: 400.ms)
                .slideY(begin: 0.1),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _menuItem(menuItems[index])
                  .animate()
                  .fadeIn(delay: (100 * index).ms)
                  .slideX(begin: 0.1),
              childCount: menuItems.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          const Divider(height: 1, thickness: 1, color: Colors.grey),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _headerItem(
                  "Meta mensual", "75%", LucideIcons.barChart3, Colors.blue),
              _headerItem("Racha", "12d", LucideIcons.award, Colors.orange),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, thickness: 1, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            "Ahorros este mes",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          const Text(
            "S/ 150",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerItem(
      String title, String value, IconData icon, Color iconColor) {
    return Column(
      children: [
        Icon(icon, color: iconColor, size: 30),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(color: Colors.black54)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _menuItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: item["glowColor"],
            blurRadius: 5,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: item["glowColor"],
            blurRadius: 10,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: item["iconColor"].withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(item["icon"], color: item["iconColor"], size: 24),
          ),
          title: Text(
            item["title"],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                item["subtitle"],
                style: const TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 4),
              Text(
                item["amount"],
                style: const TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
          onTap: () => _showFeatureDialog(context, item),
        ),
      ),
    );
  }

  void _showFeatureDialog(BuildContext context, Map<String, dynamic> item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 5,
              width: 40,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: item["iconColor"].withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                item["icon"],
                color: item["iconColor"],
                size: 40,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              item["title"],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item["subtitle"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              item["amount"],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  _navigateToRoute(context, item["route"]);
                },
                child: const Text(
                  'CONTINUAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ).animate().slideY(begin: 0.5, end: 0).fadeIn(),
      ),
    );
  }
}
