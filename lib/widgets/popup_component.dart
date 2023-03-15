import 'package:flutter/material.dart';
import 'widgets.dart';


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
