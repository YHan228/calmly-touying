// Feature Showcase - Complete Theme Documentation
// Demonstrates ALL features of the Calmly Theme
#import "../theme/theme.typ": *

// =============================================================================
// THEME CONFIGURATION
// =============================================================================
// All available options documented below:
//
// variant: "light" (default), "dark"
//   Controls light/dark mode
//
// colortheme: "tomorrow" (default), "warm-amber", "paper", "dracula"
//   Four distinct color palettes
//
// progressbar: "foot" (default), "head", "frametitle", "none"
//   Position of the progress indicator
//
// header-style: "moloch" (default), "minimal"
//   "moloch" = colored bar with white text
//   "minimal" = gradient underline only
//
// title-layout: "moloch" (default), "centered", "split"
//   Layout variant for title slide

#show: calmly.with(
  config-info(
    title: [Calmly Theme],
    subtitle: [Complete Feature Showcase],
    author: [Theme Documentation],
    date: datetime.today(),
    institution: [All Features Demonstrated],
  ),
  variant: "light",
  colortheme: "tomorrow",
  progressbar: "foot",
  header-style: "moloch",
)

// =============================================================================
// Title Slide Variants
// =============================================================================

#title-slide()

// Alternative title layouts:
// #title-slide(layout: "centered")  // Centered with accent line
// #title-slide(layout: "split")     // Two-column split layout

// =============================================================================
// SECTION 1: Basic Components
// =============================================================================

= Basic Components

== Text Styling

#text(size: size-small, fill: text-muted)[Subtitle or context text]

The theme provides several text helpers:

- *Bold text* for emphasis
- _Italic text_ for subtle emphasis
- #alert[Alert text] highlights important terms
- #muted[Muted text] for secondary information
- #subtle[Subtle text] for tertiary content

== Box Components

#highlight-box(title: "Highlight Box")[
  Use for key concepts, main ideas, or important summaries. Features a left accent border with gradient background.
]

#v(spacing-md)

#two-col(
  [
    #alert-box(title: "Alert Box")[
      Warnings, important notes, or critical information.
    ]
  ],
  [
    #example-box(title: "Example Box")[
      Code samples, demonstrations, or illustrative content.
    ]
  ]
)

== Themed Block

#themed-block(title: "Generic Themed Block")[
  A versatile container that adapts to the current color scheme. Use for general-purpose content grouping.
]

#v(spacing-md)

#themed-block(title: "Filled Variant", fill-mode: "fill")[
  Set `fill-mode: "fill"` for a filled background instead of transparent.
]

== Algorithm Box

#algorithm-box(title: "Algorithm 1: Example Procedure")[
  *Input:* Data $X$, parameters $theta$ \
  *Output:* Result $Y$

  1: Initialize $y <- 0$ \
  2: *for each* $x_i in X$ *do* \
  3: #h(1em) $y <- y + f(x_i; theta)$ \
  4: *end for* \
  5: *return* $y / n$
]

== Code Blocks

Code blocks get automatic syntax highlighting that matches your selected color theme:

```python
def quicksort(arr: list[int]) -> list[int]:
    """Sort a list using the quicksort algorithm."""
    if len(arr) <= 1:
        return arr
    pivot = arr[len(arr) // 2]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    return quicksort(left) + middle + quicksort(right)
```

Typst code is highlighted too:

```typst
#let greet(name) = {
  [Hello, #name! Welcome to *Calmly-Touying*.]
}
```

// =============================================================================
// SECTION 2: Layouts
// =============================================================================

= Layout Components

== Two-Column Layout

#two-col(
  [
    *Left Column*

    Content on the left side. Good for comparisons, before/after, or related concepts.

    - Point one
    - Point two
  ],
  [
    *Right Column*

    Content on the right side. The columns have automatic gutter spacing.

    - Detail A
    - Detail B
  ]
)

== Three-Column Layout

