enum PAGES { homePage, loginDash, loginPage, createAccountPage, forgetPage }

extension AppPageExtention on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.homePage:
        return '/homePage';
      case PAGES.loginPage:
        return '/loginPage';
      case PAGES.createAccountPage:
        return '/createAccountPage';
      case PAGES.forgetPage:
        return '/forgotPage';
      case PAGES.loginDash:
        return '/';
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.homePage:
        return 'HomePage';
      case PAGES.loginPage:
        return 'LoginPage';
      case PAGES.createAccountPage:
        return 'Create Account';
      case PAGES.forgetPage:
        return 'Forgot Password';
      case PAGES.loginDash:
        return 'LoginDash';
    }
  }
}
