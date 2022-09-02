import 'package:flutter/material.dart';

import 'package:loveadoption/models/cadastroPet.dart';
import 'package:loveadoption/screens/adocaoPage/adocao_pet.dart';
import 'package:loveadoption/screens/cadastroPet/body.dart';
import 'package:loveadoption/screens/home/components/carousel.dart';
import 'package:loveadoption/screens/userPublicac%C3%A3o/user_publicacao.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);


  int _currentPage = 0;
  CadastroPet pet;

  var _listImage = [
    {'id': 0, 'image': 'assets/images/pet1.png'},
    {'id': 1, 'image': 'assets/images/pet2.png'},
    {'id': 2, 'image': 'assets/images/pet3.png'},
    {'id': 3, 'image': 'assets/images/pet4.png'},
  ];

  var _listInicialText = [
    {'id': 0, 'text': ' Adotar cão'},
    {'id': 1, 'text': ' Adotar gato'},
    {'id': 2, 'text': ' Cadastrar adoção'},
    {'id': 3, 'text': ' Publicações'}
  ];

  var _listFinalText = [
    {'id': 0, 'text': 'Visualizar opções de adoção.'},
    {'id': 1, 'text': 'Visualizar opções de adoção.'},
    {'id': 2, 'text': 'Registrar pet para adoção. '},
    {'id': 3, 'text': 'Visualizar suas postagens'}
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF709EE3),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _listImage.length,
                itemBuilder: (_, currentIndex) {
                  bool activePage = currentIndex == _currentPage;

                  return GestureDetector(
                    onTap: () {
                      if (currentIndex == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return AdocaoPage(
                              currentIndex: currentIndex,
                            );
                          }),
                        );
                      } else if (currentIndex == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return AdocaoPage(
                              currentIndex: currentIndex,
                            );
                          }),
                        );
                      } else if (currentIndex == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Body(pet: pet,);
                          }),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return UserPublicacao();
                          }),
                        );
                      }
                    },
                    child: CarouselSlider(
                        activePage: activePage,
                        image: _listImage[currentIndex]['image'],
                        inicialtext: _listInicialText[currentIndex]['text'],
                        finalText: _listFinalText[currentIndex]['text']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
