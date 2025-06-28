// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../config/theme/src/styles.dart';



class NewsTextButton extends StatelessWidget {
  String text;

  NewsTextButton({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final textSpan = TextSpan(
          text: text,
        );
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(maxWidth: constraints.maxWidth);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: CustomTextStyle.bodyMedium(context),
              maxLines: 3,
            ),
            // SizedBox(height: 5,),
            // if (numberOfLines > 3)
            //   GestureDetector(
            //     onTap: (){
            //       showDialog(
            //         context: context,
            //         builder: (BuildContext context) {
            //           return AlertDialog(
            //             title: Text('Full Text'),
            //             scrollable: true,
            //             backgroundColor: Colors.white,
            //             content: Text(
            //               text,
            //               style: TextStyle(
            //                 color: Color(0xff01016d),
            //                 fontSize: 18,
            //               ),
            //               softWrap: true,
            //             ),
            //             actions: [
            //               TextButton(
            //                 onPressed: () {
            //                   Navigator.of(context).pop();
            //                 },
            //                 child: Text(
            //                   'Close',
            //                   style: TextStyle(
            //                     color: Color(0xff01016d),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           );
            //         },
            //       );
            //     },
            //     child: Text(
            //       "قراءةالمزيد ..",
            //       style: CustomTextStyle.bodySmall(
            //         context,
            //         color: AppColors.primaryColor,
            //       ),
            //       textAlign: TextAlign.right,
            //     ),
            //   ),
          ],
        );
      },
    );
  }
}
