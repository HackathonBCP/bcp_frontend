import 'package:flutter/material.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Reto 30 días"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProgressCard(),
            const SizedBox(height: 16),
            _buildTodayChallenge(),
            const SizedBox(height: 16),
            _buildProgressGrid(),
            const SizedBox(height: 16),
            _buildRewards(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 12 / 30,
                  strokeWidth: 8,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation(Colors.purple),
                ),
                const Center(
                  child: Text(
                    "12\ndías",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text("¡Vas increíble! 🔥",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text("Has ahorrado S/ 60 en total"),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _infoItem(Icons.calendar_today, "18", "Días restantes"),
              _infoItem(Icons.local_fire_department, "12", "Racha actual"),
              _infoItem(Icons.emoji_events, "2", "Logros"),
            ],
          )
        ],
      ),
    );
  }

  Widget _infoItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.purple),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildTodayChallenge() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Colors.purple, Colors.pink]),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Reto de hoy",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          const Text("Día 12 de 30", style: TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: const Text("Registrar S/ 5",
                style: TextStyle(color: Colors.purple)),
          )
        ],
      ),
    );
  }

  Widget _buildProgressGrid() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 1.2,
        ),
        itemCount: 30,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: index < 12 ? Colors.purple : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Center(
              child: Text(
                "Día ${index + 1}\n${index < 12 ? '5/5' : ''}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: index < 12 ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRewards() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.local_fire_department, color: Colors.orange),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("7 días seguidos",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text("¡Racha de una semana!"),
            ],
          )
        ],
      ),
    );
  }
}
