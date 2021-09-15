import 'package:dubuz_app/Screens/A%20Details/detailScreen.dart';
import 'package:dubuz_app/Screens/My%20Account/myAccount.dart';
import 'package:dubuz_app/Screens/Pending%20Ads/pendingAdsCards.dart';
import 'package:flutter/material.dart';

class PendingAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyAccount()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'Pending Ads',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PendingAdsCards(
              img: 'assets/ads/img1.jpg',
              text: 'Assetz Marq',
              icon: Icons.location_on_outlined,
              location: 'Whitefield, Banglore',
              timeIcon: Icons.access_time,
              time: '7 hours ago',
              price: '\$99999',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDetails()));
              },
            ),
            PendingAdsCards(
              img: 'assets/ads/img2.jpg',
              text: 'Nikon Camera New...',
              icon: Icons.location_on_outlined,
              location: 'Khargarh Mumbai',
              timeIcon: Icons.access_time,
              time: '5 hours ago',
              price: '\$120',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDetails()));
              },
            ),
            PendingAdsCards(
              img: 'assets/ads/img3.jpg',
              text: 'Sun Glasses',
              icon: Icons.location_on_outlined,
              location: 'Mumbai',
              timeIcon: Icons.access_time,
              time: '3 Sep 2020',
              price: '\$100',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDetails()));
              },
            ),
            PendingAdsCards(
              img: 'assets/ads/img4.jpg',
              text: 'Iphone X Pro',
              icon: Icons.location_on_outlined,
              location: 'UP, India',
              timeIcon: Icons.access_time,
              time: '2 hours ago',
              price: '\$490',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDetails()));
              },
            ),
            PendingAdsCards(
              img: 'assets/ads/img5.jpg',
              text: 'Audi 753x Car',
              icon: Icons.location_on_outlined,
              location: 'Lodhyana, India',
              timeIcon: Icons.access_time,
              time: '5 hours ago',
              price: '\$5000',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDetails()));
              },
            ),
            PendingAdsCards(
              img: 'assets/ads/img6.jpg',
              text: 'Refurnished Chair',
              icon: Icons.location_on_outlined,
              location: 'Punjab, India',
              timeIcon: Icons.access_time,
              time: '10 hours ago',
              price: '\$890',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDetails()));
              },
            ),
            PendingAdsCards(
              img: 'assets/ads/img7.jpg',
              text: 'Honda Bike 678yh',
              icon: Icons.location_on_outlined,
              location: 'Mumbai',
              timeIcon: Icons.access_time,
              time: '5 hours ago',
              price: '\$120',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDetails()));
              },
            ),
            PendingAdsCards(
              img: 'assets/ads/img8.jpg',
              text: 'Keviy Bicycle',
              icon: Icons.location_on_outlined,
              location: 'Khargarh',
              timeIcon: Icons.access_time,
              time: '10 Aug 2020',
              price: '\$120',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdDetails()));
              },
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
