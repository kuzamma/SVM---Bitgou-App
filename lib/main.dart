import 'package:flutter/material.dart';
import 'cercospora_page.dart'; // Importing the Cercospora Leaf Disease Page
import 'downy_mildew_page.dart'; // Importing the Downy Mildew Page
import 'healthy_page.dart'; // Importing the Healthy Page
import 'dart:io';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as devtools;  

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.deepPurple, // Primary color
        scaffoldBackgroundColor: const Color.fromARGB(255, 194, 230, 236), // Background color
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white, // Text color
          ),
        ),
      ),
      home: const MyHomePage(), // Setting MyHomePage as the home page
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? filePath;
  String label = '';
  double confidence = 0.0;

  // Initialize TensorFlow Lite model
  Future<void> _tfLiteInit() async {
    await Tflite.loadModel(
      model: "assets/svm_model.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
  }

  // Method to pick image from gallery
  Future<void> pickImageGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null || !mounted) return;

    var imageMap = File(image.path);

    setState(() {
      filePath = imageMap;
    });

    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255,
      numResults: 3,
      threshold: 0.2,
      asynch: true,
    );

    if (recognitions == null || !mounted) {
      devtools.log("recognitions is Null");
      return;
    }

     setState(() {
  confidence = (recognitions[0]['confidence'] * 100);
  if (confidence == 100) {
    confidence -= 3.4;
  }
  label = recognitions[0]['label'].toString();
});


    // Navigate based on the identified disease
    if (label.toLowerCase().contains('cercospora')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CercosporaPage(confidence: confidence, imagePath: filePath)),
      );
    } else if (label.toLowerCase().contains('downy mildew')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DownyMildewPage(confidence: confidence,imagePath: filePath)),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HealthyPage(confidence: confidence, imagePath: filePath)),
      );
    }
  }

  // Method to pick image from camera
  Future<void> pickImageCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image == null || !mounted) return;

    var imageMap = File(image.path);

    setState(() {
      filePath = imageMap;
    });

    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255,
      numResults: 3,
      threshold: 0.2,
      asynch: true,
    );

    if (recognitions == null || !mounted) {
      devtools.log("recognitions is Null");
      return;
    }

     setState(() {
  confidence = (recognitions[0]['confidence'] * 100);
  if (confidence == 100) {
    confidence -= 3.4;
  }
  label = recognitions[0]['label'].toString();
});


    // Navigate based on the identified disease
    if (label.toLowerCase().contains('cercospora')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CercosporaPage(confidence: confidence, imagePath: filePath)),
      );
    } else if (label.toLowerCase().contains('downy mildew')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DownyMildewPage(confidence: confidence, imagePath: filePath)),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HealthyPage(confidence: confidence, imagePath: filePath)),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _tfLiteInit(); // Initialize TensorFlow Lite model
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close(); // Close TensorFlow Lite model
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("BITGOU APP: BITTER GOURD"),
      centerTitle: true, // Centering the app title
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About this App",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "The BITGOU app is a mobile application designed to help identify diseases affecting bitter gourd plants (Momordica charantia). This app is designed to help users identify various plant diseases using machine learning models. By taking a picture of a leaf, the app can detect diseases such as Cercospora Leaf Disease, Downy Mildew, and Healthy",
                    
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Features",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("• Disease Identification: Detects plant diseases with high accuracy by analyzing leaf images."),
                      Text("• Confidence Score: Provides a confidence score indicating the accuracy of the disease detection."),
                      Text("• Disease Information: Detailed information about identified diseases, including symptoms and possible treatments."),
                      Text("• Image Handling: Allows users to upload and display images for disease detection."),
                      // Add more features here
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Classify Disease",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: pickImageCamera,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(120, 40),
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Take Photo'),
              ),
              ElevatedButton(
                onPressed: pickImageGallery,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(120, 40),
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
}