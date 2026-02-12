// Dark Variant Example
// Demonstrates the dark color mode
// See feature-showcase.typ for complete feature documentation
#import "../theme/theme.typ": *

#show: calmly.with(
  config-info(
    title: [Dark Variant Demo],
    subtitle: [Same Features, Dark Mode],
    author: [Your Name],
    date: datetime.today(),
    institution: [Your Institution],
  ),
  variant: "dark",            // Key difference: dark mode
  colortheme: "tomorrow",
  progressbar: "foot",
  header-style: "moloch",
)

#title-slide()

== Dark Mode Benefits

#text(size: size-small, fill: text-muted)[When to use dark variant]

- Better for dimly lit venues
- Reduces eye strain for extended viewing
- Modern, sleek appearance
- Works well with all three color themes

#highlight-box(title: "Configuration")[
  Simply set `variant: "dark"` in your theme configuration.
]

== Box Components in Dark Mode

#two-col(
  [
    #alert-box(title: "Alert")[
      Warnings adapt to dark backgrounds.
    ]
  ],
  [
    #example-box(title: "Example")[
      Examples remain readable.
    ]
  ]
)

#v(spacing-lg)

#themed-block(title: "Themed Block")[
  All components automatically adjust their colors for dark mode.
]

#focus-slide[
  Focus slides look great in dark mode
]

== Algorithm Box

#algorithm-box(title: "Algorithm: Dark Mode Check")[
  *Input:* Venue lighting $L$ \
  *Output:* Variant selection

  1: *if* $L < "threshold"$ *then* \
  2: #h(1em) *return* `"dark"` \
  3: *else* \
  4: #h(1em) *return* `"light"` \
  5: *end if*
]

== Code in Dark Mode

Syntax highlighting adapts to the dark palette:

```python
class DarkTheme:
    bg = "#282a36"
    fg = "#f8f8f2"

    def apply(self, window):
        window.set_colors(bg=self.bg, fg=self.fg)
        return window.render()
```

#ending-slide(
  title: [Thank You],
  subtitle: [Dark mode complete],
  contact: ("See feature-showcase.typ for all features",),
)
