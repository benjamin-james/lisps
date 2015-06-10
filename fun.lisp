(defun primep (n &optional (d 2))
  (or (>= d n)
      (and (/= (rem n d) 0)
	   (primep n (+ d 1)))))
(defun factorial (n)
  (if (> n 1)
      (* n (factorial (- n 1)))
      n))
(defun next-prime (n)
  (loop for x from n when (primep x) return x))

(defmacro do-primes ((var start end) &body body)
  `(do ((,var (next-prime ,start) (next-prime (1+ ,var))))
       ((> ,var ,end))
     ,@body))
;(load "~/Programs/custom/fun.lisp");;for SLIME

;(do-primes (p 1 20) (format t "~d " p));example

