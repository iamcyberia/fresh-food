#version 150

uniform sampler2D Sampler0;

in vec2 texCoord0;
in vec4 vertexColor;

uniform vec4 ColorModulator;

out vec4 fragColor;

void main() {
    vec4 texel = texture(Sampler0, texCoord0);

    if (texel.a < 0.1) discard;

    ivec2 texSize = textureSize(Sampler0, 0);
    ivec2 coord = ivec2(texCoord0 * vec2(texSize));
    texel = texelFetch(Sampler0, coord, 0);

    ivec4 pixel = ivec4(texel * 255.0 + 0.5);

    vec4 color = texel;

    bool special = false;

    switch (pixel.a) {
        case 200: case 252: case 253: case 254: case 250: case 100: case 50:
            special = true;
            break;
    }

    if (special) {
        color *= ColorModulator;
        color.rgb *= 0.9;
    } else {
        color *= vertexColor;
    }

    fragColor = color;
}