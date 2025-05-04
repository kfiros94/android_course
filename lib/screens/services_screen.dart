import 'package:flutter/material.dart';

class Service {
  final String name;
  final String asset;
  const Service(this.name, this.asset);
}

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});
  static const routeName = '/services';

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  // Replace asset paths with your own images
  final _services = const [
    Service('Cleaning', 'assets/images/svc_cleaning.png'),
    Service('Plumber', 'assets/images/svc_plumber.png'),
    Service('Electrician', 'assets/images/svc_electrician.png'),
    Service('Painter', 'assets/images/svc_painter.png'),
    Service('Carpenter', 'assets/images/svc_carpenter.png'),
    Service('Gardener', 'assets/images/svc_gardener.png'),
  ];

  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectedIndex == null
            ? null
            : () {
                // TODO: navigate to next step, pass selected service
                Navigator.pushNamed(context, '/home');
              },
        backgroundColor:
            _selectedIndex == null ? Colors.grey.shade400 : const Color(0xFF3F7DFB),
        child: const Icon(Icons.arrow_forward_ios_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text(
              'Which service do you need?',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemCount: _services.length,
                itemBuilder: (context, index) {
                  final svc = _services[index];
                  final isSelected = _selectedIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFEFF6FF)
                            : const Color(0xFFF5F7FB),
                        borderRadius: BorderRadius.circular(16),
                        border: isSelected
                            ? Border.all(color: const Color(0xFF3F7DFB), width: 2)
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            svc.asset,
                            width: 80, // enlarged icon
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            svc.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}