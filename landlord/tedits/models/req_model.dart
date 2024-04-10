// ignore_for_file: public_member_api_docs, sort_constructors_first
class RequestingModel {
  final String name;
  final String profile;
  RequestingModel({
    required this.name,
    required this.profile,
  });
}

final List<RequestingModel> reqbytenant = [
  RequestingModel(
    name: "Topo Lefika",
    profile: "assets/repair.png",
  ),
  RequestingModel(
    name: "Steffy",
    profile: "assets/repair.png",
  ),
  
];
