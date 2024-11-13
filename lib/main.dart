import 'package:flutter/material.dart';
import 'package:tekberapp/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: ProfileScreen(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const name = 'Andrew';
    const studentId = '5026211187';
    const funFact = 'saya aslinya dua orang';
    const profileImageUrl =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyzTWQoCUbRNdiyorem5Qp1zYYhpliR9q0Bw&s';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hai abangkuh'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16.0),
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            SizedBox(height: 16.0),
            Text(
              name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              studentId,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              funFact,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeListPage extends StatelessWidget {
  static const List<Map<String, dynamic>> recipes = [
    {
      'title': 'Telur Dadar',
      'description': 'Telur dadar enak bgt cuy',
      'imageUrl':
          'https://cdn0-production-images-kly.akamaized.net/mkAcKHQQm2Ujwq0LngbV5KHKOp4=/1979x0:4981x4001/500x667/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/2843447/original/098533600_1562138068-shutterstock_1335756413.jpg',
      'ingredients': [
        '2 butir telor',
        'sejumput pisang',
        'sedikit cinta',
        'satu sendok teh madu'
      ],
      'steps': ['lalu masukan royco', 'kocok telor', 'goreng telor']
    }
  ];

  const RecipeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hai bangkuh'),
      ),
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.orange.shade100,
              child: ListTile(
                leading: Image.network(recipes[index]['imageUrl']!,
                    width: 50, height: 50, fit: BoxFit.cover),
                title: Text(
                  recipes[index]['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  recipes[index]['description']!,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RecipeDetailPage(recipe: recipes[index])),
                  );
                },
              ),
            );
          }),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final Map<String, dynamic> recipe;
  const RecipeDetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['title']!),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe['imageUrl']!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              recipe['title']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Bahan bahan',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(
              height: 8,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recipe['ingredients'].length,
                itemBuilder: (context, index) {
                  return Text(
                    '-${recipe['ingredients'][index]}',
                    style: const TextStyle(fontSize: 16),
                  );
                })
          ],
        ),
      ),
    );
  }
}
