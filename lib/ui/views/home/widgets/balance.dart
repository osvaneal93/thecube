import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BalanceGeneral extends StatelessWidget {
  final String? icon;
  final String numb;
  final String label;
  const BalanceGeneral({Key? key, this.icon, required this.numb, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      height: screenSize.height * .08,
      width: screenSize.width * .33,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon != null ? SvgPicture.asset(icon!) : const SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$numb ",
                  style: const TextStyle(
                      fontFamily: 'regular', fontSize: 15, color: Color(0xff627554), fontWeight: FontWeight.w700)),
              Text(label,
                  style: const TextStyle(
                    fontFamily: 'regular',
                    fontSize: 9,
                    color: Colors.grey,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
