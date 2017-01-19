# Object Oriented R At a Glance

- objects can come in the form of Lists or Environments.
- Functions should be used for Analysis; Object Oriented Programming for Tools

### There are 9 different Object Packages but wont cover them all
- R5
- mutatr
- OOP
- proto
- R.oo

## S3
- Created in the 1980s
- Can function on Different Objects
- TEACH ONESELF THIS

## S4
- Mature package and used a lot.
- Apparently it's weird, but I don't remember why.
- Bioconductor Packages use this almost exclusively.

## ReferenceClasses
- We wont be Touching.

## S3,4
- Splits into Generic and Methods.
- Call UseMethod('Generic')
- Nomenclature: Generic.Type
- Check is object is S3,S4               | is_s3_generic() [ Package:pryr ]
- List Structures in memory              | ls.str()
- Check the list of all existing methods | methods()
- Check methods for single class         | methods( class = '')

- returns S3, S4 Only.
- Check S3 Methods                       | .S3methods( class = '' )
- Check S4 Methods                       | .S4methods( class = '')

- R Primatives map to C Types underneath
- .S3PrimativeGenerics

- Ex: get_n_elements <- function( x, ...){ UseMethod( 'get_n_elements' ) }


## R6
- Check the Class of an object           | class()
- Check for the Type                     | typeof()
- You wont need to use this              | mode()
- You wont need to use this              | storate.mode()

- define new Object R6Class( "Name", private = list( a_field = 'a value', another_field = 'derp'))
- thing_factory$new() will create a new object.
- Should provide function front end: i.e. createNewFactory( a_field = 'a value', another_field = 'derp'){ ... }
- Private is for Variables being used.
- Public is for callable functions.
- ENVIRONMENTS ARE POINTERS!

shared = {
	e = new.env()// new envir
	  // assignments
	e // return envir
}

- Shared is an anonymous function, so access regulated with shared$value
- Clone an object        | object$clone()
- Clone all of an object | object$clone( deep = TRUE)

- Initialize is just a Constructor.
- You can pass values to it since it's a function.
- Initialize goes in Public .
- Finalize is a Destructor.

##
- Calls the next generic for the next class vector | NextMethod()
- Think of class generators as factories.
- Create new environment                           | new.envir() // always empty

## Reading list:
- None.