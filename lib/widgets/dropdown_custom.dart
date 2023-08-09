// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../models/model_city.dart';

class CustomDropdown extends StatefulWidget {
  final List<City> cities = vietnamCities;
  final Function(String) onCityChanged;
  String selectValue;
  CustomDropdown(this.selectValue,this.onCityChanged, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String selectedCity;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.selectValue,
      items: widget.cities.map((City city) {
        return DropdownMenuItem<String>(
          value: city.name,
          child: Text(city.name),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCity = value!;
        });

        widget.onCityChanged(selectedCity);
      },
      decoration: const InputDecoration(
        labelText: 'City',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class CustomDropdownGender extends StatefulWidget {
  String selectValue;
  final Function(String) onGenderChanged;
  CustomDropdownGender(this.selectValue,this.onGenderChanged, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownGenderState createState() => _CustomDropdownGenderState();
}

class _CustomDropdownGenderState extends State<CustomDropdownGender> {
  String selectedGender='';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.selectValue,
      items: const [
        DropdownMenuItem(value: '', child: Text('Vui lòng chọn giới tính')),
        DropdownMenuItem(value: "Nam", child: Text('Nam')),
        DropdownMenuItem(value: 'Nữ', child: Text('Nữ')),
        DropdownMenuItem(value: 'Khác', child: Text('Khác')),
      ],
      onChanged: (value) {
        setState(() {
          selectedGender = value!;
        });
        widget.onGenderChanged(selectedGender);
      },
      decoration: const InputDecoration(
        labelText: 'Gender',
        border: OutlineInputBorder(),
      ),
    );
  }
}
