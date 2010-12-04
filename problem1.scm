(define (range a b) (if (<= a b) (cons a (range (+ 1 a) b)) '() ) )
(define (sumlist l) (if (eq? l '()) 0 (+ (car l) (sumlist (cdr l)))))
(define (isdiv3or5 x) (or (= 0 (modulo x 3)) (= 0 (modulo x 5))))
(display (sumlist (map (lambda (x) (if (isdiv3or5 x) x 0)) (range 1 1000))))
