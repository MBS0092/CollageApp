import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImageSelectionScreen(),
    );
  }
}

class ImageSelectionScreen extends StatefulWidget {
  const ImageSelectionScreen({Key? key}) : super(key: key);

  @override
  _ImageSelectionScreenState createState() => _ImageSelectionScreenState();
}

class _ImageSelectionScreenState extends State<ImageSelectionScreen> {
  List<XFile> selectedImageGroups = [];
  int crossAxisCount = 2;
  bool showInvertedGrid = false; // Added state variable

  Future<void> loadAssets() async {
    List<XFile> resultList = [];
    final ImagePicker picker = ImagePicker();

    try {
      resultList.clear();
      resultList = await picker.pickMultiImage();

      if (!mounted) return;

      setState(() {
        selectedImageGroups.clear();
        selectedImageGroups.addAll(resultList);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void changeCrossAxisCount(int count) {
    setState(() {
      crossAxisCount = count;
      showInvertedGrid =
          false; // Reset to default grid when crossAxisCount changes
    });
  }

  void showInvertedGridPattern() {
    setState(() {
      showInvertedGrid = true;
    });
  }

  double getImageAspectRatio(String imagePath) {
    try {
      final File imageFile = File(imagePath);
      final img.Image image = img.decodeImage(imageFile.readAsBytesSync())!;
      return image.width / image.height;
    } catch (e) {
      if (kDebugMode) {
        print('Error calculating image aspect ratio: $e');
      }
      return 1.0; // Default aspect ratio if there's an error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Selection'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: loadAssets,
            child: const Text("Select Images"),
          ),
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: showInvertedGrid
                ? GridView.custom(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        const QuiltedGridTile(2, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index < selectedImageGroups.length) {
                          return InteractiveViewer(
                            maxScale: 5.0,
                            minScale: 0.01,
                            boundaryMargin:
                                const EdgeInsets.all(double.infinity),
                            child: Image.file(
                              File(selectedImageGroups[index].path),
                              fit: BoxFit.fill,
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                      childCount: selectedImageGroups.length,
                    ),
                  )
                : MasonryGridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    itemCount: selectedImageGroups.length,
                    itemBuilder: (BuildContext context, int index) {
                      double imageAspectRatio =
                          getImageAspectRatio(selectedImageGroups[index].path);
                      return InteractiveViewer(
                        maxScale: 5.0,
                        minScale: 0.01,
                        boundaryMargin: const EdgeInsets.all(double.infinity),
                        child: AspectRatio(
                          aspectRatio: imageAspectRatio,
                          child: Image.file(
                            File(selectedImageGroups[index].path),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () => changeCrossAxisCount(2),
              icon: const Icon(Icons.grid_on),
              color: crossAxisCount == 2 ? Colors.blue : null,
            ),
            label: 'Grid On',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () => changeCrossAxisCount(3),
              icon: const Icon(Icons.grid_view),
              color: crossAxisCount == 3 ? Colors.blue : null,
            ),
            label: 'Grid View',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: showInvertedGridPattern,
              icon: const Icon(Icons.grid_view_sharp),
            ),
            label: 'Inverted',
          ),
        ],
      ),
    );
  }
}


// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:image_picker/image_picker.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: ImageSelectionScreen(),
//     );
//   }
// }

// class ImageSelectionScreen extends StatefulWidget {
//   const ImageSelectionScreen({Key? key}) : super(key: key);

//   @override
//   _ImageSelectionScreenState createState() => _ImageSelectionScreenState();
// }

// class _ImageSelectionScreenState extends State<ImageSelectionScreen> {
//   List<XFile> selectedImageGroups = [];
//   double crossAxisSpacing = 48.0;
//   double mainAxisSpacing = 24.0;

//   Future<void> loadAssets() async {
//     List<XFile> resultList = [];
//     final ImagePicker picker = ImagePicker();

//     try {
//       resultList.clear();
//       resultList = await picker.pickMultiImage();
//       if (!mounted) return;

//       setState(() {
//         selectedImageGroups.clear();
//         selectedImageGroups.addAll(resultList);
//       });
//     } catch (e) {
//       if (kDebugMode) {
//         print(e.toString());
//       }
//     }
//   }

//   void changeSpacing(double count, double counts) {
//     setState(() {
//       crossAxisSpacing = count;
//       mainAxisSpacing = counts;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Selection'),
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: loadAssets,
//             child: const Text("Select Images"),
//           ),
//           Container(
//             height: 400,
//             width: MediaQuery.of(context).size.width,
//             child: GridView.custom(
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: SliverStairedGridDelegate(
//                 crossAxisSpacing: crossAxisSpacing,
//                 mainAxisSpacing: mainAxisSpacing,
//                 startCrossAxisDirectionReversed: true,
//                 pattern: [
//                   const StairedGridTile(0.5, 1),
//                   const StairedGridTile(0.5, 3 / 4),
//                   const StairedGridTile(1.0, 10 / 4),
//                 ],
//               ),
//               childrenDelegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   if (index < selectedImageGroups.length) {
//                     return InteractiveViewer(
//                       maxScale: 5.0,
//                       minScale: 0.01,
//                       boundaryMargin: const EdgeInsets.all(double.infinity),
//                       child: Image.file(
//                         File(selectedImageGroups[index].path),
//                         fit: BoxFit.fill,
//                       ),
//                     );
//                   } else {
//                     return Container(); // Return an empty container for non-existent indices
//                   }
//                 },
//                 childCount: selectedImageGroups.length,
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: () => changeSpacing(48, 24),
//               icon: const Icon(Icons.grid_on),
//               color: Colors.blue,
//             ),
//             label: 'Grid On',
//           ),
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: () => changeSpacing(36, 18),
//               icon: const Icon(Icons.grid_view),
//               color: Colors.blue,
//             ),
//             label: 'Grid View',
//           ),
//           // Add more BottomNavigationBarItem for additional icons
//         ],
//       ),
//     );
//   }
// }

// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:image_picker/image_picker.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: ImageSelectionScreen(),
//     );
//   }
// }

// class ImageSelectionScreen extends StatefulWidget {
//   const ImageSelectionScreen({Key? key}) : super(key: key);

//   @override
//   _ImageSelectionScreenState createState() => _ImageSelectionScreenState();
// }

// class _ImageSelectionScreenState extends State<ImageSelectionScreen> {
//   List<XFile> selectedImageGroups = [];
//   int crossAxisCount = 2;

//   Future<void> loadAssets() async {
//     List<XFile> resultList = [];
//     final ImagePicker picker = ImagePicker();

//     try {
//       resultList.clear();
//       resultList = await picker.pickMultiImage();
//       if (!mounted) return;

//       setState(() {
//         selectedImageGroups.clear();
//         selectedImageGroups.addAll(resultList);
//       });
//     } catch (e) {
//       if (kDebugMode) {
//         print(e.toString());
//       }
//     }
//   }

//   void changeCrossAxisCount(int count) {
//     setState(() {
//       crossAxisCount = count;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Selection'),
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: loadAssets,
//             child: const Text("Select Images"),
//           ),
//           Container(
//             height: 400,
//             width: MediaQuery.of(context).size.width,
//             child: GridView.custom(
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: SliverWovenGridDelegate.count(
//                 crossAxisCount: crossAxisCount,
//                 mainAxisSpacing: 8,
//                 crossAxisSpacing: 8,
//                 pattern: [
//                   const WovenGridTile(2),
//                   const WovenGridTile(
//                     5 / 7,
//                     crossAxisRatio: 0.9,
//                     alignment: AlignmentDirectional.centerEnd,
//                   ),
//                 ],
//               ),
//               childrenDelegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   if (index < selectedImageGroups.length) {
//                     return InteractiveViewer(
//                       maxScale: 5.0,
//                       minScale: 0.01,
//                       boundaryMargin: const EdgeInsets.all(double.infinity),
//                       child: Image.file(
//                         File(selectedImageGroups[index].path),
//                         fit: BoxFit.fill,
//                       ),
//                     );
//                   } else {
//                     return Container(); // Return an empty container for non-existent indices
//                   }
//                 },
//                 childCount: selectedImageGroups.length,
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: () => changeCrossAxisCount(2),
//               icon: const Icon(Icons.grid_on),
//               color: crossAxisCount == 2 ? Colors.blue : null,
//             ),
//             label: 'Grid On',
//           ),
//           BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: () => changeCrossAxisCount(3),
//               icon: const Icon(Icons.grid_view),
//               color: crossAxisCount == 3 ? Colors.blue : null,
//             ),
//             label: 'Grid View',
//           ),
//           // Add more BottomNavigationBarItem for additional icons
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter_image_editor/flutter_image_editor.dart'; // For image editing

// class CollageMaker extends StatefulWidget {
//   @override
//   _CollageMakerState createState() => _CollageMakerState();
// }

// class _CollageMakerState extends State<CollageMaker> {
//   List<XFile> selectedImages = [];
//   int gridCrossAxisCount = 2;
//   double aspectRatio = 1.5;
//   bool isLoading = false; // Track loading state

//   // ... other code

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Collage Maker'),
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: pickImages,
//             child: const Text('Select Images'),
//           ),
//           DropdownButton<int>(
//             value: gridCrossAxisCount,
//             items: [
//               DropdownMenuItem(value: 2, child: Text('2x2')),
//               DropdownMenuItem(value: 3, child: Text('3x3')),
//               // ... more options
//             ],
//             onChanged: (value) => setState(() => gridCrossAxisCount = value!),
//           ),
//           Slider(
//             value: aspectRatio,
//             min: 1.0,
//             max: 4.0,
//             onChanged: (value) => setState(() => aspectRatio = value),
//           ),
//           Expanded(child: buildGridView()),
//         ],
//       ),
//     );
//   }

//   // ... other methods (pickImages, buildGridView, etc.)
// }
