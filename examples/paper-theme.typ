// Paper Theme Example
// Demonstrates the high-contrast academic color palette
// See feature-showcase.typ for complete feature documentation
#import "../theme/theme.typ": *

#show: warm-amber-theme.with(
  config-info(
    title: [Paper Theme Demo],
    subtitle: [High Contrast Academic Style],
    author: [Your Name],
    date: datetime.today(),
    institution: [Your Institution],
  ),
  variant: "light",
  colortheme: "paper",        // Key difference: paper color theme
  progressbar: "foot",
  header-style: "moloch",
)

#title-slide()

== Paper Theme Characteristics

#text(size: size-small, fill: text-muted)[When to use paper theme]

- Pure white background for maximum contrast
- Dark blue accents for professional appearance
- High readability in bright environments
- Ideal for academic and formal presentations

#highlight-box(title: "Configuration")[
  Set `colortheme: "paper"` in your theme configuration.
]

== Color Comparison

#three-col(
  [
    *Warm Amber*
    - Cream background
    - Orange/amber accents
    - Soft, warm feel
  ],
  [
    *Tomorrow*
    - Light grey background
    - Blue accents
    - Balanced, neutral
  ],
  [
    *Paper* (this example)
    - Pure white
    - Dark blue accents
    - High contrast
  ]
)

== Box Components

#two-col(
  [
    #alert-box(title: "Alert")[
      High contrast warnings.
    ]
  ],
  [
    #example-box(title: "Example")[
      Clear, readable examples.
    ]
  ]
)

#v(spacing-lg)

#themed-block(title: "Themed Block")[
  Paper theme provides maximum readability with clean, high-contrast styling.
]

#focus-slide[
  Focus slides in paper theme
]

== Best Use Cases

- Academic conferences
- Formal presentations
- Printed handouts
- High ambient light environments
- When projector quality is uncertain

#example-box(title: "Tip")[
  Paper theme also works well with `variant: "dark"` for a pure black background.
]

#ending-slide(
  title: [Thank You],
  subtitle: [Paper theme complete],
  contact: ("See feature-showcase.typ for all features",),
)
