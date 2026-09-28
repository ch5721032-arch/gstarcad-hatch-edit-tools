# GstarCAD Hatch Edit Tools

Set a new pattern scale or angle across a selection of hatches, and count the hatches in a drawing.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

A hatch at the wrong scale or angle is the most common pattern complaint in a drawing set. These utilities set a new pattern scale or angle across a whole selection in one command, and count every hatch in the drawing so nothing is missed.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/hatch-scale.lsp` | ;; hatch-scale.lsp - Change the pattern scale of selected hatches
;; Command: HSCALE
;; Usage: select pattern hatches, then enter the new scale (e.g. 2)
(defun c:HSCALE ( / ss s i en ed )
  (setq ss (ssget '((0 . "HATCH"))))
  (if ss
    (progn
      (setq s (getreal "\nNew pattern scale: "))
      (if s
        (progn
          (setq i 0)
          (repeat (sslength ss)
            (setq en (ssname ss i) ed (entget en))
            (if (assoc 41 ed)
              (entmod (subst (cons 41 s) (assoc 41 ed) ed))
            )
            (setq i (1+ i))
          )
          (princ (strcat "\nScale updated on " (itoa (sslength ss)) " hatches."))
        )
      )
    )
  )
  (princ)
)
 |
| `scripts/hatch-angle.lsp` | ;; hatch-angle.lsp - Change the pattern angle of selected hatches
;; Command: HANGLE
;; Usage: select pattern hatches, then enter the new angle in degrees
(defun c:HANGLE ( / ss a i en ed )
  (setq ss (ssget '((0 . "HATCH"))))
  (if ss
    (progn
      (setq a (getreal "\nNew pattern angle (degrees): "))
      (if a
        (progn
          (setq i 0)
          (repeat (sslength ss)
            (setq en (ssname ss i) ed (entget en))
            (if (assoc 52 ed)
              (entmod (subst (cons 52 a) (assoc 52 ed) ed))
            )
            (setq i (1+ i))
          )
          (princ (strcat "\nAngle updated on " (itoa (sslength ss)) " hatches."))
        )
      )
    )
  )
  (princ)
)
 |
| `scripts/hatch-count.lsp` | ;; hatch-count.lsp - Count the hatches in the drawing
;; Command: HCOUNT
(defun c:HCOUNT ( / ss )
  (setq ss (ssget "_X" '((0 . "HATCH"))))
  (princ (strcat "\nHatches in drawing: " (itoa (if ss (sslength ss) 0))))
  (princ)
)
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
