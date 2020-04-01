import 'package:flutter/material.dart';

final TextStyle menuFont = TextStyle(color: Colors.white, fontSize: 20);
final Color backgroundColor = Color(0xFF383745);

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  double ekranYuksekligi, ekranGenisligi;
  bool menuAcikmi = false;
  String tabName="Ana Sayfa";
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _scaleMenuAnimation;
  Animation<Offset> _menuOffsetAnimation;
  final Duration _duration = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = Tween(begin: 1.0, end: 0.6).animate(_controller);
    _scaleMenuAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _menuOffsetAnimation = Tween(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ekranYuksekligi = MediaQuery.of(context).size.height;
    ekranGenisligi = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            menuOlustur(context),
            deashBoardOlustur(context),
          ],
        ),
      ),
    );
  }

  Widget menuOlustur(BuildContext context) {
    return SlideTransition(
      position: _menuOffsetAnimation,
      child: ScaleTransition(
        scale: _scaleMenuAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 17.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      if (menuAcikmi) {
                        _controller.reverse();
                      } else {
                        _controller.forward();
                      }
                      tabName="Ana Sayfa";
                      menuAcikmi = !menuAcikmi;
                    });
                  },
                  icon: Icon(
                    Icons.home,
                    color: Colors.tealAccent,
                  ),
                  label: Text(
                    "Ana Sayfa",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Text("Ana Sayfa", style: menuFont),
                SizedBox(
                  height: 10,
                ),
                FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      if (menuAcikmi) {
                        _controller.reverse();
                      } else {
                        _controller.forward();
                      }
                      tabName="Servisler";
                      menuAcikmi = !menuAcikmi;
                    });
                  },
                  icon: Icon(
                    Icons.dashboard,
                    color: Colors.tealAccent,
                  ),
                  label: Text(
                    "Servisler",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      if (menuAcikmi) {
                        _controller.reverse();
                      } else {
                        _controller.forward();
                      }
                      tabName="Mesajlar";
                      menuAcikmi = !menuAcikmi;
                    });
                  },
                  icon: Icon(
                    Icons.message,
                    color: Colors.tealAccent,
                  ),
                  label: Text(
                    "Mesajlar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      if (menuAcikmi) {
                        _controller.reverse();
                      } else {
                        _controller.forward();
                      }
                      tabName="İletişim";
                      menuAcikmi = !menuAcikmi;
                    });
                  },
                  icon: Icon(
                    Icons.contacts,
                    color: Colors.tealAccent,
                  ),
                  label: Text(
                    "İletişim",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      if (menuAcikmi) {
                        _controller.reverse();
                      } else {
                        _controller.forward();
                      }
                      tabName="Ayarlar";
                      menuAcikmi = !menuAcikmi;
                    });
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Colors.tealAccent,
                  ),
                  label: Text(
                    "Ayarlar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget deashBoardOlustur(BuildContext context) {
    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: menuAcikmi ? 0.4 * ekranGenisligi : 0,
      right: menuAcikmi ? -0.4 * ekranGenisligi : 0,
      duration: _duration,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          borderRadius:
              menuAcikmi ? BorderRadius.all(Radius.circular(40)) : null,
          elevation: 10,
          color: backgroundColor,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            setState(() {
                              if (menuAcikmi) {
                                _controller.reverse();
                              } else {
                                _controller.forward();
                              }
                              menuAcikmi = !menuAcikmi;
                            });
                          },
                          child: Icon(Icons.menu, color: Colors.white)),
                      Text(tabName,
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                      Icon(Icons.add_circle_outline, color: Colors.white),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                         Container(
                          child: Image.network(
                            "https://assets.imgix.net/hp/snowshoe.jpg?__hstc=158051173.c9493ef12d17c9b7c61ccbd8b9a2af05.1585755462941.1585755462941.1585755462941.1&__hssc=158051173.2.1585755462942&__hsfp=61469213",
                            fit: BoxFit.cover,
                          ),
                          width: 200,
                          margin: EdgeInsets.symmetric(horizontal: 2),
                        ),
                        Container(
                          child: Image.network(
                            "https://cdn.pixabay.com/photo/2015/12/09/01/02/psychedelic-1084082__340.jpg",
                            fit: BoxFit.cover,
                          ),
                          width: 200,
                          margin: EdgeInsets.symmetric(horizontal: 2),
                        ),
                        Container(
                          child: Image.network(
                            "https://images.unsplash.com/photo-1528557692780-8e7be39eafab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
                            fit: BoxFit.cover,
                          ),
                          width: 200,
                          margin: EdgeInsets.symmetric(horizontal: 2),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.teal,
                        ),
                        title: Text("Kullanıcı $index"),
                        trailing: Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                      );
                    },
                    separatorBuilder: (context, item) {
                      return Divider();
                    },
                    itemCount: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
