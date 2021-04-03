import 'package:coffeapp/controller/CoffesController.dart';
import 'package:coffeapp/ui/coffe.dart';
import 'package:coffeapp/ui/widgets/TitleAndPrice.dart';
import 'package:coffeapp/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class ListCoffe extends StatelessWidget {
  const ListCoffe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SwiperController swiperController = SwiperController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: height,
        child: Stack(
          children: [
            GetBuilder<CoffesController>(
              init: CoffesController(),
              initState: (_) {},
              builder: (_) {
                if (_.list != null && _.list.length > 0) {
                  return Obx(() {
                    if (_.index.value != 0) {
                      swiperController.move(_.index.value, animation: true);
                    } else if (_.index.value == 0) {
                      _.hide.value = false;
                    }
                    return AnimatedContainer(
                        duration: Duration(seconds: 1),
                        decoration: buildBoxDecoration(_.index.value),
                        width: width,
                        height: height,
                        child: Padding(
                          padding: EdgeInsets.only(top: height * .15),
                          child: Stack(
                            children: [
                              Swiper(
                                onIndexChanged: (value) {
                                  _.index.value = value;
                                },
                                controller: SwiperController(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(top: height * .1),
                                    child: Container(
                                      width: width,
                                      height: height * 4,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(Coffe(
                                            controller: _,
                                            index: index,
                                          ));
                                        },
                                        child: Hero(
                                            tag: index,
                                            child:
                                                Image.asset(_.list[index].img)),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: _.list.length,
                                itemWidth: width * 0.9,
                                itemHeight: height * 0.6,
                                containerHeight: height * 0.6,
                                containerWidth: width * 0.9,
                                layout: SwiperLayout.STACK,
                                scrollDirection: Axis.vertical,
                              ),
                              AnimatedOpacity(
                                onEnd: () {
                                  _.hide.value = true;
                                },
                                duration: Duration(milliseconds: 400),
                                opacity: _.index.value == 0 ? 1.0 : 0.0,
                                child: !_.hide.value
                                    ? Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: height * .08),
                                          child: Text(
                                            "Coffe \n Hortigado",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: height * .06,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ),
                              AnimatedPositioned(
                                top: _.index.value == 0 ? -height * .11 : 0,
                                duration: Duration(seconds: 1),
                                child: TitleAndPrice(
                                    controller: _,
                                    width: width,
                                    height: height,
                                    swiperController: swiperController),
                              ),
                            ],
                          ),
                        ));
                  });
                } else if (_.list != null && _.list.length == 0) {
                  return Center(
                    child: Text("no data"),
                  );
                } else {
                  return Center(
                    child: Container(
                      height: height * .2,
                      width: height * .2,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            AppBarWidget(width: width),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration(value) {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [
        value == 0 ? 0 : .7,
        value == 0 ? .7 : 1,
      ],
      colors: [
        value == 0 ? Colors.brown : Colors.white,
        value == 0 ? Colors.white : Colors.brown,
      ],
    ));
  }
}
