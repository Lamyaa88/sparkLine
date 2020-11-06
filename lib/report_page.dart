import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {


//  ---------------------------------------------------------------------------------------------- colors used in this screen
  static const BlueColor = Color(0xff4682B4);
  static const GrayColor = Color(0xffC0C0C0);
  static const whiteColor = Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
//          ---------------------------------------the main column
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _topPart(),
//
//              ---------------------------------------------------------------
              SizedBox(
                height: height * .03,
              ),
//            ------------------------------------------------------------------------------------------ report name

              reportName(),
//              ----------------------------------------------------------------------------------------------------- 1m,3m,3m,.....

              MillionsRow(),

//------------------------------------------------------------------------------------------------------------------- the shape
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ratioColumn(),
                  Container(
                    padding: EdgeInsets.only(right: width * .04),
                    child: _sparkLine(),
                  ),
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
//              -----------------------------------------------------------------------------------------------the row of the days

              daysRow(),
              SizedBox(
                height: height * .05,
              ),

//              ------------------------------------------------------------------------------------------------------ the lower part
              _lowerPart()
            ],
          )
        ],
      ),
    );


  }

//  ========================================================
//  ===================== the functions ====================
  //  ======================================================


//  ------------------------------------------------------------------------------------------------ first:  the Top part function ( التقارير + the icon )


  Widget _topPart() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: height * .1,
      color: BlueColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: width * .4,
          ),
          Text(
            'التقارير ',
            style: TextStyle(
                fontSize: height * .025,
                color: whiteColor,
                fontFamily: 'jf',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: width * .2,
          ),
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: whiteColor,
                size: height * .025,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
//  --اسم التقرير ,234.00,+900.7-----------------------------------------------------------------------------------------------------
  reportName(){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: width * .7),
          child: Text(
            'اسم التقرير',
            style: TextStyle(
                fontSize: height * .02,
                color: GrayColor,
                fontFamily: 'jf',
                fontWeight: FontWeight.bold),
          ),
        ),
//              ---------------------------------------------------------------------------------------------234.00 +900.7
        SizedBox(
          height: height * .02,
        ),
        Container(
          padding: EdgeInsets.only(right: width * .05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '+900.7',
                style: TextStyle(
                    fontSize: height * .02,
                    color: BlueColor,
                    fontFamily: 'jf',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: width * .07,
              ),
              Text(
                '234.00',
                style: TextStyle(
                    fontSize: height * .02,
                    color: GrayColor,
                    fontFamily: 'jf',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * .05,
        ),


      ],
    );
  }
//  ----------------------------------------------------------------------------------------------- the shape only without the  other components

  Widget _sparkLine() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

//    on these data the chart form depends on .
    var data = [
      7.0,
      20.0,
      15.2,
      30.0,
      15.0,
      40.0,
      2.0,
      8.0,
      5.0,
      10.0,
      17.0,
      17.0,
      17.0
    ];
    return Container(
      width: width * .8,
      height: height * .30,
      child: Sparkline(
        data: data,
//        the color of the  area below the diagram
        fillColor: Colors.grey.shade300, lineColor: Colors.black,
        pointColor: Colors.black,
        lineWidth: 3.5, fallbackWidth: 200,
        fillMode: FillMode.below,
      ),
    );
  }
//  ------------------------------------------------------------------------------------------------- default text to be used when needed

  Widget _customText(String text, double size) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: GrayColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'jf'),
    );
  }



//----------------------------------------------------------------------------------------------------------------- Ms container function

  Widget _millionContainer(
      String text, Color backgroundColor, Color textColor) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: height * .02,
            color: textColor,
          ),
        ),
      ),
      height: height * .04,
      width: width * .08,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(height * .01),
      ),
    );
  }

