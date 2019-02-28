import 'package:flutter/material.dart';
import 'package:movie_app/media_list.dart';
class Home extends StatefulWidget
{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>
{
  int _indexPage;
  PageController pageController =PageController();
  @override
  void initState()
  {
    super.initState();
    pageController.addListener(
      (){
        
        setState(()
        {
          _indexPage =pageController.page.toInt();
          print('indice actual:'+_indexPage.toString());
        });
      }
    );
    //_loadJson();
  }
  /*_loadJson() async 
  {

    //String data = await HttpHandler().fetchMovies();
    //print(data);
  }*/
  void tapFooterTab(int index)
  {
    setState(() {
      pageController.jumpToPage(index);
    });
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutt Movies'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: (){},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Material(),),
              ListTile(
            title: Text('Peliculas'),
            trailing: Icon(Icons.local_movies),
          ),
          Divider(
            height: 5.0,
          ),
          ListTile(
            title: Text('Televisión'),
            trailing: Icon(Icons.live_tv),
          ),
          Divider(
            height: 5.0,
          ),
          ListTile(
            title: Text('Cerrar'),
            trailing: Icon(Icons.close),
            onTap: ()=> Navigator.of(context).pop(),
          ),
          ],
        ) 
      ),
      body: PageView(
        controller: pageController,
        children: <Widget>[
          MediaList(),
          Text('segundo'),
          Text('tercero')
        ]
      ),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _indexPage,
        onTap: tapFooterTab,
        items: _getFooterItems(),
      ),
    );
  }
  List<BottomNavigationBarItem> _getFooterItems()
  {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.thumb_up),
        title: Text('Populares')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        title: Text('Estrenos')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star_border),
        title: Text('Mejor valoradas')
      )
    ];
  }
}