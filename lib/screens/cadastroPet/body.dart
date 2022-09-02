import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loveadoption/Services/Uploadfotos/firebase_uploadFotos_service.dart';
import 'package:loveadoption/Services/publicacao/publicacao_service.dart';
import 'package:loveadoption/screens/cadastroPet/cadastroPet_page.dart';
import 'package:loveadoption/screens/home/home_page.dart';
import 'package:loveadoption/screens/userPublicac%C3%A3o/details.dart';
import 'package:loveadoption/screens/userPublicac%C3%A3o/user_publicacao.dart';
import 'package:loveadoption/screens/widgets/Alert_dialog.dart';
import 'package:loveadoption/screens/widgets/Input-field.dart';
import 'package:loveadoption/screens/widgets/button.dart';
import 'package:loveadoption/screens/widgets/checkBox.dart';
import 'package:loveadoption/screens/widgets/dropdown.dart';
import 'package:loveadoption/screens/widgets/text.dart';
import 'package:loveadoption/Services/services.dart';
import 'package:loveadoption/models/cadastroPet.dart';
import 'package:loveadoption/Services/Auth/Auth.dart';

class Body extends StatefulWidget {
  final Function(CadastroPet) cadastroPetHandler;
  final CadastroPet pet;

  const Body({Key key, this.cadastroPetHandler, this.pet}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CadastroPet petObject;
  File _image;
  File get selectedImage => _image;
  int _radiovalue = 0;

  var selectedCidade,
      selectedEstado,
      selectedEstagioVida,
      selectedSexopet,
      selectedPorte,
      selectedCurrency,
      selectedType;

  bool checkBoxVacinado = false;
  bool checkBoxMicrochipado = false;
  bool checkBoxCastrado = false;
  bool get _petEddit => widget.pet != null;

  final _formKey = GlobalKey<FormState>();
  final CadastroPetService _cadastroPetService =
      instance.get<CadastroPetService>();

  final CloudStorageService _storageService = instance<CloudStorageService>();

  TextEditingController _nomePetController;
  TextEditingController _cidadePetController;

  List<String> _estagioVida = <String>['Filhote', 'Adulto', 'Idade avançada'];
  List<String> _sexoPet = <String>[
    'Fêmea',
    'Macho',
  ];
  List<String> _porte = <String>['Pequeno', 'Médio', 'Grande'];

  @override
  // ignore: override_on_non_overriding_member
  void _radioValueChange(int value) {
    setState(() {
      _radiovalue = value;

      switch (_radiovalue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _nomePetController =
        TextEditingController(text: _petEddit ? widget.pet.nomePet : "");
    _cidadePetController =
        TextEditingController(text: _petEddit ? widget.pet.cidade : "");
  }

  Future selectImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = image;
      }
    });
  }