#three-col(
  [
    *Option A*
    - Feature 1
    - Feature 2
    - Best for X
  ],
  [
    *Option B*
    - Feature 3
    - Feature 4
    - Best for Y
  ],
  [
    *Option C*
    - Feature 5
    - Feature 6
    - Best for Z
  ]
)

== Vertical Spacing with #raw("#v(1fr)")

#v(1fr)

#align(center)[
  This content is vertically centered using `#v(1fr)` above and below.

  The `1fr` unit distributes remaining space equally.
]

#v(1fr)

// =============================================================================
// SECTION 3: Progressive Reveals
// =============================================================================

= Progressive Reveals

== Using #raw("#only(n)[...]")

#only(1)[
  *Step 1:* First, we introduce the concept.

  This content only appears on the first sub-slide.
]

#only(2)[
  *Step 2:* Then, we add more detail.

  This replaces the previous content on the second sub-slide.
]

#only(3)[
  *Step 3:* Finally, we show the complete picture.

  Use `#only(n)[...]` to create progressive reveals.
]

== Building Up Content

Base content that's always visible:

#only(1)[
  #highlight-box(title: "Phase 1")[
    Initial setup and configuration.
  ]
]

#only(2)[
  #highlight-box(title: "Phase 1")[
    Initial setup and configuration.
  ]

  #alert-box(title: "Phase 2")[
    Processing and transformation.
  ]
]

#only(3)[
  #highlight-box(title: "Phase 1")[
    Initial setup and configuration.
  ]

  #alert-box(title: "Phase 2")[
    Processing and transformation.
  ]

  #example-box(title: "Phase 3")[
    Output and verification.
  ]
]

// =============================================================================
// SECTION 4: Citations
// =============================================================================

= Citations & References

== Inline Citations

Use standard Typst citations with `@key` syntax for inline references.

When you write `@smith2023` in your text, it renders as a grey-boxed citation that links to your bibliography.

Example: "Recent work has shown significant improvements @smith2023."

_(Note: Requires a .bib file to be loaded)_

== Citation Boxes

#cite-box("wang2021robust", display-label: "Wang et al. 2021", position: "bottom-right")

The `#cite-box()` places a styled citation in the corner of the slide.

#v(1em)

*Parameters:*
- `bib-key`: Single key or array of keys
- `display-label`: Custom display text
- `position`: "top-right", "bottom-left", "bottom-right"

== Multiple Citations

#cite-box(
  ("smith2023", "jones2024"),
  display-label: "Smith 2023; Jones 2024",
  position: "bottom-right"
)

Pass an array of keys for multiple citations:

```typst
#cite-box(
  ("key1", "key2"),
  display-label: "Author1; Author2"
)
```

// =============================================================================
// SECTION 5: Tables
// =============================================================================

= Tables & Data

== Basic Table

#table(
  columns: (auto, 1fr, auto),
  stroke: 0.5pt + luma(200),
  inset: 8pt,
  align: (left, left, center),
  table.header(
    [*Method*], [*Description*], [*Score*]
  ),
  [Baseline], [Standard approach], [72.3],
  [Improved], [With optimization], [85.1],
  [Proposed], [Our method], [*91.7*],
)

== Styled Definition Table

#table(
  columns: (auto, 1fr),
  stroke: none,
  row-gutter: 12pt,
  column-gutter: 2em,
  [$alpha$], [Learning rate parameter],
  [$beta$], [Momentum coefficient],
  [$gamma$], [Decay factor],
  [$epsilon$], [Numerical stability term],
)

// =============================================================================
// SECTION 6: Special Slides
// =============================================================================

= Special Slide Types

#focus-slide[
  Focus Slide
]

== About Focus Slides

The `#focus-slide[]` creates a full-bleed gradient background with centered text.

Use for:
- Key takeaways
- Section transitions
- Important statements

#standout-slide[
  Standout Slide
]

== About Standout Slides

The `#standout-slide[]` uses high-contrast colors for maximum emphasis.

Similar to focus slides but with different styling.

#section-slide(show-progress: true)[New Section]

== About Section Slides

