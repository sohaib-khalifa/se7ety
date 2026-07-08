import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  // دالة تسجيل الدخول كاملة مثل الفيديو
  Future<void> login() async {
    emit(AuthLoadingState());

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthFailureState("البريد الالكتروني غير موجود"));
      } else if (e.code == 'wrong-password') {
        emit(AuthFailureState("كلمة السر غير صحيحة"));
      } else {
        emit(AuthFailureState("حدث خطأ ما"));
      }
    } catch (e) {
      emit(AuthFailureState("حدث خطأ ما"));
    }
  }

  // دالة إنشاء الحساب كما هي لديك
  Future<void> register() async {
    emit(AuthLoadingState());

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

      var user = credential.user;
      await user?.updateDisplayName(nameController.text);
      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthFailureState("كلمة السر ضعيفة"));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthFailureState("البريد الالكتروني مستخدم بالفعل"));
      } else {
        emit(AuthFailureState("حدث خطأ ما"));
      }
    } catch (e) {
      emit(AuthFailureState("حدث خطأ ما"));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    return super.close();
  }
}
