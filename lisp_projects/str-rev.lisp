;;; Reversing a string

(defun str-rev (str)
  (let ((r-str (make-array (length str)
			   :element-type 'character)))
    (loop for i from 0 below (length str) do
	 (setf (aref r-str i) (aref str (- (length str) (+ i 1)))))
    r-str))

(defun str-rev (str)
  (defun rev (acc str)
    (if (string/= str "")
	(rev (catenate (char str 0) acc) (subseq str 1))
	acc)))


(defun rev-lst (lst)
  (defun rev (acc lst)
    (if lst	
	(rev (cons (car lst) acc) (cdr lst))
	acc))
  (rev () lst))

(defun str-rev-dumb (str)
  (doiter ))
