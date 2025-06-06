// lib/resume_screen.dart
import 'package:flutter/material.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar: Back arrow + “Save” (dummy)
      appBar: AppBar(
        title: const Text('Resume'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Dummy Save – replace with real logic if needed
              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(content: Text('Saved (dummy)')),
              // );
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),

      // Body: List of three “PDF” items + two pink buttons at the bottom
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3, // three dummy rows
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.picture_as_pdf,
                    color: Colors.red,
                    size: 32,
                  ),
                  title: const Text(
                    'CV - Kfir Amoyal.pdf',
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: const Text(
                    '/Users/kfira/Library/Developer/...',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  onTap: () {
                    // Dummy tap
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text('Tapped item #$index')),
                    // );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 8),

          // Bottom two pink buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Dummy “Upload from Link”
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Upload from Link'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Dummy “Upload from Device”
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Upload from Device'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
