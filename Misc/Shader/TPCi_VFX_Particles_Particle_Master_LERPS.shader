//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Particles/Particle_Master_LERPS" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
_SpriteTextureDiffuse ("Sprite Texture (Diffuse)", 2D) = "white" { }
_AddWhiteToDiffuse1tomakediffusewhite ("Add White To Diffuse (1 to make diffuse white)", Range(0, 1)) = 1
_AddWhiteToAlpha1tomakeAlphawhiteUseifusinganotherdissolvetex ("Add White To Alpha (1 to make Alpha white - Use if using another dissolve tex)", Float) = 0
_DiffuseLightnessUsefultolowerlightnessofspriteifitswhite ("Diffuse Lightness (Useful to lower lightness of sprite if it's white)", Range(0, 1)) = 1
_TextureDesaturation ("Texture Desaturation", Range(0, 1)) = 0
_EmissiveProperties ("----------------Emissive Properties----------------", Float) = 1
_EmissiveIntensity ("Emissive Intensity", Float) = 1
_EmissiveDissolveThresholdMax ("Emissive Dissolve Threshold Max", Float) = 0.9
_EmissiveDissolveThresholdMin ("Emissive Dissolve Threshold Min", Float) = 0.4
_EmissiveMask ("Emissive Mask", 2D) = "white" { }
_EmissiveMaskTiling ("Emissive Mask Tiling", Vector) = (1,1,0,0)
_EmissiveMaskOffset ("Emissive Mask Offset", Vector) = (0,0,0,0)
_DissolveProperties ("----------------Dissolve Properties----------------", Float) = 1
_AlphaDissolveMask ("Alpha Dissolve Mask", 2D) = "white" { }
_AlphaDissolveAmount ("Alpha Dissolve Amount", Range(0, 1)) = 1
_AlphaDissolveMaskTiling ("Alpha Dissolve Mask Tiling", Vector) = (1,1,0,0)
_AlphaDissolveMaskOffset ("Alpha Dissolve Mask Offset", Vector) = (0,0,0,0)
_AlphaDissolveMaskPanSpeed ("Alpha Dissolve Mask Pan Speed", Vector) = (0,0,0,0)
_DissolveThresholdMax ("Dissolve Threshold Max", Float) = 1
_DissolveThresholdMin ("Dissolve Threshold Min", Float) = 0
_ParticleCameraOffset ("Particle Camera Offset", Float) = 0
_EmissiveColor ("Emissive Color", Color) = (1,0,0,0)
_DistortionProperties ("----------------Distortion Properties----------------", Float) = 1
_DistortionTexture ("Distortion Texture", 2D) = "white" { }
_DistortionTexturePanning ("Distortion Texture Panning", Vector) = (0,0,0,0)
_DistortionTextureTiling ("Distortion Texture Tiling", Vector) = (1,1,0,0)
_DistortionTextureOffset ("Distortion Texture Offset", Vector) = (0,0,0,0)
_DistortionAmount ("Distortion Amount", Float) = 0
_LERPDoesDiffuseHaveAlpha ("LERP - Does Diffuse Have Alpha", Range(0, 1)) = 0
_LERPControlDissolveWithCurve ("LERP - Control Dissolve With Curve", Range(0, 1)) = 0
_LERPAlphaDissolveMask0False1True ("LERP - Alpha Dissolve Mask - 0False 1True", Range(0, 1)) = 0
_LERPUseDissolveTexture ("LERP - Use Dissolve Texture", Range(0, 1)) = 0
_LERPControlalphawParticleVertAlpha ("LERP - Control alpha w Particle Vert Alpha", Range(0, 1)) = 0
_LERPAddEmissiveonTop ("LERP - Add Emissive on Top", Range(0, 1)) = 0
_LERPUseCustomEmissiveColor ("LERP - Use Custom Emissive Color", Range(0, 1)) = 0
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 62990
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
uniform 	float _ParticleCameraOffset;
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
    u_xlat0.xyz = vec3(vec3(_ParticleCameraOffset, _ParticleCameraOffset, _ParticleCameraOffset)) * u_xlat0.xyz + in_POSITION0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _EmissiveColor;
