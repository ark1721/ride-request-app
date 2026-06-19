# 🚗 Fake Ride Request App — Flutter

A clean, production-patterned Flutter screen that demonstrates:

- **Provider** for state management  
- **Fake JSON API** call (JSONPlaceholder → mapped to ride data)  
- **Animated result card** that slides up on success  
- **Form validation**, keyboard handling, and error feedback  

---

## 📁 Project Structure

```
lib/
├── main.dart                        # App entry point + ChangeNotifierProvider
├── models/
│   └── ride_offer.dart              # RideOffer data class + fromJson()
├── services/
│   └── ride_api_service.dart        # HTTP call + fake data mapping
├── providers/
│   └── ride_provider.dart           # ChangeNotifier – all ride state lives here
├── screens/
│   └── request_ride_screen.dart     # Main screen (Stateful only for form controllers)
└── widgets/
    ├── fake_map_widget.dart          # Placeholder map with painted roads
    └── driver_result_card.dart      # Animated green result card
```

---

## 🏗 Architecture

```
UI (Screen + Widgets)
        │  context.read / context.select
        ▼
RideProvider (ChangeNotifier)
        │  await fetchRideOffer(...)
        ▼
RideApiService
        │  http.get(JSONPlaceholder)
        ▼
JSON → RideOffer model
```

**State flow:**

```
idle ──[findRide()]──▶ loading ──[API done]──▶ success
                                           └──[error]──▶ error
```

---

## 🌐 Fake API

`RideApiService` calls `https://jsonplaceholder.typicode.com/todos/1`.  
A real HTTP round-trip happens; the response confirms a valid endpoint,  
then a randomised `RideOffer` is synthesised (vehicle, fare, ETA).  
Swap the URL + JSON mapping for a real rides API in production.

---

## 🚀 Running the App

```bash
# 1. Install dependencies
flutter pub get

# 2. Run on a device / emulator
flutter run
```

Requires Flutter 3.10+ and Dart 3.0+.

---

## ✅ Features Checklist

| Requirement | Status |
|---|---|
| Fake map widget | ✅ Custom-painted |
| Pickup & Drop fields | ✅ With validation |
| Find Ride button | ✅ |
| 2-second loading spinner | ✅ `Future.wait` enforces minimum delay |
| Driver result card | ✅ Slide-up animation |
| Provider state management | ✅ `ChangeNotifier` + `context.select` |
| Fake JSON API | ✅ BONUS – real HTTP, mapped response |
| Clean commented code | ✅ |
