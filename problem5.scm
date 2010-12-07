; no fair using the builtin lcm i assume ;)

(load "quicksort.scm")
(load "common.scm")
(load "factor.scm")

; similar to unix uniq(1) command with -c option
; assumes sorted input -- actually, just that like values are grouped

;   input eg: (2 5 5 5 9 13 13 13 13)
;   output eg: (13 4 9 1 5 3 2 1)   ; FIXME reverse pairwise

(define (uniq-count l)
  (aggregate uniq-count-aggregate cdr '() l ))

(define (uniq-count-aggregate acc l)
  (let ((v (car l)))
    (if (null? acc) (list v 1)
      (let ((v0 (car acc)) (count (cadr acc)))
        (if (= v0 v)
          (append (list v (+ 1 count)) (cddr acc))
          (append (list v 1 v0 count) (cddr acc)))))))

; factor a number into a flat list (prime factor,exponent) pairs
;  eg (factor-powers 60) -> (5 1 3 1 2 2)

(define (factor-powers n)
  (uniq-count (quicksort-numeric (factor n))))

; merge two factor powers lists into a single list 
; with the maximum of the two exponents for any common prime factors

(define (merge-factor-powers l1 l2)
  (cond
    ((null? l1) l2)
    ((null? l2) l1)
    (else (let
      ((v1 (car l1)) (count1 (cadr l1))
       (v2 (car l2)) (count2 (cadr l2)))
      (cond
        ((= v1 v2)
          (append (list v1 (max count1 count2)) (merge-factor-powers (cddr l1) (cddr l2))))
        ((> v1 v2)
          (append (list v1 count1) (merge-factor-powers (cddr l1) l2)))
        ((< v1 v2)
          (append (list v2 count2) (merge-factor-powers l1 (cddr l2)))) ) ))))

; find lcm by merging factor powers lists

(define (my-lcm l)
  (multiply-powers (aggregate my-lcm-aggregate cdr '() l)))

(define (my-lcm-aggregate acc l)
  (merge-factor-powers acc (factor-powers (car l))))

; multiple everything in a factor powers list together

(define (multiply-powers l)
  (if (null? l) 1
    (* (inexact->exact (expt (car l) (cadr l))) (multiply-powers (cddr l)))))


(display (my-lcm (range 1 20)))

