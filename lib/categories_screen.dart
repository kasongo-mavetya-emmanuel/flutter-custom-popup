
import 'package:flutter/material.dart';

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

class PopUpComponent extends StatelessWidget {
  const PopUpComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
        left: 10,
        child: Card(
          color: Colors.white,
          elevation: 8,
          child: Container(
            width: MediaQuery.of(context).size.width*0.65,
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField(items: ['Goma','Bukavu'].map(
                        (e) => DropdownMenuItem(
                          value: e,
                            child: Text(e))).toList(),
                    onChanged: (item){
                    },
                  value: 'Goma',
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isDense: true,
                ),),
                Text('Radius'),
                SizedBox(
                  height: 10,
                ),
                SliderComponent(),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ));
  }
}


class SliderComponent extends StatefulWidget {
  const SliderComponent({Key? key}) : super(key: key);

  @override
  State<SliderComponent> createState() => _SliderComponentState();
}

class _SliderComponentState extends State<SliderComponent> {
  double _currentSliderValue=1.0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: Theme.of(context).primaryColor,
          overlayShape: SliderComponentShape.noOverlay,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
          valueIndicatorTextStyle: TextStyle(fontSize: 9,color: Colors.white),
          showValueIndicator: ShowValueIndicator.always,
          inactiveTrackColor: Colors.black12
      ),
      child: Slider(
          value: _currentSliderValue,
          max: 30,
          min: 1,
          label: '${_currentSliderValue.round()}km',
          onChanged: (value){
            setState(() {
              _currentSliderValue=value;
            });
          }),
    );
  }
}

class SearchBar extends StatelessWidget {

  VoidCallback onPressed;
  bool rotateIcon;
  SearchBar({
    super.key,
    required this.onPressed,
    required this.rotateIcon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child:Row(
        children: [
          //Search card
           Expanded(
             child:
             Card(
               clipBehavior: Clip.hardEdge,
               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                 child: Row(
                   children: [
                      GestureDetector(
                        onTap: onPressed,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon((Icons.location_on)),
                            Text('Goma'),
                            Icon(rotateIcon?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                     SizedBox(width: 10,),
                     Expanded(
                       child: TextField(
                         decoration: InputDecoration(
                           isDense: true,
                           hintText: 'Search for a category...',
                           enabledBorder: InputBorder.none,
                           focusedBorder: InputBorder.none,
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),

          //Search Icon
          Card(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
    );
  }
}

class GidViewComponent extends StatelessWidget {
  const GidViewComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index){
              return Card(
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset('assets/img.png',fit: BoxFit.cover,),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    Center(
                      child: Text('Category ${index}',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              );
      }),
    );
  }
}
