
document {
     Key => {gbw, (gbw, Ideal, List), (gbw, Matrix, List)},
     Headline => "Groebner basis w.r.t. a weight",
     Usage => "gbI = gbw(I,w), gbM = gbw(M,w)",
     Inputs => {
	  "I" => Ideal => "in the Weyl algebra",
	  "M" => Matrix => "with entries in the Weyl algebra",
	  "w" => List => "of weights"
	  },
     Outputs => {
	  "gbI" => Ideal => "with the generators forming a Grobner basis 
	  of the ideal with respect to the weight vector", 
	  "gbM" => Matrix => "with the columns forming a Grobner basis
	  of the submodule generated by the columns of the matrix 
	  with respect to the weight vector"
	  },
     "This routine computes a Groebner basis of a left ideal ", EM "I",  
     " of the Weyl algebra with respect to a weight vector ", EM "w = (u,v)",
     " where either ", EM "u+v > 0", " or ", EM "u+v = 0", 
     ".  In the case where ", EM "u+v > 0",
     " the ordinary Buchberger algorithm works for any term order
     refining the weight order. In the case
     where ", EM "u+v = 0", " the Buchberger algorithm needs to be adapted to
     guarantee termination.  There are two strategies for doing this.  
     One is to homogenize
     to an ideal of the homogeneous Weyl algebra.  The other is
     to homogenize with respect to the weight vector ", EM "w", ".", 
     " More information can be found in Sections 1.1 and 1.2 of the book by
     Saito, Sturmfels and Takayama.",
     EXAMPLE lines ///
	W = QQ[x,y,Dx,Dy, WeylAlgebra => {x=>Dx,y=>Dy}]
     	I = ideal (x*Dx+2*y*Dy-3, Dx^2-Dy) 
     	gbw(I, {1,3,3,-1})
     	gbw(I, {-1,-3,1,3})
	///,
     Caveat =>{"The weight vector ", EM "w = (u,v)", " must have ", 
	  EM "u+v>=0", "."},
     SeeAlso => {"inw", "setHomSwitch"}
     }

document {
     Key => {inw, (inw, Matrix, List), (inw, RingElement, List), (inw, Ideal, List)},
     Headline => "initial form/ideal w.r.t. a weight",
     Usage => "inF = inw(F,w), inI = inw(I,w), inM = inw(M,w)",
     Inputs => {
	  "F" => RingElement => "an element of the Weyl algebra",
	  "I" => Ideal => "in the Weyl algebra",
	  "M" => Matrix => "with entries in the Weyl algebra",
	  "w" => List => "of weights"
	  },
     Outputs => {
	  "inF" => RingElement => {"the initial form of ", EM "F", " with respect to the weight vector"}, 
	  "inI" => Ideal => {"the initial ideal of ", EM "I", " with respect to the weight vector"}, 
	  "inM" => Matrix => {"with the columns generating the initial module of the image of ", EM "M",
	       " with respect to the weight vector"}
	  },
     "This routine computes the initial ideal of a left ideal ", EM "I",  
     " of the Weyl algebra with respect to a weight vector ", EM "w = (u,v)",
     " where ", EM "u+v >= 0", ".
     In the case where u+v > 0, then the ideal lives in the 
     associated graded ring which is a commutative ring.  In the case
     where u+v = 0, then the ideal lives in the associated graded
     ring which is again the Weyl algebra.  In the general case ", 
     EM "u+v >= 0",
     " the associated graded ring is somewhere between.  There are
     two strategies to compute the initial ideal.  One is to homogenize
     to an ideal of the homogeneous Weyl algebra.  The other is
     to homogenize with respect to the weight vector ", EM "w", 
     ".",
     EXAMPLE lines ///
	W = QQ[x,y,Dx,Dy, WeylAlgebra => {x=>Dx,y=>Dy}]
     	I = ideal (x*Dx+2*y*Dy-3, Dx^2-Dy) 
     	inw(I, {1,3,3,-1})
     	inw(I, {-1,-3,1,3})
	///,
     Caveat =>{"The weight vector ", EM "w = (u,v)", " must have ", 
	  EM "u+v>=0", "."},
     SeeAlso => {"gbw", "setHomSwitch"}
     }

document {
     Key => {Fourier, (Fourier,Matrix), (Fourier,RingElement), (Fourier,Ideal)},
     Headline => "Fourier transform for Weyl algebra",
     Usage => "Fourier A",
     Inputs => {
	  "A" => {ofClass RingElement, ", ", ofClass Ideal, ", or ", 
	       ofClass Matrix} 
	  },
     Outputs => {
	  {ofClass RingElement, ", ", ofClass Ideal, ", or", 
	       ofClass Matrix, 
	       " of the same type as ", TT "A", " -- the Fourier transform of ", TT "A"}
	  },
     "The Fourier transform is the automorphism of the Weyl algebra
     which sends ", EM {"x",SUB "i"}, " to ", EM {"D", SUB "i"}, " 
     and ", EM  {"D", SUB "i"}, " to ", EM {"-x",SUB "i"}, ".",
     EXAMPLE lines ///
	     W = QQ[x,y,Dx,Dy, WeylAlgebra => {x=>Dx,y=>Dy}]
	     L = x^2*Dy + y*Dy^2 + 3*Dx^5*Dy       
	     Fourier L
	     ///,
     SeeAlso => {"WeylAlgebra"}
     },

