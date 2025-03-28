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
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _percentageController = TextEditingController();
  String _selectedFrequency = 'Diario';
  bool _useRecommendation = true;
  bool _isManualPercentage = false;
  String? _selectedCategory;
  final List<String> _defaultCategories = [
    'Vacaciones',
    'Emergencias',
    'Educación',
    'Otros'
  ];
  final List<String> _customCategories = [];
  final double _maxRecommendedPercentage = 5.0;

  @override
  void initState() {
    super.initState();
    _calculateRecommendedPercentage();
  }

  @override
  void dispose() {
    _goalController.dispose();
    _categoryController.dispose();
    _percentageController.dispose();
    super.dispose();
  }

  void _calculateRecommendedPercentage() {
    final randomPercentage =
        (DateTime.now().millisecond % 100) / 100 * _maxRecommendedPercentage;

    setState(() {
      if (!_isManualPercentage) {
        _percentageController.text = randomPercentage.toStringAsFixed(2);
      }
    });
  }

  void _deleteCategory(String category) {
    if (_customCategories.contains(category)) {
      setState(() {
        _customCategories.remove(category);
        if (_selectedCategory == category) {
          _selectedCategory = _defaultCategories.isNotEmpty
              ? _defaultCategories.first
              : (_customCategories.isNotEmpty ? _customCategories.first : null);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final allCategories = [..._defaultCategories, ..._customCategories];

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
              _buildCategorySection(allCategories),
              const SizedBox(height: 24),
              _buildSavingsGoalSection(),
              const SizedBox(height: 24),
              _buildPercentageSection(),
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
          _isManualPercentage = !_useRecommendation;
          if (_useRecommendation) {
            _calculateRecommendedPercentage();
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
                  ? 'Basado en tu historial, te recomendamos ahorrar entre 0% y ${_maxRecommendedPercentage.toStringAsFixed(0)}% de tus ingresos'
                  : 'Estás configurando manualmente tu ahorro',
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
                    _isManualPercentage = !_useRecommendation;
                    if (_useRecommendation) {
                      _calculateRecommendedPercentage();
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
                  _useRecommendation ? 'Personalizar' : 'Usar recomendación IA',
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

  Widget _buildCategorySection(List<String> allCategories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categoría de ahorro',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              value: _selectedCategory,
              isExpanded: true,
              items: [
                ...allCategories.map((category) => DropdownMenuItem(
                      value: category,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              category,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (_customCategories.contains(category))
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  size: 18, color: Colors.red),
                              onPressed: () => _deleteCategory(category),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                        ],
                      ),
                    )),
                const DropdownMenuItem(
                  value: 'Nueva categoría',
                  child: Text('Crear nueva categoría'),
                ),
              ],
              onChanged: (value) {
                if (value == 'Nueva categoría') {
                  _showNewCategoryDialog();
                } else if (value != null) {
                  setState(() {
                    _selectedCategory = value;
                  });
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                hintText: 'Selecciona una categoría',
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value == 'Nueva categoría') {
                  return 'Selecciona una categoría válida';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  void _showNewCategoryDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Nueva categoría'),
          content: TextField(
            controller: _categoryController,
            decoration: const InputDecoration(
              labelText: 'Nombre de la categoría',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_categoryController.text.trim().isNotEmpty) {
                  setState(() {
                    _customCategories.add(_categoryController.text.trim());
                    _selectedCategory = _categoryController.text.trim();
                    _categoryController.clear();
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
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
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'S/',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: _goalController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9B4DFF),
                    height: 1.5,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '1000',
                    hintStyle: TextStyle(
                      fontSize: 24,
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
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPercentageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Porcentaje a ahorrar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
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
              Expanded(
                child: TextFormField(
                  controller: _percentageController,
                  keyboardType: TextInputType.number,
                  enabled: _isManualPercentage,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9B4DFF),
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '0',
                    suffixText: '%',
                    suffixStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.black54,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa un porcentaje';
                    }
                    final percentage = double.tryParse(value);
                    if (percentage == null) {
                      return 'Ingresa un número válido';
                    }
                    if (percentage < 0 ||
                        percentage > _maxRecommendedPercentage) {
                      return 'Debe ser entre 0% y $_maxRecommendedPercentage%';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
        if (_useRecommendation)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Recomendación: 0% - ${_maxRecommendedPercentage.toStringAsFixed(0)}%',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
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
        const SizedBox(height: 16),
        Text(
          _getEstimatedTimeText(),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
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

  String _getEstimatedTimeText() {
    final goal = double.tryParse(_goalController.text) ?? 0;
    final percentage = double.tryParse(_percentageController.text) ?? 0;

    if (goal <= 0 || percentage <= 0) {
      return 'Ingresa meta y porcentaje para ver estimación';
    }

    const monthlyIncome = 1000;
    final monthlySaving = monthlyIncome * percentage / 100;

    if (monthlySaving <= 0) return 'El porcentaje debe ser mayor a 0%';

    double totalMonths = goal / monthlySaving;
    double totalDays = totalMonths * 30;

    if (_selectedFrequency == 'Diario') {
      totalDays = goal / (monthlySaving / 30);
    } else if (_selectedFrequency == 'Semanal') {
      totalDays = goal / (monthlySaving / 4) * 7;
    }

    if (totalDays >= 365) {
      return 'Alcanzarás tu meta en aproximadamente ${(totalDays / 365).toStringAsFixed(1)} años';
    } else if (totalDays >= 30) {
      return 'Alcanzarás tu meta en aproximadamente ${(totalDays / 30).toStringAsFixed(1)} meses';
    } else if (totalDays >= 7) {
      return 'Alcanzarás tu meta en aproximadamente ${(totalDays / 7).toStringAsFixed(1)} semanas';
    } else {
      return 'Alcanzarás tu meta en aproximadamente ${totalDays.toStringAsFixed(1)} días';
    }
  }

  Widget _buildStartSavingButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            Navigator.pushNamed(context, '/automate_save_view');
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
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/automate_save_view');
        },
        child: const Text(
          'Ver mis categorías de ahorro',
          style: TextStyle(
            color: Color(0xFF9B4DFF),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
