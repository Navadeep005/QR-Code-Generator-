import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const QRCodeApp());
}

class QRCodeApp extends StatelessWidget {
  const QRCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Code Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QRCodePage(),
    );
  }
}

class QRCodePage extends StatefulWidget {
  const QRCodePage({super.key});

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  final TextEditingController controller = TextEditingController();

  String qrData = '';

  void generateQR() {
    setState(() {
      qrData = controller.text.trim();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Enter text or URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateQR,
              child: const Text('Generate QR Code'),
            ),
            const SizedBox(height: 30),
            if (qrData.isNotEmpty)
              QrImageView(
                data: qrData,
                size: 250,
              ),
          ],
        ),
      ),
    );
  }
}