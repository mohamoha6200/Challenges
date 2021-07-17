import 'dart:ui';

import 'package:challenges/challenge_bank_diego/data.dart';
import 'package:challenges/challenge_bank_diego/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewCardPage extends StatelessWidget {
  NewCardPage({
    Key? key,
    required this.value,
    required this.maxheight,
    required this.maxWidth,
    this.isView = false,
  }) : super(key: key);
  final double value;
  final double maxheight;
  final double maxWidth;
  final bool isView;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxheight,
      width: maxWidth,
      child: Padding(
        padding: EdgeInsets.all(lerpDouble(20, 0, value)!),
        child: Container(
          decoration: BoxDecoration(
            color: Helpers.purpleLigth_color,
            borderRadius: BorderRadius.circular(lerpDouble(30, 0, value)!),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Jean ',
                      style: Helpers.txtNameUser,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Roldan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: lerpDouble(75, 50, value),
                    height: 50,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          child: CircleAvatar(
                            minRadius: 25,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                              User.listUser[0].img,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Opacity(
                            opacity: lerpDouble(1, 0, value)!,
                            child: CircleAvatar(
                              minRadius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.credit_card,
                                color: Helpers.purple_color,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),

              Flexible(
                flex: 1,
                child: ListView.builder(
                  itemCount: User.listUser.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemExtent: (MediaQuery.of(context).size.width / 5) -
                      lerpDouble(0, 10, value)!,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  itemBuilder: (__, item) {
                    final widthChild = (MediaQuery.of(context).size.width / 5) -
                        lerpDouble(0, 10, value)!;
                    return FittedBox(
                      child: item == 0
                          ? ItemCircleUser(
                              name: 'Search',
                              width: widthChild,
                              child: Icon(CupertinoIcons.search),
                            )
                          : ItemCircleUser(
                              name: User.listUser[item].name,
                              width: widthChild,
                              backgroundImage:
                                  AssetImage(User.listUser[item].imgProfile),
                            ),
                    );
                  },
                ),
              ),
              if (value >= .3) const SizedBox(height: 20),

              Flexible(
                flex: 1,
                child: value <= 0.20
                    ? const SizedBox.shrink()
                    : Opacity(
                        opacity: value,
                        child: Container(
                          // height: 140,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue.shade300,
                          ),
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Helpers.purpleLigth_color,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Helpers.purpleLigth_color,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Text(
                                        'Holiday goal',
                                        style: Helpers.txtHoliday,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '\$100  \$5000',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Helpers.purple_color,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Helpers.fontPrincipal,
                                        fontSize: 25,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
              if (value >= .3) const SizedBox(height: 20),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // child: Column(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Icon(
                  //           Icons.credit_card,
                  //           size: 50,
                  //           color: Helpers.purple_color,
                  //         ),
                  //         Text(
                  //           'Pay for services',
                  //           style: Helpers.txtList,
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       children: [
                  //         Icon(
                  //           Icons.credit_card,
                  //           size: 50,
                  //           color: Helpers.purple_color,
                  //         ),
                  //         Text(
                  //           'Pay for services',
                  //           style: Helpers.txtList,
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCircleUser extends StatelessWidget {
  const ItemCircleUser({
    Key? key,
    required this.name,
    required this.width,
    this.backgroundImage,
    this.child,
  }) : super(key: key);
  final String name;
  final ImageProvider<Object>? backgroundImage;
  final Widget? child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            child: CircleAvatar(
              radius: width / 2,
              backgroundColor: Colors.white,
              backgroundImage: backgroundImage,
              child: backgroundImage == null ? child : null,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: width,
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: Helpers.txtName,
            ),
          )
        ],
      ),
    );
  }
}