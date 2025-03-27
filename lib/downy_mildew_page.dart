import 'package:flutter/material.dart';
import 'dart:io';

class DownyMildewPage extends StatelessWidget {
  final double confidence;
  final File? imagePath;

  const DownyMildewPage({
    super.key,
    required this.confidence,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Downy Mildew'),
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
                    'Disease Identified: Downy Mildew',
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
            _buildInfoSection('About the Disease:', 'Symptoms: It is prevalent in areas of high humidity, especially when summer rains occur regularly. The disease is first seen as yellow angular spots on the upper surface of the leaves. Under conditions of high humidity, whitish powdery growth appears on the lower surface of the leaves.'),
            const SizedBox(height: 10),
            _buildInfoSection('Management:', '• Requires close monitoring of the weather to anticipate rain events at crucial timings and equally close monitoring of the vines for early signs of infections.\n• You can treat downy mildew or powdery mildew by spraying the infected plants with fungicide labeled especially for the type of mildew you are dealing with. Always follow all label instructions and precautions.'),
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
