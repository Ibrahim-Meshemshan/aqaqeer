// import 'package:aqaqeer/feature/root/state/index_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../home/presentation/ui/screens/home_screen.dart';
// import '../profile/presentaion/ui/screen/profile_screen.dart';
// import '../services/presentation/ui/screen/services_screen.dart';
//
// class BodyRoot extends StatelessWidget {
//   const BodyRoot({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<IndexBloc, int>(
//       builder: (context, currentIndex) {
//         IndexBloc indexBloc = BlocProvider.of<IndexBloc>(context);
//         return PageView(
//           controller: indexBloc.pageController,
//           scrollBehavior: const ScrollBehavior(),
//           physics: const NeverScrollableScrollPhysics(),
//           children: const [
//             HomeScreen(),
//             ServicesScreen(),
//             ProfileScreen(),
//           ],
//         );
//       },
//     );
//   }
// }
