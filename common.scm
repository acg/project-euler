
(define (range a b)
  (if (<= a b) (cons a (range (+ 1 a) b)) '()))

(define (find-first test? next v)
  (if (null? v) '()
    (if (test? v) v (find-first test? next (next v)))))

(define (aggregate agg next c v) (if (eq? v ()) c (aggregate agg next (agg c v) (next v))))

