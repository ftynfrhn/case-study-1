# case_study1

- Group Name: Eclair
- Group Member Details:
  1. NUR FATIN FARHANA BINTI HAMDAN (2014226)
  2. BALQIS HAIFA BINTI M.NASER (2026210)

## Description of the Case Study 1

- Title: A Course Scheduling System
- Requirements:
  1. It contains 25 empty slots (5 time slots x 5 days) for storage from Monday to Friday excluding lunch time.
  2. Each slot can only store a subject.
  3. The class starts at 8.30 AM and ends at 4.50 PM. The duration for each slot is an hour and 20 minutes.
  4. Item is stored based on course code.
  5. Each course stored in a slot contains date and time stamp.
  6. Each course should have 2 meetings in a week.
  7. A user would be able to schedule, modify, remove, and view all the scheduled courses for the 25 time slots.
  8. Admin would be able to view all the scheduled courses made by the users.

## Assigned tasks for each group member

1. All user-related pages - Fatin Farhana
    - user_login.dart (Set user login screen layout & provide navigation to the admin login screen)
    - user_login_form.dart (Form widget for user login)
    - user_dashboard.dart (Presenting schedule in tabular format for the user to view, edit, and manage their course details)
      
2. All admin-related pages - Balqis Haifa
    - admin_login.dart (Set admin login screen layout)
    - admin_login_form.dart (Form widget for admin login)
    - admin_dashboard.dart (Page for admin to oversee user data and course schedules, enabling administrators to select a user and view
      their course details)
    - course_schedule_page.dart (Presenting course schedules with key details like code, name, timing, date, and lecturer. Users get an
      organized view of all courses)
    
3. Other additional components - Fatin Farhana
    - main.dart (Configures the app's theme, title, and home screen)
    - responsive.dart (Adapt the UI to different screen sizes)
    - constants.dart (Define a set of constants that will be used throughout the app)
    - background.dart (Create a background for the app and ensures the background is properly adjusted to the screen size)


## References

1. Syncfusion Flutter DataGrid:
     - Link: https://www.syncfusion.com/flutter-widgets/flutter-datagrid
2. Building a responsive login page in Flutter:
     - Link: https://blog.logrocket.com/building-responsive-login-page-flutter/
3. Flutter’s DataTable widget: A guide to displaying data:
     - Link: https://blog.logrocket.com/flutter-datatable-widget-guide-displaying-data/
4. Github:
     - Link: https://github.com/abuanwar072/Welcome-Login-Signup-Page-Flutter.git
5. Building a web application with Flutter:
     - Link: https://docs.flutter.dev/platform-integration/web/building
6. Introduction to Git in VS Code:
     - Link: https://code.visualstudio.com/docs/sourcecontrol/intro-to-git#:~:text=Pick%20an%20existing%20or%20new,to%20start%20tracking%20code%20changes
     
