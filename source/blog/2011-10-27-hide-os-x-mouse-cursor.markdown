---
title: Hide OS X Mouse Cursor
updated_at: 2011-06-29
rendered: site.time
---

These instructions replace the default OS X cursor with an empty image.
This can be helpful for full-screen environments, where the cursor
cannot be set from within the application.

Open the Terminal (Applications -> Utilities -> Terminal) and type the
following commands:

* Make a copy of the existing arrow cursor:

```bash
cp /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/HIServices.framework/Versions/A/Resources/cursors/arrow/cursor.png /tmp
open -A Preview /tmp/cursor.png
```

* Clear and save the image (e.g: __⌘ + a__, __Fn+delete__, __⌘ + s__)
* Replace the __arrow cursor__ image with the empty image

```bash
sudo cp /tmp/cursor.png /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/HIServices.framework/Versions/A/Resources/cursors/arrow/cursor.png
```

* Restart your box

