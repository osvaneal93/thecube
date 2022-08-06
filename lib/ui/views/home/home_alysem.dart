import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thecube_test/tools/paths.dart';
import 'package:thecube_test/ui/views/home/widgets/balance.dart';
import 'package:thecube_test/ui/views/home/widgets/carditem.dart';

class HomeAlysem extends StatelessWidget {
  const HomeAlysem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey.withOpacity(.15),
        leading: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(iconsPaths.iconSearch, height: screenSize.height * .03),
          ],
        ),
        actions: [
          SvgPicture.asset(iconsPaths.notification, height: screenSize.height * .03),
          const SizedBox(
            width: 20,
          )
        ],
        centerTitle: true,
        title: SvgPicture.asset(imagePaths.logo),
        backgroundColor: Colors.white,
        toolbarHeight: screenSize.height * .07,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset(iconsPaths.profile), label: ''),
          const BottomNavigationBarItem(icon: Icon(Icons.restart_alt, color: Colors.grey,size: 30), label: ''),
          BottomNavigationBarItem(icon: Image.asset(imagePaths.alisemIcon), label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset(iconsPaths.graphic, color: Colors.grey, height: 25), label: ''),
          BottomNavigationBarItem(icon: SvgPicture.asset(iconsPaths.wallet), label: ''),
        ],
        currentIndex: 2,
      ),
      body: Column(
        children: [
          Row(
            children: [
              BalanceGeneral(icon: iconsPaths.wallet, label: 'Balance general', numb: '\$29.000'),
              Container(
                height: screenSize.height * .055,
                width: 1,
                color: Colors.grey,
              ),
              BalanceGeneral(icon: iconsPaths.money, label: 'Retorno Inversión', numb: '\$90.000'),
              Container(
                height: screenSize.height * .055,
                width: 1,
                color: Colors.grey,
              ),
              BalanceGeneral(label: 'Inversiones activas', numb: '6'),
            ],
          ),
          Container(
            height: 2,
            width: screenSize.width * .9,
            color: Colors.grey.withOpacity(.4),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: const [
                        Text(" Oportunidades de inversión",
                            style: TextStyle(
                                fontFamily: 'regular',
                                fontSize: 15,
                                color: Color(0xff929292),
                                fontWeight: FontWeight.w900)),
                        Spacer(),
                        InkWell(
                          child: Text(" Ver todas",
                              style: TextStyle(
                                  fontFamily: 'regular',
                                  fontSize: 12,
                                  color: Color(0xff94A16F),
                                  fontWeight: FontWeight.w900)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .60,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: PageController(viewportFraction: .8),
                      itemCount: 4,
                      itemBuilder: (context, index) => CardItem(screenSize: screenSize, index: index),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: const [
                        Text("Más Inversiones",
                            style: TextStyle(
                                fontFamily: 'regular',
                                fontSize: 15,
                                color: Color(0xff929292),
                                fontWeight: FontWeight.w900)),
                        Spacer(),
                        InkWell(
                          child: Text(" Ver todas",
                              style: TextStyle(
                                  fontFamily: 'regular',
                                  fontSize: 12,
                                  color: Color(0xff94A16F),
                                  fontWeight: FontWeight.w900)),
                        ),
                      ],
                    ),
                  ),
                  Column(
                      children: List.generate(
                          5,
                          (index) =>
                              Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: ListItem(index: index))))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final products = ['Frijoles rojos E', 'Frijoles Blancos', 'Otras proteínas', 'Otras proteínas', 'Otras proteínas'];
  final images = [imagePaths.frijolesR, imagePaths.frijolesB, imagePaths.varios, imagePaths.varios, imagePaths.varios];
  final initDate = ['02/08/22', '03/08/2022', '04/08/2022', '04/08/2022', '04/08/2022'];
  final finish = ['02/12/22', '03/12/2022', '04/12/2022', '04/12/2022', '04/12/2022'];
  final rendim = ['7.3%', '8.5%', '5.8%', '5.8%', '5.8%'];
  final invertido = ['21.500', '23.123', '21.000', '14.125', '16.456'];
  final int index;
  ListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
      height: screenSize.height * .11,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 2,
          spreadRadius: 2,
          color: Colors.grey.withOpacity(.2),
        ),
      ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: screenSize.height * .1,
            width: screenSize.height * .08,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(images[index]), fit: BoxFit.contain),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(products[index],
                          style: TextStyle(
                              fontFamily: 'regular',
                              fontSize: 15,
                              color: Color.fromARGB(255, 84, 83, 83),
                              fontWeight: FontWeight.w900)),
                      Spacer(),
                      InkWell(
                        child: Text("Asegurado",
                            style: TextStyle(
                                fontFamily: 'regular',
                                fontSize: 12,
                                color: Color(0xff94A16F),
                                fontWeight: FontWeight.w900)),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.grey.withOpacity(.4),
                    height: 1,
                    width: screenSize.width * .72,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenSize.height * .15,
                        child: Column(children: [
                          Row(
                            children: [
                              Text('Inicio: ',
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 9,
                                      color: Color(0xffB08C60),
                                      fontWeight: FontWeight.w900)
                                  //
                                  ),
                              Text(initDate[index],
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 12,
                                      color: Color(0xff94A16F),
                                      fontWeight: FontWeight.w900))
                            ],
                          ),
                          Row(
                            children: [
                              Text('Finaliza:',
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 9,
                                      color: Color(0xffB08C60),
                                      fontWeight: FontWeight.w900)),
                              Text(finish[index],
                                  style: TextStyle(
                                      fontFamily: 'regular',
                                      fontSize: 12,
                                      color: Color(0xff94A16F),
                                      fontWeight: FontWeight.w900))
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(
                        width: screenSize.height * .085,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text('Rendimiento',
                              style: TextStyle(
                                  fontFamily: 'regular',
                                  fontSize: 9,
                                  color: Color(0xffB08C60),
                                  fontWeight: FontWeight.w900)),
                          Text(rendim[index],
                              style: TextStyle(
                                  fontFamily: 'regular',
                                  fontSize: 12,
                                  color: Color(0xff94A16F),
                                  fontWeight: FontWeight.w900)),
                        ]),
                      ),
                      SizedBox(
                        width: screenSize.height * .09,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                          Text('Invertido',
                              style: TextStyle(
                                  fontFamily: 'regular',
                                  fontSize: 9,
                                  color: Color(0xffB08C60),
                                  fontWeight: FontWeight.w900)),
                          Text('\$${invertido[index]}',
                              style: TextStyle(
                                  fontFamily: 'regular',
                                  fontSize: 12,
                                  color: Color(0xff94A16F),
                                  fontWeight: FontWeight.w900)),
                        ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
