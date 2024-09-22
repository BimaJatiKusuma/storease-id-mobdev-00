// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class VrDisplayArtStep extends StatefulWidget {
//   const VrDisplayArtStep({super.key});

//   @override
//   State<VrDisplayArtStep> createState() => _VrDisplayArtStepState();
// }

// class _VrDisplayArtStepState extends State<VrDisplayArtStep> {
//   late WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//     // For Android WebView hybrid composition
//     WebView.platform = SurfaceAndroidWebView();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("VR Display"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: () {
//               _controller.reload();  // Reload the WebView on button press
//             },
//           ),
//         ],
//       ),
//       body: WebView(
//         initialUrl: 'https://example.com',  // URL to display (replace with your VR content URL)
//         javascriptMode: JavascriptMode.unrestricted,  // Enable JavaScript
//         onWebViewCreated: (WebViewController webViewController) {
//           _controller = webViewController;  // Store the controller
//         },
//       ),
//     );
//   }
// }
