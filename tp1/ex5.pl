% <INFO GIVEN>
       
% jobs
job(technician, eleuterio).
job(technician, juvenaldo).
job(analyst, leonilde).
job(analyst, marciliano).
job(engineer, osvaldo).
job(engineer, porfirio).
job(engineer, reginaldo).
job(supervisor, sisnando).
job(chief_supervisor, gertrudes).
job(secretary, felismina).
job(director, asdrubal).

% supervised by
supervised_by(technician, engineer).
supervised_by(engineer, supervisor).
supervised_by(analyst, supervisor).
supervised_by(supervisor, chief_supervisor).
supervised_by(chief_supervisor, director).
supervised_by(secretary, director).

% a)

/*
i. Does Sisnando supervises analysts ?
ii. Query to indicates the supervisor of the supervisor of a technician.
iii. Who is supervised by a supervisor and whats their role?
iv. Who is supervised by Asdrubal ?
 */

% c)

direct_supervisor(N1, N2) :- job(X, N1), job(Y, N2), supervised_by(Y, X).
supervised_by_people_with_the_same_job(N1, N2) :- job(X, N1), job(Y, N2), supervised_by(X, J), supervised_by(Y, B), (J == B).
responsible_for_more_than_1_job(X) :- job(N, X), supervised_by(N1, N), supervised_by(N2, N), (N1 \= N2).
supervisor_of_supervisor(N1, N2) :- job(X, N1), job(Y, N2), supervised_by(Y, S), supervised_by(S, X).