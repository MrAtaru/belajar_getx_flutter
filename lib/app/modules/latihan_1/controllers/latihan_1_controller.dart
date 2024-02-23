import 'package:belajar_getx/app/modules/latihan_1/views/latihan_1_output.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Latihan1Controller extends GetxController {
  //TODO: Implement Latihan1Controller

  var fullName = ''.obs;
  var placeOfBirth = ''.obs;
  var dateOfBirth = ''.obs;
  var gender = ''.obs;
  var email = ''.obs;
  var nationality = ''.obs;

  var membership = ''.obs;

  var cardNumber = ''.obs;
  var expiredDate = ''.obs;
  var payment = ''.obs;
  var benefit = ''.obs;

  void paymentByMembership() {
    if (membership.value == 'Regular') {
      payment.value = '50000';
      benefit.value = 'Anggota 1 Bulan';
    } else if (membership.value == 'Gold') {
      payment.value = '150000';
      benefit.value = 'Anggota 1 Bulan + Cemilan Gratis';
    } else if (membership.value == 'Platinum') {
      payment.value = '250000';
      benefit.value = 'Anggota 2 Bulan + Cemilan Gratis + Free Wifi';
    } else if (membership.value == 'VIP') {
      payment.value = '500000';
      benefit.value =
          'Anggota 3 Bulan + Cemilan Gratis + Free Wifi + Ticket Concert';
    } else {
      payment.value = '';
      benefit.value = '';
    }
  }

  String formatCurrency(int amount) {
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');
    return currencyFormat.format(amount);
  }

  var isFormSubmitted = false.obs;
  var selectedBirthDate = ''.obs;
  var selectedExpiredDate = ''.obs;
  var age = 0.obs;
  Future<void> selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      selectedBirthDate.value = formattedDate;

      calculateAge(picked);
    }
  }

  void calculateAge(DateTime birthDate) {
    var currentYear = DateTime.now().year;
    var birthYear = birthDate.year;
    age.value = currentYear - birthYear;
  }

  Future<void> selectExpiredDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      selectedExpiredDate.value = formattedDate;
    }
  }

  void submitForm() async {
    print(
        "$fullName, $placeOfBirth, $age, $gender, $email, $membership, $payment");
    isFormSubmitted.value = true;
    await Future.delayed(Duration.zero);
    Get.to(Output());
  }
}
