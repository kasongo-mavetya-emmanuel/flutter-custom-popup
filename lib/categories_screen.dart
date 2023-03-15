
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool togglePopUp=false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: TextStyle(color: Colors.white),),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10,),
          Stack(
            children: [
              //Search bar
              SearchBar(
                rotateIcon: togglePopUp,
                onPressed: () {
                  setState(() {
                    togglePopUp=!togglePopUp;
                  });
                },),


              //Grid builder
              Container(margin: EdgeInsets.only(top: 55),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      child: Text('Categories',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ),
                    GidViewComponent(),
                  ],
                ),
              ),
              //PopUp
              togglePopUp?PopUpComponent():SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}






