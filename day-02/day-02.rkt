#lang racket
#| #############################################################################
# Copyright (C) 2019 Michael Wiseman                                           #
#                                                                              #
# This program is free software: you can redistribute it and/or modify it      #
# under the terms of the GNU Affero General Public License as published by the #
# Free Software Foundation, either version 3 of the License, or (at your       #
# option) any later version.                                                   #
#                                                                              #
# This program is distributed in the hope that it will be useful, but WITHOUT  #
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        #
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License #
# for more details.                                                            #
#                                                                              #
# You should have received a copy of the GNU Affero General Public License     #
# along with this program.  If not, see <https://www.gnu.org/licenses/>.       #
############################################################################# |#

;;;;;;;;;;;;;;;;
;; UNFINISHED ;;
;;;;;;;;;;;;;;;;

(define-syntax-rule (while test body ...)
    (let loop () (when test body ... (loop))))

(define in (string-split (file->string "day-02-input.txt") ","))
(set! in (list->vector (map string->number (list-update in (- (length in) 1) string-trim))))

(define (part-one input)
  (vector-set! input 1 12)
  (vector-set! input 2 2)
  (define ptr 0)
  (define pos-f 0)
  (define pos-s 0)
  (define pos-t 0)

  (while (not (= (vector-ref input ptr) 99))
    (cond
      [(= (vector-ref input ptr) 1) => (lambda (x)
                                         (set! pos-f (vector-ref input (+ ptr 1)))
                                         (set! pos-s (vector-ref input (+ ptr 2)))
                                         (set! pos-t (vector-ref input (+ ptr 3)))
                                         (vector-set! input pos-t (+ (vector-ref input pos-f) (vector-ref input pos-s))))]
      [(= (vector-ref input ptr) 2) => (lambda (x)
                                         (set! pos-f (vector-ref input (+ ptr 1)))
                                         (set! pos-s (vector-ref input (+ ptr 2)))
                                         (set! pos-t (vector-ref input (+ ptr 3)))
                                         (vector-set! input pos-t (* (vector-ref input pos-f) (vector-ref input pos-s))))])
    (set! ptr (+ 4 ptr)))
  (print (vector-ref input 0)))

(define (part-two input)


  (for*/first ([noun (in-range 100)]
               [verb (in-range 100)]
               #:when (= (vector-ref input 0) 19690720)))
    (print noun)))
    ;; (vector-set! input 1 noun)
    ;; (vector-set! input 2 verb)
    ;; (define ptr 0)
    ;; (define pos-f 0)
    ;; (define pos-s 0)
    ;; (define pos-t 0)
    ;; (cond
      ;; [(= (vector-ref input ptr) 1) => (lambda (x)
                                           ;; (set! pos-f (vector-ref input (+ ptr 1)))
                                           ;; (set! pos-s (vector-ref input (+ ptr 2)))
                                           ;; (set! pos-t (vector-ref input (+ ptr 3)))
                                           ;; (vector-set! input pos-t (+ (vector-ref input pos-f) (vector-ref input pos-s))))]
      ;; [(= (vector-ref input ptr) 2) => (lambda (x)
                                           ;; (set! pos-f (vector-ref input (+ ptr 1)))
                                           ;; (set! pos-s (vector-ref input (+ ptr 2)))
                                           ;; (set! pos-t (vector-ref input (+ ptr 3)))
                                           ;; (vector-set! input pos-t (* (vector-ref input pos-f) (vector-ref input pos-s))))]
      ;; [(= (vector-ref input ptr) 99) input])
    ;; (set! ptr (+ 4 ptr)))
  ;; (print (+ (* 100 noun) verb)))

;; (part-one in) ; 4570637
(part-two in) ; 5485
