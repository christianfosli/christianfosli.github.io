+++
title = "MS Teams notify"
description = "Rust-based console app to work-around easy-to-miss notifications from MS Teams PWA on Linux"
weight = 4

[extra]
comment = true
+++

### Problem

Using the Microsoft Teams PWA on a Linux distrubution with Gnome, it can be easy to miss notifications.

The built-in notifications (at least with PWA installed via Chrome) only appear for a short period of time, and there is no sound when they appear, so unless you are constantly looking at the screen, or constantly checking in MS Teams itself it's easy to miss something.

### Solution

This rust-based console app listens to the notification on dbus and republishes the notification with a notification sound and in a way that it doesn't dissapear from the notifications center right away.

### Links

* Source code and usage/installation instructions: [github.com/christianfosli/msteams-notify-with-sound](https://github.com/christianfosli/msteams-notify-with-sound)
