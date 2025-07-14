import 'dart:typed_data';
import 'package:flutter/material.dart';

import '../../../../core/common/config/theme/src/colors.dart';

class CapturedImage extends StatefulWidget {
  Uint8List? capturedImage;
   CapturedImage({super.key,this.capturedImage});
  @override
  State<CapturedImage> createState() => _CapturedImageState();
}
class _CapturedImageState extends State<CapturedImage> {
  Uint8List? localCapturedImage;
  @override
  void initState() {
    super.initState();
    localCapturedImage = widget.capturedImage;
  }
  @override
  Widget build(BuildContext context) {
    return localCapturedImage != null ?  Container(
      margin: EdgeInsets.all(8),
      width: 100,
      height: 100,
      // decoration: BoxDecoration(
      //  // color: AppColors.gray.withValues(alpha: 0.2),
      //   border: Border.all(color: Colors.grey),
      //   borderRadius: BorderRadius.circular(15),
      // ),
      child: Stack(
        children: [
          GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (_) => Dialog(
                    backgroundColor: Colors.transparent,
                    child: Stack(
                      children: [
                        InteractiveViewer(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.memory(localCapturedImage!, fit: BoxFit.contain),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withValues(alpha: 0.6),
                              ),
                              padding: const EdgeInsets.all(6),
                              child: const Icon(Icons.close, size: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColors.gray.withValues(alpha: 0.3),
                   // border: Border.all(color: Colors.grey),
                     borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.memory(localCapturedImage!, fit: BoxFit.contain))
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  localCapturedImage = null;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withValues(alpha: 0.5),
                ),
                child: Icon(Icons.close, size: 18, color: Colors.white),
                padding: EdgeInsets.all(4),
              ),
            ),
          ),
        ],
      ),
    ) :SizedBox();
  }
}
