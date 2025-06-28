import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/config/theme/src/styles.dart';
import '../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import '../../../../../../resources/assets.gen.dart';



class BarcodeScreen extends StatefulWidget {
  const BarcodeScreen({super.key});

  @override
  State<BarcodeScreen> createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {

  double? _previousBrightness;

  @override
  void initState() {
    super.initState();
    _setMaxBrightness(); //  The automatic brightness is raised to maximum.
  }

  Future<void> _setMaxBrightness() async {
    try {
      _previousBrightness = await ScreenBrightness().application; // Save current brightness
      await ScreenBrightness().setApplicationScreenBrightness(1.0); // Set to max
    } catch (e) {
      debugPrint("Failed to set brightness: $e");
    }
  }

  @override
  void dispose() {
    _restoreBrightness();
    super.dispose();
  }

  Future<void> _restoreBrightness() async {
    if (_previousBrightness != null) {
      try {
        await ScreenBrightness().setApplicationScreenBrightness(_previousBrightness!); // Restore brightness
      } catch (e) {
        debugPrint("Failed to restore brightness: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset.center,
                        child: Image.asset(
                          color: AppColors.black,
                          Assets.images.aqaqeerScan.path,
                          width: getWidthScreen(context),
                          // height: getHeightScreen(context),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: FadeInDownBig(
                          duration: const Duration(milliseconds: 1000),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 250,
                                height: 250,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.black,
                                ),
                                child: Image.asset(
                                  Assets.images.parCode.path,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

