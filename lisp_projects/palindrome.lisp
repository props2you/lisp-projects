;;; Check if Palindrome – Checks if the string entered by the user is
;;; a palindrome. That is that it reads the same forwards as backwards
;;; like “racecar”

(defun palindromep (str)
  (let ((len (length str)))
    (dotimes (i (truncate (/ len 2)))
      (format t "~a ~a ~a ~a~%" i (aref str i) (aref str (- len i 1)) (not
	   (char-equal (aref str i)
		       (aref str (- len i 1)))))  
      (if (not
	   (char-equal (aref str i)
		       (aref str (- len i 1))))
	  (return-from palindromep))))
  t)


(defun palindromep-2 (str)
  (equal str (reverse str)))


(defun palindromep-3 (str)
  (let* ((half-len (floor (length str) 2))
	 (rev-half-str (reverse (subseq str half-len))))
    (loop for c1 across str
       for c2 across rev-half-str
	 always (char-equal c1 c2) )))
