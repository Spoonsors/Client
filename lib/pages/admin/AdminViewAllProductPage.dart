import 'package:flutter/material.dart';
import 'package:save_children_v01/etc/Colors.dart';
import 'package:save_children_v01/pages/admin/AdminProductRegisterPage.dart';

class AdminViewAllProductPageWidget extends StatefulWidget {
  const AdminViewAllProductPageWidget({Key? key}) : super(key: key);

  @override
  _AdminViewAllProductPageWidgetState createState() =>
      _AdminViewAllProductPageWidgetState();
}

class _AdminViewAllProductPageWidgetState
    extends State<AdminViewAllProductPageWidget> {
  List<String> items = [
    "최신 순",
    "가격 순",
  ];
  final List<String> images = [
    "https://cdn2.thecatapi.com/images/bi.jpg",
    "https://cdn2.thecatapi.com/images/63g.jpg",
    "https://cdn2.thecatapi.com/images/a3h.jpg",
    "https://cdn2.thecatapi.com/images/a9m.jpg",
    "https://cdn2.thecatapi.com/images/aph.jpg",
    "https://cdn2.thecatapi.com/images/1rd.jpg",
    "https://cdn2.thecatapi.com/images/1rd.jpg",
    "https://cdn2.thecatapi.com/images/1rd.jpg",
    "https://cdn2.thecatapi.com/images/1rd.jpg",
    "https://cdn2.thecatapi.com/images/1rd.jpg",
  ];
  String selectedItem = "최신 순";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          '현재 등록된 상품들',
          style: TextStyle(
            fontFamily: 'SUITE',
            color: primaryText,
            fontSize: 22.0,
          ),
        ),
        actions: [
          // Logout button
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
            child: IconButton(
              icon: Icon(
                Icons.login_rounded,
                color: secondaryText,
                size: 24.0,
              ),
              onPressed: () {}, // TODO : [admin] Logout 버튼 구현
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
                  child: DropdownButton(
                    underline: SizedBox.shrink(),
                    style: TextStyle(
                      fontFamily: 'SUITE',
                      color: primaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    value: selectedItem,
                    items: items.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) => {
                      setState(() {
                        selectedItem = value!;
                      })
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: primaryText,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: images.length,
              itemBuilder: (context, index) {
                final imageUrl = images[index];
                return ProductDetailsWidget(imageUrl: imageUrl);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const AdminProductRegisterPageWidget()));
        },
        backgroundColor: primary,
        icon: Icon(
          Icons.add,
          color: primaryBackground,
        ),
        elevation: 8.0,
        label: Text(
          '상품 등록',
          style: TextStyle(
            fontFamily: 'SUITE',
            color: primaryBackground,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return // Generated code for this UserList9 Widget...
        Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.0,
                    color: primaryBackground,
                    offset: Offset(0.0, 1.0),
                  )
                ],
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imageUrl,
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '스팸',
                                  style: TextStyle(
                                      fontFamily: 'SUITE',
                                      color: info,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  'CJ 제일제당 스팸 200g',
                                  style: TextStyle(
                                      fontFamily: 'SUITE',
                                      fontSize: 13.0,
                                      color: secondaryText),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  '4500원',
                                  style: TextStyle(
                                    fontFamily: 'SUITE',
                                    fontSize: 12.0,
                                    color: secondaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.delete_sharp,
                                  color: secondaryText,
                                  size: 17.0,
                                ),
                                onPressed: () {}, // TODO : [admin] 등록된 상품 제거 구현
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.mode_edit_sharp,
                                  color: secondaryText,
                                  size: 17.0,
                                ),
                                onPressed: () {}, // TODO : [admin] 등록된 상품 등록 구현
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
