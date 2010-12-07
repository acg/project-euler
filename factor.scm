
(define (divides? n m)
  (= 0 (modulo n m)))

(define (factor-next v)
  (if (> v 2) (- v 1) '()))

(define (factor-first n)
  (let ((v (inexact->exact (floor (sqrt n)))))
    (if (> v 1) v '())))

(define (factor n)
  (let ((k (find-first (lambda (x) (divides? n x)) factor-next (factor-first n) )))
    (if (null? k) (list n) (append (factor k) (factor (/ n k))) )))

