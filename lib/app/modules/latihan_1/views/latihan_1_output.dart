import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:belajar_getx/app/modules/latihan_1/views/latihan_1_view.dart';
import '../controllers/latihan_1_controller.dart';

class Output extends StatelessWidget {
  final Latihan1Controller invoice = Get.find<Latihan1Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Invoice'),
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: [
                Text(
                  'Personal Information',
                  style: TextStyle(fontSize: 20),
                ),
                ListTile(
                  title: Text('Fullname : ${Latihan1Controller().fullName}'),
                ),
                ListTile(
                  title: Text('Place Of Birth : ${invoice.placeOfBirth.value}'),
                ),
                ListTile(
                  title: Text('Age : ${invoice.age.value}'),
                ),
                ListTile(
                  title: Text('Gender : ${invoice.gender.value}'),
                ),
                ListTile(
                  title: Text('Email : ${invoice.email.value}'),
                ),
                ListTile(
                  title: Text('Nationality : ${invoice.nationality.value}'),
                ),
                Text(
                  'Type Of Membership',
                  style: TextStyle(fontSize: 20),
                ),
                ListTile(
                  title: Text('Membership : ${invoice.membership.value}'),
                ),
                Text(
                  'Payment Detail',
                  style: TextStyle(fontSize: 20),
                ),
                ListTile(
                  title: Text('Card Number : ${invoice.cardNumber.value}'),
                ),
                ListTile(
                  title: Text(
                      'Expired Date : ${invoice.selectedExpiredDate.value}'),
                ),
                ListTile(
                  title: Text('Payment : ${invoice.payment.value}'),
                ),
                ListTile(
                  title: Text('Benefit : ${invoice.benefit.value}'),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
