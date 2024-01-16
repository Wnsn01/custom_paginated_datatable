Custom Paginated DataTable Flutter App

Overview
This Flutter application showcases a paginated data table with search and filtering capabilities, presenting a list of students with various details.

Features
Paginated DataTable for efficient data presentation.
Search functionality based on student number, name, gender, age, and joined date.
Responsive design with customizable rows per page.
Checkbox selection for multiple student entries.
Getting Started
Clone Repository:

bash
Copy code
git clone https://github.com/your-username/your-repo.git
cd your-repo
Run the App:

bash
Copy code
flutter run
Usage
Launch the app to view the default paginated data table.
Utilize search fields to filter student data.
Adjust the "Students Count" dropdown to change rows per page.
Use checkboxes for multiple student selections.
Structure
main.dart: Entry point containing the app logic.
paginated_data_table.dart: Custom paginated data table widget.
data_source.dart: Data source for the DataTable.
field_text.dart: Utility functions for text fields.
Dependencies
intl for date formatting.
faker for generating dummy data.
flutter/material.dart for the core Flutter framework.
Customization
Feel free to customize the app based on your specific requirements by modifying the provided Dart files.

Contribution
Contributions are welcome! Report issues or contribute through pull requests.
