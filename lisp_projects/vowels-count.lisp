;;; Count number of vowels in a string. Report a sum of each vowel found

(let ((vowels-dict (make-hash-table :test 'equalp)))
  (loop for c across "aeiou" do
       (setf (gethash c vowels-dict) t))
  (defun vowels-count (str)
    (let ((num-vowels 0))
      (loop for c across str do
	   (if (gethash c vowels-dict)
	       (incf num-vowels)))
      num-vowels))
  

  (defun vowels-count-report (str)
    (let ((num-count-hash (make-hash-table :test 'equalp)))
      (loop for c across "aeiou" do
	   (setf (gethash c num-count-hash) 0))
      (loop for c across str do
	   (if (gethash c vowels-dict)
	       (incf (gethash c num-count-hash))))
      (vowels-report num-count-hash)))

  
  (defun print-vowel-count (key value)
    (format t "~a:~a~%" key value))

  (defun vowels-report (vowel-hash)
    (maphash #'print-vowel-count vowel-hash)))

(let ((vowels-dict (make-hash-table :test 'equalp)))
  (loop for c across "aeiou" do
       (setf (gethash c vowels-dict) t))
  (defun vowels-count (str)
    (let ((num-vowels 0))
      (loop for c across str do
	   (if (gethash c vowels-dict)
	       (incf num-vowels)))
      num-vowels)))
