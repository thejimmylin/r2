#lang racket

(define env0 `())

(define ext-env
  (lambda (x v env)
    (cons (list x v) env)))

(ext-env `name "Jimmy"
  (ext-env `age 29 env0))
