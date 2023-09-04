import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:save_children_v01/pages/teenager/TeenagerWriteRequestPage.dart';

import '../../model/RecipeModel.dart';
import '../../models/TeenagerViewRecipePageModel.dart';

class TeenagerViewRecipePageWidget extends StatefulWidget {
  const TeenagerViewRecipePageWidget({super.key, required this.recipe});

  final Recipe recipe;

  @override
  _TeenagerViewRecipePageWidgetState createState() =>
      _TeenagerViewRecipePageWidgetState();
}

class _TeenagerViewRecipePageWidgetState
    extends State<TeenagerViewRecipePageWidget> {
  late TeenagerViewRecipePageModel _model;
  late Recipe _recipe;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = TeenagerViewRecipePageModel();
    _recipe = widget.recipe;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> parts = _recipe.rcp_PARTS_DTLS.split(',');
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 3, color: Colors.transparent),
                borderRadius: BorderRadius.circular(100)),
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TeenagerWriteRequestPageWidget(recipe: _recipe)));
            },
            backgroundColor: const Color(0xffffb74d),
            icon: FaIcon(
              FontAwesomeIcons.pen,
              size: 20,
              color: const Color(0xffffffff),
            ),
            elevation: 8,
            label: Text(
              '후원 요청하기',
              style: TextStyle(
                fontFamily: 'SUITE',
                color: const Color(0xffFFFFFF),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          appBar: AppBar(
            title: Text(
              '레시피 상세',
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 240,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.network(
                          _recipe.att_FILE_NO_MK,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Text(
                    _recipe.rcp_NM,
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: Color(0xFF15161E),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: parts.length,
                      itemBuilder: (context, index) {
                        final _part = parts[index];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                            height: 32,
                            decoration: BoxDecoration(
                              color: const Color(0xffff8a80), //색 변화 필요
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xffff8a80),
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: Text(
                                  _part,
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF15161E),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Text(
                    '조리 순서',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF15161E),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.sizeOf(context).width,
                    // height: 700,
                    decoration: BoxDecoration(),
                    child: Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: parts.length,
                            itemBuilder: (context, index) {
                              print(_recipe.manual[index]);
                              if (_recipe.manual[index] != "") {
                                return RecipeStepCard(
                                    recipeExplain: _recipe.manual[index],
                                    recipeImg: _recipe.manual_IMG[index],
                                    idx: index);
                              }
                            },
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          )),
    );
  }
}

class RecipeStepCard extends StatelessWidget {
  const RecipeStepCard(
      {super.key,
      required this.recipeExplain,
      required this.recipeImg,
      required this.idx});

  final String recipeExplain;
  final String recipeImg;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: 100,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      recipeExplain,
                      style: TextStyle(
                        fontFamily: 'SUITE',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                recipeImg,
                width: 160,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
