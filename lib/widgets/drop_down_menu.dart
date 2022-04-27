import 'package:bosconet/constants/constants.dart';
import 'package:bosconet/custom_widgets/text_widget.dart';
import 'package:bosconet/screens/gift_education.dart';
import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({Key? key}) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  var selectedValue = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Constants.primaryColor,
      isExpanded: true,
      menuMaxHeight: 500,
      onTap: () {},
      value: selectedValue,
      items: const [
        DropdownMenuItem(
          child: TextTitle(
            title: 'ABOUT US',
            color: Constants.primaryColorWhite,
          ),
          value: 1,
        ),
        DropdownMenuItem(
          child: TextTitle(
              title: 'WHO WE ARE', color: Constants.primaryColorWhite),
          value: 2,
        ),
        DropdownMenuItem(
          child: TextTitle(
              title: 'OUR VISION', color: Constants.primaryColorWhite),
          value: 3,
        ),
        DropdownMenuItem(
          child: TextTitle(
              title: 'OUR MISSION', color: Constants.primaryColorWhite),
          value: 4,
        ),
      ],
      onChanged: (int? value) {
        setState(() {
          selectedValue = value!;
        });
      },
    );
  }
}
