p --> [].
p --> `a`, p, `b`.

p1 --> p1(_).
p1(X) --> p1a(X), p1bc(X).

p1a(z) --> ``.
p1a(t(N)) --> `a`, p1a(N).

p1bc(z) --> ``.
p1bc(t(N)) --> `b`, p1bc(N), `c`.

p2 --> p2(_).
p2(X) --> p2a(X), fibonacci(X).

p2a(z) --> ``.
p2a(t(X)) --> `a`, p2a(X).

fibonacci(z) --> ``.
fibonacci(t(z)) --> `b`.
fibonacci(t(t(X))) --> fibonacci(X), fibonacci(t(X)).
