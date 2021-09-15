import 'package:dubuz_app/Screens/A%20Details/detailScreen.dart';
import 'package:flutter/material.dart';

class TrendingCards extends StatelessWidget {
  final String text;
  final img;
  final IconData icon;
  final String location;
  final String price;
  final onTap;

  TrendingCards(
      {this.onTap,
      required this.img,
      required this.text,
      required this.icon,
      required this.location,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: onTap,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 180,
                    height: 130,
                    child: Image.asset(
                      img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ))
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(left: 13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.grey,
                  size: 18,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            price,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )
        ],
      ),
    );
  }
}

class HomeTrendingCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TrendingCards(
              img: 'assets/ads/img2.jpg',
              text: 'Nikon Camera New..',
              icon: Icons.location_on_outlined,
              location: 'Khargarh Mumbai',
              price: '\$120',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDetails()));
              },
            ),
            SizedBox(
              width: 20,
            ),
            TrendingCards(
              img: 'assets/ads/img1.jpg',
              text: 'Assetz Marq',
              icon: Icons.location_on_outlined,
              location: 'Banglore',
              price: '\$99999',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDetails()));
              },
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TrendingCards(
              img: 'assets/ads/img3.jpg',
              text: 'Sun Glasses',
              icon: Icons.location_on_outlined,
              location: 'UP, India',
              price: '\$100',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDetails()));
              },
            ),
            SizedBox(
              width: 20,
            ),
            TrendingCards(
              img: 'assets/ads/img8.jpg',
              text: 'Kevy Bicycle 2020',
              icon: Icons.location_on_outlined,
              location: 'Mumbai',
              price: '\$490',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDetails()));
              },
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TrendingCards(
              img: 'assets/ads/img6.jpg',
              text: 'Refurnished Chair',
              icon: Icons.location_on_outlined,
              location: 'Punjab, India',
              price: '\$50000',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDetails()));
              },
            ),
            SizedBox(
              width: 20,
            ),
            TrendingCards(
              img: 'assets/ads/img9.jpg',
              text: 'Audi Car 456yT',
              icon: Icons.location_on_outlined,
              location: 'Ludhyana',
              price: '\$670',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDetails()));
              },
            ),
          ],
        ),
      ],
    );
  }
}
