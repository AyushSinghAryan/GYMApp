import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/video_info.dart';
import 'colors.dart' as color; // these are our selected color

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List info = [];
  _initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
      setState(() {
        info = json.decode(value);
      });

    });
  }

  @override
  void initState(){
    super.initState();
    _initData();//private fun
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      //by (.) dot we just excess its property
      //scaffold have body section
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        // padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Training',
                  style: TextStyle(
                    fontSize: 30,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //Expended child fills the available space.
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                SizedBox(
                  width: 10,
                ),
                //for space between icons use sized box
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  'Your Program',
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                //expanded takes all available space between two child
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageDetail,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: (){
                    Get.to(() => VideoInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.AppColor.gradientFirst.withOpacity(0.8),
                      color.AppColor.gradientSecond.withOpacity(0.9),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(80),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 10),
                        //offset  means from the left to the right
                        //do  5 pixels and 10 means from top to bottom come done 10px
                        blurRadius: 20,
                        //higher the blur radius the lighter the shadow is
                        color: color.AppColor.gradientSecond.withOpacity(0.2)),
                  ]),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //in column main axis is horizontal
                  children: [
                    Text(
                      "Next Workout",
                      style: TextStyle(
                        fontSize: 16,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Legs Toning",
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "and Glutes Workout",
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.homePageContainerTextBig,
                      ),
                    ),
                    SizedBox(height: 25,),
                    Row(
                      crossAxisAlignment:CrossAxisAlignment.end ,//end push down every thing
                      //to the bottom
                      children: [
                        Row(
                          children: [
                            Icon(Icons.timer,size: 20,
                            color:color.AppColor.homePageContainerTextSmall,),
                            SizedBox(width: 10,),
                            Text(
                              "60 min",
                              style: TextStyle(
                                fontSize: 10,
                                color: color.AppColor.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container(),),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(60) ,
                            boxShadow: [
                              BoxShadow(
                                color: color.AppColor.gradientFirst,
                                blurRadius: 10,
                                offset: Offset(4, 8),
                              )
                              ]
                          ),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      //continue 35.00;
                      ],
                    ),


                  ],

                ),

              ),
            ),
            SizedBox(height: 5,),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/card.jpg"
                        ),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          offset: Offset(8,10),
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                        ),
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(-1,-5),
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                        ),
                      ]
                    ),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right:200,bottom: 30 ),
                    decoration: BoxDecoration(
                        // color: Colors.redAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/figure.png"
                          ),
                          // fit: BoxFit.fill,
                        ),

                    ),

                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 150,top: 50),
                    width: double.maxFinite,
                    height: 100,
                    // color: Colors.redAccent.withOpacity(0.3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         "You are doing great",
                         style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.bold,
                           color: color.AppColor.homePageDetail,
                         ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(text: TextSpan(
                          text: "Keep it up\n",
                          style: TextStyle(
                            color: color.AppColor.homePagePlanColor,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: "Stick to your plan",
                            )
                          ]
                        ),),
                      ],
                    ),

                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Area of focus",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color:color.AppColor.homePageTitle
                  ),
                )
              ],
            ),
            Expanded(child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: (info.length.toDouble()/2).toInt(),//2
                    itemBuilder:(_, i){
                    int a = 2*i;// first time i =0 , second time i = 2
                    int b = 2*i + 1;// first time i =1, second time i = 3
                      return Row(
                        children: [
                          Container(
                            height: 170,
                            margin: EdgeInsets.only(left: 30,bottom: 15, top: 15),
                            width: (MediaQuery.of(context).size.width-90)/2,
                            padding: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                    info[a]['img'],//acess from json file
                                )
                              ),
                               boxShadow:[
                                 BoxShadow(
                                   blurRadius: 3,
                                   offset: Offset(5,5),
                                   color:color.AppColor.gradientSecond.withOpacity(0.1),
                               ),
                                 BoxShadow(
                                   blurRadius: 3,
                                   offset: Offset(-5,-5),
                                   color:color.AppColor.gradientSecond.withOpacity(0.1),
                                 ),
                          ]
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[a]['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: color.AppColor.homePageDetail,
                                  ),
                                ),
                              ) ,
                            ),

                          ),
                          Container(
                            height: 170,
                            margin: EdgeInsets.only(left: 30,bottom: 15,top: 15),
                            width: (MediaQuery.of(context).size.width-90)/2,
                            padding: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                      info[b]['img'],//acess from json file
                                    )
                                ),
                                boxShadow:[
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(5,5),
                                    color:color.AppColor.gradientSecond.withOpacity(0.1),
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(-5,-5),
                                    color:color.AppColor.gradientSecond.withOpacity(0.1),
                                  ),
                                ]
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[b]['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: color.AppColor.homePageDetail,
                                    // continue 1:31:13
                                  ),
                                ),
                              ) ,
                            ),

                          ),
                        ],
                      //  continue 1:04:00

                      );
                    }
                ),
              ),
            )
            )
            
          ],
        ),
      ),
    );
  }
}
