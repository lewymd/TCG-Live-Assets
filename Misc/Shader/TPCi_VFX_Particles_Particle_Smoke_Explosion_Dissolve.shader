//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Particles/Particle_Smoke_Explosion_Dissolve" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
_SmokeTexture ("Smoke Texture", 2D) = "white" { }
_EmissiveChannelIntensity ("Emissive Channel Intensity", Float) = 1
_Texture0 ("Texture 0", 2D) = "white" { }
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
  GpuProgramID 9409
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
uniform 	vec4 _SmokeTexture_ST;
uniform 	float _EmissiveChannelIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _SmokeTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _Texture0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_2;
float u_xlat4;
float u_xlat6;
float u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.x + 0.330000013;
    u_xlat6 = min(u_xlat6, 1.0);
    u_xlat6 = (-u_xlat0.x) + u_xlat6;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.xy = vs_TEXCOORD0.xy * _SmokeTexture_ST.xy + _SmokeTexture_ST.zw;
    u_xlat16_1 = texture(_SmokeTexture, u_xlat1.xy);
    u_xlat9 = (-u_xlat0.x) + u_xlat16_1.y;
    u_xlat6 = u_xlat6 * u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat6 * -2.0 + 3.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = min(u_xlat6, 1.0);
    u_xlat4 = (-vs_COLOR0.w) + 1.14999998;
#ifdef UNITY_ADRENO_ES3
    u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
    u_xlat16_2 = (-vs_COLOR0.w) + 1.0;
    u_xlat4 = u_xlat4 + (-u_xlat16_2);
    u_xlat7 = u_xlat16_1.z + (-u_xlat16_2);
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat4 * -2.0 + 3.0;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat9 = u_xlat7 * u_xlat4 + u_xlat9;
    u_xlat9 = min(u_xlat9, 1.0);
    u_xlat2.w = u_xlat16_1.w * u_xlat9;
    u_xlat0.y = 0.0;
    u_xlat16_0.xyw = texture(_Texture0, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyw * vec3(u_xlat6);
    u_xlat9 = max(vs_TEXCOORD0.w, 0.0);
    u_xlat9 = min(u_xlat9, 100.0);
    u_xlat9 = u_xlat9 * _EmissiveChannelIntensity;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _SmokeTexture_ST;
uniform 	float _EmissiveChannelIntensity;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _SmokeTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _Texture0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat4;
float u_xlat8;
float u_xlat12;
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
    u_xlat4.x = (-vs_COLOR0.w) * u_xlat0.x + 1.14999998;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_1 = (-vs_COLOR0.w) * u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat4.x + (-u_xlat16_1);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat4.xy = vs_TEXCOORD0.xy * _SmokeTexture_ST.xy + _SmokeTexture_ST.zw;
    u_xlat16_2 = texture(_SmokeTexture, u_xlat4.xy);
    u_xlat4.x = (-u_xlat16_1) + u_xlat16_2.z;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat3.x = vs_TEXCOORD0.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat8 = u_xlat3.x + 0.330000013;
    u_xlat8 = min(u_xlat8, 1.0);
    u_xlat8 = (-u_xlat3.x) + u_xlat8;
    u_xlat8 = float(1.0) / u_xlat8;
    u_xlat12 = u_xlat16_2.y + (-u_xlat3.x);
    u_xlat0.z = u_xlat8 * u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.z = min(max(u_xlat0.z, 0.0), 1.0);
#else
    u_xlat0.z = clamp(u_xlat0.z, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat0.z * -2.0 + 3.0;
    u_xlat0.xz = u_xlat0.xz * u_xlat0.xz;
    u_xlat8 = u_xlat0.z * u_xlat12;
    u_xlat12 = min(u_xlat8, 1.0);
    u_xlat0.x = u_xlat4.x * u_xlat0.x + u_xlat12;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat1.w = u_xlat16_2.w * u_xlat0.x;
    u_xlat3.y = 0.0;
    u_xlat16_0.xyw = texture(_Texture0, u_xlat3.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyw * vec3(u_xlat8);
    u_xlat12 = max(vs_TEXCOORD0.w, 0.0);
    u_xlat12 = min(u_xlat12, 100.0);
    u_xlat12 = u_xlat12 * _EmissiveChannelIntensity;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.xyz * u_xlat16_2.xxx + u_xlat0.xyz;
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