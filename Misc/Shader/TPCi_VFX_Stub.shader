//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Stub" {
Properties {
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 50379
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    gl_Position = in_POSITION0;
    vs_TEXCOORD2.xyz = in_NORMAL0.xyz;
    vs_TEXCOORD3.xyz = in_TANGENT0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(1.0, 1.0, 1.0, 1.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
}
}
}
}