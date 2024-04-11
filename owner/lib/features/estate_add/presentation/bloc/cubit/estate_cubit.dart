import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../app/service_locator.dart';
import '../../../../../core/utils/google_mpas_tools.dart';
import 'estate_state.dart';

class EstateCubit extends Cubit<EstateState> {
  EstateCubit() : super(EstateInitial());
  bool isMoreDeails = false;
  int index = 0;
  int roomIndex = 0;
  int envIndex = 0;
  int propertyIndex = 0;
  int timeIndex = 0;

  List<XFile> images = [];

  final ImagePicker _picker = ImagePicker();

  void changePropertyIndex(int index) {
    emit(EstateChangeDetailsView());
    propertyIndex = index;
    emit(EstateChangedDetailsView());
  }

  void changeTimeIndex(int index) {
    emit(EstateChangeDetailsView());
    timeIndex = index;
    emit(EstateChangedDetailsView());
  }

  void nextOrForward(int value) {
    emit(EstateChangeDetailsView());
    index = value;
    emit(EstateChangedDetailsView());
  }

  void addImage() async {
    emit(ImagesListState());
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      images.add(pickedImage);
    }
    emit(ImagesListChangedState());
  }

  void removeImage(XFile image) async {
    emit(ImagesListState());
    images.remove(image);
    emit(ImagesListChangedState());
  }

  void clear() {
    images = [];
  }

  void changeRoomIndex(int index) {
    emit(EstateChangeDetailsView());
    roomIndex = index;
    emit(EstateChangedDetailsView());
  }

  void changeEnvIndex(int index) {
    emit(EstateChangeDetailsView());
    envIndex = index;
    emit(EstateChangedDetailsView());
  }

  TextEditingController estateName = TextEditingController();
  TextEditingController estateDesc = TextEditingController();
  GlobalKey<FormState> nameKey = GlobalKey<FormState>();

  String? locationLatitude;
  String? locationLongtitude;
  TextEditingController address = TextEditingController();
  GlobalKey<FormState> locationKey = GlobalKey<FormState>();

  GlobalKey<FormState> extraInfoKey = GlobalKey<FormState>();
  TextEditingController price = TextEditingController();
  bool isChecked = true;
  List<String> titlesTime = ["Daily", "Monthly", "Yearly"];
  void changeCheckState(bool check) {
    if (check != isChecked) {
      emit(EstateInitial());
      isChecked = check;
      emit(EstateChanged());
    }
  }

  //change number of feature
  int numberOfBeds = 0;
  int numberOfBathroom = 0;
  int numberOfBalacon = 0;
  int getValueOfFeature(int type) {
    switch (type) {
      case 1:
        return numberOfBeds;
      case 2:
        return numberOfBathroom;
      case 3:
        return numberOfBalacon;
      default:
        return 0;
    }
  }

  void getLocation(
      {required double locationLatitude,
      required double locationLongtitude}) async {
    emit(VisibilityInital());
    await sl<GoogleMapsTools>()
        .convertPositionToAddress(
            lat: locationLatitude, lon: locationLongtitude)
        .then((value) {
      address.text = '${value.locality}-${value.street}-${value.country}';
    });
    this.locationLatitude = locationLatitude.toString();
    this.locationLongtitude = locationLongtitude.toString();
    emit(VisibilityChanged());
  }

  List<String> getFeature() {
    List<String> features = [];
    if (numberOfBeds > 0) {
      features.add('Beds,$numberOfBeds');
    }
    if (numberOfBathroom > 0) {
      features.add('Bathroom,$numberOfBathroom');
    }
    if (numberOfBalacon > 0) {
      features.add('Balacons,$numberOfBalacon');
    }
    features.add('Rooms,${roomTitles[roomIndex]}');
    return features;
  }

  void changeNumberOfFeature(String operator, int type) {
    emit(ChangeNumberOfFeature());
    if (operator == '+') {
      if (type == 1) {
        numberOfBeds++;
      } else if (type == 2) {
        numberOfBathroom++;
      } else if (type == 3) {
        numberOfBalacon++;
      }
      emit(ChangeNumberOfFeatureDone());
    } else if (operator == '-') {
      if (type == 1 && numberOfBeds > 0) {
        numberOfBeds--;
      } else if (type == 2 && numberOfBathroom > 0) {
        numberOfBathroom--;
      } else if (type == 3 && numberOfBalacon > 0) {
        numberOfBalacon--;
      }
      emit(ChangeNumberOfFeatureDone());
    }
  }

  List<int> roomTitles = [
    2,
    3,
    4,
  ];
  List<String> envTitles = ["Parking Lot", "Pet Allowed", "Pet Allowed"];
  void clearData() {
    estateName.clear();
    estateDesc.clear();
    propertyIndex = 0;
    isChecked = true;
    timeIndex = 0;
    envIndex = 0;
    index=0;
    numberOfBeds = 0;
    numberOfBathroom = 0;
    numberOfBalacon = 0;
    roomIndex = 0;
    address.clear();
    price.clear();
    images = [];
  }
}
