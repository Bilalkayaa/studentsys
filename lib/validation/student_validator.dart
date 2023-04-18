class StudentValidationMixin {
  String validateFirstName(String? value) {
    if (value == null || value.length < 2) {
      return "isim en az 3 karakter olmalıdır";
    }
    return "";
  }

  String validateLastName(String? value) {
    if (value == null || value.length < 2) {
      return "soyisim en az 3 karakter olmalıdır";
    }
    return "";
  }

  String validateGrade(String? value) {
    if (value == null || value.isEmpty) {
      return "not alanı boş olamaz";
    }
    var grade=int.tryParse(value);
    if (grade == null || grade < 0 || grade > 100) {
      return "hatalı not";
    }
    return "";
  }
}
