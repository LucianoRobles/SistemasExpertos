
% Ejemplo 1

% Hechos
mujer(elena).
mujer(laura).
mujer(silvia).
mujer(claudia).

hombre(ricardo).
hombre(luis).
hombre(tomas).
hombre(jose).
hombre(martin).

% Relaciones familiares
padre(ricardo, laura).% se lee "ricardo es padre de laura"
padre(ricardo, luis).
padre(luis, tomas).
padre(luis, claudia).
padre(martin, jose).
madre(elena, luis).
madre(elena, laura).
madre(silvia, tomas).
madre(silvia, claudia).
madre(claudia, martin).

% Reglas

% regla de conjuncion una coma es igual a un and
abuelo(X, Y) :- padre(X, Z), padre(Z, Y), !.% :- significa "si"
abuela(X, Y) :- madre(X, Z), madre(Z, Y), !.% se lee "X es abuela de Y si X es madre de Z y Z es madre de Y"
esTio(X, Y) :- sonHermanos(X, Z), (padre(Z, Y); madre(Z, Y)), !.

%reglas de disyuncion un punto y coma es igual a un or
sonHermanos(X, Y) :- ((padre(P, X), padre(P, Y)) ; (madre(M, X), madre(M, Y))), X \= Y, !. % ; es disyuncion, se lee "X es hermano de Y si X y Y tienen el mismo padre o la misma madre, y X es distinto a Y"
hijoDe(X, Y) :- padre(Y, X) ; madre(Y, X), !. % se lee "X es hijo de Y si Y es padre de X o Y es madre de X"
esNieto(X, Y) :- abuelo(Y, X) ; abuela(Y, X), !.

%reglas de recursividad
esDescendiente(X, Y) :- hijoDe(X, Y), !.% caso base, se lee "X es descendiente de Y si X es hijo de Y"
esDescendiente(X, Y) :- hijoDe(X, Z), esDescendiente(Z, Y), !. % caso recursivo, se lee "X es descendiente de Y si X es hijo de Z y Z es descendiente de Y"

% algunas consultas
% ¿Quiénes son los hijos de Ricardo?
% ?- hijoDe(Hijo, ricardo).
% ¿Quiénes son los abuelos de Claudia?
% ?- abuelo(Abuelo, claudia).
% ¿Quiénes son los tíos de Martín?
% ?- esTio(Tio, claudia).
% ¿Quiénes son los descendientes de Silvia?
% ?- esDescendiente(jose, silvia).
% ¿Quiénes son los nietos de Elena?
% ?- esNieto(Nieto, silvia).

% Consultas adicionales
% ¿Quiénes son las mujeres de la familia?
% ?- mujer(Mujer).
% ¿Quiénes son los hombres de la familia?
% ?- hombre(Hombre).





% Ejemplo 2 mas complejo

/*
 -----------------------------
 1. Base de conocimiento
 -----------------------------
*/
% Base de conocimiento para el sistema de gestión de proyectos de investigación
% investigador(Nombre, Especialidad, AñosExperiencia).
investigador(ana, fisica, 10).
investigador(bruno, biologia, 6).
investigador(carla, informatica, 9).
investigador(diego, quimica, 4).
investigador(elena, fisica, 12).
investigador(felipe, biologia, 3).

% proyecto(Nombre, Campo, NivelComplejidad).
proyecto(genoma_humano, biologia, alto).
proyecto(simulacion_cuantica, fisica, alto).
proyecto(sistema_experto, informatica, medio).
proyecto(reaccion_quimica, quimica, bajo).
proyecto(ecosistema_marino, biologia, medio).

% participa(Investigador, Proyecto).
participa(ana, simulacion_cuantica).
participa(ana, sistema_experto).
participa(bruno, genoma_humano).
participa(bruno, ecosistema_marino).
participa(carla, sistema_experto).
participa(carla, genoma_humano).
participa(diego, reaccion_quimica).
participa(elena, simulacion_cuantica).
participa(elena, genoma_humano).
participa(elena, ecosistema_marino).
participa(felipe, ecosistema_marino).

% lider(Investigador, Proyecto). (usado para la restricción de conflicto)
lider(elena, simulacion_cuantica).

% ejecucion(Proyecto, AnioInicio, AnioFin).
ejecucion(genoma_humano, 2022, 2025).
ejecucion(simulacion_cuantica, 2024, 2026).
ejecucion(sistema_experto, 2023, 2024).
ejecucion(reaccion_quimica, 2024, 2025).
ejecucion(ecosistema_marino, 2021, 2023).

% -----------------------------
% 2. Reglas de liderazgo
% -----------------------------

% Campo en el que ha participado un investigador
campo_participado(Inv, Campo) :-
    participa(Inv, Proy),
    proyecto(Proy, Campo, _).

% ¿Tiene experiencia interdisciplinaria?
experiencia_interdisciplinaria(Inv) :-
    setof(Campo, campo_participado(Inv, Campo), Campos),
    length(Campos, N),
    N >= 3.

% Cuenta proyectos en un mismo campo
proyectos_en_campo(Inv, Campo, N) :-
    findall(P, (participa(Inv, P), proyecto(P, Campo, _)), Ps),
    length(Ps, N).

% Regla principal de liderazgo
puede_liderar(Inv, Proy) :-
    experiencia_interdisciplinaria(Inv) -> true;
    proyecto(Proy, Campo, Nivel),
    investigador(Inv, Campo, Exp),
    Exp >= 5,
    proyectos_en_campo(Inv, Campo, NPrev),
    NPrev >= 2,
    (Nivel = alto -> Exp > 8; true).

% -----------------------------
% 3. Consultas razonadas
% -----------------------------

% ¿Qué proyectos de nivel alto no tienen ningún líder calificado?
sin_lider_calificado(Proyecto) :-
    proyecto(Proyecto, _, alto),
    \+ (puede_liderar(_, Proyecto)).

% ¿Qué investigadores pueden liderar más de un proyecto?
puede_liderar_mas_de_uno(Inv) :-
    findall(P, (proyecto(P, _, _), puede_liderar(Inv, P)), L),
    sort(L, Unicos),
    length(Unicos, N),
    N > 1.

% -----------------------------
% 4. Restricción adicional
% -----------------------------

% ¿Hay conflicto de liderazgo por simultaneidad?
en_conflicto(Inv, ProyNuevo) :-
    participa(Inv, ProyNuevo),
    proyecto(ProyNuevo, Campo, _),
    proyecto(ProyAnt, Campo, _),
    ProyAnt \= ProyNuevo,
    lider(Inv, ProyAnt),
    ejecucion(ProyAnt, A1, B1),
    ejecucion(ProyNuevo, A2, B2),
    B1 >= A2,
    B2 >= A1.

% Regla extendida: liderazgo sin conflicto
puede_liderar_sin_conflicto(Inv, Proy) :-
    puede_liderar(Inv, Proy),
    \+ en_conflicto(Inv, Proy).