  void addPet(CadastroPet petObject) async {
    if (widget.pet == null) {
      CloudStorageResult storageResult;

      storageResult = await _storageService.uploadImage(
        imageUpload: _image,
      );

      var result = await _cadastroPetService.createPet(CadastroPet(
          userUid: currentUser.uid,
          nomeUser: nomeCompleto,
          fotoUser: imageUrl,
          photoURL: storageResult.imageUrl,
          nomePet: _nomePetController.text,
          tipo: _radiovalue,
          estado: selectedEstado,
          cidade: _cidadePetController.text,
          estagioVida: selectedEstagioVida,
          porte: selectedPorte,
          sexo: selectedSexopet,
          microchipado: checkBoxMicrochipado,
          vacinado: checkBoxVacinado,
          castrado: checkBoxCastrado));

      if (result is String) {
        var baseDialogOK = BaseAlertDialogOK(
          title: 'Erro!',
          content: 'Publicação não concluída, por favor, tente novamente mais tarde.',
          ok: 'OK',
          okOnPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CadastroPetPage();
            }));
          },
        );
        showDialog(
            context: context, builder: (BuildContext context) => baseDialogOK);
      } else {
        var baseDialogOK = BaseAlertDialogOK(
          title: 'Sucesso!',
          content: 'Publicação realizada com sucesso!',
          ok: 'OK',
          okOnPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CadastroPetPage();
            }));
          },
        );
        showDialog(
            context: context, builder: (BuildContext context) => baseDialogOK);
      }
    } else {
      CloudStorageResult storageResult;

      if (_image != null) {
        storageResult = await _storageService.updateImage(
            imageUpload: _image, petUid: widget.pet.uid);
      }

      var result = _cadastroPetService.updatePet(CadastroPet(
          uid: widget.pet.uid,
          userUid: currentUser.uid,
          nomeUser: nomeCompleto,
          fotoUser: imageUrl,
          photoURL: _image == null ? widget.pet.photoURL : storageResult,
          nomePet: _nomePetController.text,
          tipo: _radiovalue,
          estado: selectedEstado,
          cidade: _cidadePetController.text,
          estagioVida: selectedEstagioVida,
          porte: selectedPorte,
          sexo: selectedSexopet,
          microchipado: checkBoxMicrochipado,
          vacinado: checkBoxVacinado,
          castrado: checkBoxCastrado));

      if (result is String) {
         var baseDialogOK = BaseAlertDialogOK(
          title: 'Erro!',
          content: 'Atualização não concluída, por favor, tente novamente mais tarde.',
          ok: 'OK',
          okOnPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CadastroPetPage();
            }));
          },
        );
        showDialog(
            context: context, builder: (BuildContext context) => baseDialogOK);
      } else {
        var baseDialogOK = BaseAlertDialogOK(
          title: 'Sucesso!',
          content: 'Publicação atualizada com sucesso!',
          ok: 'OK',
          okOnPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UserPublicacao();
            }));
          },
        );
        showDialog(
            context: context, builder: (BuildContext context) => baseDialogOK);
      }
    }
  }

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Color(0xFFFA7D6A6)),
                title: TextWidget(
                  text: _petEddit ? "Atualizar" : "Cadastrar",
                  color: Color(0xFFF807F7F),
                  fontSize: 17,
                ),
                leading: _petEddit
                    ? IconButton(
                        icon: new Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DetailsPublicacaoUser(pet: widget.pet);
                            }),
                          );
                        },
                      )
                    : IconButton(
                        icon: new Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Home();
                            }),
                          );
                        },
                      ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: Color(0xFFFA7D6A6),
                          child: CircleAvatar(
                              radius: 70,
                              child: ClipOval(
                                child: MaterialButton(
                                  padding: EdgeInsets.all(-10),
                                  color: Color(0xFFFC4C4C4),
                                  child: SizedBox(
                                      width: size.width * 2,
                                      height: size.height * 2,
                                      child: (_image != null)
                                          ? Image.file(
                                              _image,
                                              fit: BoxFit.cover,
                                            )
                                          : _petEddit
                                              ? Image.network(
                                                  widget.pet.photoURL,
                                                  fit: BoxFit.cover)
                                              : Image.asset(
                                                  "assets/images/PerfilFundo.png",
                                                  fit: BoxFit.cover,
                                                )),
                                  onPressed: () {
                                    selectImage();
                                  },
                                ),
                              )),
                        )),
                    SizedBox(height: size.height * 0.04),
                    InputField(
                      hintText: "Nome Pet",
                      controller: _nomePetController,
                      tamanho: 0.4,
                    ),
                    SizedBox(height: size.height * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: 0,
                          groupValue: _petEddit ? widget.pet.tipo : _radiovalue,
                          activeColor: Color(0xFFFA7D6A6),
                          onChanged: _radioValueChange,
                        ),
                        TextWidget(
                          text: "Cachorro",
                          color: Colors.black,
                          fontSize: 17,
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Radio(
                            value: 1,
                            groupValue:
                                _petEddit ? widget.pet.tipo : _radiovalue,
                            activeColor: Color(0xFFFA7D6A6),
                            onChanged: _radioValueChange),
                        TextWidget(
                          text: "Gato",
                          color: Colors.black,
                          fontSize: 17,
                        ),
                        SizedBox(
                          width: size. width * 0.04,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: size. height * 0.001,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(color: Color(0xFFFC4C4C4)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size. height * 0.02,
                    ),
                    Column(children: [
                      Row(
                        children: [
                          SizedBox(
                            width: size. width * 0.05
                          ),
                          TextWidget(
                            text: 'Cidade',
                            fontSize: 17,
                          ),
                          SizedBox(
                            width: size. width * 0.05,
                          ),
                          InputField(
                            hintText: 'Digite aqui',
                            controller: _cidadePetController,
                            tamanho: 0.6,
                          ),
                        ],
                      ),
                      SizedBox(height: size. height * 0.015),
                      Row(
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("Estados")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                Text('Carregando...');
                              }
                              if (snapshot.data == null) {
                                return CircularProgressIndicator();
                              }
                              List<DropdownMenuItem> currencyItems = [];
                              for (int i = 0;
                                  i < snapshot.data.docs.length;
                                  i++) {
                                DocumentSnapshot snap = snapshot.data.docs[i];
                                currencyItems.add(
                                  DropdownMenuItem(
                                    child: Container(
                                      child: Text(
                                        snap.data()["Estado"],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.5,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                    value: "${snap.data()['Estado']}",
                                  ),
                                );
                              }
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  Text(
                                    'Estado',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.5,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.05 ,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size. width * 0.09, vertical: 0),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF807F7F),
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    child: DropdownButton(
                                      dropdownColor: Color(0xFFF807F7F),
                                      items: currencyItems,
                                      onChanged: (currencyValue) {
                                        setState(() {
                                          selectedEstado = currencyValue;
                                          print(selectedEstado);
                                        });
                                      },
                                      value: selectedEstado,
                                      isExpanded: false,
                                      iconEnabledColor: Colors.white,
                                      underline: SizedBox(),
                                      hint: TextWidget(
                                        text: _petEddit
                                            ? widget.pet.estado
                                            : 'Escolher',
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            TextWidget(
                              text: 'Estagio de vida',
                              color: Colors.black,
                              fontSize: 17,
                            ),
                            SizedBox(
                              width: size. width * 0.05,
                            ),
                            DropDownString(
                              list: _estagioVida,
                              onChanged: (selectedEstagio) {
                                setState(() {
                                  print(selectedEstagio);
                                  selectedEstagioVida = selectedEstagio;
                                });
                              },
                              value: selectedEstagioVida,
                              hint: TextWidget(
                                text: _petEddit
                                    ? widget.pet.estagioVida
                                    : 'Escolher',
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            )
                          ]),
                      SizedBox(height: size.height * 0.02),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            TextWidget(
                              text: 'Porte',
                              color: Colors.black,
                              fontSize: 17,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DropDownString(
                              list: _porte,
                              onChanged: (selectPorte) {
                                setState(() {
                                  selectedPorte = selectPorte;
                                });
                              },
                              value: selectedPorte,
                              hint: TextWidget(
                                text: _petEddit ? widget.pet.porte : 'Escolher',
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(width: 20),
                            TextWidget(
                              text: 'Sexo',
                              color: Colors.black,
                              fontSize: 17,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DropDownString(
                              list: _sexoPet,
                              onChanged: (selectedSexo) {
                                setState(() {
                                  print(selectedSexo);
                                  selectedSexopet = selectedSexo;
                                });
                              },
                              value: selectedSexopet,
                              hint: TextWidget(
                                text: _petEddit ? widget.pet.sexo : 'Escolher',
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            )
                          ]),
                      SizedBox(height: 20),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 1,
                          width: 350,
                          decoration: BoxDecoration(color: Color(0xFFFC4C4C4)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  CheckBox(
                    value: _petEddit
                        ? checkBoxMicrochipado = widget.pet.microchipado
                        : checkBoxMicrochipado,
                    onChanged: (bool valueMicrochipado) {
                      setState(() {
                        checkBoxMicrochipado = valueMicrochipado;
                      });
                    },
                    text: 'Microchipado',
                  ),
                  CheckBox(
                    value: _petEddit
                        ? checkBoxCastrado = widget.pet.castrado
                        : checkBoxCastrado,
                    onChanged: (bool valueCastrado) {
                      setState(() {
                        checkBoxCastrado = valueCastrado;
                      });
                    },
                    text: 'Castrado',
                  ),
                  CheckBox(
                    value: _petEddit
                        ? checkBoxVacinado = widget.pet.vacinado
                        : checkBoxVacinado,
                    onChanged: (bool valueVacinado) {
                      setState(() {
                        checkBoxVacinado = valueVacinado;
                      });
                    },
                    text: 'Vacinado',
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'roboto',
                        letterSpacing: 0.5,
                        color: Colors.white),
                  ),
                  width: 300,
                  press: () {
                     1  {
                      if (_nomePetController == null ||
                          selectedEstado == null ||
                          selectedEstagioVida == null ||
                          selectedPorte == null ||
                          selectedSexopet == null ||
                          checkBoxCastrado == null ||
                          checkBoxMicrochipado == null ||
                          checkBoxVacinado == null) {
                        _nomePetController.text = widget.pet.nomePet;

                        selectedEstado = widget.pet.estado;
                        selectedEstagioVida = widget.pet.estagioVida;
                        selectedPorte = widget.pet.porte;
                        selectedSexopet = widget.pet.sexo;
                        checkBoxCastrado = widget.pet.castrado;
                        checkBoxMicrochipado = widget.pet.microchipado;
                        checkBoxVacinado = widget.pet.vacinado;
                        addPet(petObject);
                      } else {
                        _nomePetController.text = _nomePetController.text;
                        _cidadePetController.text = _cidadePetController.text;
                        selectedEstado = selectedEstado;
                        selectedEstagioVida = selectedEstagioVida;
                        selectedPorte = selectedPorte;
                        selectedSexopet = selectedSexopet;
                        checkBoxCastrado = checkBoxCastrado;
                        checkBoxMicrochipado = checkBoxMicrochipado;
                        checkBoxVacinado = checkBoxVacinado;
                        addPet(petObject);
                      }
                    }  if (_cidadePetController == null ||
                        selectedEstado == null ||
                        selectedEstagioVida == null ||
                        selectedPorte == null ||
                        selectedSexopet == null) {
                      var baseDialogOk = BaseAlertDialogOK(
                        title: 'Por favor preencha todos os campos.',
                        content:
                            '''Alguns dos campos: Cidade, Estado, Estagio de vida, Porte ou Sexo, não estão preenchidos.
Por favor, preencha todos estes campos para continuar.''',
                        ok: 'OK',
                        okOnPressed: () {
                          Navigator.of(context).pop();
                        },
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => baseDialogOk);
                    } else if(_image == null){
                        
                      var baseDialogOk = BaseAlertDialogOK(
                        title: 'Por favor adicione uma imagem',
                        content:
                            '''Por favor, adicione uma imagem do pet para que alcance mais usuários.''',
                        ok: 'OK',
                        okOnPressed: () {
                          Navigator.of(context).pop();
                        },
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => baseDialogOk);
                    }else {
                      addPet(petObject);
                      print('Click');
                    }
                  }),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
