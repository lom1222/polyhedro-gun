shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back;

uniform vec4 base_color : source_color = vec4(0.1, 0.1, 0.1, 0.0);
uniform vec4 line_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 outline_color : source_color = vec4(1.0, 0.0, 0.0, 0.8);

uniform float grid_size = 1.0;
uniform float line_width = 0.02;
uniform float outline_width = 0.05;

uniform float pulse_speed = 2.0;
uniform float pulse_intensity = 0.5;
uniform float pulse_min = 0.5;
uniform float pulse_max = 1.0;

void fragment() {
	
    float pulse = sin(TIME * pulse_speed) * (pulse_max - pulse_min) + pulse_min;

    vec2 grid = fract(UV * grid_size);
    vec2 dist_to_edge = min(grid, 1.0 - grid);
    float d = min(dist_to_edge.x, dist_to_edge.y);

    float outline_mask = step(d, outline_width); 
    float line_mask = step(d, line_width);

    vec4 final_rgba = mix(base_color, outline_color, outline_mask);
	vec4 final_line_color = line_color;
	final_line_color.a = pulse;
    final_rgba = mix(final_rgba, final_line_color, line_mask);

    ALBEDO = final_rgba.rgb;
    ALPHA = final_rgba.a;
    EMISSION = final_rgba.rgb * pulse * pulse_intensity;
}
