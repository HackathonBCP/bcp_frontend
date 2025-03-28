import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FinanceDashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      "title": "Ahorro Automático",
      "subtitle": "Guarda S/5 diarios y gana insignias",
      "amount": "S/ 5.00 por día",
      "icon": LucideIcons.piggyBank,
    },
    {
      "title": "Reto 30 días",
      "subtitle": "¡Únete al desafío y gana recompensas!",
      "amount": "12 días completados",
      "icon": LucideIcons.target,
    },
    {
      "title": "Ahorro por Ingresos",
      "subtitle": "Guarda un % de tus Yapeos",
      "amount": "10% por ingreso",
      "icon": LucideIcons.trendingUp,
    },
    {
      "title": "Reto 10 soles",
      "subtitle": "¡Completa el desafío semanal!",
      "amount": "S/ 40 ahorrados",
      "icon": LucideIcons.trophy,
    },
    {
      "title": "Fondo de Emergencia",
      "subtitle": "Accede a microcréditos respaldados",
      "amount": "Hasta S/ 1,000 disponible",
      "icon": LucideIcons.shieldCheck,
    },
    {
      "title": "Beneficios Desbloqueados",
      "subtitle": "¡Descuentos en Rappi, Uber y más!",
      "amount": "3 recompensas nuevas",
      "icon": LucideIcons.gift,
    },
  ];

  FinanceDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Finanzas",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return _menuItem(menuItems[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade100, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _headerItem("Meta mensual", "75%", LucideIcons.bold),
              _headerItem("Racha", "12d", LucideIcons.award),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Ahorros este mes",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 5),
          const Text(
            "S/ 150",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerItem(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.purple, size: 30),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(color: Colors.grey)),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.purple,
          ),
        ),
      ],
    );
  }

  Widget _menuItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade50, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 6)],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.purple.shade100,
            shape: BoxShape.circle,
          ),
          child: Icon(item["icon"], color: Colors.purple, size: 28),
        ),
        title: Text(
          item["title"],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item["subtitle"], style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 5),
            Text(
              item["amount"],
              style: const TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
      ),
    );
  }
}
