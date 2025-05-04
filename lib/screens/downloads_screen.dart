import 'dart:async';
import 'package:flutter/material.dart';

/// מודל מצב הורדה
enum DownloadStatus { idle, downloading, done }

class DownloadItem {
  DownloadItem(this.title);
  final String title;
  double progress = 0; // 0‑1
  DownloadStatus status = DownloadStatus.idle;
}

/// מסך הורדות – מציג רשימת אפליקציות להורדה
class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});
  static const routeName = '/downloads';

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  final List<DownloadItem> _items = List.generate(
    6,
    (i) => DownloadItem('Awesome App #${i + 1}'),
  );

  /// מפעיל הורדה מדומה עם עדכון התקדמות
  void _startDownload(DownloadItem item) {
    if (item.status == DownloadStatus.downloading || item.status == DownloadStatus.done) return;

    setState(() {
      item.status = DownloadStatus.downloading;
      item.progress = 0;
    });

    const totalMillis = 4 * 1000; // 4 שניות להדגמה
    const tick = 200; // ms
    int elapsed = 0;

    Timer.periodic(const Duration(milliseconds: tick), (timer) {
      elapsed += tick;
      final p = (elapsed / totalMillis).clamp(0.0, 1.0);
      setState(() => item.progress = p);
      if (elapsed >= totalMillis) {
        timer.cancel();
        setState(() => item.status = DownloadStatus.done);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Downloads')),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        itemCount: _items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = _items[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  // --- Icon
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.apps, size: 28, color: Colors.blue),
                  ),
                  const SizedBox(width: 16),
                  // --- Title & progress
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 6),
                        if (item.status == DownloadStatus.downloading)
                          LinearProgressIndicator(value: item.progress)
                        else if (item.status == DownloadStatus.done)
                          const Text('Downloaded', style: TextStyle(color: Colors.green))
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // --- Action button
                  ElevatedButton(
                    onPressed: item.status == DownloadStatus.idle ? () => _startDownload(item) : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (item.status == DownloadStatus.done)
                          ? Colors.green
                          : const Color(0xFF3F7DFB),
                      minimumSize: const Size(100, 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text(
                      item.status == DownloadStatus.done
                          ? 'Open'
                          : item.status == DownloadStatus.downloading
                              ? '...' // disabled state
                              : 'Download',
                    ),
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
