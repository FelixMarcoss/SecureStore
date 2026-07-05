---
name: Security Operations System
colors:
  surface: '#051424'
  surface-dim: '#051424'
  surface-bright: '#2c3a4c'
  surface-container-lowest: '#010f1f'
  surface-container-low: '#0d1c2d'
  surface-container: '#122131'
  surface-container-high: '#1c2b3c'
  surface-container-highest: '#273647'
  on-surface: '#d4e4fa'
  on-surface-variant: '#c2c6d6'
  inverse-surface: '#d4e4fa'
  inverse-on-surface: '#233143'
  outline: '#8c909f'
  outline-variant: '#424754'
  surface-tint: '#adc6ff'
  primary: '#adc6ff'
  on-primary: '#002e6a'
  primary-container: '#4d8eff'
  on-primary-container: '#00285d'
  inverse-primary: '#005ac2'
  secondary: '#bec6e0'
  on-secondary: '#283044'
  secondary-container: '#3f465c'
  on-secondary-container: '#adb4ce'
  tertiary: '#bcc7de'
  on-tertiary: '#263143'
  tertiary-container: '#8691a7'
  on-tertiary-container: '#1f2a3c'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#d8e2ff'
  primary-fixed-dim: '#adc6ff'
  on-primary-fixed: '#001a42'
  on-primary-fixed-variant: '#004395'
  secondary-fixed: '#dae2fd'
  secondary-fixed-dim: '#bec6e0'
  on-secondary-fixed: '#131b2e'
  on-secondary-fixed-variant: '#3f465c'
  tertiary-fixed: '#d8e3fb'
  tertiary-fixed-dim: '#bcc7de'
  on-tertiary-fixed: '#111c2d'
  on-tertiary-fixed-variant: '#3c475a'
  background: '#051424'
  on-background: '#d4e4fa'
  surface-variant: '#273647'
typography:
  headline-lg:
    fontFamily: Geist
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
    letterSpacing: -0.02em
  headline-md:
    fontFamily: Geist
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: -0.01em
  headline-sm:
    fontFamily: Geist
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: Geist
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Geist
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  body-sm:
    fontFamily: Geist
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
  label-md:
    fontFamily: JetBrains Mono
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.05em
  label-sm:
    fontFamily: JetBrains Mono
    fontSize: 10px
    fontWeight: '500'
    lineHeight: 12px
    letterSpacing: 0.05em
  headline-lg-mobile:
    fontFamily: Geist
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  unit: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  gutter: 12px
  margin-mobile: 16px
---

## Brand & Style

The brand personality of this design system is authoritative, vigilant, and precise. Designed for a high-stakes security environment, the UI prioritizes clarity and speed of thought above decorative elements. It utilizes a **Modern Corporate** style infused with **Technical Minimalism**, emphasizing high information density without sacrificing legibility.

The target audience consists of security professionals and property managers who require instant situational awareness. The emotional response should be one of "controlled urgency"—users should feel that the system is powerful and reliable, providing them with the exact data points needed to make critical decisions. The aesthetic leverages dark-mode optimization to reduce eye strain during extended monitoring sessions and uses color sparingly but purposefully to signal status and priority.

## Colors

The palette is anchored in deep "Ink" and "Slate" tones to establish a secure, high-tech foundation. 

- **Primary (Reliable Blue):** Used for primary actions, active states, and "Viewed" indicators. It suggests stability and digital precision.
- **Neutral (Charcoals & Slates):** The background hierarchy uses a range of dark grays to create depth. `#020617` serves as the base canvas, with lighter slates used for containers to define content areas.
- **Semantic (Alert & Status):** A vibrant "Alert Red" is reserved exclusively for "Deny" actions, active threats, or critical system failures. A "Success Green" provides immediate confirmation for safe states and authorized entries.
- **Data Layers:** Secondary and tertiary grays are used to distinguish between metadata and primary content, ensuring that even in dense views, the hierarchy remains clear.

## Typography

This design system utilizes **Geist** as its primary typeface. Geist’s geometric precision and technical feel align perfectly with a security context, offering exceptional legibility at small sizes which is vital for information-dense mobile screens.

For technical data, timestamps, and device IDs, **JetBrains Mono** is employed. This monospaced font ensures that numerical data remains easy to scan and compare across lists.

- **Headlines:** Set with tighter letter-spacing to feel impactful and modern.
- **Body:** Optimized for reading logs and event descriptions with comfortable line heights.
- **Labels:** Always set in JetBrains Mono and often uppercase to distinguish "System Data" from "User Content."

## Layout & Spacing

The layout follows a strict **4px baseline grid** to maintain a compact, high-density interface. 

- **Mobile Strategy:** A 4-column fluid grid is used for most views. Margins are set to 16px, but internal card padding is reduced to 12px to maximize horizontal space for data and video feeds.
- **Density:** Elements are packed closely to allow the user to see more events simultaneously. We use "Vertical Rhythm" to separate distinct time-blocks in activity logs.
- **Touch Targets:** Despite the high density, interactive elements like "Deny" or "Allow" buttons maintain a minimum height of 44px to ensure accuracy under pressure.

## Elevation & Depth

In this dark-themed environment, depth is communicated through **Tonal Layering** and **Low-Contrast Outlines** rather than heavy shadows.

- **Surface Levels:** 
  - Level 0: `#020617` (Global Background)
  - Level 1: `#0F172A` (Cards, List Items)
  - Level 2: `#1E293B` (Modals, Overlays, Floating Action Buttons)
- **Borders:** Every container features a subtle 1px border (`#334155` at 50% opacity). This creates a "blueprint" feel and provides clear separation between adjacent data points in low-light environments.
- **Inner Glows:** Critical alerts use a subtle inner stroke or a very faint outer glow (bloom) in the alert color to draw immediate attention without obscuring text.

## Shapes

The shape language is **Soft (0.25rem)**. This slight rounding provides a professional, modern feel that avoids the "aggressive" look of sharp corners while remaining more serious and "engineered" than fully rounded pill shapes.

- **Small Components:** Checkboxes and status indicators use a 2px radius.
- **Standard Components:** Buttons and Input fields use 4px (0.25rem).
- **Large Components:** Cards and Video containers use 8px (0.5rem) to create a clear containerized look.

## Components

- **Buttons:** 
  - *Primary:* Solid Blue background, white text.
  - *Alert (Deny):* Solid Red background.
  - *Ghost:* Transparent with a Slate border for secondary actions like "Clear Log."
- **Status Chips:** Small, rectangular indicators with a background tint matching the status color (e.g., 10% Green background with Green text for "Secure").
- **Activity Lists:** High-density rows with a JetBrains Mono timestamp on the left, a bold title, and secondary metadata below. Rows are separated by a 1px slate divider.
- **Input Fields:** Darker than the card surface with a high-contrast border on focus. Icons are used prefix-side to denote the type of data (e.g., a shield icon for "Security Code").
- **Monitoring Cards:** Specifically designed for video feeds. The video occupies the top 70%, with a condensed metadata bar and immediate action buttons ("Talk", "Sirens", "Dismiss") at the bottom.
- **Proximity Alerts:** A special component that uses a pulsing border animation to indicate an active, unaddressed trigger.