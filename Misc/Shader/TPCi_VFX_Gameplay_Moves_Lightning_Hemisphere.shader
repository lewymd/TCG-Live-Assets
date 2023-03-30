//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Gameplay/Moves/Lightning_Hemisphere" {
Properties {
_bias ("bias", Float) = 0
_scale ("scale", Float) = 1
_power ("power", Float) = 5
_distortion ("distortion", 2D) = "white" { }
_Lightning ("Lightning", 2D) = "white" { }
_tex4coord ("", 2D) = "white" { }
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "QUEUE" = "Transparent+0" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+0" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  GpuProgramID 45904
Program "vp" {
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _tex4coord_ST;
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex4coord_ST.xy + _tex4coord_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	float _bias;
uniform 	float _scale;
uniform 	float _power;
UNITY_LOCATION(0) uniform mediump sampler2D _distortion;
UNITY_LOCATION(1) uniform mediump sampler2D _Lightning;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec2 u_xlat4;
mediump vec2 u_xlat16_4;
float u_xlat6;
void main()
{
    u_xlat0 = vs_TEXCOORD1.xyxy * vec4(1.0, 0.25, 1.0, 0.5);
    u_xlat4.xy = _Time.yy * vec2(0.0, -0.200000003) + u_xlat0.zw;
    u_xlat16_4.xy = texture(_distortion, u_xlat4.xy).xy;
    u_xlat0.xy = u_xlat16_4.xy * vec2(0.0500000007, 0.0500000007) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * vec2(0.0, -0.5) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_Lightning, u_xlat0.xy).xyz;
    u_xlat6 = (-vs_TEXCOORD1.y) + 1.0;
    u_xlat6 = log2(u_xlat6);
    u_xlat6 = u_xlat6 * 0.589999974;
    u_xlat6 = exp2(u_xlat6);
    u_xlat6 = u_xlat6 * 2.02999997;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(u_xlat6);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.822207689, 1.0, 0.0402725302);
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
    u_xlat6 = (-u_xlat6) + 1.0;
    u_xlat6 = log2(u_xlat6);
    u_xlat1.x = vs_TEXCOORD0.z * _power;
    u_xlat6 = u_xlat6 * u_xlat1.x;
    u_xlat6 = exp2(u_xlat6);
    u_xlat6 = _scale * u_xlat6 + _bias;
    u_xlat0.xyz = vec3(u_xlat6) * vec3(0.822207689, 1.0, 0.0402725302) + u_xlat0.xyz;
    u_xlat1.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.w = u_xlat1.x * vs_COLOR0.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _tex4coord_ST;
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex4coord_ST.xy + _tex4coord_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	float _bias;
uniform 	float _scale;
uniform 	float _power;
UNITY_LOCATION(0) uniform mediump sampler2D _distortion;
UNITY_LOCATION(1) uniform mediump sampler2D _Lightning;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec2 u_xlat4;
mediump vec2 u_xlat16_4;
float u_xlat6;
void main()
{
    u_xlat0 = vs_TEXCOORD1.xyxy * vec4(1.0, 0.25, 1.0, 0.5);
    u_xlat4.xy = _Time.yy * vec2(0.0, -0.200000003) + u_xlat0.zw;
    u_xlat16_4.xy = texture(_distortion, u_xlat4.xy).xy;
    u_xlat0.xy = u_xlat16_4.xy * vec2(0.0500000007, 0.0500000007) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * vec2(0.0, -0.5) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_Lightning, u_xlat0.xy).xyz;
    u_xlat6 = (-vs_TEXCOORD1.y) + 1.0;
    u_xlat6 = log2(u_xlat6);
    u_xlat6 = u_xlat6 * 0.589999974;
    u_xlat6 = exp2(u_xlat6);
    u_xlat6 = u_xlat6 * 2.02999997;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(u_xlat6);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.822207689, 1.0, 0.0402725302);
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
    u_xlat6 = (-u_xlat6) + 1.0;
    u_xlat6 = log2(u_xlat6);
    u_xlat1.x = vs_TEXCOORD0.z * _power;
    u_xlat6 = u_xlat6 * u_xlat1.x;
    u_xlat6 = exp2(u_xlat6);
    u_xlat6 = _scale * u_xlat6 + _bias;
    u_xlat0.xyz = vec3(u_xlat6) * vec3(0.822207689, 1.0, 0.0402725302) + u_xlat0.xyz;
    u_xlat1.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.w = u_xlat1.x * vs_COLOR0.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
}
}
}
CustomEditor "ASEMaterialInspector"
}