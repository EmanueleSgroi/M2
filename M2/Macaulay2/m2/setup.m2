--		Copyright 1993-2003 by Daniel R. Grayson

nonnull = x -> select(x, i -> i =!= null)
nonempty = x -> select(x, i -> i =!= "")
dashes  = n -> concatenate (n:"-")
spaces  = n -> concatenate n

-- let's get these reserved variables defined all in the same spot
flagLookup a; flagLookup b; flagLookup c; flagLookup d; flagLookup e;
flagLookup f; flagLookup g; flagLookup h; flagLookup i; flagLookup j;
flagLookup k; flagLookup l; flagLookup m; flagLookup n; flagLookup o;
flagLookup p; flagLookup q; flagLookup r; flagLookup s; flagLookup t;
flagLookup u; flagLookup v; flagLookup w; flagLookup x; flagLookup y;
flagLookup z; flagLookup A; flagLookup B; flagLookup C; flagLookup D;
flagLookup E; flagLookup F; flagLookup G; flagLookup H; flagLookup I;
flagLookup J; flagLookup K; flagLookup L; flagLookup M; flagLookup N;
flagLookup O; flagLookup P; flagLookup Q; flagLookup R; flagLookup S;
flagLookup T; flagLookup U; flagLookup V; flagLookup W; flagLookup X;
flagLookup Y; flagLookup Z

centerString = (wid,s) -> (
     n := width s;
     if n === wid then s
     else (
     	  w := (wid-n+1)//2;
     	  horizontalJoin(spaces w,s,spaces(wid-w-n))))

if class oooo =!= Symbol then error "setup.m2 already loaded"

if class RawMutableMatrix =!= Type then error "where is RawMutableMatrix?"

OutputDictionary = new Dictionary
dictionaryPath = append(dictionaryPath,OutputDictionary)

-- references to the symbol 'User' occur before the corresponding package has been created...
getGlobalSymbol(PackageDictionary,"User")

getSymbol = nm -> (
     if isGlobalSymbol nm then return getGlobalSymbol nm;
     for d in dictionaryPath do if mutable d then return getGlobalSymbol(d,nm);
     error "no mutable dictionary on path";
     )

-----------

addStartFunction(
     () -> (
	  Function.GlobalReleaseHook = (X,x) -> (
	       stderr << "--warning: " << toString X << " redefined" << endl;
	       if hasAttribute(x,ReverseDictionary) then removeAttribute(x,ReverseDictionary);
	       );
	  )
     )

---------------------------------

if notify then stderr << "--loading setup.m2" << endl

match := X -> null =!= regex X -- defined as a method later

somethingElse = () -> error "something else needs to be implemented here"

rotateOutputLines := x -> (
     if ooo =!= null then global oooo <- ooo;
     if oo =!= null then global ooo <- oo;
     if x =!= null then global oo <- x;
     )

Thing#AfterEval = x -> (
     if x =!= null then (
     	  s := getGlobalSymbol(OutputDictionary,concatenate(interpreterDepth:"o",toString lineNumber));
     	  s <- x;
	  );
     rotateOutputLines x;
     x)

Nothing#{Standard,Print} = identity

binaryOperators = join(fixedBinaryOperators,flexibleBinaryOperators)
prefixOperators = join(fixedPrefixOperators,flexiblePrefixOperators)
postfixOperators = join(fixedPostfixOperators,flexiblePostfixOperators)
flexibleOperators = join(flexibleBinaryOperators,flexiblePrefixOperators,flexiblePostfixOperators)
fixedOperators = join(fixedBinaryOperators,fixedPrefixOperators,fixedPostfixOperators)
allOperators = join(fixedOperators,flexibleOperators)

undocumentedkeys = new MutableHashTable
undocumented' = key -> undocumentedkeys#key = true

pathdo := (loadfun,path,filename,reportfun) -> (
     ret := null;
     if class filename =!= String then error "expected a string";
     newpath := (
	  if isStablePath filename then {
	       singledir :=
	       if isAbsolutePath filename
	       then ""
	       else if currentFileDirectory != "--startupString--/" then currentFileDirectory
	       else "./"
	       }
	  else path
	  );
     if null === scan(newpath, dir -> (
	       if class dir =!= String then error "member of 'path' not a string";
	       fullfilename := dir | filename;
	       if fileExists fullfilename then (
		    ret = loadfun fullfilename;
		    reportfun fullfilename;
		    break true)))
     then error splice("file not found",
	  if singledir =!= null then (" in \"",singledir,"\"") else " on path",
	  ": \"", toString filename, "\"");
     ret)

tryload := (filename,loadfun,notify) -> pathdo(loadfun,path,filename, fullfilename -> markLoaded(fullfilename,filename,notify))
load = (filename) -> (tryload(filename,simpleLoad,notify);)
input = (filename) -> (tryload(filename,simpleInput,false);)
needs = s -> if not filesLoaded#?s then load s


lastLN := 0
lastWI := 0
     
load "loads.m2"

protect Core.Dictionary

-- Local Variables:
-- compile-command: "make -C $M2BUILDDIR/Macaulay2/m2 "
-- End:
