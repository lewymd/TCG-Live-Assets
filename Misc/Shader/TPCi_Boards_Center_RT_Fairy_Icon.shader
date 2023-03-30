//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/Center_RT_Fairy_Icon" {
Properties {
_T_VFX_Gradient_Beam_Horizontal ("T_VFX_Gradient_Beam_Horizontal", 2D) = "white" { }
_Panning ("Panning", Vector) = (0,0.25,0,0)
_Emissive ("Emissive", Float) = 1
_Color ("Color", Color) = (0.9897361,0.5330188,1,0)
_Power ("Power", Float) = 19.81
_T_VFX_Fairy_Icon ("T_VFX_Fairy_Icon", 2D) = "white" { }
_Color0 ("Color 0", Color) = (0.3290762,0.8018868,0.6647173,0)
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
  GpuProgramID 26337
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	float _Emissive;
uniform 	vec4 _Color0;
uniform 	vec4 _Color;
uniform 	vec2 _Panning;
uniform 	float _Power;
uniform 	vec4 _T_VFX_Fairy_Icon_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_Gradient_Beam_Horizontal;
UNITY_LOCATION(1) uniform mediump sampler2D _T_VFX_Fairy_Icon;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_1;
void main()
{
    u_xlat0.xy = _Time.yy * _Panning.xy + vs_TEXCOORD0.xy;
    u_xlat1.x = dot(u_xlat0.xy, vec2(0.707106769, 0.707106769));
    u_xlat1.y = dot(u_xlat0.xy, vec2(-0.707106769, 0.707106769));
    u_xlat16_0.xyz = texture(_T_VFX_Gradient_Beam_Horizontal, u_xlat1.xy).xyz;
    u_xlat0.xyz = log2(u_xlat16_0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Power, _Power, _Power));
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-_Color0.xyz) + _Color.xyz;
    u_xlat1.xyz = vs_TEXCOORD0.yyy * u_xlat1.xyz + _Color0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.207547203, 0.207547203, 0.207547203) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Emissive);
    u_xlat1.xy = vs_TEXCOORD0.xy * _T_VFX_Fairy_Icon_ST.xy + _T_VFX_Fairy_Icon_ST.zw;
    u_xlat16_1.xy = texture(_T_VFX_Fairy_Icon, u_xlat1.xy).xw;
    u_xlat0.w = u_xlat16_1.y * 0.0500000007 + u_xlat16_1.x;
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	float _Emissive;
uniform 	vec4 _Color0;
uniform 	vec4 _Color;
uniform 	vec2 _Panning;
uniform 	float _Power;
uniform 	vec4 _T_VFX_Fairy_Icon_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_Gradient_Beam_Horizontal;
UNITY_LOCATION(1) uniform mediump sampler2D _T_VFX_Fairy_Icon;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_1;
void main()
{
    u_xlat0.xy = _Time.yy * _Panning.xy + vs_TEXCOORD0.xy;
    u_xlat1.x = dot(u_xlat0.xy, vec2(0.707106769, 0.707106769));
    u_xlat1.y = dot(u_xlat0.xy, vec2(-0.707106769, 0.707106769));
    u_xlat16_0.xyz = texture(_T_VFX_Gradient_Beam_Horizontal, u_xlat1.xy).xyz;
    u_xlat0.xyz = log2(u_xlat16_0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Power, _Power, _Power));
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-_Color0.xyz) + _Color.xyz;
    u_xlat1.xyz = vs_TEXCOORD0.yyy * u_xlat1.xyz + _Color0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.207547203, 0.207547203, 0.207547203) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Emissive);
    u_xlat1.xy = vs_TEXCOORD0.xy * _T_VFX_Fairy_Icon_ST.xy + _T_VFX_Fairy_Icon_ST.zw;
    u_xlat16_1.xy = texture(_T_VFX_Fairy_Icon, u_xlat1.xy).xw;
    u_xlat0.w = u_xlat16_1.y * 0.0500000007 + u_xlat16_1.x;
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