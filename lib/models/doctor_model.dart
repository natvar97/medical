class DoctorModel {
  String name;
  String imagePath;
  String occupation;
  String ratings;

  DoctorModel({
    required this.name,
    required this.imagePath,
    required this.occupation,
    required this.ratings,
  });

  static List<DoctorModel> getDoctors() {
    List<DoctorModel> doctors = [];
    doctors.add(
      DoctorModel(
        name: 'Dr. Jenny Wilson',
        imagePath: 'assets/images/ic_doctor1.png',
        occupation: 'Dental Surgeon',
        ratings: '4.8',
      ),
    );
    doctors.add(
      DoctorModel(
        name: 'Dr. Kristin Watson',
        imagePath: 'assets/images/ic_doctor2.png',
        occupation: 'Dental Surgeon',
        ratings: '4.8',
      ),
    );
    return doctors;
  }
}
