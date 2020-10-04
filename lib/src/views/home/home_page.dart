part of views;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  double _appBarTop = 0.0;
  TabController _tabController;

  final _tabs = <Widget>[
    Tab(icon: Icon(Icons.camera_alt)),
    Tab(text: 'CHATS'),
    Tab(text: 'STATUS'),
    Tab(text: 'CALLS'),
  ];
  final int _cameraTapIndex = 0;

  double _getappBarHeight(BuildContext context) {
    final double kTabHeight = 46.0;
//    final double kTextAndIconTabHeight = 72.0;
    final double inicatorHeight = 2.0;

    return kToolbarHeight +
        kTabHeight +
        inicatorHeight +
        MediaQuery.of(context).padding.top;
  }

  _buildTabView() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        WillPopScope(
          onWillPop: () {
            _tabController.animateTo(_cameraTapIndex + 1);
            return Future.value(false);
          },
          child: CameraExampleHome(),
        ),
        ChatScreen(),
        StatusScreen(),
        CallsScreen(),
      ],
    );
  }

  _handleAppBarAnimation() {
    if (_tabController.animation.value <= 1.0 && _cameraTapIndex == 0) {
      final value = _tabController.animation.value;
      final appBarHeight = _getappBarHeight(context);

      setState(() {
        _appBarTop = -(1 - value) * appBarHeight;
      });
    }
  }

  _handleTabIndex() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: _tabs.length,
      initialIndex: 1,
    );
    _tabController.animation.addListener(_handleAppBarAnimation);
    _tabController.animation.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.animation.removeListener(_handleAppBarAnimation);
    _tabController.animation.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final marginTopRaw = _appBarTop +
        _getappBarHeight(context) -
        MediaQuery.of(context).padding.top;
    final marginTop = marginTopRaw > 0 ? marginTopRaw : 0.0;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: marginTop,
            ),
            child: _buildTabView(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: _appBarTop,
            child: buildCustomAppBar(
              context,
              'WhatsApp',
              _tabs,
              _tabController,
              _getappBarHeight(context),
            ),
          ),
        ],
      ),
      floatingActionButton: buildFloatingActionButton(
        context,
        _tabController,
      ),
    );
  }

  Widget buildFloatingActionButton(BuildContext context, TabController tabController) {
    if (getIsChatList(tabController)) {
      return FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRouter.selectContact),
        child: Icon(
          Icons.message,
        ),
      );
    } else if (getIsStatusList(tabController)) {
      return FloatingActionButton(
        onPressed: () {
//        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
//          return TabCamera(
//            needScaffold: true,
//          );
//        }));
        },
        child: Icon(Icons.camera_alt),
      );
    } else if (getIsCallList(tabController)) {
      return FloatingActionButton(
        onPressed: () => AppRouter.selectCallContact,
        child: Icon(Icons.add_call),
      );
    }

    return null;
  }
}

bool getIsTabCamera(TabController tabController) {
  return tabController.animation.value < 0.7;
}

bool getIsChatList(TabController tabController) {
  return tabController.animation.value > 0.7 &&
      tabController.animation.value < 1.7;
}

bool getIsStatusList(TabController tabController) {
  return tabController.animation.value > 1.7 &&
      tabController.animation.value < 2.7;
}

bool getIsCallList(TabController tabController) {
  return tabController.animation.value > 2.7;
}

const listLeadingAvatarRadius = 25.0;


