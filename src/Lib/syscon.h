/* This file "syscon.h" contains the prototypes of the operations
 * on the systems container in PHCpack. */

int syscon_read_system ( void );
/* 
 * DESCRIPTION :
 *   Prompts the user for a file, reads system from file, and puts the
 *   system in the container for systems with standard coefficients;
 *   returns 0 if okay, otherwise fail value. */

int syscon_read_Laurent_system ( void );
/* 
 * DESCRIPTION :
 *   Prompts the user for a file, reads Laurent system from file, and puts
 *   the system in the container for Laurent polynomials;
 *   returns 0 if okay, otherwise returns the fail value. */

int syscon_read_dobldobl_system ( void );
/* 
 * DESCRIPTION :
 *   Prompts the user for a file, reads system from file, and puts the
 *   system in the container for systems with double double coefficients;
 *   returns 0 if okay, otherwise returns the fail value. */

int syscon_read_quaddobl_system ( void );
/* 
 * DESCRIPTION :
 *   Prompts the user for a file, reads system from file, and puts the
 *   system in the container for systems with quad double coefficients;
 *   returns 0 if okay, otherwise returns the fail value. */

int syscon_read_multprec_system ( int deci );
/* 
 * DESCRIPTION :
 *   Prompts the user for a file, reads system from file, and puts the
 *   system in the container for systems with multiprecision coefficients;
 *   where the number of decimal places in the working precision to evaluate
 *   the coefficients is given by the value of deci.
 *   Returns 0 if okay, otherwise returns the fail value. */

int syscon_random_system ( int n, int m, int d, int c );
/*
 * DESCRIPTION :
 *   Puts in the system container a system of n equations in n variables,
 *   with at most m monomials per equation and where each monomial has
 *   degree no larger then d.  The coefficient type c is 0, 1, or 2:
 *   c = 0 : complex coefficients on the unit circle;
 *   c = 1 : all coefficients are equal to one;
 *   c = 2 : coefficients are random floats, uniform in [-1,+1]. */

int syscon_write_system ( void );
/*
 * DESCRIPTION :
 *   Writes the system in the container of systems 
 *   with standard coefficients to screen. */

int syscon_write_Laurent_system ( void );
/*
 * DESCRIPTION :
 *   Writes the Laurent system in the container to screen. */

int syscon_write_dobldobl_system ( void );
/*
 * DESCRIPTION :
 *   Writes the system in the container of systems 
 *   with double double coefficients to screen. */

int syscon_write_quaddobl_system ( void );
/*
 * DESCRIPTION :
 *   Writes the system in the container of systems 
 *   with quad double coefficients to screen. */

int syscon_write_multprec_system ( void );
/*
 * DESCRIPTION :
 *   Writes the system in the container of systems 
 *   with multiprecision coefficients to screen. */

int syscon_number_of_polynomials ( int *length );
/*
 * DESCRIPTION :
 *   Returns in length the number of polynomials in the container. */

int syscon_number_of_Laurentials ( int *length );
/*
 * DESCRIPTION :
 *   Returns in length the number of Laurent polynomials in the container. */

int syscon_number_of_dobldobl_polynomials ( int *length );
/*
 * DESCRIPTION :
 *   Returns in length the number of polynomials in the container
 *   for systems with double double coefficients. */

int syscon_number_of_quaddobl_polynomials ( int *length );
/*
 * DESCRIPTION :
 *   Returns in length the number of polynomials in the container
 *   for systems with quad double coefficients. */

int syscon_number_of_multprec_polynomials ( int *length );
/*
 * DESCRIPTION :
 *   Returns in length the number of polynomials in the container
 *   for systems with multiprecision coefficients. */

int syscon_initialize_number ( int length );
/*
 * DESCRIPTION :
 *   Initializes the container with length, the number of polynomials. 
 *   Also initializes the symbol table. */

int syscon_initialize_number_of_Laurentials ( int length );
/*
 * DESCRIPTION :
 *   Initializes the container with length, the number of Laurent polynomials. 
 *   Also initializes the symbol table. */

int syscon_initialize_number_of_dobldobl_polynomials ( int length );
/*
 * DESCRIPTION :
 *   Initializes the container with length, the number of polynomials. 
 *   Also initializes the symbol table. */

int syscon_initialize_number_of_quaddobl_polynomials ( int length );
/*
 * DESCRIPTION :
 *   Initializes the container with length, the number of polynomials. 
 *   Also initializes the symbol table. */

