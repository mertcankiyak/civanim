class ServiceModel{

  String? serviceId;
  String? serviceName;
  String? serviceIcon;


  ServiceModel.fromMap(Map<String, dynamic> map):
      serviceId = map['service_id'],
      serviceName = map['service_adi'],
      serviceIcon = map['service_icon'];

}