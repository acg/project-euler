
(load "common.scm")

(define (check-triplet a b c)
  (= (+ (* a a) (* b b)) (* c c))
)

(define (range-a N)
  (list 1 (- (inexact->exact (truncate (/ N 3))) 1))
)

(define (range-b N a)
  (list (+ a 1) (inexact->exact (truncate (/ (- N a) 2))))
)

(define (map-range r f)
  (let ((a (car r)) (b (cadr r)))
    (if (> a b) '()
      (let ((x (f a))
            (l (map-range (list (+ a 1) b) f)))
        (if (null? x) l (append (list x) l))))))

; TODO flatten outer list

(define (pythagorean-triplets N)
  (map-range (range-a N) (lambda (a)
    (map-range (range-b N a) (lambda (b)
      (let ((c (- N (+ a b))))
        (if (check-triplet a b c) (list a b c) '()))
    ))
  ))
)

