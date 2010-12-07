; quicksort in scheme

; http://cs.hofstra.edu/~cscccl/csc123/quicksort.scm
; patched to allow arbitrary cmp function

; given list '(7 3 9 6 5 3 2 7 6) -> return sorted list

; pivot function returns the pivot - first element out of order.
; returns 'done if no pivot (means list already sorted)

; partition function takes pivot, list and returns a pair of lists of the
; form '((4 3 6) (8 9 7))

; given:
; (append '(1 2) '(3 4)) --> (1 2 3 4)
; (member 1 '(3 1 2)) --> #t  (or actually, the rest of the list)

(define (pivot l cmp)
  (cond ((null? l) 'done)
	((null? (cdr l)) 'done)
        ((<= 0 (cmp (car l) (cadr l))) (pivot (cdr l) cmp))
	(#t (car l))))

; usage: (partition 4 '(6 4 2 1 7) () ()) -> returns partitions
(define (partition piv l p1 p2 cmp)
  (if (null? l) (list p1 p2)
     (if (< 0 (cmp (car l) piv)) (partition piv (cdr l) (cons (car l) p1) p2 cmp)
	 (partition piv (cdr l) p1 (cons (car l) p2) cmp))))

(define (quicksort l cmp)
 (let ((piv (pivot l cmp)))
   (if (eq? piv 'done) l
     (let ((parts (partition piv l () () cmp)))
       (append (quicksort (car parts) cmp) 
               (quicksort (cadr parts) cmp))))))

(define (cmp-numeric x y)
  (if (< x y) 1
      (if (> x y) -1 0)))

(define (quicksort-numeric l)
  (quicksort l cmp-numeric))

; load program in scheme with (load "quicksort.scm")
; sample use:  
;2 error> (quicksort-numeric '(3 8 5 4 8 2 4 1 9 4))

;Value 2: (1 2 3 4 4 4 5 8 8 9)


