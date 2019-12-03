(let ((vowel-hash (make-hash-table :test #'equalp)))
  (loop for c across "aeiou" do
       (setf (gethash c vowel-hash) t))
  (defun pig-latin (word)
    (let ((consonants-lst nil))
      (loop for c across word do
	   (if (not (gethash c vowel-hash))
	       (setf consonants-lst (cons c consonants-lst))
	       (return)))
      consonants-lst)))

(let ((vowel-hash (make-hash-table :test #'equalp)))
  (loop for c across "aeiou" do
       (setf (gethash c vowel-hash) t))
  (defun pig-latin (word)
    (if (equal word "")
	""
	(let ((len (length word))
	      (my-string (make-array 0
				     :element-type 'character
				     :fill-pointer 0
				     :adjustable t)))
	  (labels ((foo (idx)	 ; returns the first consonant cluster
		     (if (or (= idx len) (gethash (char word idx) vowel-hash))
			 (values (concatenate 'string  my-string "ay") idx)
			 (progn
			   (vector-push-extend (char word idx) my-string)
			   (foo (1+ idx))))))
	    (multiple-value-bind  (suffix idx) (foo 0)
	      (concatenate 'string (subseq word idx) suffix)))))))
