;; hatch-angle.lsp - Change the pattern angle of selected hatches
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
