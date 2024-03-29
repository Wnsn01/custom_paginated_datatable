# Custom Paginated DataTable Flutter App

## Overview
This Flutter application showcases a custom paginated data table with search and filtering capabilities, presenting a list of students with various details.
The purpose of this project is to test on the full potential of paginated datatable widget. Some customization had been enabled, such as, 
- dataRowColor
- headingRowColor
- headingRowHeightrow
- rowsPerPageTitle

## Features
Paginated DataTable for efficient data presentation.
Search functionality based on student number, name, gender, age, and joined date.
Responsive design with customizable rows per page.
Checkbox selection for multiple student entries.

## Getting Started
1. Clone the repository:

   ```bash
   git clone https://github.com/Wnsn01/custom_paginated_datatable.git
   cd custom_paginated_datatable
   ```
   
2. Run the App:

   ```bash
   flutter run
   ```
   
## Usage
1. Launch the app to view the default paginated data table.
2. Scroll or drag the screen to view the whole paginated data table.
3. Utilize search fields to filter student data.
4. Adjust the "Students Count" dropdown to change rows per page.
5. Use checkboxes for multiple student selections.

## Structure
- 'main.dart': Entry point containing the app logic.
- 'paginated_data_table.dart': Custom paginated data table widget.
- 'data_source.dart': Data source for the DataTable.
- 'field_text.dart: Utility functions for text fields.

## Dependencies
- 'intl' for date formatting.
- 'faker' for generating dummy data.
- 'flutter/material.dart' for the core Flutter framework.

## Customization
Feel free to customize the app based on your specific requirements by modifying the provided Dart files.

## Contribution
Contributions are welcome! Report issues or contribute through pull requests.
