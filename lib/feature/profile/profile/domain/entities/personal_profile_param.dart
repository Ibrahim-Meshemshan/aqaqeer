class PersonalProfileParam {
  String? firstName, lastName, nationalId, fatherName, birthDate, genderId, maritalStatusId;

  PersonalProfileParam({
    this.firstName,
    this.lastName,
    this.nationalId,
    this.fatherName,
    this.birthDate,
    this.genderId,
    this.maritalStatusId,
  });

  /// Converts an instance of PersonalProfileParam to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      // "first_name": firstName,
      // "last_name": lastName,
      "national_id": nationalId,
      "father_name": fatherName,
      "birth_date": birthDate,
      "gender_id": genderId,
      "marital_status_id": maritalStatusId,
    };
  }
}
