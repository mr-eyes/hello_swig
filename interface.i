%module helloSwig

%{
/* Everything in this block will be copied in the wrapper file. We include the C header file necessary to compile the interface */
#include "hello.hpp" // including kDataframe
%}

%include std_string.i       /*And this for converting python str to C++ std::string*/


void hello();

std::string get_hello();