import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //*padding constants
  final double horizontalPadding = 40.0;
  final double verticalPadding = 20.0;

  //*list of smart devices
  List mySmartDevices = [
    //*[d evice name , icon path , power status ]
    ["Smart Light", "assets/icons/light-bulb.png", true],
    ["Smart AC", "assets/icons/air-conditioner.png", false],
    ["Smart TV", "assets/icons/smart-tv.png", false],
    ["Smart Fan", "assets/icons/fan.png", true],
  ];
//*power button checker
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //*menu icon
                  Image.asset(
                    "assets/icons/menu.png",
                    height: 45,
                    color: Colors.grey[800],
                  ),

                  //*profile icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //*Welcome Home
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "welcome Home,",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    "Ahmed Gamal",
                    style: GoogleFonts.bebasNeue(fontSize: 72),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                )),

            SizedBox(
              height: 20,
            ),

            //* smart devices grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.grey[800]),
              ),
            ),

            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(25),
                  itemCount: mySmartDevices.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.3, crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return SmartDeviceBox(
                      smartDeviceName: mySmartDevices[index][0],
                      iconPath: mySmartDevices[index][1],
                      powerOn: mySmartDevices[index][2],
                      onChanged: (value) => powerSwitchChanged(value, index),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
