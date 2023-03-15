import 'package:flutter/material.dart';

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
