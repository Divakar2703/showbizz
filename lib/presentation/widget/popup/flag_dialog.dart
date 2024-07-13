import 'package:flutter/material.dart';
import 'package:showbiz/presentation/constant/constant.dart';
import 'package:showbiz/presentation/constant/text_style.dart';

class InteractWithBizFlagAlert extends StatelessWidget {
  InteractWithBizFlagAlert();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      backgroundColor: gradientTextPurple2.withOpacity(1),
      contentPadding:
          const EdgeInsets.only(top: 0, bottom: 15, right: 20, left: 20),
      content: ListView(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: lightWhiteTextColor,
                  ))
            ],
          ),
          ListView(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [

             FlagWidget(title: "Occupied", tileColor: buttonGreen,),
             FlagWidget(title: "Past", tileColor: Colors.grey,),
             FlagWidget(title: "Available", tileColor: Colors.green,),
             FlagWidget(title: "Pending", tileColor: Colors.amber,),
             FlagWidget(title: "Not Responding", tileColor: Colors.purple,),
             FlagWidget(title: "Scheduled", tileColor: Colors.pink,),
             FlagWidget(title: "Rejected", tileColor: Colors.red,),

            ],
          ),
        ],
      ),
    );
  }
}

class FlagWidget extends StatelessWidget {
  String title;
  Color tileColor;

  FlagWidget({Key? key, required this.title, required this.tileColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundColor: tileColor,
              radius: 13,
            ),
          ),
          Text(
            "$title",
            style: TextStyles.smallerText.copyWith(color: lightWhiteTextColor),
          ),
        ],
      ),
    );
  }
}

