//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Particles/Particle_Mesh_Alpha_Pan" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
_DiffuseTex ("Diffuse Tex", 2D) = "white" { }
_DiffuseIntensity ("Diffuse Intensity", Range(-1, 1)) = 0
_DiffuseTxTile ("Diffuse Tx Tile", Vector) = (1,1,0,0)
_DiffuseTxPan ("Diffuse Tx Pan", Vector) = (-1,0.5,0,0)
_AlphaTxMask ("Alpha Tx Mask", 2D) = "white" { }
_AlphaTxTile ("Alpha Tx Tile", Vector) = (1,1,0,0)
_AlphaTxPan ("Alpha Tx Pan", Vector) = (0,0,0,0)
[Toggle] _EnableFunkyDistortion ("Enable Funky Distortion", Float) = 1
_MaskTxPan ("Mask Tx Pan", Vector) = (0,-1,0,0)
_MaskDistPower ("Mask Dist Power", Range(-5, 5)) = 0
_MaskDistortionMap ("Mask Distortion Map", 2D) = "bump" { }
_MaskDistortNoise ("Mask Distort Noise", Range(-1, 1)) = 0
_SecondaryTx ("Secondary Tx", 2D) = "white" { }
_SecondaryTxIntensity ("Secondary Tx Intensity", Range(0, 1)) = 0
_SecondaryTxTile ("Secondary Tx Tile", Vector) = (1,1,0,0)
_SecondaryTxPan ("Secondary Tx Pan", Vector) = (1,-0.5,0,0)
_FresnelColor ("Fresnel Color", Color) = (0.8254717,0.9483842,1,1)
_FresnelPower ("Fresnel Power", Range(0, 10)) = 2.724146
_FresnelScale ("Fresnel Scale", Range(0, 10)) = 1
_AlphaIntensityOverall ("Alpha Intensity Overall", Range(0, 5)) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  GpuProgramID 47496
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
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
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4.w = 0.0;
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
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _EnableFunkyDistortion;
uniform 	vec2 _AlphaTxTile;
uniform 	vec2 _AlphaTxPan;
uniform 	vec2 _MaskTxPan;
uniform 	float _MaskDistortNoise;
uniform 	float _MaskDistPower;
uniform 	float _AlphaIntensityOverall;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	vec4 _FresnelColor;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(1) uniform mediump sampler2D _DiffuseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskDistortionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _AlphaTxMask;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
mediump float u_xlat16_7;
vec2 u_xlat8;
vec3 u_xlat10;
vec2 u_xlat16;
vec2 u_xlat17;
vec2 u_xlat18;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
void main()
{
    u_xlat0.x = float(0.0);
    u_xlat0.z = float(1.0);
    u_xlat1.xy = _Time.yy * vec2(_MaskTxPan.x, _MaskTxPan.y) + vs_TEXCOORD0.xy;
    u_xlat17.xy = u_xlat1.xy * vec2(_MaskDistortNoise);
    u_xlat24 = dot(u_xlat17.xy, vec2(0.366025418, 0.366025418));
    u_xlat17.xy = u_xlat1.xy * vec2(_MaskDistortNoise) + vec2(u_xlat24);
    u_xlat17.xy = floor(u_xlat17.xy);
    u_xlat2.xy = u_xlat17.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat2.xy = floor(u_xlat2.xy);
    u_xlat2.xy = (-u_xlat2.xy) * vec2(289.0, 289.0) + u_xlat17.xy;
    u_xlat18.xy = u_xlat1.xy * vec2(_MaskDistortNoise) + (-u_xlat17.xy);
    u_xlat24 = dot(u_xlat17.xy, vec2(0.211324871, 0.211324871));
    u_xlat17.xy = vec2(u_xlat24) + u_xlat18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat17.y<u_xlat17.x);
#else
    u_xlatb24 = u_xlat17.y<u_xlat17.x;
