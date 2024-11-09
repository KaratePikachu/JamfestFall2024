shader_type canvas_item;

//uniform sampler2D TEXTURE : hint_screen_texture, repeat_disable, filter_nearest;
uniform float scale : hint_range(0.1, 10) = 1.0;
uniform float lod: hint_range(0.0, 5) = 0.0;
uniform float x_blur_offest : hint_range(0.0, 3.0) = 0.0;
uniform float y_blur_offest : hint_range(0.0, 3.0) = 0.0;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, repeat_disable, filter_nearest;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV, lod);
	vec4 blur_colors[16/*4*/] = { texture(TEXTURE, UV + vec2(0.0,y_blur_offest)),
	texture(SCREEN_TEXTURE, UV + vec2(0.0,-y_blur_offest)),
	texture(SCREEN_TEXTURE, UV + vec2(x_blur_offest,0.0)),
	texture(SCREEN_TEXTURE, UV + vec2(-x_blur_offest,0.0)),
	texture(SCREEN_TEXTURE, UV + vec2(x_blur_offest,y_blur_offest)),
	texture(SCREEN_TEXTURE, UV + vec2(-x_blur_offest,-y_blur_offest)),
	texture(SCREEN_TEXTURE, UV + vec2(x_blur_offest,-y_blur_offest)),
	texture(SCREEN_TEXTURE, UV + vec2(-x_blur_offest,y_blur_offest)),
	texture(SCREEN_TEXTURE, UV + vec2(0.0,y_blur_offest * 0.5)),
	texture(SCREEN_TEXTURE, UV + vec2(0.0,-y_blur_offest* 0.5)),
	texture(SCREEN_TEXTURE, UV + vec2(x_blur_offest* 0.5,0.0)),
	texture(SCREEN_TEXTURE, UV + vec2(-x_blur_offest* 0.5,0.0)),
	texture(SCREEN_TEXTURE, UV + vec2(x_blur_offest* 0.5,y_blur_offest* 0.5)),
	texture(SCREEN_TEXTURE, UV + vec2(-x_blur_offest* 0.5,-y_blur_offest* 0.5)),
	texture(SCREEN_TEXTURE, UV + vec2(x_blur_offest* 0.5,-y_blur_offest* 0.5)),
	texture(SCREEN_TEXTURE, UV + vec2(-x_blur_offest* 0.5,y_blur_offest* 0.5)) };
	
	COLOR = color;
	
	
	COLOR = (blur_colors[0] + blur_colors[1] + blur_colors[2] + blur_colors[3] + blur_colors[4] +
	blur_colors[5] + blur_colors[6] + blur_colors[7] + 
	blur_colors[8] + blur_colors[9] + blur_colors[10] + 
	blur_colors[11] + blur_colors[12] + blur_colors[13] +
	blur_colors[14] + blur_colors[15]  ) /16.0 ;
	// Called for every pixel the material is visible on.
	//vec4 pixelColor = texture(SCREEN_TEXTURE, SCREEN_UV, lod);
	//vec4 pixelColor = texture(TEXTURE, UV * scale);
	//COLOR = pixelColor;
	
	//pixelColor = vec4(0.0,0.0,0.0,0.0);
}
