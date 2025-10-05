shader_type canvas_item;

global uniform float PIXEL_SIZE;

void fragment() {
	vec2 pixelSize = vec2(PIXEL_SIZE); //vec2(32.0 / 4.0);
	vec2 correction = TEXTURE_PIXEL_SIZE * vec2(float(pixelSize.x), float(pixelSize.y)) / 2.0;
	vec2 textureUV = floor(UV / TEXTURE_PIXEL_SIZE);
	vec2 offset = vec2(mod(textureUV.x, pixelSize.x), mod(textureUV.y, pixelSize.y));
	vec2 target = (textureUV - offset) * TEXTURE_PIXEL_SIZE;

	vec4 screenColor = textureLod(TEXTURE, (target + correction), 0.0);

	COLOR = screenColor;
}