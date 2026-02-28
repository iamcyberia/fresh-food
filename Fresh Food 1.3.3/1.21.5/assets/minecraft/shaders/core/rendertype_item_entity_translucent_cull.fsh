#version 150

#moj_import <minecraft:fog.glsl>

uniform sampler2D Sampler0;
uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec4 lightColor;    // Directional shading
in vec4 lightMapColor; // Day/Night and torch light
in vec2 texCoord0;
in vec2 texCoord1;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0);
    ivec4 icol = ivec4(round(texelFetch(Sampler0, ivec2(texCoord0 * textureSize(Sampler0, 0)), 0) * 255));
    
    switch (icol.a) {
        case 254:
            // FULLY UNLIT: No shading, no day/night cycle (Full Bright)
            color *= vertexColor; 
            break;
        case 100: 
        case 253: 
        case 200: 
        case 50: 
            // UNLIT BUT REACTIVE: No shading, but dims at night
            color *= vertexColor * lightMapColor; 
            break;
        default: 
            // STANDARD: Full shading and day/night cycle
            color *= vertexColor * lightColor * lightMapColor; 
            break;
    }
    
    color *= ColorModulator;

    if (color.a < 0.1) discard;
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}