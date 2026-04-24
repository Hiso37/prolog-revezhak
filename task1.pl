% Завдання: Знайти суму всіх парних з n перших чисел Фібоначчі

% fib(+N, -F): N-те число Фібоначчі

% Опишемо вазові випадки

fib(0, 0).
fib(1, 1).

% За правилом рекурсії F(n) = F(n-1) + F(n-2)

fib(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, F1),
    fib(N2, F2),
    F is F1 + F2.

% fib_list(+N, -List): список перших N чисел Фібоначчі (з індексами 0...(N-1))

fib_list(N, List) :-
    N >= 0,
    fib_list_helper(0, N, List).

% Допоміжне правило, збираємо числа Фібоначчі від I до N

fib_list_helper(I, N, []) :-
    I >= N. % якщо досягли кінця - порожній список
fib_list_helper(I, N, [F|Rest]) :-
    I < N,
    fib(I, F), % обчислюємо I-те число Фібоначчі
    I1 is I + 1,
    fib_list_helper(I1, N, Rest). % рекурсивно беремо наступні числа

% even_sum(+List, -Sum): сума парних елементів списку
even_sum([], 0). % порожній список, сума дорівнює 0
even_sum([H|T], Sum) :-
    H mod 2 =:= 0, % якщо H парне
    !,
    even_sum(T, Rest),
    Sum is Rest + H. % ( + H) до суми
even_sum([_|T], Sum) :-
    even_sum(T, Sum). % Пропуск якщо непарне

% even_fib_sum(+N, -Sum): сума парних з перших N чисел Фібоначчі
even_fib_sum(N, Sum) :-
    fib_list(N, List), % список перших N чисел
    even_sum(List, Sum). % рахуємо суму парних