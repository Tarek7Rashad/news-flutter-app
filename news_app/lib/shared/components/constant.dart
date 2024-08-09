import 'package:flutter/material.dart';

const kgreyColor = Color(0xffe5e5e5);
const kgrey2Color = Color.fromRGBO(224, 224, 224, 1);
const kwhiteColor = Color(0xffffffff);
const kblackColor = Color(0xff000000);
const kblueGreyColor = Colors.blueGrey;
const kTextFieldBorderColor = Color(0xfff7f7f7);
const kblueColor = Color.fromARGB(255, 14, 2, 128);
TextEditingController updateProfileUserNameEditingController =
    TextEditingController();
TextEditingController updateProfileEmailEditingController =
    TextEditingController();
TextEditingController updateProfilePhoneEditingController =
    TextEditingController();

TextEditingController emailEditingController = TextEditingController();

TextEditingController passwordEditingController = TextEditingController();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
GlobalKey<FormState> formKey = GlobalKey();

TextEditingController adminEmailEditingController = TextEditingController();
TextEditingController adminIdEditingController = TextEditingController();

TextEditingController adminPasswordEditingController = TextEditingController();
AutovalidateMode adminAutovalidateMode = AutovalidateMode.disabled;
GlobalKey<FormState> adminFormKey = GlobalKey();

TextEditingController registerFirstNameEditingController =
    TextEditingController();
TextEditingController registerLastNameEditingController =
    TextEditingController();
TextEditingController registerEmailEditingController = TextEditingController();

TextEditingController registerPasswordEditingController =
    TextEditingController();
TextEditingController registerConfirmPasswordEditingController =
    TextEditingController();
AutovalidateMode registerAutovalidateMode = AutovalidateMode.disabled;
GlobalKey<FormState> formRegisterKey = GlobalKey();
TextEditingController addUnitImagesEditingController = TextEditingController();
TextEditingController addUnitLocationEditingController =
    TextEditingController();
TextEditingController addUnitPriceEditingController = TextEditingController();

TextEditingController addUnitDescriptionEditingController =
    TextEditingController();

TextEditingController addUnitRoomsEditingController = TextEditingController();
TextEditingController addUnitBedsEditingController = TextEditingController();

AutovalidateMode addUnitAutovalidateMode = AutovalidateMode.disabled;
GlobalKey<FormState> addUnitFormKey = GlobalKey();
TextEditingController updateUnitImagesEditingController =
    TextEditingController();
TextEditingController updateUnitLocationEditingController =
    TextEditingController();
TextEditingController updateUnitPriceEditingController =
    TextEditingController();

TextEditingController updateUnitDescriptionEditingController =
    TextEditingController();

TextEditingController updateUnitRoomsEditingController =
    TextEditingController();
TextEditingController updateUnitBedsEditingController = TextEditingController();

AutovalidateMode updateUnitAutovalidateMode = AutovalidateMode.disabled;
GlobalKey<FormState> updateUnitFormKey = GlobalKey();



