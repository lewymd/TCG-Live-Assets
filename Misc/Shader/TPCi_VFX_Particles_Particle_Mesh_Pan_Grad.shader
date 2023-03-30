//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Particles/Particle_Mesh_Pan_Grad" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
_AddWhiteToDiffuse ("Add White To Diffuse", Float) = 0
_PanningMask ("Panning Mask", 2D) = "white" { }
_PanningMaskTextureTiling ("Panning Mask Texture Tiling", Vector) = (1,1,0,0)
_PanningMaskTexturePan ("Panning Mask Texture Pan", Vector) = (0,0,0,0)
_AlphaIntensity ("Alpha Intensity", Float) = 1
_ColorIntensity ("Color Intensity", Float) = 1.56
_LUTLowThreshhold ("LUT Low Threshhold", Color) = (0.3867925,0.3867925,0.3867925,1)
_LUTLowRange ("LUT Low Range", Range(0, 1)) = 0.194
_ColorHigh ("Color High", Color) = (0.9294118,0.7058824,0.1254902,1)
_ColorLow ("Color Low", Color) = (0.8207547,0.2068043,0,1)
_texcoord ("", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Geometry" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Geometry" "RenderType" = "Transparent" }
  Blend SrcAlpha One, One OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  GpuProgramID 3827
Program "vp" {
SubProgram "gles3 " {
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
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
uniform 	vec4 _ColorLow;
uniform 	vec4 _PanningMask_ST;
uniform 	vec4 _LUTLowThreshhold;
uniform 	float _LUTLowRange;
uniform 	float _ColorIntensity;
uniform 	vec4 _ColorHigh;
uniform 	float _AddWhiteToDiffuse;
uniform 	vec2 _PanningMaskTextureTiling;
uniform 	vec2 _PanningMaskTexturePan;
uniform 	float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _PanningMask;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.xy = _Time.yy * _PanningMaskTexturePan.xy;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_PanningMaskTextureTiling.x, _PanningMaskTextureTiling.y) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_PanningMask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat1.xyz = _ColorHigh.xyz + vec3(_AddWhiteToDiffuse);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_ColorIntensity, _ColorIntensity, _ColorIntensity));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _PanningMask_ST.xy + _PanningMask_ST.zw;
    u_xlat1 = texture(_PanningMask, u_xlat1.xy).xywz;
    u_xlat2.xyz = u_xlat1.xyw + _ColorLow.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2 = u_xlat1.xywz + (-_LUTLowThreshhold);
    u_xlat9 = dot(u_xlat2, u_xlat2);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 + (-_LUTLowRange);
    u_xlat9 = u_xlat9 * 2.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat1.xyw + (-_ColorLow.xyz);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz + _ColorLow.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz * vec3(vec3(_AlphaIntensity, _AlphaIntensity, _AlphaIntensity));
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SOFTPARTICLES_ON" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    vs_TEXCOORD2.z = (-u_xlat0.x);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.w = u_xlat1.w;
    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 _ColorLow;
uniform 	vec4 _PanningMask_ST;
uniform 	vec4 _LUTLowThreshhold;
uniform 	float _LUTLowRange;
uniform 	float _ColorIntensity;
uniform 	vec4 _ColorHigh;
uniform 	float _AddWhiteToDiffuse;
uniform 	vec2 _PanningMaskTextureTiling;
uniform 	vec2 _PanningMaskTexturePan;
uniform 	float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _PanningMask;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.xy = _Time.yy * _PanningMaskTexturePan.xy;
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_PanningMaskTextureTiling.x, _PanningMaskTextureTiling.y) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_PanningMask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat1.xyz = _ColorHigh.xyz + vec3(_AddWhiteToDiffuse);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_ColorIntensity, _ColorIntensity, _ColorIntensity));
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD0.xy * _PanningMask_ST.xy + _PanningMask_ST.zw;
    u_xlat1 = texture(_PanningMask, u_xlat1.xy).xywz;
    u_xlat2.xyz = u_xlat1.xyw + _ColorLow.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2 = u_xlat1.xywz + (-_LUTLowThreshhold);
    u_xlat9 = dot(u_xlat2, u_xlat2);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 + (-_LUTLowRange);
    u_xlat9 = u_xlat9 * 2.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat1.xyw + (-_ColorLow.xyz);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz + _ColorLow.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz * vec3(vec3(_AlphaIntensity, _AlphaIntensity, _AlphaIntensity));
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    SV_Target0 = u_xlat1;
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
SubProgram "gles3 " {
Keywords { "SOFTPARTICLES_ON" }
""
}
}
}
}
CustomEditor "ASEMaterialInspector"
}