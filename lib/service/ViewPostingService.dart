import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ViewPosting {
  int? postId;
  String? postTitle;
  String? postTxt;
  int? postState;
  int? hasReview;
  String? postDate;
  List<Spon>? spon;
  int? remainSpon;
  String? menuImg;
  String? menuName;
  Bmember? bmember;

  ViewPosting(
      {this.postId,
      this.postTitle,
      this.postTxt,
      this.postState,
      this.hasReview,
      this.postDate,
      this.spon,
      this.remainSpon,
      this.menuImg,
      this.menuName,
      this.bmember});

  ViewPosting.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    postTitle = json['post_title'];
    postTxt = json['post_txt'];
    postState = json['post_state'];
    hasReview = json['has_review'];
    postDate = json['post_date'];
    if (json['spon'] != null) {
      spon = <Spon>[];
      json['spon'].forEach((v) {
        spon!.add(new Spon.fromJson(v));
      });
    }
    remainSpon = json['remain_spon'];
    menuImg = json['menu_img'];
    menuName = json['menu_name'];
    bmember =
        json['bmember'] != null ? new Bmember.fromJson(json['bmember']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['post_title'] = this.postTitle;
    data['post_txt'] = this.postTxt;
    data['post_state'] = this.postState;
    data['has_review'] = this.hasReview;
    data['post_date'] = this.postDate;
    if (this.spon != null) {
      data['spon'] = this.spon!.map((v) => v.toJson()).toList();
    }
    data['remain_spon'] = this.remainSpon;
    data['menu_img'] = this.menuImg;
    data['menu_name'] = this.menuName;
    if (this.bmember != null) {
      data['bmember'] = this.bmember!.toJson();
    }
    return data;
  }
}

class Spon {
  int? sponId;
  Ingredients? ingredients;
  String? sponDate;
  int? sponState;
  String? tid;
  Smember? smember;

  Spon(
      {this.sponId,
      this.ingredients,
      this.sponDate,
      this.sponState,
      this.tid,
      this.smember});

  Spon.fromJson(Map<String, dynamic> json) {
    sponId = json['spon_id'];
    ingredients = json['ingredients'] != null
        ? new Ingredients.fromJson(json['ingredients'])
        : null;
    sponDate = json['spon_date'];
    sponState = json['spon_state'];
    tid = json['tid'];
    smember =
        json['smember'] != null ? new Smember.fromJson(json['smember']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spon_id'] = this.sponId;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.toJson();
    }
    data['spon_date'] = this.sponDate;
    data['spon_state'] = this.sponState;
    data['tid'] = this.tid;
    if (this.smember != null) {
      data['smember'] = this.smember!.toJson();
    }
    return data;
  }
}

class Ingredients {
  int? ingredientsId;
  String? ingredientsName;
  String? productName;
  String? ingredientsImage;
  int? price;

  Ingredients(
      {this.ingredientsId,
      this.ingredientsName,
      this.productName,
      this.ingredientsImage,
      this.price});

  Ingredients.fromJson(Map<String, dynamic> json) {
    ingredientsId = json['ingredients_id'];
    ingredientsName = json['ingredients_name'];
    productName = json['product_name'];
    ingredientsImage = json['ingredients_image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ingredients_id'] = this.ingredientsId;
    data['ingredients_name'] = this.ingredientsName;
    data['product_name'] = this.productName;
    data['ingredients_image'] = this.ingredientsImage;
    data['price'] = this.price;
    return data;
  }
}

class Smember {
  String? createDate;
  String? modifiedDate;
  String? role;
  String? token;
  String? profilePath;
  String? smemberId;
  String? smemberName;
  String? smemberNickname;

  Smember(
      {this.createDate,
      this.modifiedDate,
      this.role,
      this.token,
      this.profilePath,
      this.smemberId,
      this.smemberName,
      this.smemberNickname});

  Smember.fromJson(Map<String, dynamic> json) {
    createDate = json['createDate'];
    modifiedDate = json['modifiedDate'];
    role = json['role'];
    token = json['token'];
    profilePath = json['profile_path'];
    smemberId = json['smember_id'];
    smemberName = json['smember_name'];
    smemberNickname = json['smember_nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createDate'] = this.createDate;
    data['modifiedDate'] = this.modifiedDate;
    data['role'] = this.role;
    data['token'] = this.token;
    data['profile_path'] = this.profilePath;
    data['smember_id'] = this.smemberId;
    data['smember_name'] = this.smemberName;
    data['smember_nickname'] = this.smemberNickname;
    return data;
  }
}

class Bmember {
  String? createDate;
  String? modifiedDate;
  int? canPost;
  String? token;
  int? isVerified;
  String? profilePath;
  String? bmemberId;
  String? bmemberName;
  String? bmemberBirth;
  String? bmemberNickname;