int syscon_initialize_number_of_multprec_polynomials ( int length );
/*
 * DESCRIPTION :
 *   Initializes the container with length, the number of polynomials. 
 *   Also initializes the symbol table. */

int syscon_degree_of_polynomial ( int k, int *d );
/*
 * DESCRIPTION :
 *   Returns in d the degree of the k-th polynomial stored in
 *   the standard polynomial systems container. */

int syscon_degree_of_dobldobl_polynomial ( int k, int *d );
/*
 * DESCRIPTION :
 *   Returns in d the degree of the k-th polynomial stored in
 *   the double double polynomial systems container. */

int syscon_degree_of_quaddobl_polynomial ( int k, int *d );
/*
 * DESCRIPTION :
 *   Returns in d the degree of the k-th polynomial stored in
 *   the quad double polynomial systems container. */

int syscon_degree_of_multprec_polynomial ( int k, int *d );
/*
 * DESCRIPTION :
 *   Returns in d the degree of the k-th polynomial stored in
 *   the multiprecision polynomial systems container. */

int syscon_store_polynomial ( int nc, int n, int k, char *p );
/*
 * DESCRIPTION :
 *   Defines the k-th polynomial in the systems container with
 *   the data in string p, the #characters in p is in nc.
 *
 * ON ENTRY :
 *   nc       number of characters in the string p;
 *   n        number of variables in the multivariate polynomial;
 *   k        index of the polynomial in the system;
 *   p        string which will be parsed by PHCpack into a
 *            polynomial in n variables with complex coefficients.
 *
 * REQUIRED :
 *   The systems container must be initialized with the number of
 *   polynomials and this number must be larger than or equal to k. */

int syscon_store_dobldobl_polynomial ( int nc, int n, int k, char *p );
/*
 * DESCRIPTION :
 *   Defines the k-th polynomial with complex double double coefficients
 *   in the systems container with the data in string p,
 *   the #characters in p is in nc.
 *
 * ON ENTRY :
 *   nc       number of characters in the string p;
 *   n        number of variables in the multivariate polynomial;
 *   k        index of the polynomial in the system;
 *   p        string which will be parsed by PHCpack into a
 *            polynomial in n variables with complex coefficients.
 *
 * REQUIRED :
 *   The systems container must be initialized with the number of
 *   polynomials and this number must be larger than or equal to k. */

int syscon_store_quaddobl_polynomial ( int nc, int n, int k, char *p );
/*
 * DESCRIPTION :
 *   Defines the k-th polynomial with complex quad double coefficients
 *   in the systems container with the data in string p,
 *   the #characters in p is in nc.
 *
 * ON ENTRY :
 *   nc       number of characters in the string p;
 *   n        number of variables in the multivariate polynomial;
 *   k        index of the polynomial in the system;
 *   p        string which will be parsed by PHCpack into a
 *            polynomial in n variables with complex coefficients.
 *
 * REQUIRED :
 *   The systems container must be initialized with the number of
 *   polynomials and this number must be larger than or equal to k. */

int syscon_store_multprec_polynomial
 ( int nc, int n, int k, int deci, char *p );
/*
 * DESCRIPTION :
 *   Defines the k-th polynomial with multiprecision complex coefficients
 *   in the systems container with the data in string p,
 *   the #characters in p is in nc.
 *
 * ON ENTRY :
 *   nc       number of characters in the string p;
 *   n        number of variables in the multivariate polynomial;
 *   k        index of the polynomial in the system;
 *   deci     number of decimal places in the working precision
 *            to parse the coefficients;
 *   p        string which will be parsed by PHCpack into a
 *            polynomial in n variables with complex coefficients.
 *
 * REQUIRED :
 *   The systems container must be initialized with the number of
 *   polynomials and this number must be larger than or equal to k. */

int syscon_load_polynomial ( int k, int *nc, char *p );
/*
 * DESCRIPTION :
 *   Returns the k-th polynomial in the systems container in the string p,
 *   where nc equals the number of characters in the string p. */

int syscon_load_dobldobl_polynomial ( int k, int *nc, char *p );
/*
 * DESCRIPTION :
 *   Returns the k-th polynomial in the systems container 
 *   with double double complex coefficients in the string p,
 *   where nc equals the number of characters in the string p. */

int syscon_load_quaddobl_polynomial ( int k, int *nc, char *p );
/*
 * DESCRIPTION :
 *   Returns the k-th polynomial in the systems container 
 *   with quad double complex coefficients in the string p,
 *   where nc equals the number of characters in the string p. */

