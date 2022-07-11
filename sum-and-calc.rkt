#lang racket

(define sum
  (lambda (exp)
    (match exp
      ((? number? x) x)
      (`(,e1 ,e2) (+ (sum e1) (sum e2))))))

; 3
(sum '(1 2))
; 6
(sum '(1 (2 3)))
; 6
(sum '((1 2) 3))
; 10
(sum '((1 2) (3 4)))

(define calc
  (lambda (exp)
    (match exp
      ((? number? x) x)
      (`(,op ,e1 ,e2)
       (let ((v1 (calc e1)) (v2 (calc e2)))
         (match op
           ('+ (+ v1 v2))
           ('- (- v1 v2))
           ('* (* v1 v2))
           ('/ (/ v1 v2))))))))

; 3
(calc '(+ 1 2))
; 6
(calc '(* 2 3))
; 21
(calc '(* (+ 1 2) (+ 3 4)))
