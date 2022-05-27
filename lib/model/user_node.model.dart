class UserNode {
  String? id;
  int? parentId;
  String? name;
  String? username;
  String? mobileNo;
  String? emailAddress;
  int? status;
  String? userType;
  String? category;
  int? kycStatus;
  double? totalAchievedIncome;
  double? totalExpectedIncome;
  String? packageName;
  double? packageAmount;
  String? createdOn;
  List<Children>? children;
  int? j;
  int? i;

  UserNode(
      {this.id,
      this.parentId,
      this.name,
      this.username,
      this.mobileNo,
      this.emailAddress,
      this.status,
      this.userType,
      this.category,
      this.kycStatus,
      this.totalAchievedIncome,
      this.totalExpectedIncome,
      this.packageName,
      this.packageAmount,
      this.createdOn,
      this.children,
      this.j,
      this.i});

  UserNode.fromJson(Map<String, dynamic> json) {
    id = json["Id"].toString();
    parentId = json["parentId"];
    name = json["Name"];
    username = json["Username"];
    mobileNo = json["MobileNo"];
    emailAddress = json["EmailAddress"];
    status = json["Status"];
    userType = json["UserType"];
    category = json["Category"];
    kycStatus = json["KYCStatus"];
    totalAchievedIncome = json["TotalAchievedIncome"];
    totalExpectedIncome = json["TotalExpectedIncome"];
    packageName = json["PackageName"];
    packageAmount = json["PackageAmount"];
    createdOn = json["CreatedOn"];
    children = json["Children"] == null
        ? null
        : (json["Children"] as List).map((e) => Children.fromJson(e)).toList();
    j = json["j"];
    i = json["i"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Id"] = id;
    data["parentId"] = parentId;
    data["Name"] = name;
    data["Username"] = username;
    data["MobileNo"] = mobileNo;
    data["EmailAddress"] = emailAddress;
    data["Status"] = status;
    data["UserType"] = userType;
    data["Category"] = category;
    data["KYCStatus"] = kycStatus;
    data["TotalAchievedIncome"] = totalAchievedIncome;
    data["TotalExpectedIncome"] = totalExpectedIncome;
    data["PackageName"] = packageName;
    data["PackageAmount"] = packageAmount;
    data["CreatedOn"] = createdOn;
    if (children != null) {
      data["Children"] = children?.map((e) => e.toJson()).toList();
    }
    data["j"] = j;
    data["i"] = i;
    return data;
  }
}

class Children {
  String? id;
  int? parentId;
  String? name;
  String? username;
  String? mobileNo;
  String? emailAddress;
  int? status;
  String? userType;
  String? category;
  int? kycStatus;
  double? totalAchievedIncome;
  double? totalExpectedIncome;
  String? packageName;
  double? packageAmount;
  String? createdOn;
  List<Children>? children;
  int? j;
  int? i;

  Children(
      {this.id,
      this.parentId,
      this.name,
      this.username,
      this.mobileNo,
      this.emailAddress,
      this.status,
      this.userType,
      this.category,
      this.kycStatus,
      this.totalAchievedIncome,
      this.totalExpectedIncome,
      this.packageName,
      this.packageAmount,
      this.createdOn,
      this.children,
      this.j,
      this.i});

  Children.fromJson(Map<String, dynamic> json) {
    id = json["Id"].toString();
    parentId = json["parentId"];
    name = json["Name"];
    username = json["Username"];
    mobileNo = json["MobileNo"];
    emailAddress = json["EmailAddress"];
    status = json["Status"];
    userType = json["UserType"];
    category = json["Category"];
    kycStatus = json["KYCStatus"];
    totalAchievedIncome = json["TotalAchievedIncome"];
    totalExpectedIncome = json["TotalExpectedIncome"];
    packageName = json["PackageName"];
    packageAmount = json["PackageAmount"];
    createdOn = json["CreatedOn"];
    children = json["Children"] == null
        ? null
        : (json["Children"] as List).map((e) => Children.fromJson(e)).toList();
    j = json["j"];
    i = json["i"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Id"] = id;
    data["parentId"] = parentId;
    data["Name"] = name;
    data["Username"] = username;
    data["MobileNo"] = mobileNo;
    data["EmailAddress"] = emailAddress;
    data["Status"] = status;
    data["UserType"] = userType;
    data["Category"] = category;
    data["KYCStatus"] = kycStatus;
    data["TotalAchievedIncome"] = totalAchievedIncome;
    data["TotalExpectedIncome"] = totalExpectedIncome;
    data["PackageName"] = packageName;
    data["PackageAmount"] = packageAmount;
    data["CreatedOn"] = createdOn;
    if (children != null) {
      data["Children"] = children;
    }
    data["j"] = j;
    data["i"] = i;
    return data;
  }
}
