import 'package:flutter/material.dart';
import 'package:ui/button/index.dart';
import 'package:ui/collapse/index.dart';
import 'package:ui/theme/index.dart';
import 'package:ui/toast/index.dart';

///主页
class Index extends StatefulWidget {
  final Function toggleTheme;

  Index(this.toggleTheme);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  //标题padding
  final double titlePadding = 36.0;

  // 列表左右padding
  final double listPadding = 18.0;

  WeTheme theme;

  //列表
  final list = [
    {
      'title': '表单',
      'icon': 'assets/images/index-icon/icon_nav_form.png',
      'childer': [
        {'title': 'Button', 'url': '/button'},
        {'title': 'Checklist', 'url': '/checklist'},
        {'title': 'Checkbox', 'url': '/checkbox'},
        {'title': 'Radiolist', 'url': '/radiolist'},
        {'title': 'Radio', 'url': '/radio'},
        {'title': 'Input', 'url': '/input'},
        {'title': 'Slider', 'url': '/slider'},
        {'title': 'Uploader', 'url': null},
        {'title': 'Switch', 'url': '/switch'},
        {'title': 'PickerView', 'url': '/picker_view'}
      ]
    },
    {
      'title': '基础组建',
      'icon': 'assets/images/index-icon/icon_nav_layout.png',
      'childer': [
        {'title': 'Badge', 'url': '/badge'},
        {'title': 'Cell', 'url': '/cell'},
        {'title': 'Grid', 'url': '/grid'},
        {'title': 'Icons', 'url': '/icon'},
        {'title': 'Loadmore', 'url': '/loadmore'},
        {'title': 'Spin', 'url': '/spin'}
      ]
    },
    {
      'title': '展示组件',
      'icon': 'assets/images/index-icon/icon_nav_layout.png',
      'childer': [
        {'title': 'Swipe', 'url': '/swipe'},
        {'title': 'Progress', 'url': '/progress'},
        {'title': 'Collapse', 'url': '/collapse'},
        {'title': 'imagePreview', 'url': '/imagePreview'},
        {'title': 'noticeBar', 'url': '/noticeBar'}
      ]
    },
    {
      'title': '操作反馈',
      'icon': 'assets/images/index-icon/icon_nav_feedback.png',
      'childer': [
        {'title': 'Drawer', 'url': '/drawer'},
        {'title': 'Actionsheet', 'url': '/actionsheet'},
        {'title': 'Dialog', 'url': '/dialog'},
        {'title': 'Toast', 'url': '/toast'},
        {'title': 'notify', 'url': '/notify'},
        {'title': 'tip', 'url': '/tip'}
      ]
    },
  ];

  bool isDefault = true;

  @override
  void didChangeDependencies() {
    theme = WeUI.getTheme(context);
    super.didChangeDependencies();
  }

  //主题切换
  void toggleTheme() {
    widget.toggleTheme();
    setState(() {
      isDefault = !isDefault;
      WeToast.info(context)('当前为' + (isDefault ? '默认' : '自定义') + '主题');
    });
  }

  //标题
  Widget buildTitle(bool checked, int index, Widget child) {
    return Opacity(
      opacity: checked ? 0.5 : 1.0,
      child: Padding(
        padding: EdgeInsets.only(top: 25, bottom: 25, left: listPadding, right: listPadding),
        child: Row(
          children: <Widget>[
            Expanded(child: child),
            Image.asset(list[index]['icon'], height: 22.0),
          ],
        ),
      ),
    );
  }

  //item-子视图
  List<Widget> renderSubItem(subList) {
    final List<Widget> widgetList = [];

    subList.forEach((it) {
      final List<Widget> content = [];

      //分界线
      if (subList.indexOf(it) > 0) {
        content.add(Divider(height: 1, color: theme.defaultBorderColor));
      }

      content.add(ListTile(
        title: Text(it['title']),
        trailing: Icon(Icons.keyboard_arrow_right),
      ));

      widgetList.add(Container(
        child: Column(children: content),
      ));
    });
    return widgetList;
  }

  //内容
  Widget buildContent(bool checked, int index, Widget child) {
    return child;
  }

  @override
  Widget build(BuildContext context) {
    final List<WeCollapseItem> children = [];

    final theme = WeUI.getTheme(context);

    list.forEach((it) {
      children.add(WeCollapseItem(
        title: Text(
          it['title'],
          style: TextStyle(fontSize: 16),
        ),
        child: Column(
          children: renderSubItem(it['childer']),
        ),
      ));
    });

    return Scaffold(
      backgroundColor: theme.defaultBorderColor,
      body: ListView(
        children: [
          // head
          Stack(children: [
            Container(
              padding: EdgeInsets.all(36.0),
              child: Column(
                children: [
                  Row(children: [Text('Flutter WeUi', style: TextStyle(fontSize: 25.0))]),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'WeUI 是一套同微信原生视觉体验一致的基础样式库，由微信官方设计团队为微信内网页和微信小程序量身设计，令用户的使用感知更加统一。',
                      style: TextStyle(fontSize: 15.0, color: Color(0xff888888)),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 20,
              child: WeButton(
                isDefault ? '默认主题' : '自定义主题',
                size: WeButtonSize.mini,
                onClick: toggleTheme,
              ),
            )
          ]),
          Container(
            padding: EdgeInsets.only(left: 18.0, right: 18.0, bottom: 10.0),
            child: WeCollapse(
              card: true,
              accordion: true,
              buildTitle: buildTitle,
              buildContent: buildContent,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
