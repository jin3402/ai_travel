import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const AuthApp());
}

class AuthApp extends StatelessWidget {
  const AuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Urbanist',
      ),
      home: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(),
              const SizedBox(height: 32),
              _buildSignUpForm(),
              const SizedBox(height: 32),
              _buildDivider(),
              const SizedBox(height: 32),
              _buildSocialLoginSection(),
              const SizedBox(height: 48),
              _buildLoginLink(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE8ECF4), width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFF1E232C),
              size: 20,
            ),
          ),
        ),
        onPressed: () => print('뒤로가기 버튼 클릭'),
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      '회원가입',
      style: TextStyle(
        color: Color(0xFF1E232C),
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Column(
      children: [
        _buildTextField('이름'),
        const SizedBox(height: 16),
        _buildTextField('전화번호', keyboardType: TextInputType.phone),
        const SizedBox(height: 16),
        _buildTextField('이메일', keyboardType: TextInputType.emailAddress),
        const SizedBox(height: 16),
        _buildTextField('비밀번호', isPassword: true),
        const SizedBox(height: 16),
        _buildTextField('비밀번호 확인', isPassword: true),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => print('등록 버튼 클릭'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E232C),
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              '등록',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String hintText,
      {bool isPassword = false, TextInputType? keyboardType}) {
    return TextField(
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF8390A1)),
        filled: true,
        fillColor: const Color(0xFFF7F8F9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFE8ECF4))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '다른 회원가입',
            style: TextStyle(
                color: Color(0xFF6A707C), fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(child: Divider(color: Color(0xFFE8ECF4))),
      ],
    );
  }

  Widget _buildSocialLoginSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialLoginButton(_facebookIcon),
        const SizedBox(width: 16),
        _socialLoginButton(_googleIcon),
        const SizedBox(width: 16),
        _socialLoginButton(_appleIcon),
      ],
    );
  }

  Widget _socialLoginButton(String svgAsset) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(80, 56),
        side: const BorderSide(color: Color(0xFFE8ECF4)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
      ),
      child: SvgPicture.string(svgAsset, height: 26, width: 26),
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account? ',
          style: TextStyle(color: Color(0xFF1E232C), fontSize: 15),
        ),
        TextButton(
          onPressed: () => print('Login Now 클릭'),
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: const Text(
            'Login Now',
            style: TextStyle(
              color: Color(0xFF34C2C1),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

// 소셜 아이콘 SVG 데이터
const String _facebookIcon = '''
<svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M17.4521 4.33325H15.1667C13.553 4.33325 12.875 5.46242 12.875 6.69242V8.66659H17.4521L16.5917 12.9999H12.875V21.6666H8.125V12.9999H5.41667V8.66659H8.125V6.26492C8.125 3.51825 9.94167 1.83325 12.5521 1.83325L17.4521 1.84409V4.33325Z" fill="#1877F2"/>
</svg>
''';

const String _googleIcon = '''
<svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M22.7162 11.8333H13.2773V15.1667H19.0431C18.4237 17.6892 16.1133 19.5 13.2773 19.5C9.72856 19.5 6.83331 16.6048 6.83331 13C6.83331 9.39525 9.72856 6.5 13.2773 6.5C14.8878 6.5 16.3242 7.07367 17.4367 8.082L19.9298 5.58883C18.1578 4.02033 15.8943 3.25 13.2773 3.25C7.94273 3.25 3.58331 7.60942 3.58331 13C3.58331 18.3906 7.94273 22.75 13.2773 22.75C18.9137 22.75 22.9991 18.6646 22.9991 13.2227C22.9991 12.6032 22.8894 12.2183 22.7162 11.8333Z" fill="#FFC107"/>
<path d="M4.88583 10.1558L7.548 11.8983C7.90717 10.7425 8.95567 9.875 10.2058 9.875H10.5808V6.5H10.2058C8.01633 6.5 6.13633 7.94617 5.24167 9.875L4.88583 10.1558Z" fill="#FF3D00"/>
<path d="M13.2773 22.75C15.9398 22.75 18.229 21.9483 19.9298 20.4112L17.4367 17.918C16.3498 18.8952 14.8878 19.5 13.2773 19.5C10.7548 19.5 8.601 17.9467 7.85967 15.69L5.24167 17.8433C6.88458 20.8 9.87558 22.75 13.2773 22.75Z" fill="#4CAF50"/>
<g clip-path="url(#clip0_1_183)">
<path d="M22.7162 11.8333L22.9991 13.2227C22.9991 16.4253 21.0125 18.918 18.4237 20.2117L19.9298 20.4112C18.229 21.9483 15.9398 22.75 13.2773 22.75C12.9778 22.75 12.6892 22.75 12.4115 22.6967L12.9778 22.75L13.2773 22.75C18.9137 22.75 22.9991 18.6646 22.9991 13.2227C22.9991 12.6032 22.8894 12.2183 22.7162 11.8333Z" fill="#1976D2"/>
</g>
<defs>
<clipPath id="clip0_1_183">
<rect width="12" height="12" fill="white" transform="translate(12 12)"/>
</clipPath>
</defs>
</svg>
''';

const String _appleIcon = '''
<svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M18.1504 12.0163C18.2321 10.595 17.5891 9.24459 16.5163 8.35626C15.495 7.42959 14.0737 6.94126 12.9191 7.02293C11.3091 7.02293 9.94043 7.90043 9.07959 7.95126C7.57209 8.05376 6.13126 9.03209 5.34543 10.5396C3.78626 13.4304 4.88459 17.3013 6.66626 19.5396C7.57876 20.6279 8.68793 21.7671 10.0941 21.7396C11.4516 21.7121 11.8054 20.9454 13.4346 20.9454C15.0637 20.9454 15.3983 21.7396 16.8504 21.7121C18.3529 21.6846 19.2654 20.5754 20.1263 19.4871C18.9141 18.6696 18.3079 17.1354 18.4271 15.5437C18.4779 14.9437 18.7713 14.3946 19.2379 14.0408C19.4304 13.8821 19.5671 13.6721 19.6487 13.4346C19.1437 13.1971 18.4654 12.7846 18.1504 12.0163ZM14.1871 5.48459C14.9454 4.69876 15.3983 3.61043 15.2617 2.50126C14.1633 2.58293 13.065 3.23626 12.3321 4.02209C11.5367 4.75709 11.0267 5.86459 11.2191 6.94126C12.3841 6.99209 13.4821 6.27043 14.1871 5.48459Z" fill="#1C1C1E"/>
</svg>
''';
