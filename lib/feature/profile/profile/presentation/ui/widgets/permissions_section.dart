import 'dart:developer';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/function/get_width_height_screen.dart';
import '../../../../../../core/common/widgets/buttons/custom_button.dart';
import '../../../../../../core/common/widgets/custom_texts/custom_text.dart';
import 'package:aqaqeer/core/l10n/localizations/app_localizationsNew.dart';


class PermissionsSection extends StatefulWidget {
  @override
  _PermissionsSectionState createState() => _PermissionsSectionState();
}

class _PermissionsSectionState extends State<PermissionsSection> {
  Map<Permission, String> permissions = {};

  Map<Permission, PermissionStatus> statuses = {};

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkPermissions(); // Refresh state when returning to the screen
  }

  Future<void> _checkPermissions() async {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    final sdkInt = androidInfo.version.sdkInt;

    if (Platform.isAndroid) {
      // final deviceInfo = DeviceInfoPlugin();
      // final androidInfo = await deviceInfo.androidInfo;
      // final sdkInt = androidInfo.version.sdkInt;

      permissions = sdkInt >= 33
          ? {
        Permission.photos: AppLocalizations.of(context)!.allow_media_access,
        Permission.notification: AppLocalizations.of(context)!.allow_notifications,
      }
          : {
        Permission.storage: AppLocalizations.of(context)!.allow_media_access,
        Permission.notification: AppLocalizations.of(context)!.allow_notifications,
      };
    } else if (Platform.isIOS) {
      permissions = {
        Permission.storage: AppLocalizations.of(context)!.allow_media_access,
        Permission.notification: AppLocalizations.of(context)!.allow_notifications,
      };
      log('ios permissions ${permissions}');
    }

    final results = await Future.wait(
      permissions.keys.map((perm) => perm.status),
    );

    if (mounted) {
      setState(() {
        statuses = Map.fromIterables(permissions.keys, results);
      });
    }
  }

  void _openAppSettings() async {
    await openAppSettings();
    await Future.delayed(
        Duration(seconds: 1)); // Small delay to allow navigation
    _checkPermissions(); // Refresh state after returning
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: permissions.isEmpty
          ? CustomText(
        text: AppLocalizations.of(context)!.no_permissions_required,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: ListView(
              shrinkWrap: true,
              children: permissions.keys.map((permission) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final status = await permission.request();
                        setState(() {
                          statuses[permission] = status;
                        });
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        trailing: Icon(
                          statuses[permission] == PermissionStatus.granted
                              ? Icons.check_circle
                              : Icons.error_outline,
                          color: statuses[permission] ==
                              PermissionStatus.granted
                              ? Colors.green
                              : Colors.red,
                        ),
                        title: Text(permissions[permission] ?? ''),
                        subtitle: Text(
                            statuses[permission]
                                ?.toString()
                                .split('.')
                                .last ==
                                AppLocalizations.of(context)!.manage_permissions
                                ? AppLocalizations.of(context)!.permission_granted
                                : AppLocalizations.of(context)!.no_permissions_required
                        ),
                      ),
                    ),
                    Divider()
                  ],
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: CustomButton(
              onPressed: _openAppSettings,
              child: Text(
                AppLocalizations.of(context)!.manage_permissions,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              backgroundColor: AppColors.white,
              borderColor: Colors.black54,
              borderRadius: BorderRadius.circular(8),
              elevation: 0,
              height: 60,
              width: getWidthScreen(context) - 100,
            ),
          ),
        ],
      ),
    );
  }
}



