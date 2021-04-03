import 'package:coffeapp/controller/CoffesController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key key,
    @required this.controller,
    @required this.width,
    @required this.height,
    @required this.swiperController,
  }) : super(key: key);

  final double width;
  final CoffesController controller;
  final double height;
  final SwiperController swiperController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: width,
          height: height * .07,
          child: (controller.list != null)
              ? Swiper(
                  itemCount: controller.list.length,
                  controller: swiperController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index != 0) {
                      return Container(
                        height: height * .1,
                        padding: EdgeInsets.symmetric(horizontal: width * .27),
                        child: Center(
                          child: Text(
                            controller.list[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: height * .03),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                )
              : Container(),
        ),
        Container(
          padding: EdgeInsets.only(top: height * .01),
          child: Text(
            "${controller.list[controller.index.value].price.toDouble().toString()} \$",
            style:
                TextStyle(fontWeight: FontWeight.w300, fontSize: height * .03),
          ),
        )
      ],
    );
  }
}
