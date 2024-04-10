import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landlord/pages/landlord/tedits/models/req_model.dart';

class MaintenaceReq extends StatelessWidget {
  const MaintenaceReq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(reqbytenant.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(reqbytenant[index].profile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " ${reqbytenant[index].name}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text("Door handle needs fixing"),
                  const SizedBox(height: 16),
                  
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
