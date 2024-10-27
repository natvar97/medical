import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical/utils.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: ListView(
        children: [
          _profileDetails(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Biography',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: const Color(0xff09121C).withOpacity(0.5),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ReadMoreText(
                  text:
                      'Dr. Jenny Wilson (Implantologist),  is a Dentist in America, she has 20 years of is a Dentist in America, she has 20 years of is a Dentist in America, she has 20 years of',
                  textStyle: TextStyle(
                    fontFamily: 'Poppins',
                    color: const Color(0xff09121C).withOpacity(0.5),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _profileDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffFFF2E4),
              ),
              child: Image.asset(
                'assets/images/ic_doctor1.png',
                width: 100,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dr. Jenny Watson',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Dental Surgeon',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/ic_star.svg'),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: Colors.white,
      title: const Text(
        'Detail Doctor',
        style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 60,
          width: 60,
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 30,
                spreadRadius: 1,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
          ),
          child: SvgPicture.asset('assets/icons/ic_arrow_left.svg'),
        ),
      ),
    );
  }
}
