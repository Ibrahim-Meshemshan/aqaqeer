class SaveNotificationParams{
  final String announcementTypeIds;
  final String mobile;
  // final String token;

  SaveNotificationParams({
    required this.announcementTypeIds,
  required this.mobile
  });

  Map<String,dynamic> toJson(){
    return{
      'announcementTypeIds':announcementTypeIds,
      'mobile': mobile,
      // 'rememberToken':token
    };
  }
}