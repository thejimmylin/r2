#lang racket

(define sum
  (lambda (tree)
    (match tree
      ((? number? x) x)
      (`(,tree1 ,tree2) (+ (sum tree1) (sum tree2))))))

; Tests
; 3
(sum '(1 2))
; 6
(sum '(1 (2 3)))
; 6
(sum '((1 2) 3))
; 10
(sum '((1 2) (3 4)))

(define calc
  (lambda (tree)
    (match tree
      ((? number? x) x)
      (`(,op ,tree1 ,tree2)
       (let ((v1 (calc tree1))
             (v2 (calc tree2)))
         (match op
           ('+ (+ v1 v2))
           ('- (- v1 v2))
           ('* (* v1 v2))
           ('/ (/ v1 v2))))))))

; Tests
; 3
(calc '(+ 1 2))
; 6
(calc '(* 2 3))
; 21
(calc '(* (+ 1 2) (+ 3 4)))
