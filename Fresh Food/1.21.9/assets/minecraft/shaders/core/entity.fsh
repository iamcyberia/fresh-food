#version 150

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec4 vertexColor;
in vec4 unshadedColor;
in vec4 lightMapColor;
in vec4 overlayColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0);
#ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT) {
        discard;
    }
#endif

ivec4 pixel = ivec4(
        round(texelFetch(Sampler0, ivec2(texCoord0 * vec2(textureSize(Sampler0, 0))), 0) * 255)
    );

    switch (pixel.a) {
        case 200: case 252: case 253: case 254: case 250: case 100: case 50: 
            color *= unshadedColor;
            color.rgb *= 0.9;
            break;
        default: 
            color *= vertexColor;
            break;
    }

    color *= ColorModulator;

#ifndef NO_OVERLAY
    color.rgb = mix(overlayColor.rgb, color.rgb, overlayColor.a);
#endif
#ifndef EMISSIVE
    if (pixel.a != 254) {
        color *= lightMapColor;
    }
#endif
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}
