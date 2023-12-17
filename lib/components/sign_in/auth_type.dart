enum AuthType {
  emailLink,
  emailPassword,
  phoneNumber;

  bool get isEmailLink => this == emailLink;

  bool get isEmailPassword => this == emailPassword;

  bool get isPhoneNumber => this == phoneNumber;
}
