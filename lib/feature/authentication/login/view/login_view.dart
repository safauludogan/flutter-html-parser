import 'package:flutter/material.dart';
import 'package:flutter_html_parser/core/base/view/base_view.dart';
import 'package:flutter_html_parser/core/constants/height_weight.dart';
import 'package:flutter_html_parser/core/constants/padding_items.dart';
import 'package:flutter_html_parser/core/constants/project_items.dart';
import 'package:flutter_html_parser/core/widgets/image_widget.dart';
import 'package:flutter_html_parser/core/utils/context_extension.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../home/view/get_exercise_list_view.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onPageBuilder: (context, viewModel, isInternet) => _homeBody,
      onModelReady: (model) {
        model.setContext(context);
        model.init(null);
        viewModel = model;
      },
    );
  }

  Widget get _homeBody => SafeArea(
        child: Scaffold(
            body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  ColorConstants.aeroColor,
                  ColorConstants.dullLavenderColor
                ])),
            child: Opacity(
              opacity: 0.04,
              child: ImagePaths.image_login.toWidget(
                  height: context.mediaQuery.height,
                  width: context.mediaQuery.width),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: PaddingItems.paddingScaffold,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _headerTitle(),
                  SizedBox(height: dynamicHeight(value: 0.1, context: context)),
                  _loginText(),
                  SizedBox(
                      height: dynamicHeight(value: 0.03, context: context)),
                  const CustomTextField(hintText: ProjectItems.email),
                  SizedBox(
                      height: dynamicHeight(value: 0.02, context: context)),
                  const CustomTextField(hintText: ProjectItems.password),
                  SizedBox(
                      height: dynamicHeight(value: 0.02, context: context)),
                  _forgotPasswordText(),
                  SizedBox(
                      height: dynamicHeight(value: 0.05, context: context)),
                  CustomButton(
                    text: ProjectItems.login,
                    callback: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ExerciseListView()));
                    },
                  ),
                  SizedBox(
                      height: dynamicHeight(value: 0.06, context: context)),
                  _orText(),
                  SizedBox(
                      height: dynamicHeight(value: 0.06, context: context)),
                  CustomButton(
                    textColor: ColorConstants.blackColor,
                    color: ColorConstants.whiteColor,
                    imageAsset: ImagePaths.google_icon.toIcon(),
                    text: ProjectItems.loginWithGoogle,
                    callback: () {},
                  ),
                  SizedBox(
                      height: dynamicHeight(value: 0.06, context: context)),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: ProjectItems.newToFitness,
                              style: context.textTheme.titleMedium!
                                  .copyWith(color: ColorConstants.greyColor)),
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: ProjectItems.signIn,
                            style: context.textTheme.titleMedium!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ])),
      );

  Text _orText() {
    return Text(ProjectItems.or,
        style: context.textTheme.bodyText2!.copyWith(
            color: ColorConstants.whiteColor, fontWeight: FontWeight.bold));
  }

  Align _forgotPasswordText() {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        ProjectItems.forgotPassword,
        style: context.textTheme.titleMedium!.copyWith(color: Colors.white),
      ),
    );
  }

  Align _loginText() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        ProjectItems.login,
        style: context.textTheme.headline5!
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Center _headerTitle() {
    return Center(
      child: Text(
        ProjectItems.fitness,
        style: context.textTheme.headline3!.copyWith(color: Colors.white),
      ),
    );
  }
}
