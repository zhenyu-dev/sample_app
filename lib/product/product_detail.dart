import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_app/models/nav.dart';
import 'package:sample_app/product/product.dart';
import 'package:sample_app/widgets/base_app_bar.dart';
import 'package:sample_app/widgets/base_list_tile.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail(this.product);

  final Product product;
  final Nav _share = Nav(
    icon: Icons.share,
    label: '分享',
  );
  final Nav _fav = Nav(
    icon: Icons.favorite,
    label: '关注',
  );
  final Nav _shop = Nav(
    icon: Icons.shop,
    label: '店铺',
  );
  final Color _highlightColor = Color(0xFFFF5B5A);
  final List<String> _tags = <String>[
    '正品保证',
    '7天退换',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(),
        body: GestureDetector(
          child: Column(
            children: <Widget>[
              new BottomSheetController(),
              // 图片
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // 商品介绍
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(21),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        top: ScreenUtil().setWidth(11),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: ScreenUtil().setWidth(600),
                            ),
                            child: Text(
                              product.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(28),
                                color: Color(0xFF333333),
                              ),
                            ),
                          ),
                          Wrap(
                            direction: Axis.vertical,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              Icon(
                                _share.icon,
                                color: _highlightColor,
                                size: ScreenUtil().setWidth(33),
                              ),
                              Text(
                                _share.label,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(24),
                                  color: _highlightColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: ScreenUtil().setWidth(21),
                      ),
                      child: Text(
                        '￥ ${product.price}',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(38),
                          color: _highlightColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: ScreenUtil().setWidth(27),
                        bottom: ScreenUtil().setWidth(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '快递：0.00~20.00',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(21),
                              color: Color(0xFFC2C2C2),
                            ),
                          ),
                          Text(
                            '库存：936',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(21),
                              color: Color(0xFFC2C2C2),
                            ),
                          ),
                          Text(
                            '河南省 郑州市',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(21),
                              color: Color(0xFFC2C2C2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 分割线
                    Container(
                      color: Color(0xFFEEEEEE),
                      height: ScreenUtil().setWidth(1),
                      child: Divider(),
                    ),
                    // 会员优惠
                    Container(
                      height: ScreenUtil().setWidth(80),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '会员',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(26),
                              color: Color(0xFF666666),
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(47),
                          ),
                          Container(
                            height: ScreenUtil().setWidth(36),
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(8),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: ScreenUtil().setWidth(2),
                                color: _highlightColor,
                              ),
                              borderRadius: BorderRadius.circular(
                                  ScreenUtil().setWidth(5)),
                            ),
                            child: Center(
                              child: Text(
                                'VIP会员卡',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(22),
                                  color: _highlightColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(8),
                          ),
                          Text(
                            '可享受',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(22),
                              color: Color(0xFF666666),
                            ),
                          ),
                          Text(
                            '￥254.6',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(22),
                              color: _highlightColor,
                            ),
                          ),
                          Text(
                            '的价格',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(22),
                              color: Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 产品标签
                    Container(
                      color: Color(0xFFF3F3F3),
                      height: ScreenUtil().setWidth(96),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _tags.length,
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(4),
                              ),
                              Text(
                                _tags[index],
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(24),
                                  color: Color(0xFF323232),
                                ),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(53),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // 选择数量
              BaseListTile(
                title: '请选择数量',
                trailing: Icon(
                  Icons.chevron_right,
                  color: Color(0xFF999999),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(20),
              ),
              // 店铺
              Container(
                color: Colors.white,
                height: ScreenUtil().setWidth(130),
                padding: EdgeInsets.only(
                  right: ScreenUtil().setWidth(44),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(24),
                            right: ScreenUtil().setWidth(19),
                          ),
                          width: ScreenUtil().setWidth(99),
                          height: ScreenUtil().setWidth(99),
                          child: Image.asset(
                            'assets/images/i2.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          '媓钻官方商城',
                          style: TextStyle(
                            fontSize: ScreenUtil().setWidth(28),
                            color: Color(0xFF323232),
                          ),
                        )
                      ],
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: ScreenUtil().setWidth(56),
                      ),
                      child: OutlineButton(
                        color: Colors.white,
                        borderSide: new BorderSide(
                          color: Color(0xFF7C7C7C),
                        ),
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setWidth(28),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          '进店逛逛',
                          style: TextStyle(
                            fontSize: ScreenUtil().setWidth(28),
                            color: Color(0xFF7C7C7C),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // 操作
              Container(
                height: ScreenUtil().setWidth(95),
                child: Row(children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(240),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  _fav.icon,
                                  color: Color(0xFFFD5454),
                                ),
                                Text(
                                  _fav.label,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(22),
                                    color: Color(0xFFFD5454),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  _shop.icon,
                                  color: Color(0xFFFD5454),
                                ),
                                Text(
                                  _shop.label,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(22),
                                    color: Color(0xFFFD5454),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: double.infinity,
                        maxHeight: double.infinity,
                      ),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        elevation: 0,
                        color: Color(0xFFFE940F),
                        onPressed: () {},
                        child: Text(
                          '加入购物车',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(28),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(240),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: double.infinity,
                        maxHeight: double.infinity,
                      ),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        elevation: 0,
                        color: Color(0xFFFD5454),
                        onPressed: () {},
                        child: Text(
                          '立即购买',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(28),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}

class BottomSheetController extends StatefulWidget {
  const BottomSheetController({
    Key key,
  }) : super(key: key);

  @override
  _BottomSheetControllerState createState() => _BottomSheetControllerState();
}

class _BottomSheetControllerState extends State<BottomSheetController> {
  bool bottomSheetVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(84),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new BottomSheetControllerItem(
            label: '商品',
            selected: !bottomSheetVisible,
            onPressed: () {
              if (bottomSheetVisible) {
                setState(() {
                  bottomSheetVisible = false;
                });
              }
            },
          ),
          new BottomSheetControllerItem(
            label: '详情',
            selected: bottomSheetVisible,
            onPressed: () {
              setState(() {
                if (!bottomSheetVisible) {
                  setState(() {
                    bottomSheetVisible = true;
                  });
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

class BottomSheetControllerItem extends StatelessWidget {
  const BottomSheetControllerItem({
    Key key,
    @required this.label,
    @required this.onPressed,
    this.selected = false,
  }) : super(key: key);

  final String label;
  final Function() onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: ScreenUtil().setWidth(300),
        child: Stack(
          children: <Widget>[
            Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),
                  color: selected ? Color(0xFFEF4F4E) : Color(0xFF666666),
                ),
              ),
            ),
            selected
                ? Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      color: Color(0xFFEF4F4E),
                      width: ScreenUtil().setWidth(300),
                      height: ScreenUtil().setWidth(3),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