  Bmember(
      {this.createDate,
      this.modifiedDate,
      this.canPost,
      this.token,
      this.isVerified,
      this.profilePath,
      this.bmemberId,
      this.bmemberName,
      this.bmemberBirth,
      this.bmemberNickname});

  Bmember.fromJson(Map<String, dynamic> json) {
    createDate = json['createDate'];
    modifiedDate = json['modifiedDate'];
    canPost = json['can_post'];
    token = json['token'];
    isVerified = json['is_verified'];
    profilePath = json['profile_path'];
    bmemberId = json['bmember_id'];
    bmemberName = json['bmember_name'];
    bmemberBirth = json['bmember_birth'];
    bmemberNickname = json['bmember_nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createDate'] = this.createDate;
    data['modifiedDate'] = this.modifiedDate;
    data['can_post'] = this.canPost;
    data['token'] = this.token;
    data['is_verified'] = this.isVerified;
    data['profile_path'] = this.profilePath;
    data['bmember_id'] = this.bmemberId;
    data['bmember_name'] = this.bmemberName;
    data['bmember_birth'] = this.bmemberBirth;
    data['bmember_nickname'] = this.bmemberNickname;
    return data;
  }
}

class Review {
  int? reviewId;
  String? reviewImg;
  String? reviewTxt;
  String? reviewDate;

  Review({this.reviewId, this.reviewImg, this.reviewTxt, this.reviewDate});

  Review.fromJson(Map<String, dynamic> json) {
    reviewId = json['review_id'];
    reviewImg = json['review_img'];
    reviewTxt = json['review_txt'];
    reviewDate = json['review_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_id'] = this.reviewId;
    data['review_img'] = this.reviewImg;
    data['review_txt'] = this.reviewTxt;
    data['review_date'] = this.reviewDate;
    return data;
  }
}

class ViewPostingService extends ChangeNotifier {
  static const platform = MethodChannel('fcm_default_channel');
  List<ViewPosting> allPostCompleteList = [];
  List<ViewPosting> allPostInCompleteList = [];
  List<Spon?> cart = [];
  Review? review;
  int TotalSupporterMoney = 0;
  late ViewPosting nowView;

  ViewPostingService() {
    getAllSuppViewPosts();
  }

  void getAllSuppViewPosts() async {
    // 완료된 목록 가져오기
    try {
      Response res = await Dio().get(
        "http://15.165.106.139:8080/viewPosting",
      );
      if (res.statusCode == 200) {
        print("후원자 게시글 GET 성공");
        allPostCompleteList.clear();
        allPostInCompleteList.clear();

        for (Map<String, dynamic> item in res.data) {
          ViewPosting Posts = ViewPosting.fromJson(item);

          if (Posts.postState == 1) {
            // 완료됨
            allPostCompleteList.add(Posts);
          } else {
            // 미완료
            allPostInCompleteList.add(Posts);
          }
        }
        notifyListeners();
      }
    } catch (e) {
      print("후원자 게시글 GET 실패");
    }
  }

  // 현재 view 선택.
  Future<void> selectNowView(int idx) async {
    nowView = allPostInCompleteList[idx];

    notifyListeners();
  }

  Future<void> selectComNowView(int idx) async {
    nowView = allPostCompleteList[idx];

    notifyListeners();
  }

  // 장바구니 채우기
  void putCart() {
    cart = [...nowView.spon!];
    getTotalCount();
    notifyListeners();
  }

  // 장바구니 특정 항목 삭제
  bool deleteCartItem(int? sponId) {
    if (cart!.length == 1) {
      return false; // 상품 1개일시 무시
    }
    for (int i = 0; i < cart!.length; i++) {
      if (cart[i]!.sponId == sponId) cart!.removeAt(i);
    }

    getTotalCount();

    notifyListeners();

    return true;
  }

  // 장바구니 계산
  void getTotalCount() {
    TotalSupporterMoney = 0;
    for (Spon? sgd in cart) {
      // 총 후원 예상 금액
      TotalSupporterMoney += sgd!.ingredients!.price!;
    }

    notifyListeners();
  }

  // 장바구니 결제
  Future<bool> payCartProduct(String? smemberId) async {
    print(cart[0]!.sponId);
    print(smemberId);
    try {
      Response response = await Dio().post(
        "http://15.165.106.139:8080/sMember/kakaoPay/${cart[0]!.sponId}/${smemberId}",
      );
      if (response.statusCode == 200) {
        print('[후원자] 후원 성공! -> 카카오 결제페이지로 연결');
        print(response.data);
      }
    } catch (e) {
      return false;
    }

    return false;
  }

  // 리뷰글 확인
  Future<void> getReview(int? postId) async {
    Response res = await Dio().get(
      "http://15.165.106.139:8080/viewPosting/${postId}",
    );
    try {
      review = Review.fromJson(res.data['review']);
    } catch (e) {
      review = null;
    }
    notifyListeners();
  }
}
