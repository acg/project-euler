(define (findfirst test? next v)
  (if (null? v) '()
    (if (test? v) v (findfirst test? next (next v)))))

(define (reverse-string s)
  (list->string (reverse (string->list s))))

(define (palindrome-number? n)
  (let ((s (number->string n))) (string=? s (reverse-string s))))

(define (divides? n m)
  (= 0 (modulo n m)))

(define (has-factor-pair-in-range? n a b)
  (not (null?
    (findfirst
      (lambda (x) (and (divides? n x)
        (let ((y (/ n x)))
          (and (>= y a) (<= y b) ))))
      (lambda (x) (if (>= x a) (- x 1) '()))
      b))))

(define (largest-palindromic-product a b)
  (let ((A (* a a)) (B (* b b)))
    (findfirst
      (lambda (x) (and (palindrome-number? x) (has-factor-pair-in-range? x a b) ))
      (lambda (x) (if (>= x A) (- x 1) '()))
      B )))

(display (largest-palindromic-product 100 999))

