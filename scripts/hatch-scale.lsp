;; hatch-scale.lsp - Change the pattern scale of selected hatches
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
