//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/Colorless_Alpha_Dissolve_Clipped" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
_Texture0 ("Texture 0", 2D) = "white" { }
_ParticleAlpha ("Particle Alpha", 2D) = "white" { }
_DissolveTexture ("Dissolve Texture", 2D) = "white" { }
_AddWhite ("Add White", Range(0, 1)) = 0
_AlphaChannel ("Alpha Channel", Range(0, 1)) = 0
_Max ("Max", Float) = 0.5
_Min ("Min", Float) = 0.5
_SmoothstepMax ("Smoothstep Max", Float) = 1
_EdgePower ("Edge Power", Float) = 4.74
_Brightness ("Brightness", Float) = 1
_Alpha_Intensity ("Alpha_Intensity", Float) = 1
_EdgeColor ("Edge Color", Color) = (1,0.6002574,0.004716992,1)
_DissolveIntensity ("Dissolve Intensity", Float) = 1
_EdgeColorBrightness ("Edge Color Brightness", Float) = 200
_OverallAlphaIntensity ("Overall Alpha Intensity", Float) = 1
_Offset ("Offset", Float) = 0
_texcoord ("", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 47048
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
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
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
uniform 	vec4 _ParticleAlpha_ST;
uniform 	float _AlphaChannel;
uniform 	float _Alpha_Intensity;
uniform 	float _SmoothstepMax;
uniform 	vec4 _DissolveTexture_ST;
uniform 	float _DissolveIntensity;
uniform 	float _OverallAlphaIntensity;
uniform 	float _Brightness;
uniform 	float _AddWhite;
uniform 	vec4 _Texture0_ST;
uniform 	vec4 _EdgeColor;
uniform 	float _Min;
uniform 	float _Max;
uniform 	float _EdgePower;
uniform 	float _EdgeColorBrightness;
UNITY_LOCATION(0) uniform mediump sampler2D _ParticleAlpha;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _Texture0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat4;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.x = max(vs_TEXCOORD0.z, -1.0);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat4 = u_xlat0.x + _SmoothstepMax;
#ifdef UNITY_ADRENO_ES3
    u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
    u_xlat4 = (-u_xlat0.x) + u_xlat4;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat8.xy = vs_TEXCOORD0.xy * _DissolveTexture_ST.xy + _DissolveTexture_ST.zw;
    u_xlat16_1.xyz = texture(_DissolveTexture, u_xlat8.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DissolveIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xzw = (-u_xlat0.xxx) + u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat4) * u_xlat0.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_OverallAlphaIntensity, _OverallAlphaIntensity, _OverallAlphaIntensity));
    u_xlat1.xy = vs_TEXCOORD0.xy * _ParticleAlpha_ST.xy + _ParticleAlpha_ST.zw;
    u_xlat16_1 = texture(_ParticleAlpha, u_xlat1.xy);
    u_xlat2.xyz = (-u_xlat16_1.xyz) + u_xlat16_1.www;
    u_xlat1.xyz = vec3(_AlphaChannel) * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Alpha_Intensity, _Alpha_Intensity, _Alpha_Intensity));
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat1.xyz * u_xlat0.xyz + (-vec3(_Min));
    u_xlat12 = vs_TEXCOORD0.z + _Max;
    u_xlat12 = u_xlat12 + (-_Min);
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = (-u_xlat1.xyz) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EdgePower, _EdgePower, _EdgePower));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = u_xlat1.xyz * _EdgeColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EdgeColorBrightness, _EdgeColorBrightness, _EdgeColorBrightness));
    u_xlat2.xy = vs_TEXCOORD0.xy * _Texture0_ST.xy + _Texture0_ST.zw;
    u_xlat16_2.xyz = texture(_Texture0, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(vec3(_AddWhite, _AddWhite, _AddWhite));
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = vec3(vec3(_Brightness, _Brightness, _Brightness)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.w = min(max(u_xlat1.w, 0.0), 1.0);
#else
    u_xlat1.w = clamp(u_xlat1.w, 0.0, 1.0);
#endif
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Offset;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
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
uniform 	vec4 _ZBufferParams;
uniform 	float _InvFade;
uniform 	vec4 _ParticleAlpha_ST;
uniform 	float _AlphaChannel;
uniform 	float _Alpha_Intensity;
uniform 	float _SmoothstepMax;
uniform 	vec4 _DissolveTexture_ST;
uniform 	float _DissolveIntensity;
uniform 	float _OverallAlphaIntensity;
uniform 	float _Brightness;
uniform 	float _AddWhite;
uniform 	vec4 _Texture0_ST;
uniform 	vec4 _EdgeColor;
uniform 	float _Min;
uniform 	float _Max;
uniform 	float _EdgePower;
uniform 	float _EdgeColorBrightness;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ParticleAlpha;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _Texture0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.x = max(vs_TEXCOORD0.z, -1.0);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat4.x = u_xlat0.x + _SmoothstepMax;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat0.x) + u_xlat4.x;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _DissolveTexture_ST.xy + _DissolveTexture_ST.zw;
    u_xlat16_1.xyz = texture(_DissolveTexture, u_xlat8.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DissolveIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xzw = (-u_xlat0.xxx) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat4.xxx * u_xlat0.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat0.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_OverallAlphaIntensity, _OverallAlphaIntensity, _OverallAlphaIntensity));
    u_xlat1.xy = vs_TEXCOORD0.xy * _ParticleAlpha_ST.xy + _ParticleAlpha_ST.zw;
    u_xlat16_1 = texture(_ParticleAlpha, u_xlat1.xy);
    u_xlat2.xyz = (-u_xlat16_1.xyz) + u_xlat16_1.www;
    u_xlat1.xyz = vec3(_AlphaChannel) * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Alpha_Intensity, _Alpha_Intensity, _Alpha_Intensity));
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat1.xyz * u_xlat0.xyz + (-vec3(_Min));
    u_xlat12 = vs_TEXCOORD0.z + _Max;
    u_xlat12 = u_xlat12 + (-_Min);
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = (-u_xlat1.xyz) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EdgePower, _EdgePower, _EdgePower));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = u_xlat1.xyz * _EdgeColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EdgeColorBrightness, _EdgeColorBrightness, _EdgeColorBrightness));
    u_xlat2.xy = vs_TEXCOORD0.xy * _Texture0_ST.xy + _Texture0_ST.zw;
    u_xlat16_2.xyz = texture(_Texture0, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(vec3(_AddWhite, _AddWhite, _AddWhite));
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = vec3(vec3(_Brightness, _Brightness, _Brightness)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat4.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat4.x = texture(_CameraDepthTexture, u_xlat4.xy).x;
    u_xlat4.x = _ZBufferParams.z * u_xlat4.x + _ZBufferParams.w;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat4.x = u_xlat4.x + (-vs_TEXCOORD2.z);
    u_xlat4.x = u_xlat4.x * _InvFade;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * vs_COLOR0.w;
    u_xlat1.w = u_xlat0.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.w = min(max(u_xlat1.w, 0.0), 1.0);
#else
    u_xlat1.w = clamp(u_xlat1.w, 0.0, 1.0);
#endif
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