//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/Center_RT_Grassy_Plains" {
Properties {
_GrassColor ("Grass Color", Color) = (0.2313726,0.9607843,0.4627451,0)
_FresnelPower ("Fresnel Power", Float) = 1
_FresnelColor ("Fresnel Color", Color) = (0.9386792,1,0.9581304,0)
_FresnelScale ("Fresnel Scale", Float) = 0.14
_FresnelBias ("Fresnel Bias", Float) = -0.04
_GrassTexture ("Grass Texture", 2D) = "white" { }
_GrassTextureTiling ("Grass Texture Tiling", Vector) = (2,2,0,0)
_GrassTilingRotation ("Grass Tiling Rotation", Float) = 45
_CameraDepthFadeLength ("Camera Depth Fade Length", Float) = 1
_CameraDepthOffset ("Camera Depth Offset", Float) = 0
_fresnelGrassTexture ("fresnel Grass Texture", Float) = 2
_CameraDepthFadeAmount ("Camera Depth Fade Amount", Range(0, 1)) = 1
_GrassColorMultiplier ("Grass Color Multiplier", Color) = (1,1,1,0)
_DistortionTexture ("Distortion Texture", 2D) = "white" { }
_GustsTexture ("Gusts Texture", 2D) = "white" { }
_GustDistortionTiling ("Gust Distortion Tiling", Vector) = (-1,1,0,0)
_DistortionTiling ("Distortion Tiling", Vector) = (-1,1,0,0)
_DistortionOffset ("Distortion Offset", Vector) = (0,0,0,0)
_GustDistortionOffset ("Gust Distortion Offset", Vector) = (0,0,0,0)
_GrassWavyAmount ("Grass Wavy Amount", Float) = 0.05
_GrassGustsIntensity ("Grass Gusts Intensity", Float) = 0.05
_GustDistortionPanning ("Gust Distortion Panning", Vector) = (-0.1,-0.1,0,0)
_DistortionPanning ("Distortion Panning", Vector) = (-0.1,-0.1,0,0)
_GustsMask ("Gusts Mask", 2D) = "white" { }
_GustsMaskOffset ("Gusts Mask Offset", Vector) = (0,0,0,0)
_GustsMaskTiling ("Gusts Mask Tiling", Vector) = (1,1,0,0)
_GustsMaskPanning ("Gusts Mask Panning", Vector) = (0,0,0,0)
_GustsMaskPower ("Gusts Mask Power", Float) = 2.05
[Toggle(_DEPTHTEST_ON)] _DepthTest ("Depth Test", Float) = 0
_CloudShadows ("CloudShadows", 2D) = "white" { }
_CloudShadowColor ("Cloud Shadow Color", Color) = (0.3183517,0.9245283,0.9019508,0)
_CloudShadowTiling ("Cloud Shadow Tiling", Vector) = (1,1,0,0)
_CloudShadowOffset ("Cloud Shadow Offset", Vector) = (0,0,0,0)
_CloudShadowPanning ("Cloud Shadow Panning", Vector) = (0.1,-0.1,0,0)
_CloudShadowDistanceTiling ("Cloud Shadow Distance Tiling", Vector) = (2,2,0,0)
_CloudShadowDistanceOffset ("Cloud Shadow Distance Offset", Vector) = (0,0,0,0)
_CloudShadowDistanceSpeed ("Cloud Shadow Distance Speed", Vector) = (0.01,-0.005,0,0)
_GustsHighlightPower ("Gusts Highlight Power", Float) = 1
_GustsHighlightColor ("Gusts Highlight Color", Color) = (0.7173371,0.9811321,0.9075927,0)
_GustsHighlightIntensity ("Gusts Highlight Intensity", Float) = 1
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 14448
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
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
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    vs_TEXCOORD3 = (-u_xlat0.x);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec2 _GrassTextureTiling;
uniform 	vec2 _DistortionPanning;
uniform 	vec2 _DistortionTiling;
uniform 	vec2 _DistortionOffset;
uniform 	float _GrassWavyAmount;
uniform 	vec2 _GustDistortionPanning;
uniform 	vec2 _GustDistortionTiling;
uniform 	vec2 _GustDistortionOffset;
uniform 	float _GrassGustsIntensity;
uniform 	vec2 _GustsMaskPanning;
uniform 	vec2 _GustsMaskTiling;
uniform 	vec2 _GustsMaskOffset;
uniform 	float _GustsMaskPower;
uniform 	float _GrassTilingRotation;
uniform 	vec4 _GrassColorMultiplier;
uniform 	vec4 _GrassColor;
uniform 	float _CameraDepthFadeLength;
uniform 	float _CameraDepthOffset;
uniform 	float _CameraDepthFadeAmount;
uniform 	vec4 _CloudShadowColor;
uniform 	vec2 _CloudShadowPanning;
uniform 	vec2 _CloudShadowTiling;
uniform 	vec2 _CloudShadowOffset;
uniform 	vec2 _CloudShadowDistanceSpeed;
uniform 	vec2 _CloudShadowDistanceTiling;
uniform 	vec2 _CloudShadowDistanceOffset;
uniform 	float _GustsHighlightPower;
uniform 	vec4 _GustsHighlightColor;
uniform 	float _GustsHighlightIntensity;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelBias;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	float _fresnelGrassTexture;
UNITY_LOCATION(0) uniform mediump sampler2D _GustsMask;
UNITY_LOCATION(1) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _GustsTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GrassTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _CloudShadows;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec2 u_xlat12;
mediump vec2 u_xlat16_12;
float u_xlat19;
float u_xlat20;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _GustDistortionTiling.xy + vec2(_GustDistortionOffset.x, _GustDistortionOffset.y);
    u_xlat0.xy = _Time.yy * vec2(_GustDistortionPanning.x, _GustDistortionPanning.y) + u_xlat0.xy;
    u_xlat16_0.xy = texture(_GustsTexture, u_xlat0.xy).xy;
    u_xlat12.xy = vs_TEXCOORD0.xy * _DistortionTiling.xy + vec2(_DistortionOffset.x, _DistortionOffset.y);
    u_xlat12.xy = _Time.yy * vec2(_DistortionPanning.x, _DistortionPanning.y) + u_xlat12.xy;
    u_xlat16_12.xy = texture(_DistortionTexture, u_xlat12.xy).xy;
    u_xlat12.xy = u_xlat16_12.xy * vec2(_GrassWavyAmount);
    u_xlat0.xy = u_xlat16_0.xy * vec2(_GrassGustsIntensity) + (-u_xlat12.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _GustsMaskTiling.xx + vec2(_GustsMaskOffset.x, _GustsMaskOffset.y);
    u_xlat1.xy = _Time.yy * vec2(_GustsMaskPanning.x, _GustsMaskPanning.y) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_GustsMask, u_xlat1.xy).xyz;
    u_xlat2.xy = log2(u_xlat16_1.xy);
    u_xlat1.xyz = log2(u_xlat16_1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_GustsHighlightPower);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * _GustsHighlightColor.xyz;
    u_xlat2.xy = u_xlat2.xy * vec2(_GustsMaskPower);
    u_xlat2.xy = exp2(u_xlat2.xy);
    u_xlat0.xy = u_xlat2.xy * u_xlat0.xy + u_xlat12.xy;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GrassTextureTiling.xy + u_xlat0.xy;
    u_xlat12.x = _GrassTilingRotation * 0.0174532924;
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3.x = cos(u_xlat12.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat16_0 = texture(_GrassTexture, u_xlat2.xy);
    u_xlat2.xyz = u_xlat16_0.xyz * _GrassColorMultiplier.xyz;
    u_xlat3.xyz = (-u_xlat16_0.xyz) * _GrassColorMultiplier.xyz + _GrassColor.xyz;
    u_xlat19 = vs_TEXCOORD3 + (-_ProjectionParams.y);
    u_xlat19 = u_xlat19 + (-_CameraDepthOffset);
    u_xlat19 = u_xlat19 / _CameraDepthFadeLength;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat20 = u_xlat19 * _CameraDepthFadeAmount;
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xyz * _CloudShadowColor.xyz + (-u_xlat2.xyz);
    u_xlat4.xy = vs_TEXCOORD0.xy * _CloudShadowDistanceTiling.xy + vec2(_CloudShadowDistanceOffset.x, _CloudShadowDistanceOffset.y);
    u_xlat4.xy = _Time.yy * vec2(_CloudShadowDistanceSpeed.x, _CloudShadowDistanceSpeed.y) + u_xlat4.xy;
    u_xlat16_4.xyz = texture(_CloudShadows, u_xlat4.xy).xyz;
    u_xlat5.xy = vs_TEXCOORD0.xy * vec2(_CloudShadowTiling.x, _CloudShadowTiling.y) + _CloudShadowOffset.xy;
    u_xlat5.xy = _Time.yy * _CloudShadowPanning.xy + u_xlat5.xy;
    u_xlat16_5.xyz = texture(_CloudShadows, u_xlat5.xy).xyz;
    u_xlat4.xyz = u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat19);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_GustsHighlightIntensity);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat16_0.www * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat0.x = u_xlat0.x * _fresnelGrassTexture;
    u_xlat6.xyz = (-u_xlat1.xyz) + _FresnelColor.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _FresnelPower;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = _FresnelScale * u_xlat19 + _FresnelBias;
    u_xlat0.x = u_xlat0.x * u_xlat19;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
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
    u_xlat0.x = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat0.x;
    vs_TEXCOORD3 = (-u_xlat0.x);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec2 _GrassTextureTiling;
