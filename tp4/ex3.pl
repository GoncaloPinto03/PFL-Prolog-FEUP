immature(X):- adult(X), !, fail.                
immature(_X). 
% red
                                  
adult(X):- person(X), !, age(X, N), N >=18.     
adult(X):- turtle(X), !, age(X, N), N >=50.     
adult(X):- spider(X), !, age(X, N), N>=1.       
adult(X):- bat(X), !, age(X, N), N >=5.         
% if we only had one person/turtle/spider/bat would be green
% if we had more that one person/turtle/spider/bat but the first one was true would be green
% if we had more that one person/turtle/spider/bat but the first one was not true would be red
