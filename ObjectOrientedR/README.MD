# Object Oriented R At a Glance
## Richie Cotton


# Introduction to Object-Oriented Programming
- Objects can come in the form of Lists or Environments.
- Functions should be used for Analysis; Object Oriented Programming for Tools.

- There are 9 different Object Packages; not all covered:
	1. R5              [ experimental; cut ]
	2. mutatr          [ experimental; cut ]
	3. OOP             [ Depreciated ]
	4. proto           [ brief, but depreciated.]
	5. R.oo            [ Common, but not picking up.]
	6. S3              [ 1980s wiht common use ]
	7. S4              [ Mature, but idiosyncratic  ]
	8. RefernceClasses [ Convert from other languages ]
	9. R6              [ Most common ]

- Calling `class()` on object will tell you it's classes.
- Check what data type exists in an object using `typeof()`.
- `mode()` and `storage.mode()` exist for compatability reasons.
- `class()` can override the value by assigning a new value to it.
- You cannot override the type of objects.
- Safest way to check if object contains numbers is `is.numeric()`.

# Using S3
- S3 exists to do function overloading.
- Splits into Generic and Methods.
- Call UseMethod('Generic') inside function to use Generic S3s.
- Nomenclature: Generic.Class.
- Don't use leapard-case for function names.
- Use lower_snake_case or lowerCamelCase.
- Check if variable is S3 Generic using `is_s3_generic()` from Package::pryr.
- Check if variable is S3 Method using `is_s3_method()` from Package::pryr.
- Just always include `...` to functions.
- List Structures in memory using `ls.str()`.
- Check the list of existing methods using `methods("function_name")`.
- Check methods for single class using `methods( class = '')`.
- `methods()` will return both S3 and S4 functions.
- Check S3 Methods using `.S3methods( class = '' )`.
- Check S4 Methods using `.S4methods( class = '')`.
- Functions written for speed are actually in C.
- R Primatives map to C Types underneath.
- You can see a complete list of 'primitive generics' using `.S3PrimitiveGenerics`.
- When assigning class vectors, assign most specific to least specific as standard.
- You can check if a class declaration exists for an object using `inherits(x, "class_test_name")`
- `NextMethod()` will invoke a call to the next classes S3 Generic for an object.

# Using R6
- R6 has ways to separate data and functions for objects.
- Class generator are templates for objects.
- Class definition and declaration:
```r
R6Class(
	"Name_Of_Class",
	private = list(
		a_field = 'a value',
		another_field = 'derp') // data
)
```
- `thing_factory$new()` will create a new object.
- Public is for callable functions.
- Private is for Variables being used.
- Encapsulation separates implementation vs UI.
- Internal functions can access private data using `private$var`.
- Internal functions can access public data using `self$var`.
- `initialize()` is just a Constructor.
- `initialize()` belongs in public section.
- You can pass values to it since it's a function.
- `finalize()` is a Destructor.
- `finalize()` takes no arguments and you can do anything you want.
- Should provide function front end: i.e. createNewFactory( a_field = 'a value', another_field = 'derp'){ ... }
- ENVIRONMENTS ARE POINTERS!
- Obligatory mention of Getters and Setters.

- Active Bindings are defined like functions but are accessed like data variables.
- active must be a named list.
- Private, Public, and Active must contain all unique variable names.
- To address this nomenclature states that you precede private elements with '..'.
- Getters are just like in C, Java, etc in principle.


# R6 Inheritance
- R6 supports inheritance.
- To inherit from a parent, use variable `inherit = "class_name"`.
- To override functions in the parent, you simply use the same name in the child.
- `super$x` can be used to call functions in a parent.
- `super$super$x()` will not work.
- By default, a grandparent cannot be accessed by a grandchild object.
- You can work around it adding this to active section:`super_ = function() super`


# Advanced R6 Usage
- Create new environment using `new.env()`.
- You can add elements to the new environment using `$` or `[[]]`.
- Use `ls.str()` to list all variables saved to the environment.
- Environments use pointers; lists do not. Therefore, changes to environments will transfer across all shared environments.
- Lists are copy by value.
- Envirs use copy by reference.
- You can share information across all instances using a shared variable inside private.
- Declare as:
```r
shared = {
	e = new.env() // new envir
	              // assignments
	e             // return envir
}
```
- Access to the shared fields uses active bindings.
- This necessitates `private$shared$variable` to get/set.
- Clone an object using `object$clone()`.
- If an R6 class contains another R6 class, then you will need a deep copy verion.
- Clone all of an object using `object$clone( deep = TRUE)`

## Research
- `args()`
- `.Internal()`
- `.Primitive("+")
- Package::assertive
- `identical(x1, x2)`
- `gc()`

## Reading list:
- None.
