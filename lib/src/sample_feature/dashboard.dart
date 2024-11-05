import 'package:flutter/material.dart';

class AnimalDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard de Animais')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2.5,
          children: [
            _buildDashboardCard(
              title: 'Vacinação',
              icon: Icons.vaccines,
              count: 3,
              description: 'Cães para vacinar na próxima semana',
              color: Colors.orange,
            ),
            _buildDashboardCard(
              title: 'Consultas',
              icon: Icons.medical_services,
              count: 5,
              description: 'Animais com consultas marcadas',
              color: Colors.blue,
            ),
            _buildDashboardCard(
              title: 'Prontos para adoção',
              icon: Icons.pets,
              count: 8,
              description: 'Animais aguardando adoção',
              color: Colors.green,
            ),
            _buildDashboardCard(
              title: 'Alimentação pendente',
              icon: Icons.food_bank,
              count: 4,
              description: 'Animais sem alimentação registrada hoje',
              color: Colors.red,
            ),
            _buildDashboardCard(
              title: 'Medicamentos',
              icon: Icons.medication,
              count: 2,
              description: 'Animais precisam de medicação esta semana',
              color: Colors.purple,
            ),
            _buildDashboardCard(
              title: 'Banho & Higiene',
              icon: Icons.bathtub,
              count: 7,
              description: 'Animais precisam de banho nesta semana',
              color: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard({
    required String title,
    required IconData icon,
    required int count,
    required String description,
    required Color color,
  }) {
    return Card(
      color: color.withOpacity(0.1),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 50, color: color),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: color,
              child: Text(
                '$count',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
