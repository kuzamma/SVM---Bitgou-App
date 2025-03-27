import 'package:flutter/material.dart';
import 'dart:io';

class CercosporaPage extends StatelessWidget {
  final double confidence;
  final File? imagePath;

  const CercosporaPage({
    super.key,
    required this.confidence,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cercospora Leaf Spot'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    'Disease Identified: Cercospora Leaf Spot',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'With an accuracy of ${confidence.toStringAsFixed(2)}%',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (imagePath != null)
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    imagePath!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About the Disease:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Symptoms:\nSmall, circular or irregularly shaped spots appear on the leaves, usually brown in the center with a yellow or reddish-brown border. Under warm and humid conditions, these spots may grow and merge into larger lesions covering most of the leaf surface, causing the leaves to turn yellow or brown, dry up, and fall off prematurely. In some cases, the disease also causes dark, sunken lesions on the fruit, reducing the quality and yield of the crop.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Management:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Clean up debris: At the end of the growing season, thoroughly clean up and dispose of fallen leaves and plant debris.\n'
                    '• Proper Spacing: Ensure plants are spaced adequately for good air circulation. This helps in faster drying of foliage and reduces humidity levels which are conducive to fungal growth.\n'
                    '• Regular Monitoring: Regularly inspect plants for signs of the disease. Early detection and intervention can reduce disease spread and severity.\n'
                    '• Healthy Soil: Ensure the soil is well-draining and enriched with organic matter. Healthy plants are often less susceptible to diseases.\n'
                    '• Water in the Morning: This allows leaves to dry quickly, minimizing the duration of leaf wetness.\n'
                    '• Protective Sprays: Consider using preventive and curative fungicidal sprays just before conditions become favorable for the disease. As always, it is important to follow all label instructions and precautions.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
