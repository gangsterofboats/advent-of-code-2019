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

(define in (file->list "day-01-input.txt"))

(define (part-one input)
  (define sum-fuel
    (for/sum ([m input])
      (- (quotient m 3) 2)))
  (print sum-fuel))

(define-syntax-rule (while test body ...)
    (let loop () (when test body ... (loop))))

(define (part-two input)
  (define sum-fuel
    (for/sum ([m input])
      (define s-f 0)
      (while (> m 0)
        (set! m (- (quotient m 3) 2))
        (if (<= m 0)
            0
            (set! s-f (+ s-f m))))
      s-f))
  (print sum-fuel))

(part-one in)
(part-two in)
