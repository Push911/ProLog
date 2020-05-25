philosoph :-
    mutex_create(Philosoph1),
    mutex_create(Philosoph2),
    mutex_create(Philosoph3),
    mutex_create(Philosoph4),
    mutex_create(Philosoph5),
    
    thread_create(loop(1, Philosoph1, Philosoph2), _),
    thread_create(loop(2, Philosoph2, Philosoph3), _),
    thread_create(loop(3, Philosoph3, Philosoph4), _),
    thread_create(loop(4, Philosoph4, Philosoph5), _),
    thread_create(loop(5, Philosoph5, Philosoph1), _).

loop(Philosopher, Left, Right) :-
    format('[~w] thinking~n', [Philosopher]),
    format('[~w] want the left fork~n', [Philosopher]),
    mutex_lock(Left),
    format('[~w] picked up left fork~n', [Philosopher]),
    format('[~w] want the right fork~n', [Philosopher]),
    mutex_lock(Right),
    format('[~w] picked up right fork~n', [Philosopher]),
    format('[~w] eating~n', [Philosopher]),
    mutex_unlock(Left),
    format('[~w] put the left fork~n', [Philosopher]),
    mutex_unlock(Right),
    format('[~w] put the right fork~n', [Philosopher]),   
    loop(Philosopher, Left, Right).
