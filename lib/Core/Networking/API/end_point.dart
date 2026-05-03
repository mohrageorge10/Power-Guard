class EndPoint 
{
  static const String baseUrl = 'https://powerguard-app315107-fufscmh5etbad8g4.uaenorth-01.azurewebsites.net/';
  
  // ---- Authentication Endpoints ----
  static const String register = 'api/Auth/register';
  static const String login = 'api/Auth/login';
  static const String refreshToken = 'api/Auth/refresh-token';
  static const String revokeToken = 'api/Auth/revoke-token';
  static const String logout = 'api/Auth/logout';
  static const String forgetPassword = 'api/Auth/forget-password';
  static const String resetPassword = 'api/Auth/reset-password';
  static const String verifyOtp = 'api/Auth/verify-otp';
  
  // ---- Admin Endpoints ----
  static const String adminDashboard = 'api/Admin/admin-dashboard';
  static const String adminFactories = 'api/Admin/factories';
  static const String adminPendingFactories = 'api/Admin/pending-factories';
  static const String adminActiveFactories = 'api/Admin/active-factories';
  static const String adminReviewFactory = 'api/Admin/review-factory';
  
  // ---- Activate Factory Keys (PUT) ----
  static String activateFactory(int id) => "api/Admin/activate-factory/$id";
  
  // ---- Delete Factory Keys (DELETE) ----
  static String deleteFactory(int id) => "api/Admin/delete-factory/$id";
  
  // ---- ConsumptionLogs Endpoints ----
  static const String enterConsumption = 'api/ConsumptionLogs/enter-consumption';
  static const String updateConsumption = 'api/ConsumptionLogs/update';
  static String deleteConsumptionLog(int id) => "api/ConsumptionLogs/$id";
  static String departmentLogs(int departmentId) => "api/ConsumptionLogs/department-logs/$departmentId";
  
  // ---- Department Dashboard Endpoints ----
  static String departmentDashboardDailySummary(int departmentId) => "api/DepartmentDashboard/daily-summary/$departmentId";
  static String departmentDashboardHourlyChart(int departmentId) => "api/DepartmentDashboard/hourly-chart/$departmentId";
  
  // ---- Department Endpoints ----
  static const String createDepartment = 'api/Departments/Create';
  static const String getDepartment = 'api/Departments';
  static const String addDepartmentManager = 'api/Departments/Add-DepartmentManager';
  static const String availableDepartmentManagers = 'api/Departments/AvailableDepartmentManagers';
  static String departmentId(int id) => "api/Departments/$id";
  static String deleteDepartmentId(int id) => "api/Departments/$id";
  static String updateDepartmentId(int id) => "api/Departments/update/$id";
  static String updateDepartmentConsumptionLimit(int departmentId) => "api/Departments/Update-ConsumptionLimit/$departmentId";
  
  // ---- Factory Endpoints ----
  static const String factory = 'api/Factories';
  static String getFactory(int id) => "api/Factories/$id";
  static String updateFactory(int id) => "api/Factories/update/$id";
  static String updateFactoryConsumptionLimit(int factoryId) => "api/Factories/Update-ConsumptionLimit/$factoryId";
  
  // ---- Factory Dashboard Endpoints ----
  static String factoryDashboardDailySummary(int factoryId) => "api/FactoryDashboard/$factoryId/daily-summary";
  static String factoryDashboardDepartmentsSummary(int factoryId) => "api/FactoryDashboard/$factoryId/departments-summary";
  static String factoryDashboardHourlyChart(int factoryId) => "api/FactoryDashboard/$factoryId/hourly-chart";
  
  // ---- Notifications Endpoints ----
  static const String getNotifications = 'api/Notifications';
  static const String notificationsUnreadCount = 'api/Notifications/unread-count';
  static String markNotificationAsRead(int id) => "api/Notifications/mark-as-read/$id";
  static const String deleteAllNotifications = 'api/Notifications/delete-all';

} 