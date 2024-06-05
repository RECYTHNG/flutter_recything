import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/constants/image_constant.dart';
import 'package:recything_application/constants/spacing_constant.dart';
import 'package:recything_application/constants/text_style_constant.dart';
import 'package:recything_application/models/faq/get_all_faq_model.dart';
import 'package:recything_application/models/faq/search_faq_model.dart';
import 'package:recything_application/screens/customer_service/faq/content/detail_answer_faq_or_other/detail_answer_faq_or_other_screen.dart';
import 'package:recything_application/screens/customer_service/faq/content/search_result_customer_service/search_result_customer_service_screen.dart';
import 'package:recything_application/screens/customer_service/faq/content/syarat_dan_ketentuan_customer_sevice_screen/syarat_dan_ketentuan_customer_service_screen.dart';
import 'package:recything_application/screens/customer_service/faq/content/topic_category_customer_service/topic_category_customer_service_screen.dart';
import 'package:recything_application/screens/customer_service/faq/widgets/container_remin_customer_service_widget.dart';
import 'package:recything_application/screens/customer_service/faq/widgets/item_category_customer_service_widget.dart';
import 'package:recything_application/screens/customer_service/faq/widgets/item_list_faq_widget.dart';
import 'package:recything_application/services/faq_services/get_all_faq_service.dart';
import 'package:recything_application/services/faq_services/search_faq_service.dart';
import 'package:recything_application/widgets/global_loading_widget.dart';
import 'package:recything_application/widgets/global_search_bar.dart';

class CustomerServiceScreen extends StatefulWidget {
  const CustomerServiceScreen({super.key});

  @override
  State<CustomerServiceScreen> createState() => _CustomerServiceScreenState();
}

class _CustomerServiceScreenState extends State<CustomerServiceScreen> {
  final TextEditingController _searchController = TextEditingController();
  final GetAllFaqService _faqService = GetAllFaqService();
  var formKey = GlobalKey<FormState>();
  List<DatumSearch> searchResults = [];
  List<Datum>? _faqData;
  bool _isLoading = true;
  bool isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchFaqData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchFaqData() async {
    try {
      final faqData = await _faqService.getAllFaq();
      setState(() {
        faqData.data?.shuffle();
        _faqData = faqData.data?.take(3).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _searchFaq(String query) async {
    setState(() {
      isLoading = true;
    });

    try {
      final searchResult = await SearchFaqService().getSearchFaq(query: query);
      setState(() {
        searchResults = searchResult.data ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        searchResults = [];
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kami Siap Membantu Anda',
                  style: TextStyleConstant.boldSubtitle.copyWith(
                    fontSize: 16.0,
                    color: ColorConstant.netralColor900,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SpacingConstant.verticalSpacing300,
                GlobalSearchBar(
                  height: 40.0,
                  width: double.infinity,
                  hintText: 'Search',
                  controller: _searchController,
                  onSubmitted: (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SearchResultCustomerService(query: value),
                      ),
                    );
                  },
                ),
                SpacingConstant.verticalSpacing300,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ItemCategoryCustomerService(
                          title: 'Profil',
                          image: ImageConstant.profileCutomerService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TopicCategoryCustomerServiceScreen(
                                        title: 'Profil', category: 'profil'),
                              ),
                            );
                          },
                        ),
                        ItemCategoryCustomerService(
                          title: 'Littering',
                          image: ImageConstant.litteringCutomerService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TopicCategoryCustomerServiceScreen(
                                  title: 'Littering',
                                  category: 'littering',
                                ),
                              ),
                            );
                          },
                        ),
                        ItemCategoryCustomerService(
                          title: 'Rubbish',
                          image: ImageConstant.rubbishCutomerService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TopicCategoryCustomerServiceScreen(
                                  title: 'Rubbish',
                                  category: 'rubbish',
                                ),
                              ),
                            );
                          },
                        ),
                        ItemCategoryCustomerService(
                          title: 'Misi',
                          image: ImageConstant.misiCutomerService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TopicCategoryCustomerServiceScreen(
                                  title: 'Misi',
                                  category: 'misi',
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SpacingConstant.verticalSpacing400,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ItemCategoryCustomerService(
                          title: 'Lokasi Sampah',
                          image: ImageConstant.lokasiCutomerService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TopicCategoryCustomerServiceScreen(
                                  title: 'Lokasi Sampah',
                                  category: 'lokasi sampah',
                                ),
                              ),
                            );
                          },
                        ),
                        ItemCategoryCustomerService(
                          title: 'Poin',
                          image: ImageConstant.poinService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TopicCategoryCustomerServiceScreen(
                                  title: 'Poin',
                                  category: 'poin dan level',
                                ),
                              ),
                            );
                          },
                        ),
                        ItemCategoryCustomerService(
                          title: 'Artikel',
                          image: ImageConstant.artikelCutomerService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TopicCategoryCustomerServiceScreen(
                                  title: 'Artikel',
                                  category: 'artikel',
                                ),
                              ),
                            );
                          },
                        ),
                        ItemCategoryCustomerService(
                          title: 'Syarat &\nKetentuan',
                          image: ImageConstant.snkCutomerService,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SyaratDanKetentuanCustomerServiceScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SpacingConstant.verticalSpacing400,
                const Divider(
                  color: ColorConstant.netralColor500,
                  thickness: 1.0,
                ),
                SpacingConstant.verticalSpacing400,
                Text(
                  'Pertanyaan yang sering diajukan',
                  style: TextStyleConstant.semiboldParagraph.copyWith(
                    fontSize: 14.0,
                    color: ColorConstant.netralColor600,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SpacingConstant.verticalSpacing200,
                if (_isLoading)
                  const Center(
                    child: MyLoading(),
                  )
                else if (_error != null)
                  Center(
                    child: Text('Error: $_error'),
                  )
                else if (_faqData == null || _faqData!.isEmpty)
                  const Center(
                    child: Text('Tidak Ada Data'),
                  )
                else
                  ..._faqData!.map(
                    (faq) {
                      return ItemListFaqWidget(
                        question: faq.question ?? '',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailAnswerFAQorOtherScreen(
                                question: faq.question ?? '',
                                answer: faq.answer ?? '',
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                SpacingConstant.verticalSpacing300,
                const ReMinCustomerServiceWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
