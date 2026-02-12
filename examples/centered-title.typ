// Centered Title Layout Example
// Demonstrates the centered title slide variant
// See feature-showcase.typ for complete feature documentation
#import "../theme/theme.typ": *

#show: calmly.with(
  config-info(
    title: [Centered Title Layout],
    subtitle: [Alternative Title Slide Design],
    author: [Your Name],
    date: datetime.today(),
    institution: [Your Institution],
  ),
  variant: "light",
  colortheme: "warm-amber",
  progressbar: "foot",
  header-style: "moloch",
)

// Key difference: centered title layout
#title-slide(layout: "centered")

== Title Layout Options

#text(size: size-small, fill: text-muted)[Three title slide designs available]

#three-col(
  [
    *Moloch* (default)
    - Left-aligned text
    - Horizontal separator
    - Academic style
    - Golden ratio spacing
  ],
  [
    *Centered* (this example)
    - Center-aligned text
    - Accent underline
    - Modern, clean
    - Symmetrical
  ],
  [
    *Split*
    - Two-column layout
    - Vertical separator
    - Supports graphics
    - Asymmetrical
  ]
)

#highlight-box(title: "Configuration")[
  Use `#title-slide(layout: "centered")` for centered layout.
]

== When to Use Centered Layout

- Modern, startup-style presentations
- When title is short and punchy
- Symmetrical design preference
- Creative or design-focused talks

#example-box(title: "Also Try")[
  Combine with `header-style: "minimal"` for an extra-clean look.
]

== Code Blocks

```rust
fn centered_layout(title: &str) -> Slide {
    Slide::new()
        .title(title)
        .layout(Layout::Centered)
        .build()
}
```

#focus-slide[
  Content slides remain the same
]

== All Components Work

#two-col(
  [
    #alert-box(title: "Alert")[
      Title layout only affects the title slide.
    ]
  ],
  [
    #example-box(title: "Example")[
      All other features work identically.
    ]
  ]
)

#ending-slide(
  title: [Thank You],
  subtitle: [Centered layout complete],
  contact: ("See feature-showcase.typ for all features",),
)
