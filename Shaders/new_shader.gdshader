shader_type canvas_item;

//uniform sampler2D TEXTURE : hint_screen_texture, repeat_disable, filter_nearest;
uniform float scale : hint_range(0.1, 10) = 1.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 pixelColor = texture(TEXTURE, UV * scale);
	COLOR = pixelColor;
	//pixelColor = vec4(0.0,0.0,0.0,0.0);
}

