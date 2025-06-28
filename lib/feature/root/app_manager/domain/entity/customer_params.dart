class CustomerParams{
  final String clientCode;
  final String applicationCode;

  CustomerParams({required this.applicationCode,required this.clientCode});
  Map<String,dynamic> toJson(){
    return{
      'clientCode':clientCode,
      'applicationCode':applicationCode
    };
  }
}