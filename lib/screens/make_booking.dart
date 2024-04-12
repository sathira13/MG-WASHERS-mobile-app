import 'package:car_wash/components/alert_dialog.dart';
import 'package:car_wash/components/car_background.dart';
import 'package:car_wash/components/custom_app_bar.dart';
import 'package:car_wash/components/custom_text_heading.dart';
import 'package:car_wash/components/primary_button.dart';
import 'package:car_wash/components/secondary_input.dart';
import 'package:car_wash/components/snak_bar.dart';
import 'package:car_wash/models/service.dart';
import 'package:car_wash/services/BookingService.dart';
import 'package:car_wash/utils/months.dart';
import 'package:car_wash/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class MakeBookingScreen extends StatefulWidget {
  const MakeBookingScreen({super.key, required this.data});
  final Service data;

  @override
  State<MakeBookingScreen> createState() => _MakeBookingScreenState();
}

class _MakeBookingScreenState extends State<MakeBookingScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _makeController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _yomController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expDateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();

  void makeBooking() async {
    var uuid = Uuid();
    String uniqueID = uuid.v4();
    BookingService bookingService = BookingService();

    String location = _locationController.text;
    String make = _makeController.text;
    String model = _modelController.text;
    String yom = _yomController.text;
    String license = _licenseController.text;

    String name = _nameController.text;
    String phone = _phoneController.text;

    String cardHolderName = _cardHolderNameController.text;
    String cardNumber = _cardNumberController.text;
    String expDate = _expDateController.text;
    String cvc = _cvcController.text;

    if (!Validator.isNameValid(location)) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: "Invalid location",
      ));
      return;
    }

    if (!Validator.isNameValid(make)) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: "Invalid Make",
      ));
      return;
    }

    if (!Validator.isNameValid(model)) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: "Invalid Model",
      ));
      return;
    }

    if (!Validator.isNumeric(yom)) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: "Invalid YOM",
      ));
      return;
    }

    if (!Validator.isNameValid(license)) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: "Invalid License plate no",
      ));
      return;
    }

    if (!Validator.isNameValid(name)) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: "Invalid Name",
      ));
      return;
    }

    if (!Validator.isMobileNumberValid(phone)) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: "Invalid Phone no",
      ));
      return;
    }

    if (!Validator.isNameValid(cardHolderName)) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: "Invalid Card holder name",
      ));
      return;
    }

    if (!Validator.validateCreditCardNumber(cardNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: "Invalid Card number",
      ));
      return;
    }

    if (!Validator.isValidExpDate(expDate)) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: "Invalid Exp Date",
      ));
      return;
    }

    if (!Validator.isNumeric(cvc)) {
      ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
        message: "Invalid CVC",
      ));
      return;
    }

    bookingService.makeBooking(
        uniqueID,
        location,
        make,
        model,
        yom,
        license,
        name,
        phone,
        widget.data.time!.toString(),
        widget.data.price!,
        widget.data.image!,
        widget.data.subTitle!,
        "${selectedTime.hour.toString()} : ${selectedTime.minute.toString()} : ${selectedTime.hour > 12 ? 'PM' : 'AM'}",
        selectedDate.day.toString() +
            " " +
            MonthSelector.getMonth(selectedDate.month),
        (bool success, String message) {
      if (success) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomAlertDialog();
            });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(MySnackbar(
          message: message,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      // appBar: CustomAppBar(false, "Wash Services"),
      body: CarBackground(
          imagePath: widget.data.image!,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(
                  isHome: false,
                  title: "Booking",
                  isBooking: true,
                ),
                SizedBox(
                  height: 200,
                ),
                Container(
                  // height: 800,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35))),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.data.subTitle!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Container(
                                padding: EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                    color: Color(0xffe8cc9f),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Text(
                                  "Car washing service",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${widget.data.time} mins"),
                            Text(
                                "Rs ${widget.data.price!.toStringAsFixed(2)}/ service")
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.01,
                        ),
                        Divider(),
                        CustomTextHeading(text: "Description: "),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Text(widget.data.description!),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Divider(),
                        CustomTextHeading(text: "Services: "),
                        SizedBox(
                          height: screenSize.height * 0.01,
                        ),
                        widget.data.services != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: widget.data.services!
                                    .map((service) =>
                                        Text(service.toString().trim()))
                                    .toList(),
                              )
                            : Container(),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        CustomTextHeading(text: "Select a car wash location: "),
                        SizedBox(
                          height: screenSize.height * 0.01,
                        ),
                        SecondaryInputBox(
                          placeholder: "Location",
                          isIcon: true,
                          controller: _locationController,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.01,
                        ),
                        CustomTextHeading(text: "Vehicle Details:"),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenSize.width / 2.5,
                              child: SecondaryInputBox(
                                placeholder: "Make",
                                isIcon: false,
                                controller: _makeController,
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width / 2.5,
                              child: SecondaryInputBox(
                                placeholder: "Model",
                                isIcon: false,
                                controller: _modelController,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenSize.width / 2.5,
                              child: SecondaryInputBox(
                                placeholder: "YOM",
                                isIcon: false,
                                controller: _yomController,
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width / 2.5,
                              child: SecondaryInputBox(
                                placeholder: "License Plate No",
                                isIcon: false,
                                controller: _licenseController,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        CustomTextHeading(text: "Date & Time:"),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                    width: screenSize.width / 2.5,
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 5, left: 10, right: 10),
                                    decoration: const BoxDecoration(
                                        color: Colors.black),
                                    child: Text(
                                      "Time",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "${selectedTime.hour} : ${selectedTime.minute} : ${selectedTime.hour > 12 ? 'PM' : 'AM'}"),
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: screenSize.width / 5,
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 10,
                                            right: 10),
                                        decoration: const BoxDecoration(
                                            color: Colors.black),
                                        child: Text(
                                          "Cancel",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    Container(
                                        width: screenSize.width / 5,
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 10,
                                            right: 10),
                                        decoration: const BoxDecoration(
                                            color: Colors.black),
                                        child: GestureDetector(
                                          onTap: () async {
                                            final TimeOfDay? timeOfDay =
                                                await showTimePicker(
                                                    context: context,
                                                    initialTime: selectedTime,
                                                    initialEntryMode:
                                                        TimePickerEntryMode
                                                            .dial);
                                            if (timeOfDay != null) {
                                              setState(() {
                                                selectedTime = timeOfDay;
                                              });
                                            }
                                          },
                                          child: Text(
                                            "Set",
                                            textAlign: TextAlign.center,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    width: screenSize.width / 2.5,
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 5, left: 10, right: 10),
                                    decoration: const BoxDecoration(
                                        color: Colors.black),
                                    child: Text(
                                      "Date",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "${MonthSelector.getMonth(selectedDate.month)} : ${selectedDate.day} : ${selectedDate.year}"),
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: screenSize.width / 5,
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 10,
                                            right: 10),
                                        decoration: const BoxDecoration(
                                            color: Colors.black),
                                        child: Text(
                                          "Cancel",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    Container(
                                        width: screenSize.width / 5,
                                        padding: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 10,
                                            right: 10),
                                        decoration: const BoxDecoration(
                                            color: Colors.black),
                                        child: GestureDetector(
                                          onTap: () async {
                                            final DateTime? date =
                                                await showDatePicker(
                                                    context: context,
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime(2100),
                                                    initialDate:
                                                        DateTime.now());

                                            if (date != null) {
                                              setState(() {
                                                selectedDate = date;
                                              });
                                            }
                                          },
                                          child: Text(
                                            "Set",
                                            textAlign: TextAlign.center,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Divider(),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        CustomTextHeading(text: "Personal Information"),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        SecondaryInputBox(
                          placeholder: "Name",
                          isIcon: false,
                          controller: _nameController,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.01,
                        ),
                        SizedBox(
                          width: screenSize.width / 2,
                          child: SecondaryInputBox(
                            placeholder: "Phone No",
                            isIcon: false,
                            controller: _phoneController,
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        CustomTextHeading(text: "Payment Method"),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        SecondaryInputBox(
                          placeholder: "Card Holder Name",
                          isIcon: false,
                          controller: _cardHolderNameController,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.01,
                        ),
                        SecondaryInputBox(
                          placeholder: "Card Number",
                          isIcon: false,
                          controller: _cardNumberController,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenSize.width / 2.5,
                              child: SecondaryInputBox(
                                placeholder: "Exp Date",
                                isIcon: false,
                                controller: _expDateController,
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width / 2.5,
                              child: SecondaryInputBox(
                                placeholder: "CVC",
                                isIcon: false,
                                controller: _cvcController,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            child: Image(
                              image: AssetImage("images/visa.png"),
                            ),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: screenSize.height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1 x ${widget.data.subTitle}"),
                            Text("Rs ${widget.data.price!.toStringAsFixed(2)}"),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.01,
                        ),
                        Divider(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Subtotal Rs. ${widget.data.price!.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: PrimaryButton(
                              text: "Make a Booking",
                              onPressed: () async {
                                makeBooking();
                              },
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    ));
  }
}
