## [0.1.1] - 12.26.2020

Update the SizeNoClipAnimation to not use ClipRect with ClipMode.none,
since it's not allowed any more. Instead, the animation allows clipping
while the rectangle is expanding (since it's typically going to be off
screen), but does not clip once the component is at its full size.


## [0.1.0+2] - 10.16.2019

Add demo to README

## [0.1.0+1] - 10.16.2019

Update homepage in pubspec to point to gitlab

## [0.1.0] - 10.16.2019

Remove visibleForTesting annotations.

## [0.0.1] - 10.16.2019

Initial release
