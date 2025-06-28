// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../../core/common/animation/animation_column_widget.dart';
import '../../../../../../core/common/config/lang/state/store_current_lang.dart';
import '../../../../../../core/common/config/theme/src/colors.dart';
import '../../../../../../core/common/widgets/circular_progress/custom_circular_progress.dart';
import '../../../../../../core/common/widgets/decoration/build_gradient_line.dart';
import '../../../../../../core/common/widgets/decoration/topuser_management_section_widget.dart';
import '../../../../../../core/common/widgets/decoration/user_management_background_widget.dart';
import '../../../../../../core/injection/injection.dart';
import '../../state/log_in_bloc.dart';
import '../username_password_login_section.dart';

class LoginScreen extends StatefulWidget {
  final LoginBloc bloc;
  final Object? nameCustomer;

  const LoginScreen({super.key, required this.bloc,required this.nameCustomer});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? lang = locator.get<LanguageStorage>().getCurrentLang();
  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.sizeOf(context).width;
    double heightC = MediaQuery.sizeOf(context).height;
    return UserManagementBackgroundWidget(
      width: widthC,
      height: heightC,
      lang: lang ?? 'ar',
      child: ModalProgressHUD(
        inAsyncCall: widget.bloc.state.logInState.isLoading() ||
            widget.bloc.state.changePasswordState.isLoading(),
        color: AppColors.primaryColor,
        opacity: 0.2,
        progressIndicator: const CustomCircularProgress(),
        child: Scaffold(
          primary: true,
          backgroundColor: AppColors.transparent,
          body: Container(
            height: heightC,
            width: widthC,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            alignment: AlignmentDirectional.center,
            child: SingleChildScrollView(
              child: Form(
                child: AnimationColumnWidget(
                  duration: const Duration(milliseconds: 1000),
                  verticalOffset: 50,
                  children: [
                    const SizedBox(height: 20,),
                    const TopUserManagementSectionWidget(),
                    UsernamePasswordLoginSection(bloc: widget.bloc,nameCustomer: widget.nameCustomer,),
                    const SizedBox(
                      height: 20,
                    ),
                    const GradientLine(),
                    // QrCodeLoginSection(bloc: widget.bloc),
                    // const SizedBox(height: 20,),
                    // // Visibility(
                    //     visible: locator.get<AuthLocal>().getFingerprintRememberToken()!= null,
                    //     child:  Center(child: FingerprintLoginSection(bloc: widget.bloc,)))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}