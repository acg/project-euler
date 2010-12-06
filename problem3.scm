(define (findfirst test? next v)
  (if (null? v) '()
    (if (test? v) v (findfirst test? next (next v)))))

(define (divides? n m)
  (= 0 (modulo n m)))

(define (factornext v)
  (if (> v 2) (- v 1) '()))

(define (factorfirst n)
  (let ((v (inexact->exact (floor (sqrt n)))))
    (if (> v 1) v '())))

(define (factor n)
  (let ((k (findfirst (lambda (x) (divides? n x)) factornext (factorfirst n) )))
    (if (null? k) (list n) (append (factor k) (factor (/ n k))) )))

; (display (factor 600851475143))
(display (eval (append '(max) (factor 600851475143))))

