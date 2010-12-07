(load "common.scm")
(load "factor.scm")

; (display (factor 600851475143))
(display (eval (append '(max) (factor 600851475143))))

