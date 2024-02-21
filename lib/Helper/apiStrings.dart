
import 'apiConstants.dart';

final Uri getUserRegister = Uri.parse('${baseUrl}insertUser');
final Uri loginWithMail = Uri.parse('${baseUrl}send_otp_request');
final Uri loginMobile = Uri.parse('${baseUrl}send_otp_request');
final Uri getBusinessCategory= Uri.parse('${baseUrl}business_cat');
final Uri getProductListAPI = Uri.parse('${baseUrl}get_product_list');
final Uri getAddProductApi = Uri.parse('${baseUrl}product_purchase');
final Uri getSupplierOrClientApi = Uri.parse('${baseUrl}supplier');
final Uri verifyOtp = Uri.parse('${baseUrl}verify_otp');
final Uri getAllServices = Uri.parse('${baseUrl}get_all_services');

