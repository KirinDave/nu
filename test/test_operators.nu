;; test_operators.nu
;;  tests for Nu operators.
;;
;;  Copyright (c) 2007 Tim Burks, Neon Design Technology, Inc.

(class TestOperators is NuTestCase
     
     (imethod (id) testMinOperator is
          (assert_equal -5 (min (* 5 -1) 10 20 30 40 50000))
          (assert_equal 40.0 (min 40.0 400.0 19992.5))
          (assert_equal "a" (min "a" "b" "c" "d" "e"))
          (assert_equal 'x' (min 'x' 'y' 'z')))
     
     (imethod (id) testMaxOperator is
          (assert_equal 50000 (max -5 10 20 30 40 (* 500 100)))
          (assert_equal 19992.5 (max 40.0 400.0 19992.5))
          (assert_equal "e" (max "a" "b" "c" "d" "e"))
          (assert_equal 'z' (max 'x' 'y' 'z')))
     
     (imethod (id) testAddOperator is
          (assert_equal 3 (+ 1 1 -5 6))
          (assert_equal "hello, world" (+ "hello" "," " " "world")))
     
     ;; Our "ternary operator" is really a method and not an operator, but I think it belongs here anyway.
     (imethod (id) dontTestTheDeprecatedTernaryOperator is
          (assert_equal "no" (nil ? "yes" : "no"))
          (assert_equal "no" (() ? "yes" : "no")) 
          (assert_equal "no" (0 ? "yes" : "no"))
          (assert_equal "yes" (t ? "yes" : "no"))
          (assert_equal "yes" ('(a b c) ? "yes" : "no"))
          (assert_equal "yes" (1 ? "yes" : "no"))
          (assert_equal "yes" ((== 4 (+ 2 2)) ? "yes" : "no"))
          (assert_equal "no" ((== 4 (+ 2 2 2)) ? "yes" : "no"))
          (set x 1) 
          (assert_equal "one" ((== x 0) ? "zero" : ((== x 1) ? "one" : "many")))
          (set x 2) 
          (assert_equal "many" ((== x 0) ? "zero" : ((== x 1) ? "one" : "many"))))
     
     ;; turn this off by default; it's a good test, but it requires manual intervention
     (imethod (id) dontTestTheGetsOperator is
          (assert_not_equal nil gets)
          (puts "\nPlease don't enter anything.")
          (assert_equal (gets) "")))
