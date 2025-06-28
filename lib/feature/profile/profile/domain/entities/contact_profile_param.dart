class ContactProfileParam {
  String? email, address,state_id;

  ContactProfileParam({
    this.email,
    this.address,
    this.state_id
  });

  /// Converts an instance of PersonalProfileParam to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "address_1": address,
      "state_id": state_id,

    };
  }
}
