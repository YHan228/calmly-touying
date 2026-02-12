// Academic Talk Template
// A realistic research presentation structure with citations
#import "../theme/theme.typ": *

#show: calmly.with(
  config-info(
    title: [Efficient Academic Talk],
    subtitle: [NeurIPS 2099],
    author: [Jane Musterfrau],
    date: datetime.today(),
    institution: [Department of Computer Science \
    University of Example

    Joint work with: John Doe, Alice Johnson],
  ),
  variant: "light",
  colortheme: "tomorrow",
  progressbar: "foot",
  header-style: "moloch",
)

// =============================================================================
// Title
// =============================================================================

#title-slide()

// =============================================================================
// Introduction
// =============================================================================

== Motivation

#text(size: size-small, fill: text-muted)[Why neural architecture search matters]

#v(1fr)

#only(1)[
  #align(center)[
    Manual architecture design is:
    - Time-consuming (weeks to months) @smith2023
    - Requires deep expertise
    - Often suboptimal
  ]
]

#only(2)[
  #highlight-box(title: "The Promise of NAS")[
    Automatically discover optimal architectures for specific tasks and constraints.
  ]

  #v(1em)

  But current methods face challenges:
  - Computational cost (thousands of GPU hours)
  - Search space limitations
  - Poor generalization
]

#v(1fr)

== Related Work

#text(size: size-small, fill: text-muted)[Building on prior foundations]

#two-col(
  [
    *Reinforcement Learning*
    - NASNet (Zoph et al.)
    - High performance
    - Extremely costly

    *Evolutionary Methods*
    - AmoebaNet
    - Good diversity
    - Slow convergence
  ],
  [
    *Gradient-Based*
    - DARTS (Liu et al.)
    - Fast optimization
    - Memory intensive

    *One-Shot Methods*
    - Weight sharing
    - Efficient
    - Ranking correlation issues
  ]
)

#cite-box(
  ("zoph2018nasnet", "liu2019darts"),
  display-label: "Zoph et al. 2018; Liu et al. 2019",
  position: "bottom-right"
)

== Our Contribution

#alert-box(title: "Research Question")[
  Can we achieve SOTA NAS performance with 10x less compute while maintaining architecture quality?
]

#v(1em)

#example-box(title: "Key Contributions")[
  + Novel gradient approximation reducing memory by 60%
  + Progressive search space pruning strategy
  + Theoretical analysis of convergence guarantees
  + SOTA results on CIFAR-10, ImageNet, and NAS-Bench-201
]

// =============================================================================
// Methods
// =============================================================================

#focus-slide[
  Methodology
]

== Problem Formulation

#text(size: size-small, fill: text-muted)[Formalizing the search objective]

#v(1fr)

Let $cal(A)$ be the architecture space and $cal(D)$ the dataset.

$ alpha^* = arg min_(alpha in cal(A)) cal(L)_"val" (w^*(alpha), alpha) $

where $w^*(alpha) = arg min_w cal(L)_"train" (w, alpha)$

#v(1em)

#highlight-box(title: "Bi-Level Optimization")[
  The nested optimization makes NAS computationally expensive.
]

#v(1fr)

#cite-box("liu2019darts", display-label: "Liu et al. 2019", position: "bottom-right")

#equation-slide(
  $ nabla_alpha cal(L)_"val" approx nabla_alpha cal(L)_"val" - xi nabla^2_(alpha, w) cal(L)_"train" dot nabla_w cal(L)_"val" $,
  title: [Gradient Approximation],
  subtitle: [First-order approximation eliminates expensive Hessian computation],
  definitions: [
    #table(
      columns: (auto, 1fr),
      stroke: none,
      row-gutter: 8pt,
      [$xi$], [Learning rate for weight update],
      [$nabla^2_(alpha, w)$], [Mixed partial derivatives (approximated)],
      [$cal(L)_"val", cal(L)_"train"$], [Validation and training losses],
    )
  ],
  citation: (bib-key: "liu2019darts", label: "Based on DARTS", position: "top-right"),
)

== Implementation

```python
def darts_step(model, arch_params, train_data, val_data, xi=0.01):
    """One step of DARTS: bilevel optimization."""
    # 1. Update weights on training data
    w_loss = model.loss(train_data)
    w_loss.backward()
    optimizer_w.step()

    # 2. Update architecture on validation data
    a_loss = model.loss(val_data)
    a_loss.backward()
    optimizer_a.step()

    return a_loss.item()
```

== Progressive Search Space Pruning

#text(size: size-small, fill: text-muted)[Reducing complexity during search]

#v(0.5em)

#only(1)[
  #align(center)[
    *Epoch 0:* Full search space

    #rect(width: 80%, height: 80pt, fill: luma(230), stroke: 1pt + luma(200))[
      #align(center + horizon)[All $|cal(O)|^E$ possible architectures]
    ]
  ]
]

#only(2)[
  #align(center)[
    *Epoch 50:* After first pruning

    #rect(width: 60%, height: 80pt, fill: luma(230), stroke: 1pt + luma(200))[
      #align(center + horizon)[Top 50% operations retained]
    ]
  ]

  Operations with $alpha_i < tau$ are pruned.
]

