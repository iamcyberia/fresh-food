#version 150

#moj_import <minecraft:fog.glsl>

uniform sampler2D Sampler0;
uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec4 lightColor;
in vec4 lightMapColor;
in vec4 overlayColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0);

    // 1.21.5 Alpha Cutout Style
    #ifdef ALPHA_CUTOUT
        if (color.a < ALPHA_CUTOUT) discard;
    #endif

    // Custom Material Logic from 1.21.9
    #ifndef EMISSIVE
        int alpha = int(round(color.a * 255));
        switch (alpha) {
            case 252: break;
            case 100: break;
            case 200: break;
            case 253: color *= lightColor; break;
            default: color *= lightColor * lightMapColor; break;
        }
    #endif

    color *= vertexColor * ColorModulator;

    #ifndef NO_OVERLAY
        color.rgb = mix(overlayColor.rgb, color.rgb, overlayColor.a);
    #endif

    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}