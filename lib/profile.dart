import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              _buildProfileHeader(),
              _buildFunfacts()
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildProfileHeader() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Material(
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 3.0)),
        elevation: 10,
        child: CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('build/flutter_assets/images/foto.jpg'),
        ),
      ),
      SizedBox(height: 16),
      Text(
        'Andaru Pratama Putra',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8),
      Text(
        '5026211187',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    ],
  );
}

Widget _buildFunfacts() {
  return GridView.count(
    shrinkWrap: true,
    crossAxisCount: 2,
    mainAxisSpacing: 16,
    crossAxisSpacing: 16,
    padding: const EdgeInsets.all(16),
    children: [
      _buildFunfactCard(
        icon: Icons.favorite,
        title: 'Suka tidur',
      ),
      _buildFunfactCard(
          icon: Icons.music_note, title: 'Selera musiknya random'),
      _buildFunfactCard(
        icon: Icons.sports_basketball,
        title: 'Gabisa berenang',
      ),
      _buildFunfactCard(icon: Icons.pets, title: 'Suka kucing'),
    ],
  );
}

Widget _buildFunfactCard({
  required IconData icon,
  required String title,
}) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.teal[400],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    ),
  );
}
