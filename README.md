# StitchableCIKernelTesting

The project fails to link because of unresolved reference to sampler.coord()  in Core Image Metal Shading language. Tried adding `-framework CoreImage` in Other Metal linker flags but it fails to add as XCode automatically puts double quotes around it. Adding -fcikernel builds the project but the CIKernel `testFilter` fails to load at runtime. What am I missing?
