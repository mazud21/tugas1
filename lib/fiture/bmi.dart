import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Bmi extends StatefulWidget {
  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  Gender? selectedGender;

  final _formKey = GlobalKey<FormState>();

  int weight = 61, height = 166, age = 36;
  double _bmi = 0.0;

  TextEditingController etAge = TextEditingController();
  TextEditingController etHeight = TextEditingController();
  TextEditingController etWeight = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    etWeight.text = weight.toString();
    etHeight.text = height.toString();
    etAge.text = age.toString();
  }

  String calculateBMI() {
    _bmi = int.parse(etWeight.text) / pow(int.parse(etHeight.text) / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black87,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('BMI Calculator',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: Get.width * 0.06,
                        color: Colors.white)),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Text('Gender', style: GoogleFonts.poppins(color: Colors.white)),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: selectedGender == Gender.male
                                    ? Colors.green
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(16)),
                        child: Stack(
                          children: [
                            Positioned(
                                right: 8,
                                top: 8,
                                child: Icon(Icons.check_circle_rounded,
                                    color: selectedGender == Gender.male
                                        ? Colors.green
                                        : Colors.grey)),
                            Center(
                              child: Image.asset(
                                'assets/images/man.png',
                                width: Get.width * 0.30,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: selectedGender == Gender.female
                                    ? Colors.green
                                    : Colors.grey),
                            borderRadius: BorderRadius.circular(16)),
                        child: Stack(
                          children: [
                            Positioned(
                                right: 8,
                                top: 8,
                                child: Icon(Icons.check_circle_rounded,
                                    color: selectedGender == Gender.female
                                        ? Colors.green
                                        : Colors.grey)),
                            Center(
                              child: Image.asset(
                                'assets/images/woman.png',
                                width: Get.width * 0.30,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Weight',
                              style: GoogleFonts.poppins(color: Colors.white)),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  controller: etWeight,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      gapPadding: 16,
                                      borderSide: const BorderSide(
                                          color: Colors.green, width: 16.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  child: Text(
                                    'Kg',
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Height',
                            style: GoogleFonts.poppins(color: Colors.white)),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                controller: etHeight,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    gapPadding: 16,
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 16.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                child: Text(
                                  'cm',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      ],
                    ))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text('Age', style: GoogleFonts.poppins(color: Colors.white)),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: etAge,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      gapPadding: 16,
                      borderSide:
                          const BorderSide(color: Colors.green, width: 16.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                    width: double.infinity,
                    height: Get.height * 0.08,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(ResultsPage(
                            interpretation: getInterpretation(),
                            bmiResult: calculateBMI(),
                            resultText: getResult()));
                        calculateBMI();
                        getResult();
                        getInterpretation();
                        dev.log(
                            'GET_RESULTS: ${calculateBMI().toString()} | ${getResult().toString()} | ${getInterpretation().toString()}');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text('Calculate',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: Get.height * 0.025)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Gender {
  male,
  female,
}

TextStyle kTitleTextStyle = GoogleFonts.poppins(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle kTitleExplanationStyle = GoogleFonts.poppins(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

/*
* calculateBMI();
        getResult();
        getInterpretation();
        dev.log('GET_RESULTS: ${calculateBMI().toString()} | ${getResult().toString()} | ${getInterpretation().toString()}');
* */

class ButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;

  const ButtonWidget(
      {super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      child: Text(buttonText,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: Get.height * 0.025)),
    );
  }
}

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  getResultColor(String bmiResult) {
    if (double.parse(bmiResult) >= 25) {
      return Colors.deepOrange;
    } else if (double.parse(bmiResult) > 18.5) {
      return Colors.green;
    } else {
      return Colors.orange;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        title: const Text('BMI Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: getResultColor(bmiResult)
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: kTitleTextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kTitleExplanationStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: Get.height*0.08,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text('Re-Calculate',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: Get.height * 0.025)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