#endif
    u_xlat3 = (bool(u_xlatb24)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat0.y = u_xlat3.y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.yyy;
    u_xlat10.xyz = u_xlat0.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat0.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat10.xyz = floor(u_xlat10.xyz);
    u_xlat0.xyz = (-u_xlat10.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xxx + u_xlat0.xyz;
    u_xlat2.x = float(0.0);
    u_xlat2.z = float(1.0);
    u_xlat2.y = u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2.xyz = floor(u_xlat2.xyz);
    u_xlat0.xyz = (-u_xlat2.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat2.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = floor(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat2.xyz);
    u_xlat0.xyz = abs(u_xlat0.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat5.x = dot(u_xlat17.xy, u_xlat17.xy);
    u_xlat6 = u_xlat17.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.xy = u_xlat3.zw + u_xlat6.xy;
    u_xlat5.y = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat5.z = dot(u_xlat6.zw, u_xlat6.zw);
    u_xlat3.xyz = (-u_xlat5.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz;
    u_xlat0.x = u_xlat17.y * u_xlat0.x;
    u_xlat8.xy = u_xlat0.yz * u_xlat6.yw;
    u_xlat4.yz = u_xlat2.yz * u_xlat6.xz + u_xlat8.xy;
    u_xlat4.x = u_xlat2.x * u_xlat17.x + u_xlat0.x;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat0.xy = u_xlat0.xx + u_xlat1.xy;
    u_xlat16_0 = texture(_MaskDistortionMap, u_xlat0.xy).x;
    u_xlat16_7 = u_xlat16_0 * 2.0 + -2.0;
    u_xlat0.x = u_xlat16_7 * vs_TEXCOORD0.y;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_MaskDistPower, _MaskDistPower)) + vs_TEXCOORD0.xy;
    u_xlat16.xy = _Time.yy * _AlphaTxPan.xy;
    u_xlat16.xy = vs_TEXCOORD0.xy * vec2(_AlphaTxTile.x, _AlphaTxTile.y) + u_xlat16.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_EnableFunkyDistortion));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_EnableFunkyDistortion);
#endif
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat0.xy : u_xlat16.xy;
    u_xlat16_0 = texture(_AlphaTxMask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _AlphaIntensityOverall;
    u_xlat0.w = u_xlat0.x * vs_COLOR0.w;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat25 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat1.xyz = vec3(u_xlat25) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelScale;
    u_xlat1 = u_xlat1.xxxx * _FresnelColor;
    u_xlat2.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat2.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_DiffuseTex, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat3.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat3.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_SecondaryTx, u_xlat3.xy).xyz;
    u_xlat0.xyz = vec3(vec3(_SecondaryTxIntensity, _SecondaryTxIntensity, _SecondaryTxIntensity)) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat0 = vs_COLOR0 * u_xlat0 + u_xlat1;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
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
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4.w = 0.0;
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
uniform 	vec4 _ZBufferParams;
uniform 	float _InvFade;
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _EnableFunkyDistortion;
uniform 	vec2 _AlphaTxTile;
uniform 	vec2 _AlphaTxPan;
uniform 	vec2 _MaskTxPan;
uniform 	float _MaskDistortNoise;
uniform 	float _MaskDistPower;
uniform 	float _AlphaIntensityOverall;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	vec4 _FresnelColor;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(2) uniform mediump sampler2D _DiffuseTex;
UNITY_LOCATION(3) uniform mediump sampler2D _MaskDistortionMap;
UNITY_LOCATION(4) uniform mediump sampler2D _AlphaTxMask;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
mediump float u_xlat16_7;
vec2 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat16;
vec2 u_xlat17;
vec2 u_xlat18;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
void main()
{
    u_xlat0.x = float(0.0);
    u_xlat0.z = float(1.0);
    u_xlat1.xy = _Time.yy * vec2(_MaskTxPan.x, _MaskTxPan.y) + vs_TEXCOORD0.xy;
    u_xlat17.xy = u_xlat1.xy * vec2(_MaskDistortNoise);
    u_xlat24 = dot(u_xlat17.xy, vec2(0.366025418, 0.366025418));
    u_xlat17.xy = u_xlat1.xy * vec2(_MaskDistortNoise) + vec2(u_xlat24);
    u_xlat17.xy = floor(u_xlat17.xy);
    u_xlat2.xy = u_xlat17.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat2.xy = floor(u_xlat2.xy);
    u_xlat2.xy = (-u_xlat2.xy) * vec2(289.0, 289.0) + u_xlat17.xy;
    u_xlat18.xy = u_xlat1.xy * vec2(_MaskDistortNoise) + (-u_xlat17.xy);
    u_xlat24 = dot(u_xlat17.xy, vec2(0.211324871, 0.211324871));
    u_xlat17.xy = vec2(u_xlat24) + u_xlat18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat17.y<u_xlat17.x);
