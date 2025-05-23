// ignore_for_file: must_be_immutable

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blueGrey.withAlpha(500),
            width: 0.3,
          ),
          borderRadius: BorderRadius.circular(24),
          color: powerOn ? Colors.grey[900] : Colors.blueGrey[80],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // *icon
              Image.asset(
                iconPath,
                height: 65,
                color: powerOn ? Colors.white : Colors.grey.shade700,
              ),

              //* smart device name + switch
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        smartDeviceName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: powerOn ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: (onChanged),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
