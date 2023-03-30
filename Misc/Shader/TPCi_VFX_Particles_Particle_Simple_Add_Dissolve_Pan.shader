//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Particles/Particle_Simple_Add_Dissolve_Pan" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
[Toggle] _AddMainColor1 ("Add Main Color", Float) = 0
_ParticleAlpha ("Particle Alpha", 2D) = "white" { }
_MainTextureTiling1 ("Main Texture Tiling", Vector) = (1,1,0,0)
_DissolveTexture ("Dissolve Texture", 2D) = "white" { }
_AddWhite ("Add White", Range(0, 1)) = 0
_PanSpeedMain1 ("Pan Speed Main", Vector) = (0,2,0,0)
_AlphaChannel ("Alpha Channel", Range(0, 1)) = 0
_SmoothstepMax ("Smoothstep Max", Float) = 1
_Brightness ("Brightness", Float) = 1
_Alpha_Intensity ("Alpha_Intensity", Float) = 1
_OverallAlphaIntensity ("Overall Alpha Intensity", Float) = 1
_Offset ("Offset", Float) = 0
_DissolveIntensity ("Dissolve Intensity", Float) = 1
_DissolveTextureTiling ("Dissolve Texture Tiling", Vector) = (1,1,0,0)
_PanSpeed ("Pan Speed", Vector) = (0,2,0,0)
_DissolveDistortionMap ("Dissolve Distortion Map", 2D) = "white" { }
_Distortpanspeed ("Distort pan speed", Vector) = (0,-1,0,0)
_DissolveDistPower ("Dissolve Dist Power", Range(-1, 1)) = -0.05409748
_DissolveDistortNoise ("Dissolve Distort Noise", Range(-1, 1)) = 0
_DistortTextureTiling ("Distort Texture Tiling", Vector) = (1,1,0,0)
_texcoord ("", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 38937
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Offset;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = vec3(vec3(_Offset, _Offset, _Offset)) * u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD3.xyz = in_TEXCOORD1.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	float _AddMainColor1;
uniform 	float _Brightness;
uniform 	float _AddWhite;
uniform 	vec2 _PanSpeedMain1;
uniform 	vec2 _MainTextureTiling1;
uniform 	vec4 _ParticleAlpha_ST;
uniform 	float _AlphaChannel;
uniform 	float _Alpha_Intensity;
uniform 	float _SmoothstepMax;
uniform 	vec2 _Distortpanspeed;
uniform 	vec2 _DistortTextureTiling;
uniform 	float _DissolveDistortNoise;
uniform 	float _DissolveDistPower;
uniform 	vec2 _PanSpeed;
uniform 	vec2 _DissolveTextureTiling;
uniform 	float _DissolveIntensity;
uniform 	float _OverallAlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ParticleAlpha;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveDistortionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _DissolveTexture;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
vec2 u_xlat8;
mediump vec2 u_xlat16_8;
vec2 u_xlat16;
vec2 u_xlat17;
vec2 u_xlat18;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.x = float(0.0);
    u_xlat0.z = float(1.0);
    u_xlat1.xy = vs_TEXCOORD3.xy * vec2(_DistortTextureTiling.x, _DistortTextureTiling.y);
    u_xlat17.xy = _Time.yy * _Distortpanspeed.xy + u_xlat1.xy;
    u_xlat2.xy = u_xlat17.xy * vec2(_DissolveDistortNoise);
    u_xlat24 = dot(u_xlat2.xy, vec2(0.366025418, 0.366025418));
    u_xlat2.xy = u_xlat17.xy * vec2(_DissolveDistortNoise) + vec2(u_xlat24);
    u_xlat2.xy = floor(u_xlat2.xy);
    u_xlat18.xy = u_xlat2.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat18.xy = floor(u_xlat18.xy);
    u_xlat18.xy = (-u_xlat18.xy) * vec2(289.0, 289.0) + u_xlat2.xy;
    u_xlat3.xy = u_xlat17.xy * vec2(_DissolveDistortNoise) + (-u_xlat2.xy);
    u_xlat24 = dot(u_xlat2.xy, vec2(0.211324871, 0.211324871));
    u_xlat2.xy = vec2(u_xlat24) + u_xlat3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat2.y<u_xlat2.x);
#else
    u_xlatb24 = u_xlat2.y<u_xlat2.x;
