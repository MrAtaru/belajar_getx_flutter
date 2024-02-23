import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/latihan_1_controller.dart';

class Latihan1View extends GetView<Latihan1Controller> {
  Latihan1View({Key? key}) : super(key: key);

  final Latihan1Controller latihan1controller = Latihan1Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan1View'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Personal Information',
                style: TextStyle(fontSize: 20),
              ),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Fullname'),
                    onChanged: (value) =>
                        latihan1controller.fullName.value = value,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Place Of Birth'),
                    onChanged: (value) =>
                        latihan1controller.placeOfBirth.value = value,
                  ),
                  SizedBox(height: 16.0),
                  InkWell(
                    onTap: () => latihan1controller.selectBirthDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Date Of Birth",
                        hintText: 'choose your date of birth',
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('choose your date of birth'),
                          Obx(() =>
                              Text(latihan1controller.selectedBirthDate.value)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Choose Your Gender',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      Obx(() => Radio(
                            value: 'Male',
                            groupValue: latihan1controller.gender.value,
                            onChanged: (value) =>
                                latihan1controller.gender.value = value!,
                          )),
                      Text('Male'),
                      Obx(() => Radio(
                            value: 'Female',
                            groupValue: latihan1controller.gender.value,
                            onChanged: (value) =>
                                latihan1controller.gender.value = value!,
                          )),
                      Text('Female'),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    onChanged: (value) =>
                        latihan1controller.email.value = value,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nationality'),
                    onChanged: (value) =>
                        latihan1controller.nationality.value = value,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Type Of Membership',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Obx(() => Radio(
                          value: 'Regular',
                          groupValue: latihan1controller.membership.value,
                          onChanged: (value) {
                            latihan1controller.membership.value = value!;
                            latihan1controller.paymentByMembership();
                          })),
                      Text('Regular'),
                      Obx(() => Radio(
                          value: 'Gold',
                          groupValue: latihan1controller.membership.value,
                          onChanged: (value) {
                            latihan1controller.membership.value = value!;
                            latihan1controller.paymentByMembership();
                          })),
                      Text('Gold'),
                      Obx(() => Radio(
                          value: 'Platinum',
                          groupValue: latihan1controller.membership.value,
                          onChanged: (value) {
                            latihan1controller.membership.value = value!;
                            latihan1controller.paymentByMembership();
                          })),
                      Text('Platinum'),
                      Obx(() => Radio(
                          value: 'VIP',
                          groupValue: latihan1controller.membership.value,
                          onChanged: (value) {
                            latihan1controller.membership.value = value!;
                            latihan1controller.paymentByMembership();
                          })),
                      Text('VIP'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Payment Details',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Card Number'),
                    onChanged: (value) =>
                        latihan1controller.cardNumber.value = value,
                  ),
                  InkWell(
                    onTap: () => latihan1controller.selectExpiredDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Expired Date",
                        hintText: 'fill the expired date',
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('fill the expired date shown in your card'),
                          Obx(() => Text(
                              latihan1controller.selectedExpiredDate.value)),
                        ],
                      ),
                    ),
                  ),
                  TextFormField(
                    readOnly: true,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(labelText: 'Payment'),
                    controller: TextEditingController(
                        text: latihan1controller.payment.value),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () => latihan1controller.submitForm(),
                    child: Text('Submit'),
                  ),
                ],
              )),
              SizedBox(height: 16.0),
              
            ],
          ),
        ),
      ),
    );
  }
}
