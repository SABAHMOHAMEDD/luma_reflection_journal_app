🌙 Luma — Mood & Reflection Journal

A minimalist journaling app designed to promote calmness, self-awareness, and emotional clarity.




<img width="250" height="800" alt="image" src="https://github.com/user-attachments/assets/9d8cf189-d41c-4347-b6a2-3dc81986d23c" />
<img width="250" height="800" alt="image" src="https://github.com/user-attachments/assets/f9cb5ccc-3234-465e-88a1-b14856b296f4" />
<img width="250" height="800" alt="image" src="https://github.com/user-attachments/assets/ee0ef1f9-675f-4e49-9b64-8250eb735d12" />
<img width="250" height="800" alt="image" src="https://github.com/user-attachments/assets/c9b07b2e-9792-40d5-927e-c92a886f0317" />







Luma offers a soft, poetic journaling experience built around gentle design and offline simplicity.
Every part of the interface — from its colors to animations — is crafted to create a relaxing and mindful environment.

✨ Visual Concept

A serene, aesthetic journaling experience inspired by nature and emotional calm.

🖼️ Background Themes:

🌸 Floral — pale roses, lavender fields

☁️ Pastel Skies — sunset, dawn, clouds

🕯️ Cozy Indoors — notebooks, candles, warm lights

🌊 Nature Tones — sand dunes, ocean waves, mountain mist

🪶 Design Details:

Soft gradients, rounded cards, and smooth fade animations

Floating visual elements (sparkles, petals, or gentle glows)

Typography: Nunito, Poppins, or Inter

Colors: Muted pastels (cream, blush pink, dusty blue)

Dark mode: Deep purples or navy blues — never harsh black

🧘‍♀️ Overall Feel: Calm, mindful, and feminine.

🧭 User Flow

Launch → Welcome / short onboarding

Home → Recent entries list + “Add” button

Add Entry → Text + mood (5 icons) + optional photos/attachments

Entry Detail → View / edit / delete / export PDF

Weekly Summary → Mood chart + common keywords

Settings → Theme, reminders, export data

📱 Main Screens

Splash / Onboarding

Home (animated list of entries)

Entry Editor (simple rich text or textarea)

Entry Detail

Summary / Analytics (pie or line chart)

Settings

📸 Screenshots coming soon...

🧩 Architecture (Clean)
lib/core/ → errors, utils, constants, theme  
lib/features/reflex/domain/ → entities, repositories (abstract), usecases  
lib/features/reflex/data/ → models, local_data_source (Hive/Drift), repository_impl  
lib/features/reflex/presentation/ → blocs, screens, widgets, animations  
lib/main.dart → dependency injection  

⚙️ State Management

Bloc + Cubit for predictable, scalable UI state handling

💾 Storage

Hive (lightweight & fast) or Drift (SQL-like queries)

Schema:

Entry {
  id,
  text,
  mood: int,
  date,
  attachments: []
}

🧠 Core Features

🎨 Theming (light/dark + mood-based dynamic theme)

🧭 Navigation via GoRouter (deep linking support)

💾 Local storage (Hive/Drift + migrations)

✨ Smooth animations (Hero, implicit, and custom transitions)

🔔 Local notifications (reminders to journal)

📝 Export entries to PDF (printing package)

🧪 Unit & widget testing

🚀 Development Milestones

✅ Basic CRUD (domain + data + minimal UI)

🎨 Theming + navigation (GoRouter)

💫 Animations + local notifications

📊 Weekly summary + PDF export

🧰 Tech Stack

Flutter (Dart)

Bloc / Cubit

Hive or Drift

GoRouter

Local Notifications

Printing package

💖 Vision

Luma is built to help users slow down, reflect, and reconnect with their emotions — one journal entry at a time.
