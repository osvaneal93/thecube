import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:thecube_test/tools/paths.dart';

class CardItem extends StatelessWidget {
  final int index;
  final images = [
    'https://www.fao.org/fileadmin/user_upload/AGRO_Noticias/img/1_FrijolesNicaragua.jpg',
    'https://elholandespicante.com/wp-content/uploads/2017/02/chiles-jalapeno-asados-para-chipotle.jpeg',
    'https://cdni.russiatoday.com/actualidad/public_images/2022.06/article/62a83b1d59bf5b77c938aa27.jpg',
    'https://am990formosa.com/wp-content/uploads/2019/03/soja-2.jpg'
  ];
  final products = ['Frijoles rojos', 'Chile Jalapeño', 'Arroz Blanco', 'Grano Soya'];
  final times = ['14', '20', '03', '33'];
  CardItem({
    Key? key,
    required this.screenSize,
    required this.index,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
      width: screenSize.width * .5,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 12,
              spreadRadius: 1,
              color: Colors.grey.withOpacity(.4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                images[index],
                              ),
                              fit: BoxFit.cover)),
                      height: screenSize.height * .23,
                    ),
                    Positioned(
                      right: 10,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: SvgPicture.asset(iconsPaths.chart),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(products[index],
                        style: const TextStyle(
                            fontFamily: 'regular',
                            fontSize: 16,
                            color: Color(0xff475569),
                            fontWeight: FontWeight.w900)),
                    Text('Faltan ${times[index]} días',
                        style: const TextStyle(
                            fontFamily: 'regular',
                            fontSize: 12,
                            color: Color(0xff627554),
                            fontWeight: FontWeight.w900)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardInfoItem(
                        screenSize: screenSize, label: 'Retorno', content: '90 días', icon: iconsPaths.calendar),
                    CardInfoItem(
                      screenSize: screenSize,
                      label: 'Rendimiento',
                      content: 'Asegurado 7%',
                      icon: iconsPaths.discount,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardInfoItem(
                        screenSize: screenSize,
                        label: 'Mínimo Inversión',
                        content: '\$10.000',
                        icon: iconsPaths.graphic),
                    CardInfoItem(
                      screenSize: screenSize,
                      label: 'Meta Inversión',
                      content: '\$500.000',
                      icon: iconsPaths.moneySlim,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Percentage(index: index),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(fixedSize: const Size(240, 40), primary: Color(0xff94A16F)),
                  child: const Text('Invertir'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Percentage extends StatelessWidget {
  final int index;
  final invertido = [200000, 200000, 400000, 100000];
  final total = [500000, 500000, 500000, 500000];
  Percentage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
          child: LinearPercentIndicator(
            alignment: MainAxisAlignment.center,
            barRadius: Radius.circular(8),
            width: screenSize.width * .7,
            lineHeight: 8.0,
            percent: (invertido[index] / 500000),
            backgroundColor: Colors.grey,
            progressColor: Color(0xffB08C60),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text('Invertido: ',
                    style: const TextStyle(
                        fontFamily: 'regular', fontSize: 12, color: Color(0xff627554), fontWeight: FontWeight.w100)),
                Text('\$${invertido[index]}',
                    style: const TextStyle(
                        fontFamily: 'regular', fontSize: 13, color: Color(0xff627554), fontWeight: FontWeight.w900)),
              ],
            ),
            Row(
              children: [
                const Text('Faltan: ',
                    style: const TextStyle(
                        fontFamily: 'regular', fontSize: 12, color: Color(0xff627554), fontWeight: FontWeight.w100)),
                Text('\$${total[index] - invertido[index]}',
                    style: const TextStyle(
                        fontFamily: 'regular', fontSize: 13, color: Color(0xff627554), fontWeight: FontWeight.w900)),
              ],
            )
          ],
        )
      ],
    );
  }
}

class CardInfoItem extends StatelessWidget {
  final String label;
  final String content;
  final String icon;

  const CardInfoItem({
    Key? key,
    required this.screenSize,
    required this.label,
    required this.content,
    required this.icon,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: screenSize.height * .07,
      width: screenSize.width * .373,
      color: Colors.white,
      child: Row(
        children: [
          SvgPicture.asset(icon),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                          height: 0.98,
                          fontFamily: 'regular',
                          fontSize: 11,
                          color: Color(0xff627554),
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      content,
                      style: TextStyle(
                          height: 0.98,
                          fontFamily: 'regular',
                          fontSize: 14,
                          color: Color(0xff627554),
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
