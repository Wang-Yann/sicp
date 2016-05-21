(load "../Chap-one/prime.scm");;;;此处为相对导入的形式，依旧采用unix 文件命令的方式
(load "3-5-1.scm")
(define sp
 (stream-filter prime? (stream-enumerate-interval 10000 1000000)))

