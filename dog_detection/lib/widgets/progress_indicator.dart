import 'package:dog_detection/model/skelton.dart';
import 'package:flutter/material.dart';

class Progressindicator extends StatelessWidget {
  const Progressindicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Skelton(
                height: 80,
                width: 260,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Skelton(
                  height: 80,
                  width: 35,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Skelton(
              height: 150,
              width: 250,
            ),
            SizedBox(height: 25.0),
            Skelton(
              height: 30,
              width: 250,
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: RaisedButton(
                onPressed: () {},
                color: Colors.grey.shade200.withOpacity(1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 35.0,
                ),
              ),
            ),
            SizedBox(height: 7.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: RaisedButton(
                onPressed: () {},
                color: Colors.grey.shade200.withOpacity(1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 35.0,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Skelton(
                  height: 15.0, width: MediaQuery.of(context).size.width),
            )
          ],
        )
      ],
    );
  }
}
