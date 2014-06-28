I = (x) -> x

toBool = (p) -> (p true) false

TRUE  = (x) -> (y) -> x
FALSE = (x) -> (y) -> y
FALSE = TRUE I

NOT = (p) -> (x) -> (y) -> (p y) x
NOT = (p) -> (p FALSE) TRUE

AND = (p) -> (q) -> (x) -> (y) -> (((p TRUE) FALSE) ((q x) y)) y
AND = (p) -> (q) -> (p q) FALSE

OR  = (p) -> (q) -> (x) -> (y) -> (((p TRUE) FALSE) x) ((q x) y)
OR  = (p) -> (q) -> (p TRUE) q
OR  = (p) -> p TRUE

toInt = (n) -> (n ((x) -> x + 1)) 0
fromInt = (number) -> if number == 0 then ZERO else SUCC fromInt (number - 1)

ZERO  = (f) -> (x) -> x
ONE   = (f) -> (x) -> f x
TWO   = (f) -> (x) -> f (f x)
THREE = (f) -> (x) -> f (f (f x))

SUCC = (n) -> (f) -> (x) -> f ((n f) x)
SUCC = (n) -> (f) -> (x) -> (n f) (f x)

FOUR = SUCC THREE
FIVE = SUCC FOUR
SIX  = SUCC FIVE

ADD  = (n) -> (m) -> (f) -> (x) -> (((n SUCC) m) f) x
ADD  = (n) -> n SUCC

MULT = (n) -> (m) -> (f) -> (x) -> (n m f) x
MULT = (n) -> (m) -> (f) -> n m f

CONST = (k) -> (x) -> k
CONST = TRUE

ISZERO = (n) -> (n (AND FALSE)) TRUE
ISZERO = (n) -> (n (CONST FALSE)) TRUE
ISZERO = (n) -> ((n FALSE) NOT) FALSE

toPair = (p) -> left: (p TRUE), right: (p FALSE)

PAIR  = (a) -> (b) -> (f) -> (f a) b
LEFT  = (p) -> p TRUE
RIGHT = (p) -> p FALSE

NIL = (x) -> TRUE
ISNIL = (p) -> p ((x) -> (y) -> FALSE)

fromArray = (array) -> if array.length == 0 then NIL else (PAIR array[0]) fromArray array.slice(1)
toArray   = (list)  -> if toBool ISNIL list then []  else [LEFT list].concat(toArray RIGHT list)

NEXTPAIR = (p) -> (PAIR RIGHT p) SUCC RIGHT p
PRED = (n) -> LEFT ((n NEXTPAIR) ((PAIR ZERO) ZERO))

SUBSTRACT = (n) -> n PRED

YP = (f) -> (g) -> (x) -> (f g g) x
Y = (f) ->  (YP f) (YP f)