int syscon_load_multprec_polynomial ( int k, int *nc, char *p );
/*
 * DESCRIPTION :
 *   Returns the k-th polynomial in the systems container 
 *   with multiprecision complex coefficients in the string p,
 *   where nc equals the number of characters in the string p. */

int syscon_store_Laurential ( int nc, int n, int k, char *p );
/*
 * DESCRIPTION :
 *   Defines the k-th Laurent polynomial in the systems container with
 *   the data in string p, the #characters in p is in nc.
 *
 * ON ENTRY :
 *   nc       number of characters in the string p;
 *   n        number of variables in the multivariate Laurent polynomial;
 *   k        index of the Laurent polynomial in the system;
 *   p        string which will be parsed by PHCpack into a Laurent
 *            polynomial in n variables with complex coefficients.
 *
 * REQUIRED :
 *   The Laurent systems container must be initialized with the number of
 *   polynomials and this number must be larger than or equal to k. */

int syscon_create_evaluator ( void );
/*
 * DESCRIPTION :
 *   Creates an evaluator for the system in the container. */

int syscon_create_Jacobian_evaluator ( void );
/*
 * DESCRIPTION :
 *   Creates an evaluator for the Jacobian matrix 
 *   of the system in the container. */

int syscon_number_of_terms ( int i, int *nt );
/*
 * DESCRIPTION :
 *   Returns in nt the number of terms in the i-th polynomial. */

int syscon_number_of_Laurent_terms ( int i, int *nt );
/*
 * DESCRIPTION :
 *   Returns in nt the number of terms in the i-th polynomial. */

int syscon_number_of_dobldobl_terms ( int i, int *nt );
/*
 * DESCRIPTION :
 *   Returns in nt the number of terms in the i-th polynomial
 *   in the constainer for systems with double double coefficients. */

int syscon_number_of_quaddobl_terms ( int i, int *nt );
/*
 * DESCRIPTION :
 *   Returns in nt the number of terms in the i-th polynomial
 *   in the constainer for systems with quad double coefficients. */

int syscon_number_of_multprec_terms ( int i, int *nt );
/*
 * DESCRIPTION :
 *   Returns in nt the number of terms in the i-th polynomial
 *   in the constainer for systems with multiprecision coefficients. */

int syscon_retrieve_term ( int i, int j, int n, int *exp, double *c );
/*
 * DESCRIPTION :
 *   Retrieves the j-th term of the i-th polynomial in the system;
 *   return 0 if okay, otherwise returns the fail value.
 *
 * ON ENTRY :
 *   i        index to the polynomial of the system to consider;
 *   j        index to the term in the i-th polynomial of the system;
 *   n        number of variables in the polynomial;
 *   exp      exponents of the variables, of dimension n;
 *   c        real and imaginary part of the coefficient. */

int syscon_retrieve_dobldobl_term
 ( int i, int j, int n, int *exp, double *c );
/*
 * DESCRIPTION :
 *   Retrieves the j-th term of the i-th polynomial in the system
 *   with complex double double coefficients;
 *   returns 0 if okay, otherwise returns the fail value.
 *
 * ON ENTRY :
 *   i        index to the polynomial of the system to consider;
 *   j        index to the term in the i-th polynomial of the system;
 *   n        number of variables in the polynomial;
 *   exp      exponents of the variables, of dimension n;
 *   c        real and imaginary part of the coefficient. */

int syscon_retrieve_quaddobl_term
 ( int i, int j, int n, int *exp, double *c );
/*
 * DESCRIPTION :
 *   Retrieves the j-th term of the i-th polynomial in the system
 *   with complex quad double coefficients;
 *   returns 0 if okay, otherwise returns the fail value.
 *
 * ON ENTRY :
 *   i        index to the polynomial of the system to consider;
 *   j        index to the term in the i-th polynomial of the system;
 *   n        number of variables in the polynomial;
 *   exp      exponents of the variables, of dimension n;
 *   c        real and imaginary part of the coefficient. */

int syscon_add_term ( int i, int n, int *exp, double *c );
/*
 * DESCRIPTION :
 *   Adds to the i-th polynomial the term with coefficients in c
 *   (real and imaginary part as two doubles) and n exponents in exp.
 *
 * ON ENTRY :
 *   i        index to the polynomial of the system to consider;
 *   n        number of variables in the polynomial;
 *   exp      exponents of the variables, of dimension n;
 *   c        real and imaginary part of the coefficient. */

