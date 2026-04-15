// ignore_for_file: use_build_context_synchronously

import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:farmer_assistance/application/pages/market_trends/bloc/price_prediction_bloc.dart';
import 'package:farmer_assistance/application/pages/market_trends/constants/price_prediction_constants.dart';
import 'package:farmer_assistance/application/pages/market_trends/widgets/price_prediction_form_card.dart';
import 'package:farmer_assistance/application/pages/market_trends/widgets/price_prediction_header_card.dart';
import 'package:farmer_assistance/application/pages/market_trends/widgets/price_prediction_result_card.dart';
import 'package:farmer_assistance/di/di.dart';
import 'package:farmer_assistance/domain/models/price_prediction_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MarketTrendsPage extends StatelessWidget {
  const MarketTrendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PricePredictionBloc>(),
      child: const _MarketTrendsContent(),
    );
  }
}

class _MarketTrendsContent extends StatefulWidget {
  const _MarketTrendsContent();

  @override
  State<_MarketTrendsContent> createState() => _MarketTrendsContentState();
}

class _MarketTrendsContentState extends State<_MarketTrendsContent> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedDivision;
  String? _selectedDistrict;
  String? _selectedMarket;
  String? _selectedCategory;
  String? _selectedCommodity;
  String? _selectedUnit;
  String? _selectedPriceType;
  String? _selectedPriceFlag;

  final _latController = TextEditingController();
  final _lonController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  void dispose() {
    _latController.dispose();
    _lonController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _onDivisionChanged(String? value) {
    setState(() {
      _selectedDivision = value;
      _selectedDistrict = null;
      _selectedMarket = null;
      _latController.clear();
      _lonController.clear();
    });
  }

  void _onDistrictChanged(String? value) {
    setState(() {
      _selectedDistrict = value;
      _selectedMarket = null;
      _latController.clear();
      _lonController.clear();
    });
  }

  void _onMarketChanged(String? value) {
    setState(() {
      _selectedMarket = value;
      final lat = PricePredictionConstants.getLatitude(value);
      final lon = PricePredictionConstants.getLongitude(value);
      _latController.text = lat != null ? lat.toStringAsFixed(4) : '';
      _lonController.text = lon != null ? lon.toStringAsFixed(4) : '';
    });
  }

  void _onCategoryChanged(String? value) {
    setState(() {
      _selectedCategory = value;
      _selectedCommodity = null;
    });
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppTheme.primaryTeal,
              onPrimary: Colors.white,
              surface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _showMissingFieldSnackBar(String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppTheme.errorRed,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
  }

  Future<void> _predict() async {
    // Validate text fields (date)
    if (!(_formKey.currentState?.validate() ?? false)) return;

    // Manual validation for dropdowns (InkWell fields aren't FormFields)
    if (_selectedDivision == null) {
      _showMissingFieldSnackBar('Please select a Division');
      return;
    }
    if (_selectedDistrict == null) {
      _showMissingFieldSnackBar('Please select a District');
      return;
    }
    if (_selectedMarket == null) {
      _showMissingFieldSnackBar('Please select a Market');
      return;
    }
    if (_selectedCategory == null) {
      _showMissingFieldSnackBar('Please select a Category');
      return;
    }
    if (_selectedCommodity == null) {
      _showMissingFieldSnackBar('Please select a Commodity');
      return;
    }
    if (_selectedUnit == null) {
      _showMissingFieldSnackBar('Please select a Unit');
      return;
    }
    if (_selectedPriceType == null) {
      _showMissingFieldSnackBar('Please select a Price Type');
      return;
    }
    if (_selectedPriceFlag == null) {
      _showMissingFieldSnackBar('Please select a Price Flag');
      return;
    }

    final lat = double.tryParse(_latController.text) ?? 0.0;
    final lon = double.tryParse(_lonController.text) ?? 0.0;

    context.read<PricePredictionBloc>().add(
      PricePredictionEvent.started(
        data: PricePredictionRequestModel(
          admin1: _selectedDivision,
          admin2: _selectedDistrict,
          market: _selectedMarket,
          latitude: lat,
          longitude: lon,
          category: _selectedCategory,
          commodity: _selectedCommodity,
          unit: _selectedUnit,
          pricetype: _selectedPriceType,
          priceflag: _selectedPriceFlag,
          date: _dateController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryTeal,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Market Trends',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.pageTopTint,
              AppTheme.pageBottomTint,
            ],
            stops: [0, 0.55],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PricePredictionHeaderCard(),
                  const SizedBox(height: 16),

                  PricePredictionFormCard(
                    selectedDivision: _selectedDivision,
                    selectedDistrict: _selectedDistrict,
                    selectedMarket: _selectedMarket,
                    selectedCategory: _selectedCategory,
                    selectedCommodity: _selectedCommodity,
                    selectedUnit: _selectedUnit,
                    selectedPriceType: _selectedPriceType,
                    selectedPriceFlag: _selectedPriceFlag,
                    latitudeController: _latController,
                    longitudeController: _lonController,
                    dateController: _dateController,
                    onDivisionChanged: _onDivisionChanged,
                    onDistrictChanged: _onDistrictChanged,
                    onMarketChanged: _onMarketChanged,
                    onCategoryChanged: _onCategoryChanged,
                    onCommodityChanged: (v) =>
                        setState(() => _selectedCommodity = v),
                    onUnitChanged: (v) => setState(() => _selectedUnit = v),
                    onPriceTypeChanged: (v) =>
                        setState(() => _selectedPriceType = v),
                    onPriceFlagChanged: (v) =>
                        setState(() => _selectedPriceFlag = v),
                    onPickDate: _pickDate,
                  ),

                  const SizedBox(height: 14),

                  BlocConsumer<PricePredictionBloc, PricePredictionState>(
                    listener: (context, state) {
                      if (state is ErrorPricePredictionState) {
                        ScaffoldMessenger.of(context)
                          ..clearSnackBars()
                          ..showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                              backgroundColor: AppTheme.errorRed,
                            ),
                          );
                      }
                      if (state is LoadedPricePredictionState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Price prediction ready!'),
                            backgroundColor: AppTheme.primaryTeal,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      final isLoading = state is LoadingPricePredictionState;

                      return Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: isLoading ? null : _predict,
                              icon: isLoading
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    )
                                  : const Icon(Icons.auto_graph),
                              label: Text(
                                isLoading
                                    ? 'Predicting...'
                                    : 'Predict Market Price',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 54),
                                backgroundColor: AppTheme.primaryTeal,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                disabledBackgroundColor:
                                    AppTheme.primaryTeal
                                        .withValues(alpha: 0.6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                          ),

                          if (state is LoadedPricePredictionState) ...[
                            const SizedBox(height: 20),
                            PricePredictionResultCard(result: state.data),
                          ],
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
