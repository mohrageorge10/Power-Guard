class ApiKey {
  // ==========================================
  // 1. General & Response Keys
  // ==========================================
  static const String status = 'status';
  static const String msg = 'message';
  static const String errorMsg = 'ErrorMessage';
  static const String role = 'role';
  static const String token = 'token';
  static const String expirationDate = 'expirationDate';
  static const String refreshTokenExpiration = 'refreshTokenExpiration';
  static const String isSuccess = 'isSuccess'; 
  static const String factoryId = 'factoryId'; 
  static const String departmentId = 'departmentId'; 

  // ==========================================
  // 2. Authentication Keys (Auth)
  // ==========================================
  static const String userName = "userName";
  static const String email = "email";
  static const String password = "password";
  static const String confirmPassword = "confirmPassword";
  static const String phoneNumber = "phoneNumber";
  static const String newPassword = 'newPassword';
  static const String resetToken = 'resetToken';
  static const String otp = "otp";
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  // ==========================================
  // 3. Admin Keys
  // ==========================================
  static const String reviewFactoryId = 'factoryId';
  static const String reviewIsApproved = 'isApproved';
  static const String reviewAdminRemarks = 'adminRemarks';

  // ==========================================
  // 4. Department Keys
  // ==========================================
  static const String name = 'name';
  static const String departmentOperatingHours = 'operatingHours';
  static const String description = 'description';
  static const String currentConsumptionLimit = 'currentConsumptionLimit';
  static const String departmentManagerId = 'managerId';
  static const String departmentManagerFullName = 'fullName';

  // ==========================================
  // 5. Factory Keys
  // ==========================================
  static const String factoryAddress = 'location';

  // ==========================================
  // 6. Consumption Logs & Notifications Keys
  // ==========================================
  static const String enterConsumptionValue = 'consumptionValue';
  static const String enterConsumptionCapturedAt = 'capturedAt';
  static const String updateConsumptionLogId = 'logId';
  static const String pageNumber = 'pageNumber';
  static const String pageSize = 'pageSize';
}