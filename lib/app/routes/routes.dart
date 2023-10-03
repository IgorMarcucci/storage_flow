import 'package:go_router/go_router.dart';
import 'package:storage_flow/views/about-me/about_me.view.dart';
import 'package:storage_flow/views/add-product/add-product.view.dart';
import 'package:storage_flow/views/change-pass/change_pass_view.dart';
import 'package:storage_flow/views/login/login.view.dart';
import 'package:storage_flow/views/main/main.view.dart';
import 'package:storage_flow/views/products-list/products_list.view.dart';
import 'package:storage_flow/views/register/register.view.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const LoginView();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) {
        return const RegisterView();
      },
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) {
        return const MainView();
      },
    ),
    GoRoute(
      path: '/about-me',
      builder: (context, state) {
        return const AboutMeView();
      },
    ),
    GoRoute(
      path: '/change-pass',
      builder: (context, state) {
        return const ChangePassView();
      },
    ),
    GoRoute(
      path: '/add-product',
      builder: (context, state) {
        return const AddProductsView();
      },
    ),
    GoRoute(
      path: '/list-product',
      builder: (context, state) {
        return const ProductsListView();
      },
    ),
  ],
);
