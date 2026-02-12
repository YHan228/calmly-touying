// Dracula Theme Example
// Demonstrates the Dracula color palette (dark variant)
// See feature-showcase.typ for complete feature documentation
#import "../theme/theme.typ": *

#show: calmly.with(
  config-info(
    title: [Dracula Theme Demo],
    subtitle: [Purple and Pink Accents],
    author: [Your Name],
    date: datetime.today(),
    institution: [Your Institution],
  ),
  variant: "dark",
  colortheme: "dracula",        // Key difference: dracula color theme
  progressbar: "foot",
  header-style: "moloch",
)

#title-slide()

== Dracula Theme Characteristics

#text(size: size-small, fill: text-muted)[When to use dracula theme]

- Purple and pink accent colors
- Popular among developers
- Excellent dark mode experience
- Works in both light and dark variants

#highlight-box(title: "Configuration")[
  Set `colortheme: "dracula"` in your theme configuration.
]

== Box Components

#two-col(
  [
    #alert-box(title: "Alert")[
      Warnings with Dracula red accents.
    ]
  ],
  [
    #example-box(title: "Example")[
      Examples with Dracula green.
    ]
  ]
)

#v(spacing-lg)

#themed-block(title: "Themed Block")[
  All components adapt to the Dracula palette automatically.
]

== Syntax Highlighting

```python
def count_vampires(castle: str) -> int:
    """Count vampires in a given castle."""
    residents = get_residents(castle)
    return sum(1 for r in residents if r.is_vampire)
```

#focus-slide[
  Focus slides with Dracula gradient
]

#ending-slide(
  title: [Thank You],
  subtitle: [Dracula theme complete],
  contact: ("See feature-showcase.typ for all features",),
)
