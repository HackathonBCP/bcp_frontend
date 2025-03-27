import 'package:flutter/material.dart';

class SavingsScreen extends StatelessWidget {
  final double savingsThisMonth = 150;
  final double savingsGoal = 300;
  final double dailySavings = 5.0;
  final int currentStreak = 12;
  final String category = "Educación";

  // Color palette
  static const _accentColor = Color(0xFF7F3DFF);
  static const _lightPurple = Color(0xFFEEE5FF);
  static const _darkText = Color(0xFF212325);
  static const _grayText = Color(0xFF91919F);
  static const _successColor = Color(0xFF00A86B);

  const SavingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = savingsThisMonth / savingsGoal;
    final daysRemaining = DateTime.now().day;
    final dailyTarget = (savingsGoal - savingsThisMonth) / daysRemaining;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryCard(),
            const SizedBox(height: 24),
            _buildProgressSection(progress),
            const SizedBox(height: 24),
            _buildStreakSection(),
            const SizedBox(height: 24),
            _buildDailySavingsSection(dailyTarget),
            const SizedBox(height: 24),
            _buildRewardsSection(),
            const SizedBox(height: 24),
            _buildTipSection(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Ahorro Automático",
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: 20, color: Colors.white)),
      backgroundColor: _accentColor,
      elevation: 0,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline, color: Colors.white),
          onPressed: () {
            // Mostrar información adicional
          },
        ),
      ],
    );
  }

  Widget _buildCategoryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _lightPurple,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _accentColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.category, color: _accentColor, size: 24),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("CATEGORÍA",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _grayText,
                      letterSpacing: 0.5)),
              Text(category,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: _darkText)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection(double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Tu progreso",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, color: _darkText)),
        const SizedBox(height: 16),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 180,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 12,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(_accentColor),
              ),
            ),
            Column(
              children: [
                Text("${(progress * 100).toStringAsFixed(0)}%",
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: _darkText)),
                const Text("completado",
                    style: TextStyle(fontSize: 14, color: _grayText)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildAmountCard("Ahorrado", savingsThisMonth),
            _buildAmountCard("Meta", savingsGoal),
          ],
        ),
      ],
    );
  }

  Widget _buildAmountCard(String label, double amount) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _lightPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(label,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _grayText)),
            const SizedBox(height: 4),
            Text("S/ ${amount.toStringAsFixed(2)}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: _darkText)),
          ],
        ),
      ),
    );
  }

  Widget _buildStreakSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _lightPurple,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _accentColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.local_fire_department,
                color: _accentColor, size: 24),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("RACHA ACTUAL",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _grayText,
                      letterSpacing: 0.5)),
              Text("$currentStreak días",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: _darkText)),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _accentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text("Activa",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildDailySavingsSection(double dailyTarget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Ahorro diario",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, color: _darkText)),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildDailySavingsCard(
                "Actual",
                dailySavings,
                Icons.trending_up,
                _accentColor,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDailySavingsCard(
                "Recomendado",
                dailyTarget,
                Icons.auto_awesome,
                _successColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDailySavingsCard(
      String title, double amount, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(title,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: color)),
            ],
          ),
          const SizedBox(height: 8),
          Text("S/ ${amount.toStringAsFixed(2)}",
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w800, color: _darkText)),
        ],
      ),
    );
  }

  Widget _buildRewardsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Logros y recompensas",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w800, color: _darkText)),
        const SizedBox(height: 16),
        _buildRewardItem(
          "Ahorrador constante",
          "Mantén tu racha por 30 días",
          500,
          Icons.star,
          const Color(0xFFFFD700),
        ),
        const SizedBox(height: 12),
        _buildRewardItem(
          "Meta mensual",
          "Alcanza tu objetivo este mes",
          1000,
          Icons.emoji_events,
          const Color(0xFFC0C0C0),
        ),
      ],
    );
  }

  Widget _buildRewardItem(String title, String description, int points,
      IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: _darkText)),
                Text(description,
                    style: const TextStyle(fontSize: 14, color: _grayText)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text("+$points pts",
                style: const TextStyle(
                    color: _accentColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildTipSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _accentColor.withOpacity(0.8),
            _accentColor,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: _accentColor.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("TIP DEL DÍA",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5)),
          const SizedBox(height: 8),
          const Text(
            "Configura una meta realista y mantén tu ahorro constante. ¡Pequeños pasos llevan a grandes logros!",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.4),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text("Más tips",
                  style: TextStyle(
                      color: _accentColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }
}
