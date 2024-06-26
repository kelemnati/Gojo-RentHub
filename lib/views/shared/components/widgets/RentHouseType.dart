import 'package:flutter/material.dart';
import 'package:gojo_renthub/views/shared/components/models/House.dart';


class RentType extends StatefulWidget {
   RentType({super.key, required this.houseType});

  List<House> houseType;

  @override
  State<RentType> createState() => _RentTypeState();
}

class _RentTypeState extends State<RentType> {
  int? _selectedButtonIndex;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: ListView.builder(
        
          scrollDirection: Axis.horizontal,
          itemCount: HouseType.values.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              
                onPressed: () {
                  setState(() {
            _selectedButtonIndex = index;
                  });
                },
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  minimumSize: MaterialStateProperty.all(Size(50, 50)),
                   
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), 
                ),
                              ),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
               if (_selectedButtonIndex == index) {
                    return Colors.blue;
                  }
                  return Color.fromARGB(255, 230, 228, 228);
            },
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (_selectedButtonIndex == index) {
                    return Colors.white;
                  }
                  return const Color.fromARGB(255, 138, 137, 137);
            },
                  ),
                ),
                child:  Padding(
                  padding:  EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text("${HouseType.values[index].name}")
                ),
              ),
          ),
        ),
    );
  }
}