Use `#section-slide[]` for clean section dividers.

Set `show-progress: true` to display a progress bar.

// =============================================================================
// SECTION 7: Equations
// =============================================================================

= Mathematical Content

== Inline and Display Math

Inline math: $f(x) = x^2 + 2x + 1$

Display math:
$ integral_0^infinity e^(-x^2) dif x = sqrt(pi) / 2 $

== Equation Slide

#equation-slide(
  $ nabla times bold(E) = -frac(partial bold(B), partial t) $,
  title: [Faraday's Law],
  subtitle: [One of Maxwell's equations describing electromagnetic induction],
  definitions: [
    #table(
      columns: (auto, 1fr),
      stroke: none,
      row-gutter: 8pt,
      [$bold(E)$], [Electric field],
      [$bold(B)$], [Magnetic field],
      [$nabla times$], [Curl operator],
    )
  ],
)

// =============================================================================
// SECTION 8: Figures
// =============================================================================

= Figures & Images

== Figure Slide

#figure-slide(
  rect(width: 60%, height: 150pt, fill: luma(230), stroke: 1pt + luma(200))[
    #align(center + horizon)[_Your figure here_]
  ],
  title: [Figure Title],
  caption: [Description of what the figure shows],
)

== Split Figure Slide

#figure-slide-split(
  rect(width: 100%, height: 120pt, fill: luma(230), stroke: 1pt + luma(200))[
    #align(center + horizon)[_Figure A_]
  ],
  rect(width: 100%, height: 120pt, fill: luma(230), stroke: 1pt + luma(200))[
    #align(center + horizon)[_Figure B_]
  ],
  title: [Side-by-Side Comparison],
  caption-left: [Before intervention],
  caption-right: [After intervention],
)

// =============================================================================
// SECTION 9: Configuration Reference
// =============================================================================

= Configuration Reference

== Theme Options

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt + luma(200),
  inset: 8pt,
  table.header(
    [*Option*], [*Values*], [*Description*]
  ),
  [`variant`], [`"light"`, `"dark"`], [Color mode],
  [`colortheme`], [`"tomorrow"`, `"warm-amber"`, `"paper"`, `"dracula"`], [Color palette (tomorrow default)],
  [`progressbar`], [`"foot"`, `"head"`, `"frametitle"`, `"none"`], [Progress bar position],
  [`header-style`], [`"moloch"`, `"minimal"`], [Slide header style],
  [`title-layout`], [`"moloch"`, `"centered"`, `"split"`], [Title slide layout],
)

== Typography Constants

#two-col(
  [
    *Sizes*
    - `size-display`: 42pt
    - `size-title`: 34pt
    - `size-slide-title`: 26pt
    - `size-body`: 17pt
    - `size-small`: 15pt
    - `size-caption`: 13pt
  ],
  [
    *Spacing*
    - `spacing-xs`: 6pt
    - `spacing-sm`: 10pt
    - `spacing-md`: 16pt
    - `spacing-lg`: 24pt
    - `spacing-xl`: 36pt
    - `spacing-2xl`: 48pt
  ]
)

== Color References

#two-col(
  [
    *Text Colors*
    - `text-primary`
    - `text-secondary`
    - `text-muted`
  ],
  [
    *Accent Colors*
    - `accent-primary`
    - `accent-secondary`
    - `accent-subtle`
  ]
)

// =============================================================================
// Bibliography & Acknowledgements
// =============================================================================

#bibliography-slide(bib-content: bibliography("references.bib", title: none, style: "apa"))

#acknowledgement-slide(
  subtitle: [Contributors and Resources],
  people: (
    (name: "Touying", role: "Framework"),
    (name: "Typst", role: "Platform"),
    (name: "Community", role: "Inspiration"),
  ),
  institutions: ("Open Source",),
  extra: [Built with care for beautiful presentations.],
)

#ending-slide(
  title: [Thank You],
  subtitle: [Questions & Discussion],
  contact: (
    "github.com/your-repo",
    "your.email@example.com",
  ),
)
