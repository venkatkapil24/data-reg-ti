## Setting up a REG-TI calculation

The i-PI code is used to set up a regularized end-point gradient thermodynamic integration (REG-TI) calculation for form I paracetamol. LAMMPS is used as the force provider. If you are not familiar with i-PI, please refer to the [official tutorials](https://ipi-code.org/resources/tutorials/).

1. **Step 1: Low-temperature short MD simulation (optional).**  
   This step allows a starting structure with a soft mode to relax into a convex region of the potential energy surface. The simulation setup is in `0_md_low_temperature`.

2. **Step 2: Fixed-cell geometry optimisation.**  
   Use the final structure from **Step 1** (if performed) and run a fixed-cell geometry optimisation using the setup in `1_geop`.

3. **Step 3: Harmonic calculation.**  
   Use the final structure from **Step 2** and estimate the dynamical matrix using finite differences in `2_harm`.

4. **Step 4: Set up the harmonic-to-anharmonic REG-TI.**  
   The setup is in `3_reg_ti`. For a new system, copy (i) the Hessian file from **Step 3**, (ii) the potential energy of the optimised structure from **Step 2**, and (iii) the XYZ coordinates of the minimum-energy structure from **Step 2**.