#else
    u_xlatb24 = u_xlat17.y<u_xlat17.x;
#endif
    u_xlat3 = (bool(u_xlatb24)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat0.y = u_xlat3.y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.yyy;
    u_xlat10.xyz = u_xlat0.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat0.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat10.xyz = floor(u_xlat10.xyz);
    u_xlat0.xyz = (-u_xlat10.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xxx + u_xlat0.xyz;
    u_xlat2.x = float(0.0);
    u_xlat2.z = float(1.0);
    u_xlat2.y = u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat2.xyz = floor(u_xlat2.xyz);
    u_xlat0.xyz = (-u_xlat2.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat2.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = floor(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-u_xlat2.xyz);
    u_xlat0.xyz = abs(u_xlat0.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat2.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat5.x = dot(u_xlat17.xy, u_xlat17.xy);
    u_xlat6 = u_xlat17.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.xy = u_xlat3.zw + u_xlat6.xy;
    u_xlat5.y = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat5.z = dot(u_xlat6.zw, u_xlat6.zw);
    u_xlat3.xyz = (-u_xlat5.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz;
    u_xlat0.x = u_xlat17.y * u_xlat0.x;
    u_xlat8.xy = u_xlat0.yz * u_xlat6.yw;
    u_xlat4.yz = u_xlat2.yz * u_xlat6.xz + u_xlat8.xy;
    u_xlat4.x = u_xlat2.x * u_xlat17.x + u_xlat0.x;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat0.xy = u_xlat0.xx + u_xlat1.xy;
    u_xlat16_0 = texture(_MaskDistortionMap, u_xlat0.xy).x;
    u_xlat16_7 = u_xlat16_0 * 2.0 + -2.0;
    u_xlat0.x = u_xlat16_7 * vs_TEXCOORD0.y;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_MaskDistPower, _MaskDistPower)) + vs_TEXCOORD0.xy;
    u_xlat16.xy = _Time.yy * _AlphaTxPan.xy;
    u_xlat16.xy = vs_TEXCOORD0.xy * vec2(_AlphaTxTile.x, _AlphaTxTile.y) + u_xlat16.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_EnableFunkyDistortion));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_EnableFunkyDistortion);
#endif
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat0.xy : u_xlat16.xy;
    u_xlat16_0 = texture(_AlphaTxMask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _AlphaIntensityOverall;
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
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat0.w = u_xlat8.x * u_xlat0.x;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat25 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat1.xyz = vec3(u_xlat25) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelScale;
    u_xlat9.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat9.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat9.xy;
    u_xlat16_9.xyz = texture(_DiffuseTex, u_xlat9.xy).xyz;
    u_xlat9.xyz = u_xlat16_9.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat2.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_SecondaryTx, u_xlat2.xy).xyz;
    u_xlat9.xyz = vec3(vec3(_SecondaryTxIntensity, _SecondaryTxIntensity, _SecondaryTxIntensity)) * u_xlat16_2.xyz + u_xlat9.xyz;
    u_xlat0.xyz = u_xlat9.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat1.xxxx * _FresnelColor + u_xlat0;
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