Mini Shop App 🛒
A modern, high-performance E-commerce mobile application built with Flutter. This project demonstrates professional-grade state management, seamless API integration, and clean architectural patterns.

🚀 Features
Product Catalog: Browse a dynamic list of products fetched from a REST API.

Category Filtering: Filter products by categories to find exactly what you need.

State Management: Utilizes Cubit/Bloc for predictable and testable UI states.

Networking: Implements Dio for optimized HTTP requests, including custom interceptors and error handling.

Loading/Error States: User-friendly UI handling for "Loading," "Success," and "Error" scenarios.

🛠️ Tech Stack
Framework: Flutter

Language: Dart

State Management: flutter_bloc

Networking: Dio

Architecture: Repository Pattern with BLoC (Business Logic Component).

🏗️ Architecture & Logic
This app follows the Loading-Success-Error (LSE) pattern to ensure a smooth user experience.

Data Layer: Dio handles the raw JSON requests from the API.

Repository Layer: Maps raw API responses into clean Dart models.

Business Logic (Cubit): Manages the app state and emits specific states (e.g., ProductLoading, ProductSuccess).

Presentation Layer: Uses BlocBuilder to reactively update the UI based on the current state.

https://github.com/user-attachments/assets/c3d0118e-d02e-49d5-bb0d-9a6d2e84bed9

