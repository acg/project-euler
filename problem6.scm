(load "common.scm")

(define (sum l)
  (aggregate (lambda (acc l) (+ acc (car l))) cdr 0 l))

(define (sum-of-squares l)
  (sum (map (lambda (x) (* x x)) l)))

(define (square-of-sums l)
  (let ((x (sum l))) (* x x)))

(display (let ((l (range 1 100))) (- (square-of-sums l) (sum-of-squares l))))