#endif
    u_xlat3 = (bool(u_xlatb24)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat0.y = u_xlat3.y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat18.yyy;
    u_xlat4.xyz = u_xlat0.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat0.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat18.xxx + u_xlat0.xyz;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat4.y = u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat0.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat4.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat0.xyz + (-u_xlat4.xyz);
    u_xlat0.xyz = abs(u_xlat0.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat5.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat6.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat7 = u_xlat2.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat7.xy = u_xlat3.zw + u_xlat7.xy;
    u_xlat6.y = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat6.z = dot(u_xlat7.zw, u_xlat7.zw);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat5.xyz * u_xlat3.xyz;
    u_xlat0.x = u_xlat2.y * u_xlat0.x;
    u_xlat8.xy = u_xlat0.yz * u_xlat7.yw;
    u_xlat5.yz = u_xlat4.yz * u_xlat7.xz + u_xlat8.xy;
    u_xlat5.x = u_xlat4.x * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat0.xy = u_xlat0.xx + u_xlat17.xy;
    u_xlat16_0 = texture(_DissolveDistortionMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 + -1.0;
    u_xlat0.xy = u_xlat1.xy * u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_DissolveDistPower, _DissolveDistPower)) + u_xlat1.xy;
    u_xlat16.xy = vs_TEXCOORD4.xy * _DissolveTextureTiling.xy;
    u_xlat1.xy = _Time.yy * vec2(_PanSpeed.x, _PanSpeed.y);
    u_xlat16.xy = u_xlat1.xy * vec2(0.76171875, 0.76171875) + u_xlat16.xy;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTexture, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _DissolveIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = max(vs_TEXCOORD0.z, -1.0);
    u_xlat8.x = min(u_xlat8.x, 1.0);
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat16.x = u_xlat8.x + _SmoothstepMax;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat8.x = (-u_xlat8.x) + u_xlat16.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * _OverallAlphaIntensity;
    u_xlat8.xy = vs_TEXCOORD0.xy * _ParticleAlpha_ST.xy + _ParticleAlpha_ST.zw;
    u_xlat16_8.xy = texture(_ParticleAlpha, u_xlat8.xy).xw;
    u_xlat16.x = (-u_xlat16_8.x) + u_xlat16_8.y;
    u_xlat8.x = _AlphaChannel * u_xlat16.x + u_xlat16_8.x;
    u_xlat8.x = u_xlat8.x * _Alpha_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.w = u_xlat0.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.w = min(max(u_xlat0.w, 0.0), 1.0);
#else
    u_xlat0.w = clamp(u_xlat0.w, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD3.xy * _MainTextureTiling1.xy;
    u_xlat17.xy = _Time.yy * vec2(_PanSpeedMain1.x, _PanSpeedMain1.y);
    u_xlat1.xy = u_xlat17.xy * vec2(0.76171875, 0.76171875) + u_xlat1.xy;
    u_xlat1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat1.xyz + vec3(_AddWhite);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
    u_xlat1.w = 0.0;
    u_xlat1 = u_xlat0 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AddMainColor1));
#else
    u_xlatb2 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AddMainColor1);
#endif
    u_xlat0 = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    SV_Target0 = u_xlat0;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Offset;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = vec3(vec3(_Offset, _Offset, _Offset)) * u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
    vs_TEXCOORD3.xyz = in_TEXCOORD1.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	vec4 _ZBufferParams;
uniform 	float _InvFade;
uniform 	float _AddMainColor1;
uniform 	float _Brightness;
uniform 	float _AddWhite;
uniform 	vec2 _PanSpeedMain1;
uniform 	vec2 _MainTextureTiling1;
uniform 	vec4 _ParticleAlpha_ST;
uniform 	float _AlphaChannel;
uniform 	float _Alpha_Intensity;
uniform 	float _SmoothstepMax;
uniform 	vec2 _Distortpanspeed;
uniform 	vec2 _DistortTextureTiling;
uniform 	float _DissolveDistortNoise;
uniform 	float _DissolveDistPower;
uniform 	vec2 _PanSpeed;
uniform 	vec2 _DissolveTextureTiling;
uniform 	float _DissolveIntensity;
uniform 	float _OverallAlphaIntensity;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _ParticleAlpha;
UNITY_LOCATION(3) uniform mediump sampler2D _DissolveDistortionMap;
UNITY_LOCATION(4) uniform mediump sampler2D _DissolveTexture;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
vec2 u_xlat8;
mediump vec2 u_xlat16_8;
vec2 u_xlat16;
vec2 u_xlat17;
vec2 u_xlat18;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.x = float(0.0);
    u_xlat0.z = float(1.0);
    u_xlat1.xy = vs_TEXCOORD3.xy * vec2(_DistortTextureTiling.x, _DistortTextureTiling.y);
    u_xlat17.xy = _Time.yy * _Distortpanspeed.xy + u_xlat1.xy;
    u_xlat2.xy = u_xlat17.xy * vec2(_DissolveDistortNoise);
    u_xlat24 = dot(u_xlat2.xy, vec2(0.366025418, 0.366025418));
    u_xlat2.xy = u_xlat17.xy * vec2(_DissolveDistortNoise) + vec2(u_xlat24);
    u_xlat2.xy = floor(u_xlat2.xy);
    u_xlat18.xy = u_xlat2.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat18.xy = floor(u_xlat18.xy);
    u_xlat18.xy = (-u_xlat18.xy) * vec2(289.0, 289.0) + u_xlat2.xy;
    u_xlat3.xy = u_xlat17.xy * vec2(_DissolveDistortNoise) + (-u_xlat2.xy);
    u_xlat24 = dot(u_xlat2.xy, vec2(0.211324871, 0.211324871));
    u_xlat2.xy = vec2(u_xlat24) + u_xlat3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat2.y<u_xlat2.x);