//-------------------------------------------------------------------------------------------------------- su,mo,tu,....function
  Widget daysRow() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(left: width * .06),
      width: width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'SU',
            style: TextStyle(
              fontSize: height * .02,
              color: GrayColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'MO',
            style: TextStyle(
              fontSize: height * .02,
              color: GrayColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'TU',
            style: TextStyle(
              fontSize: height * .02,
              color: GrayColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'WE',
            style: TextStyle(
              fontSize: height * .02,
              color: GrayColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'TH',
            style: TextStyle(
              fontSize: height * .02,
              color: GrayColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'FR',
            style: TextStyle(
              fontSize: height * .02,
              color: GrayColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'SA',
            style: TextStyle(
              fontSize: height * .02,
              color: GrayColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

//------------------------------------------------------------------------------------------------------ 5%.20# ......function
  Widget ratioColumn() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '120%',
            style: TextStyle(
              fontSize: height * .02,
              color: GrayColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '90%',
            style: TextStyle(
              fontSize: height * .02,
              color: GrayColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '50%',
            style: TextStyle(
              fontSize: height * .02,
              color: GrayColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '30%',
            style: TextStyle(
              fontSize: height * .02,
              color: GrayColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '5%',
            style: TextStyle(
              fontSize: height * .02,
              color: GrayColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
//  --------------------------------------------------------------------------------------------------------------- M.y..
//  note (1): this function depends on _millionContainer in the top.
//  note (2):this widget needs to be edited to fit the width of the chart

  Widget MillionsRow() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: width * .0),
      width: width * .7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: width*.1,),

          _millionContainer('1M', whiteColor, GrayColor),
          SizedBox(width: width*.1,),
          _millionContainer('3M', BlueColor, whiteColor),
          SizedBox(width: width*.03,),

          _millionContainer('6M', whiteColor, GrayColor),
          SizedBox(width: width*.03,),

          _millionContainer('1Y', whiteColor, GrayColor),
          SizedBox(width: width*.03,),

          _millionContainer('2Y', whiteColor, GrayColor),
        ],
      ),
    );
  }
//  ----------------------------------------------------------------------------------------- and finally  lower part function

  Widget _lowerPart() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(height * .03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
//          ---------------------------------------------------------------------------------------- 5%
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('5%', height * .02),
                  ],
                ),
              ),
              SizedBox(
                height: height * .07,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('334', height * .02),
                  ],
                ),
              ),
              SizedBox(
                height: height * .07,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                      size: height * .03,
                    )
                  ],
                ),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
//              ------------------------------------------- .....نسبة الزيادة  --------------------------------------------------------------
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('نسبة', height * .018),
                    Container(
                      child: _customText('الزيادة', height * .018),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('سعر', height * .018),
                    Container(
                      child: _customText('الزيادة', height * .018),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('مؤشر', height * .018),
                    Container(
                      child: _customText('الزيادة', height * .018),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: GrayColor,
            width: width * .003,
            height: height * .2,
          ),
//          ------------------------------------------------------------------------------------------------------- 334,9334.100000
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('334', height * .02),
                  ],
                ),
              ),
              SizedBox(
                height: height * .07,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('9334', height * .02),
                  ],
                ),
              ),
              SizedBox(
                height: height * .07,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('10000', height * .02),
                  ],
                ),
              ),
            ],
          ),

//---------  سعر المتر ----------------------------------------------------------------------------------------------------------
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
//              ---------------------------------------------------------------
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('سعر المتر', height * .018),
                    Container(
                      child: _customText('المربع الواحد', height * .018),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('سعر 100 ', height * .018),
                    Container(
                      child: _customText('متر مربع ', height * .018),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('سعر 1 ', height * .018),
                    Container(
                      child: _customText('كيلومتر', height * .018),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: GrayColor,
            width: width * .003,
            height: height * .2,
          ),
//          -----------------------------------------------------------------------------------------------------------
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('555', height * .02),
                  ],
                ),
              ),
              SizedBox(
                height: height * .07,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('222', height * .02),
                  ],
                ),
              ),
              SizedBox(
                height: height * .07,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('334', height * .02),
                  ],
                ),
              ),
            ],
          ),

//----------أول سعر سُجل ----------------------------------------------------------------------------------------------------- ----

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('أول سعر ', height * .018),
                    Container(
                      child: _customText('سجل', height * .018),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('أقل سعر ', height * .018),
                    Container(
                      child: _customText('سجل', height * .018),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _customText('أعلى سعر ', height * .018),
                    Container(
                      child: _customText('سجل', height * .018),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


