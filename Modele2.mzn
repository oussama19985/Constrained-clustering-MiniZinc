include "Data.dzn";
include "value_precede_chain.mzn";
include "at_least.mzn";

int: n;
set of int: POINT = 1..n;
set of int: POINTml = 0..n;
array[POINT,POINT] of int: dist; 
int: maxdist = max([ dist[i,j] | i,j in POINT]);
int: NbMl;
int: NbCl;
set of int : NBML = 1..NbMl;
set of int : NBCL = 1..NbCl;



array[NBML] of  POINTml : ML1;
array[NBML] of  POINTml : ML2;
array[NBCL] of POINT : CL1;
array[NBCL] of POINT : CL2;
int: k;
set of int: CLUSTER = 1..k;


array[POINT] of var CLUSTER: x;


constraint forall(i in 1..k-1)
                 (  min([ j | j in POINT where x[j] = i])
                  < min([ j | j in POINT where x[j] = i+1]));

var 0..maxdist: obj = min( i,j in POINT where i < j )
                         ( dist[i,j] + maxdist * (x[i] != x[j]) );
                         
                    
                                            
                                                                                  
constraint forall(i in NBML)(x[ML1[i]]=x[ML2[i]]);                         
constraint forall(i in NBML)(x[CL1[i]]!=x[CL2[i]]);                        
constraint value_precede_chain([ i | i in 1..k ],x);
constraint forall(i in CLUSTER)(at_least(1,x,i)=true);


solve maximize obj;

output ["obj = \(obj); x = \(x)\n "];

