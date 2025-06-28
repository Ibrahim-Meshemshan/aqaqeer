//
// // ignore_for_file: depend_on_referenced_packages
//
// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'dart:convert';
// import '../../../../../core/common/config/theme/src/colors.dart';
// import '../../../../../core/injection/injection.dart';
// import '../../../domain/entities/login_params.dart';
// import '../state/provider/login_params_provider.dart';
//
// class QRViewLogin extends StatefulWidget{
//   const QRViewLogin({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => _QRViewExampleState();
// }
//
// class _QRViewExampleState extends State<QRViewLogin> {
//   Barcode? result;
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   bool flag=true;
//   late LoginParams params;
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
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider.value(
//       value: locator.get<LoginParamProvider>() ,
//       child: Consumer<LoginParamProvider>(
//         builder: (context, value, child){
//           return
//             Scaffold(
//               body: Column(
//                 children: <Widget>[
//                   Expanded(flex: 4, child: _buildQrView(context)),
//                 ],
//               ),
//             );
//         },
//       ),
//     );
//   }
//
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
//         final resultString= result?.code;
//         //convert string to map
//         Map valueMap=jsonDecode(resultString!);
//         context.read<LoginParamProvider>().setUserName(valueMap['username']);
//         context.read<LoginParamProvider>().setUserToken(valueMap['rememberToken']);
//         // context.read<LoginParamProvider>().setUserToken(valueMap['password']);
//         log('the username is ${context.read<LoginParamProvider>().name} \n'
//             ' the rememberToken is ${context.read<LoginParamProvider>().token} \n'
//             'valueMap ${valueMap.toString()}');
//         if(result !=null){
//           flag=false;
//         }
//       });
//
//       if(temp){
//         Navigator.pop(context);
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
//
// // // ignore_for_file: depend_on_referenced_packages
// //
// // import 'dart:developer';
// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:myigate/core/common/config/lang/app_localizations.dart';
// // import 'package:myigate/core/common/config/theme/src/colors.dart';
// // import 'package:myigate/core/common/helper/app_uitls.dart';
// // import 'package:provider/provider.dart';
// // import 'package:qr_code_scanner/qr_code_scanner.dart';
// // import 'dart:convert';
// // import '../../../../../core/injection/injection.dart';
// // import '../../../domain/entities/login_params.dart';
// // import '../state/provider/login_params_provider.dart';
// //
// // class QRViewLogin extends StatefulWidget {
// //   const QRViewLogin({Key? key}) : super(key: key);
// //
// //   @override
// //   State<StatefulWidget> createState() => _QRViewExampleState();
// // }
// //
// // class _QRViewExampleState extends State<QRViewLogin> {
// //   Barcode? result;
// //   QRViewController? controller;
// //   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
// //   bool flag = true;
// //   late LoginParams params;
// //
// //   // In order to get hot reload to work we need to pause the camera if the platform
// //   // is android, or resume the camera if the platform is iOS.
// //   @override
// //   void reassemble() {
// //     super.reassemble();
// //     if (Platform.isAndroid) {
// //       controller!.pauseCamera();
// //     }
// //     controller!.resumeCamera();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider.value(
// //       value: locator.get<LoginParamProvider>(),
// //       child: Consumer<LoginParamProvider>(
// //         builder: (context, value, child) {
// //           return Scaffold(
// //             body: Column(
// //               children: <Widget>[
// //                 Expanded(flex: 4, child: _buildQrView(context)),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// //
// //   Widget _buildQrView(BuildContext context) {
// //     // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
// //     var scanArea = (MediaQuery.of(context).size.width < 400 ||
// //             MediaQuery.of(context).size.height < 400)
// //         ? 200.0
// //         : 300.0;
// //     // To ensure the Scanner view is properly sizes after rotation
// //     // we need to listen for Flutter SizeChanged notification and update controller
// //     return QRView(
// //       key: qrKey,
// //       onQRViewCreated: (controller) {
// //         _onQRViewCreated(controller, context);
// //       },
// //       overlay: QrScannerOverlayShape(
// //           borderColor: AppColors.primaryColor,
// //           borderRadius: 10,
// //           borderLength: 30,
// //           borderWidth: 10,
// //           cutOutSize: scanArea),
// //       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
// //     );
// //   }
// //
// //   void _onQRViewCreated(QRViewController controller, BuildContext context) {
// //     setState(() {
// //       this.controller = controller;
// //     });
// //
// //     controller.scannedDataStream.listen((scanData) async {
// //       if (!mounted) return;
// //
// //       setState(() {
// //         result = scanData;
// //       });
// //
// //       final resultString = result?.code;
// //       log('Scanned result: $resultString');
// //
// //       if (resultString != null) {
// //         try {
// //           Map<String, dynamic> valueMap = jsonDecode(resultString);
// //
// //           if (valueMap.containsKey('username') &&
// //               valueMap.containsKey('rememberToken')) {
// //             context
// //                 .read<LoginParamProvider>()
// //                 .setUserName(valueMap['username']);
// //             context
// //                 .read<LoginParamProvider>()
// //                 .setUserToken(valueMap['rememberToken']);
// //             log('Username: ${context.read<LoginParamProvider>().name}');
// //             log('Token: ${context.read<LoginParamProvider>().token}');
// //
// //             // Perform navigation after setting the state
// //             if (mounted) {
// //               Navigator.pop(context);
// //             }
// //           } else {
// //             await _handleInvalidQRCode(
// //               context,
// //               ("user_name_not_exist").tr(context),
// //             );
// //           }
// //         } catch (e) {
// //           log('Error parsing JSON: $e');
// //           await _handleInvalidQRCode(
// //             context,
// //             ("invalid_qr_code").tr(context),
// //           );
// //         }
// //       } else {
// //         await _handleInvalidQRCode(context, 'Invalid QR code');
// //       }
// //     });
// //   }
// //
// //   Future<void> _handleInvalidQRCode(
// //       BuildContext context, String message) async {
// //     // Pause the QR code scanner
// //     await controller?.pauseCamera();
// //
// //     // Show snackbar with error message
// //     AppUtils.snackBarError(context: context, message: message);
// //
// //     // Resume the QR code scanner after a short delay
// //     await Future.delayed(Duration(seconds: 3));
// //     await controller?.resumeCamera();
// //   }
// //
// //   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
// //     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
// //     if (!p) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('no Permission')),
// //       );
// //     }
// //   }
// //
// //   @override
// //   void dispose() {
// //     controller?.dispose();
// //     controller = null;
// //     super.dispose();
// //   }
// // }
