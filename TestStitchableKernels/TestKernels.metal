#include <CoreImage/CoreImage.h> // includes CIKernelMetalLib.h

using namespace metal;

[[ stitchable ]] half4 testColorFilter (coreimage::sample_t s,
                                float param,
                                coreimage::destination dest)
{
    float4 result = s;

    return half4(result);
}

[[ stitchable ]] half4 testFilter (coreimage::sampler inputImage, coreimage::destination dest)
{
    float2 srcCoord = inputImage.coord(); //<-- This line gives linker errors
    half4 color =  half4(inputImage.sample(srcCoord));
 
    return color;
}
