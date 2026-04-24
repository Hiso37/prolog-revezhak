% Завдання: Напишіть програму вставки підсписку до списку,
% починаючи з i-го елемента.

% insert_sublist(+Sub, +List, +I, -Result)
% Вставляє підсписок Sub до списку List починаючи з позиції I (1 - based).
% Result — це результуючий список.
 
% Базовий випадок: коли досягаємо першої позиції — вставляємо підсписок
insert_sublist(Sub, List, 1, Result) :-
    append(Sub, List, Result). % Result = Sub ++ List
 
% Рекурсивний випадок: ще не дійшли до позиції I
insert_sublist(Sub, [H|T], I, [H|Rest]) :-
    I > 1,
    I1 is I - 1,
    insert_sublist(Sub, T, I1, Rest).   % рухаємося по списку, зменшуємо I