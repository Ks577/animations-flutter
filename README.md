# 🌿 Wonders of Nature

A Flutter app to explore beautiful places around the world with smooth animations.

## 📸 Demo / Preview

GIFs may take a few seconds to load. If they don't appear immediately &mdash; refresh the page.

---

*Splash screen with animated text and a rotating element*

  <img src="assets/images/screen1.gif" width="340">
  
  <br>
  
---

*List of wonders with smooth card appearance*

  <img src="assets/images/screen2.gif" width="340">
  
<br>

---

*Details screen with Hero image transition*

  <img src="assets/images/screen3.gif" width="340">

---

## ⚙️ Features

- Splash screen with animated text and rotation
- List of wonders with smooth card appearance
- Details screen with extended information
- Interactive fullscreen images

---

## 🖌️ Animations used

<details>
 
  <summary>Click to expand the list of animations</summary>

- RotationTransition – rotating element on the Splash Screen
  
- TweenAnimationBuilder – smooth appearance of list cards
  
- SizeTransition + AnimatedSwitcher – expanding card description
  
- FadeInImage + FadeTransition – smooth image loading
  
- Hero – image transition between screens
  
- AnimatedTextKit – animated text with color effects
  
- AnimatedRotation – rotating arrow on the card

</details>

---

## 📦 Tech & Packages

- animated_text_kit: ^4.2.3

- page_transition: ^2.2.1


## 🛠️ Installation

```bash

git clone https://github.com/Ks577/animations-flutter.git
cd animations-flutter
flutter pub get
flutter run
```
