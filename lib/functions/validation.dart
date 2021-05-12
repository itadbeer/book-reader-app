bool isAValidMobileNumber(String mobile) {
  Pattern mobileNumberPattern = r"^0[0-9]{2,}[0-9]{7,}$";
  RegExp regex = new RegExp(mobileNumberPattern);
  return regex.hasMatch(mobile) && mobile.length >= 11 && mobile.length <= 13;
}
