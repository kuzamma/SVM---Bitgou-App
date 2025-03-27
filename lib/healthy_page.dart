import 'package:flutter/material.dart';
import 'dart:io';

class HealthyPage extends StatelessWidget {
  final double confidence;
  final File? imagePath;

  const HealthyPage({
    super.key,
    required this.confidence,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Healthy '),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const Text(
                    'No Disease Detected: Healthy ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'With an accuracy of: ${confidence.toStringAsFixed(2)}%',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (imagePath != null)
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Image.file(
                  imagePath!,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 10),
            _buildInfoSection('Plant Care Tips:', '• Regularly inspect your plants for any early signs of disease.\n• Ensure your plants are well-watered, but avoid overwatering.\n• Provide adequate sunlight and maintain proper spacing between plants.\n• Use high-quality soil and consider regular fertilization.\n• Prune plants to remove dead or diseased parts and promote healthy growth.'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, String content) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(content),
        ],
      ),
    );
  }
}
