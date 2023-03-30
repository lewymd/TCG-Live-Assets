//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Particles/S_Particle_Premult_Blend_Glow" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
_MainTexture ("Main Texture", 2D) = "white" { }
_AlphaMask ("Alpha Mask", 2D) = "white" { }
_Brightness ("Brightness", Range(-5, 5)) = 1
_AlphaBrightness ("Alpha Brightness", Range(0, 5)) = 1
_TintLow ("Tint Low", Color) = (0,0.2424395,0.754717,0)
_AlphaContrast ("Alpha Contrast", Range(-1, 2)) = 2
_texcoord ("", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend One OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 13454
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
uniform 	float _AlphaContrast;
uniform 	vec4 _MainTexture_ST;
uniform 	vec4 _AlphaMask_ST;
uniform 	float _AlphaBrightness;
uniform 	vec4 _TintLow;
uniform 	float _Brightness;
UNITY_LOCATION(0) uniform mediump sampler2D _AlphaMask;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTexture;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat16_0 = texture(_AlphaMask, u_xlat0.xy);
    u_xlat1.w = u_xlat16_0.w;
    u_xlat1.x = _AlphaBrightness;
    u_xlat0 = u_xlat16_0 * u_xlat1.xxxw;
    u_xlat2 = u_xlat1.wwwx * u_xlat0;
    u_xlat3.xyz = _TintLow.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat0 * u_xlat1.wwwx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat2;
    u_xlat0 = u_xlat3 * u_xlat1 + u_xlat0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTexture_ST.xy + _MainTexture_ST.zw;
    u_xlat16_2 = texture(_MainTexture, u_xlat2.xy);
    u_xlat1 = u_xlat1 * u_xlat16_2;
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat2.xy = vec2(vec2(_AlphaContrast, _AlphaContrast)) * vec2(1.0, -0.5) + vec2(0.0, 0.5);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.xw);
    u_xlat1.y = dot(u_xlat2.xy, u_xlat1.yw);
    u_xlat1.z = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0 = u_xlat0 * vec4(_Brightness) + u_xlat1;
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
uniform 	vec4 _ZBufferParams;
uniform 	float _InvFade;
uniform 	float _AlphaContrast;
uniform 	vec4 _MainTexture_ST;
uniform 	vec4 _AlphaMask_ST;
uniform 	float _AlphaBrightness;
uniform 	vec4 _TintLow;
uniform 	float _Brightness;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaMask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTexture;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
    u_xlat0.x = u_xlat0.x * _InvFade;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat5.xy = vs_TEXCOORD0.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat16_1 = texture(_AlphaMask, u_xlat5.xy);
    u_xlat2.w = u_xlat16_1.w;
    u_xlat2.x = _AlphaBrightness;
    u_xlat1 = u_xlat16_1 * u_xlat2.xxxw;
    u_xlat3 = u_xlat2.wwwx * u_xlat1;
    u_xlat4.xyz = _TintLow.xyz;
    u_xlat4.w = 0.0;
    u_xlat1 = u_xlat1 * u_xlat2.wwwx + u_xlat4;
    u_xlat2 = u_xlat1 * u_xlat3;
    u_xlat1 = u_xlat4 * u_xlat2 + u_xlat1;
    u_xlat5.xy = vs_TEXCOORD0.xy * _MainTexture_ST.xy + _MainTexture_ST.zw;
    u_xlat16_3 = texture(_MainTexture, u_xlat5.xy);
    u_xlat2 = u_xlat2 * u_xlat16_3;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat0.w = u_xlat0.x * u_xlat1.w;
    u_xlat0.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
    u_xlat1.xy = vec2(vec2(_AlphaContrast, _AlphaContrast)) * vec2(1.0, -0.5) + vec2(0.0, 0.5);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat2.xw);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat2.yw);
    u_xlat2.z = dot(u_xlat1.xy, u_xlat2.zw);
    u_xlat0 = u_xlat0 * vec4(_Brightness) + u_xlat2;
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