I = (x) -> x

toBool = (p) -> (p true) false

TRUE  = (x) -> (y) -> x
FALSE = (x) -> (y) -> y

NOT = (p) ->        (x) -> (y) -> (p y) x
AND = (p) -> (q) -> (p q) FALSE
OR  = (p) -> (q) -> (p TRUE) q

toInt = (n) -> (n ((x) -> x + 1)) 0

ZERO  = (f) -> (x) -> x
ONE   = (f) -> (x) -> f x
TWO   = (f) -> (x) -> f (f x)
THREE = (f) -> (x) -> f (f (f x))

SUCC = (n) -> (f) -> (x) -> f ((n f) x)
SUCC = (n) -> (f) -> (x) -> (n f) (f x)

ADD  = (n) -> (m) -> (f) -> (x) -> (((n SUCC) m) f) x
ADD  = (n) -> n SUCC

PROD = (n) -> (m) -> (f) -> (x) -> (n m f) x
PROD = (n) -> (m) -> (f) -> n m f
