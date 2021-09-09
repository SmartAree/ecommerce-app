import 'package:flutter/material.dart';



class HiddenAdsCards extends StatelessWidget {
  final String img;
  final String text;
  final String price;
  final IconData icon;
  final String location;
  final IconData timeIcon;
  final String time;

  HiddenAdsCards({required this.img, required this.text, required this.price, required this.icon, required this.location, required this.time, required this.timeIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 180,
      width: 411,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height: 160,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage(img),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(15),

                  ),
                ),
              ),
              Positioned(
                  top: 10,
                  left: 15,
                  child: Container(
                    height: 25,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: Text('Hidden', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                      ),),
                    ),
                  ))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: TextStyle(
                  fontSize: 18
              ),),
              SizedBox(height: 15,),
              Text(price, style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 15,),
              Row(
                children: [
                  Icon(icon, color: Colors.grey,),
                  SizedBox(width: 5,),
                  Text(location, style: TextStyle(
                      color: Colors.grey
                  ),),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Icon(timeIcon, color: Colors.blueGrey,),
                  SizedBox(width: 5,),
                  Text(time, style: TextStyle(
                      color: Colors.blueGrey
                  ),),
                  SizedBox(width: 20,),
                  Row(
                    children: [
                      Icon(Icons.edit, color: Colors.blueGrey, size: 18,),
                      SizedBox(width:5,),
                      Icon(Icons.visibility, color: Colors.blueGrey, size: 18,),
                      SizedBox(width:5,),
                      Icon(Icons.delete, color: Colors.blueGrey, size: 18,),
                    ],
                  )
                ],
              ),

            ],
          )
        ],
      ),

    );
  }
}