#only(3)[
  #align(center)[
    *Epoch 100:* Final architecture

    #rect(width: 40%, height: 80pt, fill: luma(230), stroke: 1pt + luma(200))[
      #align(center + horizon)[Discrete architecture]
    ]
  ]

  #example-box(title: "Result")[
    60% memory reduction with improved stability.
  ]
]

// =============================================================================
// Results
// =============================================================================

#section-slide(show-progress: true)[Results]

== Main Results: CIFAR-10

#text(size: size-small, fill: text-muted)[Comparison with state-of-the-art methods]

#table(
  columns: (1fr, auto, auto, auto),
  stroke: 0.5pt + luma(200),
  inset: 8pt,
  align: (left, center, center, center),
  table.header(
    [*Method*], [*Error (%)*], [*Params (M)*], [*GPU Days*]
  ),
  [NASNet-A], [2.65], [3.3], [1800],
  [AmoebaNet-A], [2.55], [3.2], [3150],
  [DARTS (2nd)], [2.76], [3.3], [4.0],
  [PC-DARTS], [2.57], [3.6], [0.1],
  [*Ours*], [*2.48*], [3.4], [*0.3*],
)

#v(0.5em)

#alert-box(title: "Key Finding")[
  Our method achieves lowest error with only 0.3 GPU days of search.
]

== Ablation Study

#text(size: size-small, fill: text-muted)[Understanding component contributions]

#three-col(
  [
    *Gradient Approx.*

    Without: 2.71%
    With: 2.56%

    #text(fill: accent-primary)[*-0.15%*]
  ],
  [
    *Progressive Pruning*

    Without: 2.63%
    With: 2.56%

    #text(fill: accent-primary)[*-0.07%*]
  ],
  [
    *Combined*

    Baseline: 2.76%
    Full: 2.48%

    #text(fill: accent-primary)[*-0.28%*]
  ]
)

#v(1em)

#highlight-box(title: "Insight")[
  Both components contribute, with gradient approximation having larger impact.
]

== Transferability to ImageNet

#text(size: size-small, fill: text-muted)[Architectures found on CIFAR-10, evaluated on ImageNet]

#two-col(
  [
    #table(
      columns: (auto, auto),
      stroke: none,
      row-gutter: 12pt,
      [*Top-1 Error*], [23.8%],
      [*Top-5 Error*], [7.1%],
      [*Parameters*], [5.3M],
      [*FLOPs*], [574M],
    )
  ],
  [
    #example-box(title: "Comparison")[
      - MobileNetV2: 28.0% (3.4M)
      - EfficientNet-B0: 23.7% (5.3M)
      - *Ours: 23.8% (5.3M)*
    ]
  ]
)

#v(0.5em)

Competitive with hand-designed efficient architectures.

// =============================================================================
// Discussion
// =============================================================================

#section-slide(show-progress: true)[Discussion]

== Key Takeaways

#alert-box(title: "Main Finding")[
  Efficient gradient-based NAS can match or exceed expensive methods at a fraction of the cost.
]

#v(1em)

#example-box(title: "Practical Implications")[
  + Democratizes NAS for resource-constrained researchers
  + Enables rapid architecture iteration
  + Opens new research directions in efficient search
]

== Limitations

#highlight-box(title: "Current Limitations")[
  - Search space still manually designed
  - Limited to differentiable operations
  - Proxy task gap (CIFAR $arrow$ ImageNet)
  - Reproducibility challenges with random seeds
]

#v(1em)

Future work should address these through:
- Learned search spaces
- Non-differentiable operation handling
- Direct large-scale search

== Future Directions

#three-col(
  [
    *Short-term*
    - Multi-objective NAS
    - Hardware-aware search
    - Robustness constraints
  ],
  [
    *Medium-term*
    - Zero-cost proxies
    - Transfer learning
    - Foundation model adaptation
  ],
  [
    *Long-term*
    - Fully automated ML
    - Self-improving systems
    - Theoretical foundations
  ]
)

// =============================================================================
// Conclusion
// =============================================================================

#focus-slide[
  Summary
]

== Conclusion

#highlight-box(title: "What We Showed")[
  + Novel gradient approximation for efficient NAS
  + Progressive pruning reduces memory 60%
  + SOTA results: 2.48% error on CIFAR-10
  + Only 0.3 GPU days (10x faster than DARTS)
]

#v(1em)

#alert-box(title: "Open Questions")[
  How can we further close the gap between proxy and target tasks?
]

// =============================================================================
// References & Acknowledgements
// =============================================================================

== Acknowledgements

#table(
  columns: (auto, 1fr),
  stroke: none,
  row-gutter: 1.5em,
  column-gutter: 1.5em,
  align: (center + horizon, left + horizon),
  [#rect(width: 60pt, height: 40pt, fill: luma(230))[Logo]], [University Computing Center for GPU resources],
  [#rect(width: 60pt, height: 40pt, fill: luma(230))[Logo]], [National Science Foundation Grant #12345],
  [#rect(width: 60pt, height: 40pt, fill: luma(230))[Logo]], [Industry Partner for dataset access],
)

#v(1em)

Special thanks to the anonymous reviewers for constructive feedback.

#bibliography-slide(bib-content: bibliography("references.bib", title: none, style: "apa"))

#ending-slide(
  title: [Thank You],
  subtitle: [Questions?],
  contact: (
    "jane.smith@university.edu",
    "github.com/jsmith/efficient-nas",
    "arxiv.org/abs/2024.xxxxx",
  ),
)
