import 'package:flutter/material.dart';

/// מסך שירותים – גלילה אופקית בין אייקונים
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  static const routeName = '/services';

  @override
  Widget build(BuildContext context) {
    // נתוני דוגמה – שם ואייקון לכל שירות
    final services = <Map<String, dynamic>>[
      {'label': 'Cloud',     'icon': Icons.cloud_outlined},
      {'label': 'Storage',   'icon': Icons.sd_storage_outlined},
      {'label': 'Camera',    'icon': Icons.photo_camera_outlined},
      {'label': 'Maps',      'icon': Icons.map_outlined},
      {'label': 'Chat',      'icon': Icons.chat_bubble_outline},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Services')),
      body: PageView.builder(
        itemCount: services.length,
        controller: PageController(viewportFraction: .8),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final service = services[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(service['icon'], size: 100, color: Colors.blueAccent),
                  const SizedBox(height: 20),
                  Text(
                    service['label'],
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
