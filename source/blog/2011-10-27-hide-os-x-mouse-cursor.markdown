---
title: Hide OS X Mouse Cursor
tags: os x, devops
---

![Mouse Cursor](/blog/2011-10-27-hide-os-x-mouse-cursor/cursor.png)

These instructions replace the default OS X cursor with an empty image.
This can be helpful for full-screen environments, where the cursor
cannot be set from within the application. READMORE

Open the Terminal (Applications -> Utilities -> Terminal) and type the
following commands:

* Make a copy of the existing arrow cursor:

```.language-bash
cp /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/HIServices.framework/Versions/A/Resources/cursors/arrow/cursor.png /tmp
open -A Preview /tmp/cursor.png
```

* Clear and save the image (e.g: <kbd>⌘ + a</kbd>, <kbd>Fn+delete</kbd>, <kbd>⌘ + s</kbd>)
* Replace the __arrow cursor__ image with the empty image

```.language-bash
sudo cp /tmp/cursor.png /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/HIServices.framework/Versions/A/Resources/cursors/arrow/cursor.png
```

* Restart your box
