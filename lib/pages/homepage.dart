// ignore_for_file: non_constant_identifier_names

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_brand_palettes/flutter_brand_palettes.dart';
import 'package:flutter/material.dart';
import '../global.dart';
import '../helpers/currency_convert_api.dart';
import 'package:provider/provider.dart';
import '../modals/currency_convert.dart';
import '../modals/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<CurrencyConvert?> future;

  static final _Con = const GoogleGrad().colors;
  static final _Con1 = const InstagramGrad().colors;

  TextEditingController amtController = TextEditingController();

  TextStyle myStyle = const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();
    future = CurrencyConvertAPI.weatherAPI
        .currencyConvertorAPI(from: "USD", to: "INR", amt: 1);

    amtController.text = "1";
  }

  String fromCurrency = "USD";
  String toCurrency = "INR";

  List img = [
    "https://avatars.mds.yandex.net/i?id=8293654e8bfe30dedcd505683a89594d20e6b345-8527116-images-thumbs&n=13",
    "https://avatars.mds.yandex.net/i?id=d9b5ba559f1d21536b2c32d8c6867c6f9af8819e-8437558-images-thumbs&n=13",
    "https://avatars.mds.yandex.net/i?id=5c0c47a3413101e29bba45de9cb3240dd6cc6f18-8264916-images-thumbs&n=13",
    "https://avatars.mds.yandex.net/i?id=ba7bd9f66ae198955b5d8096e1a118372ec5340d-7546766-images-thumbs&n=13",
    "https://avatars.mds.yandex.net/i?id=cd9a51217e4bea99a78509cc2d013b0dfaf68b24-8497122-images-thumbs&n=13",
    "https://avatars.mds.yandex.net/i?id=005af3a1e15a623e7dfa57a932925c057f8610a0-8310482-images-thumbs&n=13",
    "https://yandex-images.clstorage.net/J954LTg01/ac8202t_GSt/4QYXNDH8M4zLL028Iqt6NKRxZRORJoc53eaGa0-EtE4Q08UUoxZVWFMyIdVNQOJ1jXx2M4SFmhaCScEtq7ox_jUXxDL2b_EMiy-O_mRpO_ZmcqcSlCdHr8g-HGKGTS9TnM_NXj2EVE2TZqZTDRegLAM6Iv7aWwxFi9zXenoq7GWthZI1vGm0z0IxgP6p5jGycn9pmwZoWLDa91BnjAvr0d0HgV30ylCFlOzqychdYGcMr256FVrCjUaeGLp8beago4je-Pfme0jB8kr-rGKwcTR25NxPKNg7XXPZ50TBKx7RyIGdNQufS5ur40QA0ecmxyvh_pQYDoeA3ptzO2qoKWGP2zy9bbZGxzrCd-Gucb-8d6QbQ6RVcpAynuJOzi2UHAdHXr8LEAcZ6-uIBtarKIwjpnAY3woCQVHXvn9s4S2pAp26t2q7SAs8B37habJ89nIoUo9gXH_Y8RmvS4FqUxDBwJ83TBmLkqRmDYhXoiEK4Wh2FJwNAIvRkLA9ZGeqp8pdtD-us0SLdUg36O_xOTe07tWLLVs6EXVV4QPMq1NVwYAQPY9Yh59vI8BHFuauyWkpd1zbAkDK3BH0NGau5OvJlPb8ojpITTVPPm8g-H50MeIVR2wUfhAw2-KKRSDQGwZOnrzMEk8eLmnBARXpakQkL_tRmgpOwt-ZPbAiJyyrydbztG3wTsd1SD-kaDM2e7yq1YPl3L6VuN3jw4QtU9WDDB30SpmD2W9jDoDX5WcPIC45GFPOh0AYF3k6bKZoLM7ZdPNq88ZDPA79qCGwOLW27JNPYJq7XblYKEMDIdNexA8dusLWQpxr4M1E3WjjhCBvudJbSsGBlV87t6znpOcKW3B5YrMGS7SBv-enffe5d6VdASlds9Dyl6dMDuMZHQ1NHT9AlU_ZYaJNx15u743gqH2cV8LJil_asr1l4W3igpV09qZ8jkc-xfUk5_h5OjJoW8_t03DZeh9rCE",
    "https://avatars.mds.yandex.net/i?id=106837eb25979de6f29494479709a97905efcc49-9097932-images-thumbs&n=13",
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text("Currency Convertor"),
                backgroundColor: Colors.black,
                actions: [
                  IconButton(
                      icon: Icon(themeNotifier.isDark
                          ? Icons.nightlight_round
                          : Icons.wb_sunny),
                      onPressed: () {
                        themeNotifier.isDark
                            ? themeNotifier.isDark = false
                            : themeNotifier.isDark = true;
                      }),
                ],
              ),
              body: FutureBuilder(
                future: future,
                builder: (context, snapShot) {
                  if (snapShot.hasError) {
                    return Center(
                      child: Text("${snapShot.error}"),
                    );
                  } else if (snapShot.hasData) {
                    CurrencyConvert? data = snapShot.data as CurrencyConvert?;

                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          CarouselSlider(
                              items: [
                                ...img.map((e) => Container(
                                  margin: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage(e),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                ),
                              ],
                              options: CarouselOptions(
                                height: 500,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration: const Duration(seconds: 2),
                                viewportFraction: 0.8,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: _Con1),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "From",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        DropdownButtonFormField(
                                          value: fromCurrency,
                                          onChanged: (val) {
                                            setState(() {
                                              fromCurrency = val!.toString();
                                            });
                                          },
                                          items: Global.currency.map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "To",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        DropdownButtonFormField(
                                          value: toCurrency,
                                          onChanged: (val) {
                                            setState(() {
                                              toCurrency = val!.toString();
                                            });
                                          },
                                          items: Global.currency.map((e) {
                                            return DropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Enter Amount  :",
                                style: myStyle,
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.only(left: 20),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    controller: amtController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              //color: Global.appColor.withOpacity(0.2),
                            ),
                            child: Text(
                              "Result  :  ${data!.difference}",
                              style: const TextStyle(
                                //color: Global.appColor,
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                if (amtController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      //  backgroundColor: Global.appColor,
                                      behavior: SnackBarBehavior.floating,
                                      content: Text("Please Enter Amount"),
                                    ),
                                  );
                                } else {
                                  int amt = int.parse(amtController.text);
                                  setState(() {
                                    future = CurrencyConvertAPI.weatherAPI
                                        .currencyConvertorAPI(
                                      from: fromCurrency,
                                      to: toCurrency,
                                      amt: amt,
                                    );
                                  });
                                }
                              },
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: _Con)
                                ),
                                child: Center(child: Text("CONVERT",style: myStyle),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: LoadingAnimationWidget.discreteCircle(
                      color: Colors.black, size: 50,
                    ),
                  );
                },
              ),
            );
    });
  }
}
