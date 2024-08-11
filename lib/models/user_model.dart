import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  dynamic avatar;
  Location? location;
  String? id;
  String name;
  String email;
  String password;
  String? confirmPassword;
  String? role;
  bool? isActive;
  bool? isVerified;
  String? phone;
  String? gender;
  List<dynamic>? likes;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  OtherPermissions? otherPermissions; // New field

  User({
    this.avatar,
    this.location,
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.confirmPassword,
    this.role,
    this.isActive,
    this.isVerified,
    this.phone,
    this.gender,
    this.likes,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.otherPermissions, // Initialize in constructor
  });




  factory User.fromJson(Map<String, dynamic> json) => User(
    avatar: Avatar.fromJson(json["avatar"]).secureUrl,
    location: json["location"] != null ? Location.fromJson(json["location"]) : null,
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    isActive: json["isActive"] ?? false,
    isVerified: json["isVerified"] ?? false,
    phone: json["phone"] ?? '',
    gender: json["gender"], // If 'gender' is optional, you can leave it as is.
    likes: json["likes"] != null
        ? List<dynamic>.from(json["likes"].map((x) => x))
        : [],
    createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
    updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
    v: json["__v"],
    otherPermissions: json["otherPermissions"] != null
        ? OtherPermissions.fromJson(json["otherPermissions"])
        : null,
  );








  // factory User.fromJson(Map<String, dynamic> json) => User(
  //   avatar: Avatar.fromJson(json["avatar"]).secureUrl,
  //   location: Location.fromJson(json["location"]),
  //   id: json["_id"],
  //   name: json["name"],
  //   email: json["email"],
  //   password: json["password"],
  //   role: json["role"],
  //   isActive: json["isActive"],
  //   isVerified: json["isVerified"],
  //   phone: json["phone"],
  //   gender: json["gender"],
  //   likes: json["likes"] != null
  //       ? List<dynamic>.from(json["likes"].map((x) => x))
  //       : null,
  //   createdAt: DateTime.parse(json["createdAt"]),
  //   updatedAt: DateTime.parse(json["updatedAt"]),
  //   v: json["__v"],
  //   otherPermissions: json["otherPermissions"] != null
  //       ? OtherPermissions.fromJson(json["otherPermissions"])
  //       : null, // Parse otherPermissions
  // );

  Map<String, dynamic> toJson() => {
    "avatar": avatar,
    "name": name,
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
    "otherPermissions": otherPermissions?.toJson(), // Convert to JSON
  };
}

class Avatar {
  String publicId;
  String secureUrl;

  Avatar({
    required this.publicId,
    required this.secureUrl,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
    publicId: json["public_id"],
    secureUrl: json["secure_url"],
  );

  Map<String, dynamic> toJson() => {
    "public_id": publicId,
    "secure_url": secureUrl,
  };
}

class Location {
  String address1;
  String address2;
  String city;
  String state;
  int postcode;
  String country;

  Location({
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    address1: json["address1"],
    address2: json["address2"],
    city: json["city"],
    state: json["state"],
    postcode: json["postcode"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "address1": address1,
    "address2": address2,
    "city": city,
    "state": state,
    "postcode": postcode,
    "country": country,
  };
}

class OtherPermissions {
  bool? isVendor;
  bool? isCustomer;
  bool? isCategories;
  bool? isProducts;
  bool? isOrders;
  bool? isReviews;
  bool? isVouchers;
  bool? isAdManager;
  bool? isRoleManager;
  bool? isMessageCenter;
  bool? isFinance;
  bool? isShipment;
  bool? isSupport;
  bool? isEventManager;
  bool? isMessage;



  OtherPermissions({
    this.isVendor = true,
    this.isCustomer = false,
    this.isCategories = false,
    this.isProducts = false,
    this.isOrders = false,
    this.isReviews = false,
    this.isVouchers = false,
    this.isAdManager = false,
    this.isRoleManager = false,
    this.isMessageCenter = false,
    this.isFinance = false,
    this.isShipment = false,
    this.isSupport = false,
    this.isEventManager = false,
    this.isMessage = false,
  });




  factory OtherPermissions.fromJson(Map<String, dynamic> json) => OtherPermissions(
    isVendor: json["isVendor"],
    isCustomer: json["isCustomer"],
    isCategories: json["isCategories"],
    isProducts: json["isProducts"],
    isOrders: json["isOrders"],
    isReviews: json["isReviews"],
    isVouchers: json["isVouchers"],
    isAdManager: json["isAdManager"],
    isRoleManager: json["isRoleManager"],
    isMessageCenter: json["isMessageCenter"],
    isFinance: json["isFinance"],
    isShipment: json["isShipment"],
    isSupport: json["isSupport"],
    isEventManager: json["isEventManager"],
    isMessage: json["isMessage"],
  );

  Map<String, dynamic> toJson() => {
    "isVendor": isVendor,
    "isCustomer": isCustomer,
    "isCategories": isCategories,
    "isProducts": isProducts,
    "isOrders": isOrders,
    "isReviews": isReviews,
    "isVouchers": isVouchers,
    "isAdManager": isAdManager,
    "isRoleManager": isRoleManager,
    "isMessageCenter": isMessageCenter,
    "isFinance": isFinance,
    "isShipment": isShipment,
    "isSupport": isSupport,
    "isEventManager": isEventManager,
    "isMessage": isMessage,
  };
}