uniform 	vec2 _DistortionPanning;
uniform 	vec2 _DistortionTiling;
uniform 	vec2 _DistortionOffset;
uniform 	float _GrassWavyAmount;
uniform 	vec2 _GustDistortionPanning;
uniform 	vec2 _GustDistortionTiling;
uniform 	vec2 _GustDistortionOffset;
uniform 	float _GrassGustsIntensity;
uniform 	vec2 _GustsMaskPanning;
uniform 	vec2 _GustsMaskTiling;
uniform 	vec2 _GustsMaskOffset;
uniform 	float _GustsMaskPower;
uniform 	float _GrassTilingRotation;
uniform 	vec4 _GrassColorMultiplier;
uniform 	vec4 _GrassColor;
uniform 	float _CameraDepthFadeLength;
uniform 	float _CameraDepthOffset;
uniform 	float _CameraDepthFadeAmount;
uniform 	vec4 _CloudShadowColor;
uniform 	vec2 _CloudShadowPanning;
uniform 	vec2 _CloudShadowTiling;
uniform 	vec2 _CloudShadowOffset;
uniform 	vec2 _CloudShadowDistanceSpeed;
uniform 	vec2 _CloudShadowDistanceTiling;
uniform 	vec2 _CloudShadowDistanceOffset;
uniform 	float _GustsHighlightPower;
uniform 	vec4 _GustsHighlightColor;
uniform 	float _GustsHighlightIntensity;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelBias;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	float _fresnelGrassTexture;
UNITY_LOCATION(0) uniform mediump sampler2D _GustsMask;
UNITY_LOCATION(1) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _GustsTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GrassTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _CloudShadows;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec2 u_xlat12;
mediump vec2 u_xlat16_12;
float u_xlat19;
float u_xlat20;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _GustDistortionTiling.xy + vec2(_GustDistortionOffset.x, _GustDistortionOffset.y);
    u_xlat0.xy = _Time.yy * vec2(_GustDistortionPanning.x, _GustDistortionPanning.y) + u_xlat0.xy;
    u_xlat16_0.xy = texture(_GustsTexture, u_xlat0.xy).xy;
    u_xlat12.xy = vs_TEXCOORD0.xy * _DistortionTiling.xy + vec2(_DistortionOffset.x, _DistortionOffset.y);
    u_xlat12.xy = _Time.yy * vec2(_DistortionPanning.x, _DistortionPanning.y) + u_xlat12.xy;
    u_xlat16_12.xy = texture(_DistortionTexture, u_xlat12.xy).xy;
    u_xlat12.xy = u_xlat16_12.xy * vec2(_GrassWavyAmount);
    u_xlat0.xy = u_xlat16_0.xy * vec2(_GrassGustsIntensity) + (-u_xlat12.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _GustsMaskTiling.xx + vec2(_GustsMaskOffset.x, _GustsMaskOffset.y);
    u_xlat1.xy = _Time.yy * vec2(_GustsMaskPanning.x, _GustsMaskPanning.y) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_GustsMask, u_xlat1.xy).xyz;
    u_xlat2.xy = log2(u_xlat16_1.xy);
    u_xlat1.xyz = log2(u_xlat16_1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_GustsHighlightPower);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * _GustsHighlightColor.xyz;
    u_xlat2.xy = u_xlat2.xy * vec2(_GustsMaskPower);
    u_xlat2.xy = exp2(u_xlat2.xy);
    u_xlat0.xy = u_xlat2.xy * u_xlat0.xy + u_xlat12.xy;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GrassTextureTiling.xy + u_xlat0.xy;
    u_xlat12.x = _GrassTilingRotation * 0.0174532924;
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3.x = cos(u_xlat12.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat16_0 = texture(_GrassTexture, u_xlat2.xy);
    u_xlat2.xyz = u_xlat16_0.xyz * _GrassColorMultiplier.xyz;
    u_xlat3.xyz = (-u_xlat16_0.xyz) * _GrassColorMultiplier.xyz + _GrassColor.xyz;
    u_xlat19 = vs_TEXCOORD3 + (-_ProjectionParams.y);
    u_xlat19 = u_xlat19 + (-_CameraDepthOffset);
    u_xlat19 = u_xlat19 / _CameraDepthFadeLength;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat20 = u_xlat19 * _CameraDepthFadeAmount;
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xyz * _CloudShadowColor.xyz + (-u_xlat2.xyz);
    u_xlat4.xy = vs_TEXCOORD0.xy * _CloudShadowDistanceTiling.xy + vec2(_CloudShadowDistanceOffset.x, _CloudShadowDistanceOffset.y);
    u_xlat4.xy = _Time.yy * vec2(_CloudShadowDistanceSpeed.x, _CloudShadowDistanceSpeed.y) + u_xlat4.xy;
    u_xlat16_4.xyz = texture(_CloudShadows, u_xlat4.xy).xyz;
    u_xlat5.xy = vs_TEXCOORD0.xy * vec2(_CloudShadowTiling.x, _CloudShadowTiling.y) + _CloudShadowOffset.xy;
    u_xlat5.xy = _Time.yy * _CloudShadowPanning.xy + u_xlat5.xy;
    u_xlat16_5.xyz = texture(_CloudShadows, u_xlat5.xy).xyz;
    u_xlat4.xyz = u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat19);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_GustsHighlightIntensity);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat16_0.www * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat0.x = u_xlat0.x * _fresnelGrassTexture;
    u_xlat6.xyz = (-u_xlat1.xyz) + _FresnelColor.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _FresnelPower;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = _FresnelScale * u_xlat19 + _FresnelBias;
    u_xlat0.x = u_xlat0.x * u_xlat19;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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