uniform 	float _LERPUseCustomEmissiveColor;
uniform 	float _EmissiveDissolveThresholdMin;
uniform 	float _EmissiveDissolveThresholdMax;
uniform 	vec2 _EmissiveMaskTiling;
uniform 	vec2 _EmissiveMaskOffset;
uniform 	vec2 _DistortionTexturePanning;
uniform 	vec2 _DistortionTextureTiling;
uniform 	vec2 _DistortionTextureOffset;
uniform 	float _DistortionProperties;
uniform 	float _DistortionAmount;
uniform 	float _EmissiveProperties;
uniform 	float _TextureDesaturation;
uniform 	float _AddWhiteToDiffuse1tomakediffusewhite;
uniform 	float _DiffuseLightnessUsefultolowerlightnessofspriteifitswhite;
uniform 	float _LERPAddEmissiveonTop;
uniform 	float _EmissiveIntensity;
uniform 	float _DissolveThresholdMin;
uniform 	float _DissolveThresholdMax;
uniform 	float _AddWhiteToAlpha1tomakeAlphawhiteUseifusinganotherdissolvetex;
uniform 	float _LERPDoesDiffuseHaveAlpha;
uniform 	float _LERPControlDissolveWithCurve;
uniform 	float _AlphaDissolveAmount;
uniform 	vec2 _AlphaDissolveMaskPanSpeed;
uniform 	vec2 _AlphaDissolveMaskTiling;
uniform 	vec2 _AlphaDissolveMaskOffset;
uniform 	float _LERPAlphaDissolveMask0False1True;
uniform 	float _LERPUseDissolveTexture;
uniform 	float _DissolveProperties;
uniform 	float _LERPControlalphawParticleVertAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissiveMask;
UNITY_LOCATION(2) uniform mediump sampler2D _SpriteTextureDiffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _AlphaDissolveMask;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
mediump vec2 u_xlat16_7;
vec2 u_xlat14;
mediump vec2 u_xlat16_14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _EmissiveMaskTiling.xy + vec2(_EmissiveMaskOffset.x, _EmissiveMaskOffset.y);
    u_xlat14.xy = vs_TEXCOORD0.xy * vec2(_DistortionTextureTiling.x, _DistortionTextureTiling.y) + _DistortionTextureOffset.xy;
    u_xlat14.xy = _Time.yy * _DistortionTexturePanning.xy + u_xlat14.xy;
    u_xlat16_14.xy = texture(_DistortionTexture, u_xlat14.xy).xy;
    u_xlat14.xy = u_xlat16_14.xy * vec2(vec2(_DistortionProperties, _DistortionProperties));
    u_xlat0.xy = u_xlat14.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + u_xlat0.xy;
    u_xlat16_1.xyz = texture(_EmissiveMask, u_xlat0.xy).xyz;
    u_xlat0.x = max(_EmissiveProperties, 1.0);
    u_xlat0.x = min(u_xlat0.x, 100000.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat7.x = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat1.xyz = (-u_xlat16_1.xyz) * u_xlat0.xxx + u_xlat7.xxx;
    u_xlat1.xyz = vec3(vec3(_TextureDesaturation, _TextureDesaturation, _TextureDesaturation)) * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-vec3(vec3(_EmissiveDissolveThresholdMin, _EmissiveDissolveThresholdMin, _EmissiveDissolveThresholdMin)));
    u_xlat0.x = (-_EmissiveDissolveThresholdMin) + _EmissiveDissolveThresholdMax;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = (-vs_COLOR0.xyz) + _EmissiveColor.xyz;
    u_xlat2.xyz = vec3(_LERPUseCustomEmissiveColor) * u_xlat2.xyz + vs_COLOR0.xyz;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD0.www;
    u_xlat0.xy = u_xlat14.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + vs_TEXCOORD0.xy;
    u_xlat16_4 = texture(_SpriteTextureDiffuse, u_xlat0.xy);
    u_xlat0.x = _DiffuseLightnessUsefultolowerlightnessofspriteifitswhite;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat7.x = dot(u_xlat5.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat6.xyz = (-u_xlat16_4.xyz) * u_xlat0.xxx + u_xlat7.xxx;
    u_xlat5.xyz = vec3(vec3(_TextureDesaturation, _TextureDesaturation, _TextureDesaturation)) * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + vec3(vec3(_AddWhiteToDiffuse1tomakediffusewhite, _AddWhiteToDiffuse1tomakediffusewhite, _AddWhiteToDiffuse1tomakediffusewhite));
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD0.www + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
    u_xlat1.xyz = vec3(_LERPAddEmissiveonTop) * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
    u_xlat0.x = max(_EmissiveIntensity, 0.0);
    u_xlat0.x = min(u_xlat0.x, 10000.0);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = u_xlat16_4.w + _AddWhiteToAlpha1tomakeAlphawhiteUseifusinganotherdissolvetex;
    u_xlat0.x = (-u_xlat16_4.x) + u_xlat0.x;
    u_xlat0.x = _LERPDoesDiffuseHaveAlpha * u_xlat0.x + u_xlat16_4.x;
    u_xlat2.xy = _Time.yy * _AlphaDissolveMaskPanSpeed.xy + vec2(_AlphaDissolveMaskTiling.x, _AlphaDissolveMaskTiling.y);
    u_xlat2.xy = vs_TEXCOORD0.xy * u_xlat2.xy + _AlphaDissolveMaskOffset.xy;
    u_xlat7.xy = u_xlat14.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + u_xlat2.xy;
    u_xlat16_7.xy = texture(_AlphaDissolveMask, u_xlat7.xy).xw;
    u_xlat7.x = u_xlat16_7.x * _AlphaDissolveAmount;
    u_xlat14.x = _AlphaDissolveAmount * u_xlat16_7.y + (-u_xlat7.x);
    u_xlat7.x = _LERPAlphaDissolveMask0False1True * u_xlat14.x + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + -1.0;
    u_xlat7.x = _LERPUseDissolveTexture * u_xlat7.x + 1.0;
    u_xlat7.x = u_xlat7.x * _DissolveProperties;
    u_xlat14.x = (-vs_COLOR0.w) + vs_TEXCOORD0.z;
    u_xlat14.x = _LERPControlDissolveWithCurve * u_xlat14.x + vs_COLOR0.w;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x + (-_DissolveThresholdMin);
    u_xlat7.x = (-_DissolveThresholdMin) + _DissolveThresholdMax;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * vs_COLOR0.w + (-u_xlat0.x);
    u_xlat1.w = _LERPControlalphawParticleVertAlpha * u_xlat7.x + u_xlat0.x;
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
uniform 	float _ParticleCameraOffset;
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
    u_xlat0.xyz = vec3(vec3(_ParticleCameraOffset, _ParticleCameraOffset, _ParticleCameraOffset)) * u_xlat0.xyz + in_POSITION0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _ZBufferParams;
uniform 	float _InvFade;
uniform 	vec4 _EmissiveColor;
uniform 	float _LERPUseCustomEmissiveColor;
uniform 	float _EmissiveDissolveThresholdMin;
uniform 	float _EmissiveDissolveThresholdMax;
uniform 	vec2 _EmissiveMaskTiling;
uniform 	vec2 _EmissiveMaskOffset;
uniform 	vec2 _DistortionTexturePanning;
uniform 	vec2 _DistortionTextureTiling;
uniform 	vec2 _DistortionTextureOffset;
uniform 	float _DistortionProperties;
uniform 	float _DistortionAmount;
uniform 	float _EmissiveProperties;
uniform 	float _TextureDesaturation;
uniform 	float _AddWhiteToDiffuse1tomakediffusewhite;
uniform 	float _DiffuseLightnessUsefultolowerlightnessofspriteifitswhite;
uniform 	float _LERPAddEmissiveonTop;
uniform 	float _EmissiveIntensity;
uniform 	float _DissolveThresholdMin;
uniform 	float _DissolveThresholdMax;
uniform 	float _AddWhiteToAlpha1tomakeAlphawhiteUseifusinganotherdissolvetex;
uniform 	float _LERPDoesDiffuseHaveAlpha;
uniform 	float _LERPControlDissolveWithCurve;
uniform 	float _AlphaDissolveAmount;
uniform 	vec2 _AlphaDissolveMaskPanSpeed;
uniform 	vec2 _AlphaDissolveMaskTiling;
uniform 	vec2 _AlphaDissolveMaskOffset;
uniform 	float _LERPAlphaDissolveMask0False1True;
uniform 	float _LERPUseDissolveTexture;
uniform 	float _DissolveProperties;
uniform 	float _LERPControlalphawParticleVertAlpha;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissiveMask;
UNITY_LOCATION(3) uniform mediump sampler2D _SpriteTextureDiffuse;
UNITY_LOCATION(4) uniform mediump sampler2D _AlphaDissolveMask;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_10;
vec2 u_xlat11;
float u_xlat15;
float u_xlat16;
float u_xlat17;
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
    u_xlat5 = (-vs_COLOR0.w) * u_xlat0.x + vs_TEXCOORD0.z;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat5 = _LERPControlDissolveWithCurve * u_xlat5 + u_xlat0.x;
    u_xlat10.xy = _Time.yy * _AlphaDissolveMaskPanSpeed.xy + vec2(_AlphaDissolveMaskTiling.x, _AlphaDissolveMaskTiling.y);
    u_xlat10.xy = vs_TEXCOORD0.xy * u_xlat10.xy + _AlphaDissolveMaskOffset.xy;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_DistortionTextureTiling.x, _DistortionTextureTiling.y) + _DistortionTextureOffset.xy;
    u_xlat1.xy = _Time.yy * _DistortionTexturePanning.xy + u_xlat1.xy;
    u_xlat16_1.xy = texture(_DistortionTexture, u_xlat1.xy).xy;
    u_xlat1.xy = u_xlat16_1.xy * vec2(vec2(_DistortionProperties, _DistortionProperties));
    u_xlat10.xy = u_xlat1.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + u_xlat10.xy;
    u_xlat16_10.xy = texture(_AlphaDissolveMask, u_xlat10.xy).xw;
    u_xlat10.x = u_xlat16_10.x * _AlphaDissolveAmount;
    u_xlat15 = _AlphaDissolveAmount * u_xlat16_10.y + (-u_xlat10.x);
    u_xlat10.x = _LERPAlphaDissolveMask0False1True * u_xlat15 + u_xlat10.x;
    u_xlat10.x = u_xlat10.x + -1.0;
    u_xlat10.x = _LERPUseDissolveTexture * u_xlat10.x + 1.0;
    u_xlat10.x = u_xlat10.x * _DissolveProperties;
    u_xlat5 = u_xlat10.x * u_xlat5;
    u_xlat10.xy = u_xlat1.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_SpriteTextureDiffuse, u_xlat10.xy);
    u_xlat10.x = u_xlat16_2.w + _AddWhiteToAlpha1tomakeAlphawhiteUseifusinganotherdissolvetex;
    u_xlat10.x = (-u_xlat16_2.x) + u_xlat10.x;
    u_xlat10.x = _LERPDoesDiffuseHaveAlpha * u_xlat10.x + u_xlat16_2.x;
    u_xlat5 = u_xlat10.x * u_xlat5 + (-_DissolveThresholdMin);
    u_xlat10.x = (-_DissolveThresholdMin) + _DissolveThresholdMax;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat5 = u_xlat10.x * u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat5 * -2.0 + 3.0;
    u_xlat5 = u_xlat5 * u_xlat5;
    u_xlat5 = u_xlat5 * u_xlat10.x;
    u_xlat0.x = u_xlat5 * u_xlat0.x + (-u_xlat5);
    u_xlat0.w = _LERPControlalphawParticleVertAlpha * u_xlat0.x + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.w = min(max(u_xlat0.w, 0.0), 1.0);
