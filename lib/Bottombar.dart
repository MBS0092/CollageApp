import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  // final int selectedIndex;
  // final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    Key? key,
    //required this.selectedIndex,
    //required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Camera',
        ),
        // Add more items as needed
      ],
      // currentIndex: selectedIndex,
      // onTap: onItemTapped,
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
//           Expanded(
//             child: MasonryGridView.count(
//               crossAxisCount: 2,
//               itemCount: selectedImageGroups.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Image.file(
//                   File(selectedImageGroups[index].path),
//                   fit: BoxFit.fill,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyResizableBox(),
//     );
//   }
// }

// class MyResizableBox extends StatefulWidget {
//   @override
//   _MyResizableBoxState createState() => _MyResizableBoxState();
// }

// class _MyResizableBoxState extends State<MyResizableBox> {
//   double boxWidth1 = 100.0;
//   double boxHeight1 = 100.0;

//   double boxWidth2 = 100.0;
//   double boxHeight2 = 100.0;

//   double boxWidth3 = 100.0;
//   double boxHeight3 = 100.0;

//   double boxWidth4 = 100.0;
//   double boxHeight4 = 100.0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Resizable Boxes'),
//       ),
//       body: Column(
//         children: [
//           // First row with one box
//           Row(
//             children: [
//               ResizableBox(
//                 width: boxWidth1,
//                 height: boxHeight1,
//                 onResize: (width, height) {
//                   setState(() {
//                     boxWidth1 = width;
//                     boxHeight1 = height;
//                   });
//                 },
//               ),
//               SizedBox(width: 16),
//               ResizableBox(
//                 width: boxWidth4,
//                 height: boxHeight4,
//                 onResize: (width, height) {
//                   setState(() {
//                     boxWidth4 = width;
//                     boxHeight4 = height;
//                   });
//                 },
//               ),
//             ],
//           ),
//           SizedBox(height: 16),
//           // Second row with two boxes in a column
//           Row(
//             children: [
//               // First box in the column
//               ResizableBox(
//                 width: boxWidth2,
//                 height: boxHeight2,
//                 onResize: (width, height) {
//                   setState(() {
//                     boxWidth2 = width;
//                     boxHeight2 = height;
//                   });
//                 },
//               ),
//               SizedBox(width: 16),
//               // Second box in the column
//               ResizableBox(
//                 width: boxWidth3,
//                 height: boxHeight3,
//                 onResize: (width, height) {
//                   setState(() {
//                     boxWidth3 = width;
//                     boxHeight3 = height;
//                   });
//                 },
//               ),
//             ],
//           ),
//           // Third row with one box
//         ],
//       ),
//     );
//   }
// }

// class ResizableBox extends StatelessWidget {
//   final double width;
//   final double height;
//   final Function(double, double) onResize;

//   ResizableBox({
//     required this.width,
//     required this.height,
//     required this.onResize,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onPanUpdate: (details) {
//         onResize(width + details.delta.dx, height + details.delta.dy);
//       },
//       child: Container(
//         width: width,
//         height: height,
//         color: Colors.blue,
//         child: const Center(
//           child: Text(
//             'Resize me!',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
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
//   List<_ResizableImageState> imageStates = [];

//   Future<void> loadAssets() async {
//     List<XFile> resultList = [];
//     final ImagePicker picker = ImagePicker();

//     try {
//       resultList.clear();
//       resultList = await picker.pickMultiImage();
//       if (!mounted) return;

//       setState(() {
//         // Clear existing groups and create new groups based on the number of selected images
//         selectedImageGroups.clear();
//         imageStates.clear();

//         for (int i = 0; i < resultList.length; i++) {
//           selectedImageGroups.add(resultList[i]);
//           imageStates.add(_ResizableImageState());
//         }
//       });
//     } catch (e) {
//       if (kDebugMode) {
//         print(e.toString());
//       }
//     }
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
//           Expanded(
//             child: MasonryGridView.count(
//               crossAxisCount: 2,
//               mainAxisSpacing: 4,
//               crossAxisSpacing: 4,
//               itemCount: selectedImageGroups.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ResizableImage(
//                   imageFile: File(selectedImageGroups[index].path),
//                   resizableImageState: imageStates[index],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ResizableImage extends StatelessWidget {
//   final File imageFile;
//   final _ResizableImageState resizableImageState;

//   ResizableImage({
//     required this.imageFile,
//     required this.resizableImageState,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onPanUpdate: (details) {
//         if (resizableImageState != null) {
//           resizableImageState.updateSize(details.primaryDelta!);
//         }
//       },
//       child: Stack(
//         children: [
//           Container(
//             width: resizableImageState.boxWidth,
//             height: resizableImageState.boxHeight,
//             child: Image.file(
//               imageFile,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ResizableImageState {
//   double boxWidth = 100.0;
//   double boxHeight = 100.0;

//   void updateSize(double delta) {
//     boxWidth += delta;
//     boxHeight += delta;
//   }
// }

// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:image_picker/image_picker.dart';

// import 'Bottombar.dart';

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
//   int _selectedIndex = 0; // Index for the selected tab in bottom navigation bar

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

//   @override
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
//           Expanded(
//             child: GridView.custom(
//               gridDelegate: SliverStairedGridDelegate(
//                 crossAxisSpacing: 40,
//                 mainAxisSpacing: 20,
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
//                     return Image.file(
//                       File(selectedImageGroups[index].path),
//                       fit: BoxFit.fill,
//                     );
//                   } else {
//                     return const SizedBox(); // Return an empty widget if index is out of bounds
//                   }
//                 },
//                 childCount: selectedImageGroups.length,
//               ),
//             ),
//           ),
//           const BottomNavBar()
//         ],
//       ),
//     );
//   }
// }