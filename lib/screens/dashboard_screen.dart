// lib/dashboard_screen.dart
//
// Shows a read-only grid of the six services, keeps the back-arrow,
// bottom buttons and “Welcome to <service>” headline.
//

import 'package:flutter/material.dart';
import 'profile.dart';          // profile screen
import 'settings_screen.dart'; // settings screen

// ---------- Data model copied from services_screen ----------
class Service {
  final String name;
  final String asset;
  const Service(this.name, this.asset);
}

// Same six services the user saw on services_screen
const List<Service> _services = [
  Service('Cleaning',     'assets/images/svc_cleaning.png'),
  Service('Plumber',      'assets/images/svc_plumber.png'),
  Service('Electrician',  'assets/images/svc_electrician.png'),
  Service('Painter',      'assets/images/svc_painter.png'),
  Service('Carpenter',    'assets/images/svc_carpenter.png'),
  Service('Gardener',     'assets/images/svc_gardener.png'),
];
// ------------------------------------------------------------

class DashboardScreen extends StatelessWidget {
  final String serviceName;
  const DashboardScreen({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    // width / height of the bottom “pill” buttons
    const double buttonWidth  = 114;
    const double buttonHeight = 48;
    const double buttonFont   = 12;

    final ButtonStyle bottomStyle = ElevatedButton.styleFrom(
      fixedSize: const Size(buttonWidth, buttonHeight),
      shape: const StadiumBorder(),
      backgroundColor: const Color.fromARGB(255, 180, 178, 180),
      textStyle: const TextStyle(fontSize: buttonFont, fontWeight: FontWeight.w600),
    );

    // find which item was chosen on the previous screen so we can highlight it
    final int selectedIndex =
        _services.indexWhere((s) => s.name == serviceName);

    return Scaffold(
      // 1) AppBar – back arrow just pops, so we return to services_screen
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Dashboard'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),

            // 2) Headline
            Text(
              'Welcome to $serviceName',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // 3) Grid of *disabled* service cards
            Expanded(
              child: AbsorbPointer( // disables all taps inside
                absorbing: true,
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
                    final bool isSelected = index == selectedIndex;

                    return Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFEFF6FF) // same colours as services_screen
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
                            width: 80,
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
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 4) Bottom row – Settings / Profile / Home
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SettingsScreen()),
                    );
                  },
                  icon: const Icon(Icons.settings),
                  label: const Text('Settings'),
                  style: bottomStyle,
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProfileScreen()),
                    );
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('Profile'),
                  style: bottomStyle,
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/home'));
                  },
                  icon: const Icon(Icons.home),
                  label: const Text('Home'),
                  style: bottomStyle,
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
