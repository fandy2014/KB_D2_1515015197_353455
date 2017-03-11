PREDICATES
	nondeterm anak(STRING,STRING)
	nondeterm istri(STRING,STRING)
	nondeterm pria(STRING)
	nondeterm wanita(STRING)
	nondeterm ayah(STRING,STRING)
	nondeterm ibu(STRING,STRING)
	nondeterm cucu(STRING,STRING)
	nondeterm kakek(STRING,STRING)
	nondeterm adik(STRING,STRING)
	nondeterm usia(STRING,STRING)

CLAUSES
	anak("jhon","james").
	anak("james","peter").
	anak("sue","ann").
	istri("mary","peter").
	istri("ann","james").
	pria("jhon").
	pria("james").
	pria("peter").
	wanita("mary").
	wanita("sue").
	wanita("ann").
	usia("jhon","10").
	usia("sue","13").
	
	ayah(A,B):-anak(B,A).
	kakek(A,B):-ayah(A,C), ayah(C,B).
	ibu(A,B):-istri(B,C), anak(A,C).
	cucu(A,B):-anak(A,C), anak(C,B).
	cucu(A,B):-anak(A,C), istri(C,D), anak(D,B).
	adik(A,B):-usia(A,C), usia(B,D), C<D.

GOAL
cucu(X,Y).

