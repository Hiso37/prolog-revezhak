% Завдання: Знайти всі рішення арифметичного ребусу
% КОЗА + КОЗА = СТАДО

% Кожна буква — пронумерована (0-9)
% К, С — не можуть бути 0
%
% КОЗА  = К * 1000 + О * 100 + З * 10 + А
% СТАДО = С * 10000 + Т * 1000 + А*100 + Д * 10 + О
%
% Рівняння: 2 * КОЗА = СТАДО

% digit(X): X — цифра від 0 до 9
digit(X) :- member(X, [0,1,2,3,4,5,6,7,8,9]).

% solve(-К, -О, -З, -А, -С, -Т, -Д): знаходить значення букв
solve(K, O, Z, A, S, T, D) :-

    % Вибираємо цифри для кожної букви

    digit(K), K =\= 0, % К — перша цифра, не 0
    digit(O),
    digit(Z),
    digit(A),
    digit(S), S =\= 0, % С — перша цифра, не 0
    digit(T),
    digit(D),

    % Усі букви різні

    all_different([K, O, Z, A, S, T, D]),
    % Обчислюємо числа
    KOZA  is K*1000 + O*100 + Z*10 + A,
    STADO is S*10000 + T*1000 + A*100 + D*10 + O,
    % Перевіряємо рівняння: КОЗА + КОЗА = СТАДО
    STADO =:= 2 * KOZA.

% all_different(+List): усі елементи списку різні
all_different([]).
all_different([H|T]) :-
    \+ member(H, T), % H не міститься у хвості
    all_different(T). % рекурсивно перевіряємо хвіст

print_solution(K, O, Z, A, S, T, D) :-
    KOZA  is K*1000 + O*100 + Z*10 + A,
    STADO is S*10000 + T*1000 + A*100 + D*10 + O,
    format("К=~w, О=~w, З=~w, А=~w, С=~w, Т=~w, Д=~w~n", [K,O,Z,A,S,T,D]),
    format("~w + ~w = ~w~n", [KOZA, KOZA, STADO]).

% solve_all: знаходить і виводить усі рішення
solve_all :-
    solve(K, O, Z, A, S, T, D),
    print_solution(K, O, Z, A, S, T, D),
    fail. % backtracking — шукаємо наступне рішення
solve_all.