#else
    u_xlatb24 = u_xlat2.y<u_xlat2.x;
#endif
    u_xlat3 = (bool(u_xlatb24)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat0.y = u_xlat3.y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat18.yyy;
    u_xlat4.xyz = u_xlat0.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat0.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat18.xxx + u_xlat0.xyz;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat4.y = u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat0.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat4.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat0.xyz + (-u_xlat4.xyz);
    u_xlat0.xyz = abs(u_xlat0.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat5.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat6.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat7 = u_xlat2.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat7.xy = u_xlat3.zw + u_xlat7.xy;
    u_xlat6.y = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat6.z = dot(u_xlat7.zw, u_xlat7.zw);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat5.xyz * u_xlat3.xyz;
    u_xlat0.x = u_xlat2.y * u_xlat0.x;
    u_xlat8.xy = u_xlat0.yz * u_xlat7.yw;
    u_xlat5.yz = u_xlat4.yz * u_xlat7.xz + u_xlat8.xy;
    u_xlat5.x = u_xlat4.x * u_xlat2.x + u_xlat0.x;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat0.xy = u_xlat0.xx + u_xlat17.xy;
    u_xlat16_0 = texture(_DissolveDistortionMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 + -1.0;
    u_xlat0.xy = u_xlat1.xy * u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_DissolveDistPower, _DissolveDistPower)) + u_xlat1.xy;
    u_xlat16.xy = vs_TEXCOORD4.xy * _DissolveTextureTiling.xy;
    u_xlat1.xy = _Time.yy * vec2(_PanSpeed.x, _PanSpeed.y);
    u_xlat16.xy = u_xlat1.xy * vec2(0.76171875, 0.76171875) + u_xlat16.xy;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTexture, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _DissolveIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = max(vs_TEXCOORD0.z, -1.0);
    u_xlat8.x = min(u_xlat8.x, 1.0);
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat16.x = u_xlat8.x + _SmoothstepMax;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat8.x = (-u_xlat8.x) + u_xlat16.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * _OverallAlphaIntensity;
    u_xlat8.xy = vs_TEXCOORD0.xy * _ParticleAlpha_ST.xy + _ParticleAlpha_ST.zw;
    u_xlat16_8.xy = texture(_ParticleAlpha, u_xlat8.xy).xw;
    u_xlat16.x = (-u_xlat16_8.x) + u_xlat16_8.y;
    u_xlat8.x = _AlphaChannel * u_xlat16.x + u_xlat16_8.x;
    u_xlat8.x = u_xlat8.x * _Alpha_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat8.x = texture(_CameraDepthTexture, u_xlat8.xy).x;
    u_xlat8.x = _ZBufferParams.z * u_xlat8.x + _ZBufferParams.w;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = u_xlat8.x + (-vs_TEXCOORD2.z);
    u_xlat8.x = u_xlat8.x * _InvFade;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat8.x * vs_COLOR0.w;
    u_xlat0.w = u_xlat0.x * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.w = min(max(u_xlat0.w, 0.0), 1.0);
#else
    u_xlat0.w = clamp(u_xlat0.w, 0.0, 1.0);
#endif
    u_xlat1.xy = vs_TEXCOORD3.xy * _MainTextureTiling1.xy;
    u_xlat17.xy = _Time.yy * vec2(_PanSpeedMain1.x, _PanSpeedMain1.y);
    u_xlat1.xy = u_xlat17.xy * vec2(0.76171875, 0.76171875) + u_xlat1.xy;
    u_xlat1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat1.xyz + vec3(_AddWhite);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
    u_xlat1.w = 0.0;
    u_xlat1 = u_xlat0 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AddMainColor1));
#else
    u_xlatb2 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AddMainColor1);
#endif
    u_xlat0 = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    SV_Target0 = u_xlat0;
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