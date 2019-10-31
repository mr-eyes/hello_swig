%module helloSwig

%{
/* Everything in this block will be copied in the wrapper file. We include the C header file necessary to compile the interface */
#include "hello.hpp" // including kDataframe
%}

void hello();

std::string get_hello();