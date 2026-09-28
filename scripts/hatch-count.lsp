;; hatch-count.lsp - Count the hatches in the drawing
;; Command: HCOUNT
(defun c:HCOUNT ( / ss )
  (setq ss (ssget "_X" '((0 . "HATCH"))))
  (princ (strcat "\nHatches in drawing: " (itoa (if ss (sslength ss) 0))))
  (princ)
)