document {
     Key => {Dtransposition, (Dtransposition,Matrix), (Dtransposition,Ideal), 
	  (Dtransposition,ChainComplex), (Dtransposition,RingElement)},
     Headline => "standard transposition for Weyl algebra",
     Usage => "Dtransposition A",
     Inputs => {
	  "A" => {ofClass RingElement, ", ", ofClass Ideal, ", ", 
	       ofClass Matrix, ", or ", ofClass ChainComplex} 
	  },
     Outputs => {
	  {ofClass RingElement, ", ", ofClass Ideal, ", ", 
	       ofClass Matrix, ", or ", ofClass ChainComplex,
	       " of the same type as ", TT "A", " -- the standard transpose of ", TT "A"}
	  },
     "The standard transposition is the involution of the Weyl algebra
     which sends ", EM {"x", SUP "a","d", SUP "b"}, " to ", 
     EM {"(-d)", SUP "b", "x", SUP "a"}, ".
     It provides the equivalence in the Weyl algebra between left
     and right D-modules.",
     EXAMPLE lines ///
	     W = QQ[x,y,Dx,Dy, WeylAlgebra => {x=>Dx,y=>Dy}]
	     L = x^2*Dy + y*Dy^2 + 3*Dx^5*Dy       
	     Dtransposition L
	     ///,
     Caveat =>{"The standard transposition of a left ideal should be a right
	  ideal, however M2 currently doesn't support right modules.
	  Thus the output is left ideal generated by the transposition
	  of the previous generators."},
     SeeAlso => {"WeylAlgebra"}
     },

document {
     Key => {(makeCyclic, Matrix), makeCyclic},
     Headline => "finds a cyclic generator of a D-module",
     Usage => "H = makeCyclic M", 
     Inputs => {
	  "M" => Matrix => {
	       "that specifies a map such that ", TT "coker M", " is a 
	       holonomic D-module"
	       }
	  },
     Outputs => {
	  "H" => HashTable => {"where ", TT "H.Generator", " is a cyclic generator
	       and ", TT "H.AnnG", " is the annihilator ideal 
	       of this generator"} 
	  },
     "It is proven that every holonomic module is cyclic and 
     there is an algorithm for computing a cyclic generator.",
     EXAMPLE lines ///
	  W = QQ[x, dx, WeylAlgebra => {x=>dx}]
	  M = matrix {{dx,0,0},{0,dx,0},{0,0,dx}} -- coker M = QQ[x]^3 
	  h = makeCyclic M
	  ///,
     Caveat => {"The module ", EM "M", " must be holonomic."},
     SeeAlso => {"isHolonomic"}
     }  

document {
     Key => Generator,
     Headline => "a key created by makeCyclic",
     "See ", TO "makeCyclic", "."
     }

document {
     Key => AnnG,
     Headline => "a key created by makeCyclic",
     "See ", TO "makeCyclic", "."
     }

document {
     Key => {(stafford, Ideal), stafford},
     Headline => "computes 2 generators for a given ideal in the Weyl algebra",
     Usage => "stafford I",
     Inputs => {
	  "I" => "in the Weyl algebra"
	  },
     Outputs => {
     	  Ideal => "with 2 generators (that has the same extension as I in k(x)<dx>)"
	  },
     PARA {"A theorem of Stafford says that every ideal in the Weyl algebra 
     	  can be generated by 2 elements. This routine is the implementation of the 
     	  effective version of this theorem following the constructive proof in ",
     	  EM "A.Leykin, `Algorithmic proofs of two theorems of Stafford', 
     	  Journal of Symbolic Computation, 38(6):1535-1550, 2004."
	  },
     PARA {"The current implementation provides a weaker result: the 2 generators 
	  produced are guaranteed to generate only the extension of the ideal ", EM "I", 
	  " in the Weyl algebra with rational-function coefficients."
	  },  
     EXAMPLE lines ///
     R = QQ[x_1..x_4,D_1..D_4, WeylAlgebra=>(apply(4,i->x_(i+1)=>D_(i+1)))] 
     stafford ideal (D_1,D_2,D_3,D_4)
          ///,
     Caveat => {"The input should be generated by at least 2 generators. 
	  The output and input ideals are not equal necessarily."},
     SeeAlso => {"makeCyclic"}
}