int syscon_add_dobldobl_term ( int i, int n, int *exp, double *c );
/*
 * DESCRIPTION :
 *   Adds to the i-th polynomial the term with coefficients in c
 *   (real and imaginary part as consecutive two double doubles) 
 *   and n exponents in exp.
 *
 * ON ENTRY :
 *   i        index to the polynomial of the system to consider;
 *   n        number of variables in the polynomial;
 *   exp      exponents of the variables, of dimension n;
 *   c        real and imaginary part of the coefficient. */

int syscon_add_quaddobl_term ( int i, int n, int *exp, double *c );
/*
 * DESCRIPTION :
 *   Adds to the i-th polynomial the term with coefficients in c
 *   (real and imaginary part as consecutive two quad doubles) 
 *   and n exponents in exp.
 *
 * ON ENTRY :
 *   i        index to the polynomial of the system to consider;
 *   n        number of variables in the polynomial;
 *   exp      exponents of the variables, of dimension n;
 *   c        real and imaginary part of the coefficient. */

int syscon_total_degree ( int *d );
/*
 * DESCRIPTION :
 *   Returns in d the total degree of the system in the container. */

int syscon_clear_system ( void );
/*
 * DESCRIPTION :
 *   Clears the content of the systems container. */

int syscon_clear_Laurent_system ( void );
/*
 * DESCRIPTION :
 *   Clears the content of the Laurent systems container. */

int syscon_clear_dobldobl_system ( void );
/*
 * DESCRIPTION :
 *   Clears the content of the systems container
 *   for systems with double double coefficients. */

int syscon_clear_quaddobl_system ( void );
/*
 * DESCRIPTION :
 *   Clears the content of the systems container
 *   for systems with quad double coefficients. */

int syscon_clear_multprec_system ( void );
/*
 * DESCRIPTION :
 *   Clears the content of the systems container
 *   for systems with multiprecision coefficients. */

int syscon_number_of_symbols ( int *n );
/*
 * DESCRIPTION :
 *   Returns in n the number of symbols in the table. */

int syscon_write_symbols ( void );
/*
 * DESCRIPTION :
 *   Writes the symbols in the table to screen. */

int syscon_string_of_symbols ( int *n, char *s );
/*
 * DESCRIPTION :
 *   Expects in n the number of characters allocated to s.
 *   Returns in n the number of characters written to the string s.
 *   If enough space was allocated for s, s contains all symbols. */

int syscon_clear_symbol_table ( void );
/*
 * DESCRIPTION :
 *   Clears the symbol table. */

int syscon_remove_symbol_from_table ( int i );
/*
 * DESCRIPTION :
 *   Removes the i-th symbol from the symbol table. */

int syscon_remove_symbol_name_from_table ( int nc, char *s );
/*
 * DESCRIPTION :
 *   Removes the symbol with name in the string s
 *   with nc characters from the symbol table. */

int syscon_sort_embed_symbols ( int *nzz );
/*
 * DESCRIPTION :
 *   Sorts the symbol table so that embed symbols, starting with the "zz",
 *   occur at the very end.  The variables of the system in the container
 *   are permuted accordingly.
 *   On return, the value of nzz equals the number of embed symbols. */

int syscon_standard_drop_variable_by_index ( int k );
/*
 * DESCRIPTION :
 *   Replaces the system in the standard double precision container 
 *   with the same system that has its k-th variable dropped. */

int syscon_standard_drop_variable_by_name ( int nc, char *s );
/*
 * DESCRIPTION :
 *   Replaces the system in the standard double precision container 
 *   with the same system that have that variable dropped
 *   corresponding to the name in the string s of nc characters long. */

int syscon_dobldobl_drop_variable_by_index ( int k );
/*
 * DESCRIPTION :
 *   Replaces the system in the double double precision container 
 *   with the same system that has its k-th variable dropped. */

int syscon_dobldobl_drop_variable_by_name ( int nc, char *s );
/*
 * DESCRIPTION :
 *   Replaces the system in the double double precision container 
 *   with the same system that has that variable dropped
 *   corresponding to the name in the string s of nc characters long. */

int syscon_quaddobl_drop_variable_by_index ( int k );
/*
 * DESCRIPTION :
 *   Replaces the system in the quad double precision container 
 *   with the same system that has its k-th variable dropped. */

int syscon_quaddobl_drop_variable_by_name ( int nc, char *s );
/*
 * DESCRIPTION :
 *   Replaces the system in the quad double precision container 
 *   with the same system that has that variable dropped
 *   corresponding to the name in the string s of nc characters long. */
