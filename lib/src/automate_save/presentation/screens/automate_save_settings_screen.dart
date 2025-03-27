import 'package:flutter/material.dart';

class AutomateSaveSettingsScreen extends StatefulWidget {
  const AutomateSaveSettingsScreen({super.key});

  @override
  State<AutomateSaveSettingsScreen> createState() =>
      _AutomateSaveSettingsScreenState();
}

class _AutomateSaveSettingsScreenState
    extends State<AutomateSaveSettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _goalController =
      TextEditingController(text: '1000');
  final TextEditingController _dailyController =
      TextEditingController(text: '8');
  String _selectedFrequency = 'Diario';
  bool _useRecommendation = false;

  @override
  void dispose() {
    _goalController.dispose();
    _dailyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configura tu ahorro automático',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Colors.white)),
        backgroundColor: const Color(0xFF9B4DFF),
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRecommendationCard(),
              const SizedBox(height: 24),
              _buildSavingsGoalSection(),
              const SizedBox(height: 24),
              _buildDailyAmountSection(),
              const SizedBox(height: 24),
              _buildFrequencySection(),
              const SizedBox(height: 32),
              _buildStartSavingButton(),
              const SizedBox(height: 12),
              _buildFooterNote(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendationCard() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _useRecommendation = !_useRecommendation;
          if (_useRecommendation) {
            _dailyController.text = '8';
            _goalController.text = '1000';
            _selectedFrequency = 'Diario';
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F1FF),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _useRecommendation
                ? const Color(0xFF9B4DFF)
                : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF9B4DFF).withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lightbulb_outline,
                    color: _useRecommendation
                        ? const Color(0xFF9B4DFF)
                        : Colors.grey,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'RECOMENDACIÓN IA',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF9B4DFF),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              _useRecommendation
                  ? 'Ahorro configurado: S/8 diarios (meta: S/1000)'
                  : 'Basado en tu flujo de ingresos, podrías ahorrar S/ 8 diarios manteniendo un balance saludable para tu negocio.',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _useRecommendation = !_useRecommendation;
                    if (_useRecommendation) {
                      _dailyController.text = '8';
                      _goalController.text = '1000';
                      _selectedFrequency = 'Diario';
                    }
                  });
                },
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: const Color(0xFF9B4DFF).withOpacity(0.1),
                ),
                child: Text(
                  _useRecommendation ? 'Personalizar' : 'Aplicar recomendación',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF9B4DFF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavingsGoalSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Meta de ahorro',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(24),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'S/',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: _goalController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9B4DFF),
                  height: 1,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  hintText: '1000',
                  hintStyle: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9B4DFF),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa una meta';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingresa un número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Divider(
                color: Colors.grey.shade200,
                height: 1,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tiempo estimado',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    _calculateEstimatedTime(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDailyAmountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Monto diario',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(24),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'S/',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: _dailyController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9B4DFF),
                  height: 1,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  hintText: '8',
                  hintStyle: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9B4DFF),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa un monto';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingresa un número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Divider(
                color: Colors.grey.shade200,
                height: 1,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Alcanzarás tu meta en',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    _calculateEstimatedTime(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFrequencySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Frecuencia',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildFrequencyButton('Diario'),
            const SizedBox(width: 12),
            _buildFrequencyButton('Semanal'),
            const SizedBox(width: 12),
            _buildFrequencyButton('Mensual'),
          ],
        ),
      ],
    );
  }

  Widget _buildFrequencyButton(String frequency) {
    final isSelected = _selectedFrequency == frequency;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedFrequency = frequency;
          });
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF9B4DFF) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:
                  isSelected ? const Color(0xFF9B4DFF) : Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              frequency,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStartSavingButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            // Procesar el formulario
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Ahorro automático configurado: S/${_dailyController.text} $_selectedFrequency'),
                backgroundColor: const Color(0xFF9B4DFF),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF9B4DFF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 18),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_arrow_rounded, size: 24),
            SizedBox(width: 8),
            Text(
              'Comenzar ahorro automático',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterNote() {
    final dailyAmount = double.tryParse(_dailyController.text) ?? 0;
    final frequencyText = _selectedFrequency.toLowerCase();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        dailyAmount > 0
            ? 'Yape apartará automáticamente S/ $dailyAmount cada $frequencyText'
            : 'Configura tu plan de ahorro automático',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
          height: 1.4,
        ),
      ),
    );
  }

  String _calculateEstimatedTime() {
    final goal = double.tryParse(_goalController.text) ?? 0;
    final daily = double.tryParse(_dailyController.text) ?? 0;

    if (goal <= 0 || daily <= 0) return '-- días';

    int days = (goal / daily).ceil();

    // Ajustar según frecuencia seleccionada
    if (_selectedFrequency == 'Semanal') {
      days = (days / 7).ceil();
      return '$days semanas';
    } else if (_selectedFrequency == 'Mensual') {
      days = (days / 30).ceil();
      return '$days meses';
    }

    return '$days días';
  }
}
