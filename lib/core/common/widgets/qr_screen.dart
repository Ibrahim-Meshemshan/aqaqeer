// import 'dart:developer';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:vibration/vibration.dart';
//
// import '../config/theme/src/colors.dart';
//
//
// class QrScreen extends StatefulWidget {
//   const QrScreen({super.key});
//
//   @override
//   State<QrScreen> createState() => _QrScreenState();
// }
//
// class _QrScreenState extends State<QrScreen> {
//   Barcode? result;
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   bool flag=true;
//
//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(flex: 4, child: _buildQrView(context)),
//           ElevatedButton(onPressed: () async {await controller?.toggleFlash();}, child: const Text('flash'))
//
//         ],
//       ),
//     );
//   }
//   Widget _buildQrView(BuildContext context) {
//     // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//         MediaQuery.of(context).size.height < 400)
//         ? 200.0
//         : 300.0;
//     // To ensure the Scanner view is properly sizes after rotation
//     // we need to listen for Flutter SizeChanged notification and update controller
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: (controller) {
//         _onQRViewCreated(controller, context);
//       },
//       overlay: QrScannerOverlayShape(
//           borderColor: AppColors.primaryColor,
//           borderRadius: 10,
//           borderLength: 30,
//           borderWidth: 10,
//           cutOutSize: scanArea),
//       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller,BuildContext context) {
//     setState(() {
//       this.controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) async {
//       bool temp=flag;
//       log(scanData.code??'');
//       setState(() {
//         result = scanData;
//         if(result !=null){
//           flag=false;
//         }
//       });
//
//       if(temp){
//         Vibration.vibrate();
//         if(context.mounted) {
//           Navigator.pop(context,result?.code);
//         }
//       }
//     });
//   }
//
//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('no Permission')),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     controller = null;
//     super.dispose();
//   }
// }