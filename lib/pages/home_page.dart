import 'package:flutter/material.dart';
import 'package:medical/models/doctor_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [];

  List<DoctorModel> doctors = [];

  int _selectedCategoryIndex = 0;

  void _initializeInfo() {
    categories = [
      'assets/icons/ic_heart.png',
      'assets/icons/ic_pil.png',
      'assets/icons/ic_dentist.png',
      'assets/icons/ic_pregnant.png',
    ];
    doctors = DoctorModel.getDoctors();
  }

  @override
  Widget build(BuildContext context) {
    _initializeInfo();
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _header(context),
          _categoriesSection(),
          _doctorListSection()
        ],
      ),
    );
  }

  ListView _doctorListSection() {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: index == 0
                          ? const Color(0xffFFF2E4)
                          : const Color(0xffD0F8EC),
                    ),
                    child: Image.asset(
                      doctors[index].imagePath,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctors[index].name,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              doctors[index].name,
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
                              doctors[index].ratings,
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
          ),
        );
      },
    );
  }

  Container _categoriesSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 60,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 40,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _selectedCategoryIndex == index
                          ? const Color(0xff51A8FF)
                          : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      categories[index],
                      width: 35,
                      height: 35,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _header(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xff51A8FF),
      height: MediaQuery.of(context).size.height * 0.35,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hi, Steven',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 35,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Let\'s find\nyour top doctor!',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search here...',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          )
        ],
      ),
    );
  }
}