#else
    u_xlat0.w = clamp(u_xlat0.w, 0.0, 1.0);
#endif
    u_xlat11.xy = vs_TEXCOORD0.xy * _EmissiveMaskTiling.xy + vec2(_EmissiveMaskOffset.x, _EmissiveMaskOffset.y);
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_DistortionAmount, _DistortionAmount)) + u_xlat11.xy;
    u_xlat16_1.xyz = texture(_EmissiveMask, u_xlat1.xy).xyz;
    u_xlat16 = max(_EmissiveProperties, 1.0);
    u_xlat16 = min(u_xlat16, 100000.0);
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat16_1.xyz;
    u_xlat17 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat1.xyz = (-u_xlat16_1.xyz) * vec3(u_xlat16) + vec3(u_xlat17);
    u_xlat1.xyz = vec3(vec3(_TextureDesaturation, _TextureDesaturation, _TextureDesaturation)) * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-vec3(vec3(_EmissiveDissolveThresholdMin, _EmissiveDissolveThresholdMin, _EmissiveDissolveThresholdMin)));
    u_xlat16 = (-_EmissiveDissolveThresholdMin) + _EmissiveDissolveThresholdMax;
    u_xlat16 = float(1.0) / u_xlat16;
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
    u_xlat16 = _DiffuseLightnessUsefultolowerlightnessofspriteifitswhite;
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat16_2.xyz;
    u_xlat17 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat2.xyz = (-u_xlat16_2.xyz) * vec3(u_xlat16) + vec3(u_xlat17);
    u_xlat2.xyz = vec3(vec3(_TextureDesaturation, _TextureDesaturation, _TextureDesaturation)) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz + vec3(vec3(_AddWhiteToDiffuse1tomakediffusewhite, _AddWhiteToDiffuse1tomakediffusewhite, _AddWhiteToDiffuse1tomakediffusewhite));
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat3.xyz = (-vs_COLOR0.xyz) + _EmissiveColor.xyz;
    u_xlat3.xyz = vec3(_LERPUseCustomEmissiveColor) * u_xlat3.xyz + vs_COLOR0.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD0.www;
    u_xlat3.xyz = u_xlat3.xyz * vs_TEXCOORD0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat1.xyz = (-u_xlat3.xyz) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(_LERPAddEmissiveonTop) * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
    u_xlat16 = max(_EmissiveIntensity, 0.0);
    u_xlat16 = min(u_xlat16, 10000.0);
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat1.xyz;
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