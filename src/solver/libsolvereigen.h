/*
 * TLMBHT - Transmission-line Modeling Method applied to BioHeat Transfer Problems.
 * 
 * Copyright (C) 2015 to 2016 by Cornell University. All Rights Reserved.
 * 
 * Written by Hugo Fernando Maia Milan.
 * 
 * Free for educational, research and non-profit purposes.
 * Refer to the license file for details.
 */

/* 
 * File:   libsolvereigen.h
 * Author: Hugo Fernando Maia Milan
 * Email:  hugofernando@gmail.com
 *
 * Created on August 9, 2016.
 *
 *
 *
 * Revision history:
 * 
 * Date: 
 * Who: 
 * Description: 
 *
 */

/*
 * Description of this file:
 * contains declaration of functions, structures, and enumerations for using the
 * Eigen library with my C code. See libsolvereigen.cpp for more details.
 *
 */

#ifndef LIBSOLVEREIGEN_H
#define LIBSOLVEREIGEN_H

#ifdef __cplusplus
extern "C" {
#endif

#include "libsolver.h"
#include "../configs/libconfig.h"

    unsigned int call_from_c_solverEigenTLM(struct dataForSimulation*, int, void **);
    
    unsigned int call_from_c_solverTLMPennes2DEigen(struct dataForSimulation*);
    unsigned int call_from_c_solverTLMPennes3DEigen(struct dataForSimulation*);
    unsigned int call_from_c_initiate_matrices_calculationTLMEigen(void *, unsigned int*);


#ifdef __cplusplus
}
#endif

#endif /* LIBSOLVEREIGEN_H */

