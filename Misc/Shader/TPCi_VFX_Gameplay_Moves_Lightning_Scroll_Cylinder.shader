//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Gameplay/Moves/Lightning_Scroll_Cylinder" {
Properties {
_LightningScrollTexture ("Lightning Scroll Texture", 2D) = "white" { }
_Brightness ("Brightness", Float) = 1
_LightningScroll1Tiling ("Lightning Scroll 1 Tiling", Vector) = (1,1,0,0)
_LightningScroll2Tiling ("Lightning Scroll 2 Tiling", Vector) = (1,1,0,0)
_LightningScroll1Offset ("Lightning Scroll 1 Offset", Vector) = (0,0,0,0)
_LightningScroll2Offset ("Lightning Scroll 2 Offset", Vector) = (0,0,0,0)
_LightningScroll1Panner ("Lightning Scroll 1 Panner", Vector) = (0,0,0,0)
_LightningScroll2Panner ("Lightning Scroll 2 Panner", Vector) = (0,0,0,0)
_ScrollGradient ("Scroll Gradient", 2D) = "white" { }
_OpacityGradientOffset ("Opacity Gradient Offset", Vector) = (0,1,0,0)
_Lightningcolor ("Lightning color", Color) = (1,1,1,0)
_power ("power", Float) = 1
_LightningDistortion ("Lightning Distortion", 2D) = "white" { }
_Distortion1Panner ("Distortion 1 Panner", Vector) = (0,0,0,0)
_Distortion1Tiling ("Distortion 1 Tiling", Vector) = (1,1,0,0)
_Distortion1Amount ("Distortion 1 Amount", Float) = 0.05
_Distortion1Offset ("Distortion 1 Offset", Vector) = (0,0,0,0)
_Distortion2Tiling ("Distortion 2 Tiling", Vector) = (1,1,0,0)
_Distortion2Offset ("Distortion 2 Offset", Vector) = (0,0,0,0)
_Distortion2Panner ("Distortion 2 Panner", Vector) = (0,0,0,0)
_Distortion2Amount ("Distortion 2 Amount", Float) = 0.05
_TextureSample3 ("Texture Sample 3", 2D) = "white" { }
_maskmult ("mask mult", Float) = 1
_Lightning2 ("Lightning 2", 2D) = "white" { }
_texcoord ("", 2D) = "white" { }
_tex4coord ("", 2D) = "white" { }
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
  GpuProgramID 53105
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
uniform 	vec4 _tex4coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _tex4coord_ST.xy + _tex4coord_ST.zw;
    vs_TEXCOORD1.zw = in_TEXCOORD0.zw;
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
uniform 	float _Brightness;
uniform 	vec4 _Lightningcolor;
uniform 	vec2 _LightningScroll1Panner;
uniform 	vec2 _Distortion1Panner;
uniform 	vec2 _Distortion1Tiling;
uniform 	vec2 _Distortion1Offset;
uniform 	float _Distortion1Amount;
uniform 	vec2 _LightningScroll1Tiling;
uniform 	vec2 _LightningScroll1Offset;
uniform 	vec2 _LightningScroll2Panner;
uniform 	vec2 _LightningScroll2Tiling;
uniform 	vec2 _LightningScroll2Offset;
uniform 	vec2 _Distortion2Panner;
uniform 	vec2 _Distortion2Tiling;
uniform 	vec2 _Distortion2Offset;
uniform 	float _Distortion2Amount;
uniform 	float _power;
uniform 	vec2 _OpacityGradientOffset;
uniform 	vec4 _LightningScrollTexture_ST;
uniform 	vec4 _TextureSample3_ST;
uniform 	float _maskmult;
UNITY_LOCATION(0) uniform mediump sampler2D _LightningDistortion;
UNITY_LOCATION(1) uniform mediump sampler2D _LightningScrollTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _Lightning2;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureSample3;
UNITY_LOCATION(4) uniform mediump sampler2D _ScrollGradient;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
mediump float u_xlat16_6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Distortion1Tiling.xy + vec2(_Distortion1Offset.x, _Distortion1Offset.y);
    u_xlat0.xy = _Time.yy * vec2(_Distortion1Panner.x, _Distortion1Panner.y) + u_xlat0.xy;
    u_xlat16_0.xy = texture(_LightningDistortion, u_xlat0.xy).xy;
    u_xlat4.xy = vs_TEXCOORD0.xy * vec2(_LightningScroll1Tiling.x, _LightningScroll1Tiling.y) + _LightningScroll1Offset.xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(_Distortion1Amount) + u_xlat4.xy;
    u_xlat0.xy = _Time.yy * _LightningScroll1Panner.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_LightningScrollTexture, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_Distortion2Tiling.x, _Distortion2Tiling.y) + _Distortion2Offset.xy;
    u_xlat1.xy = _Time.yy * _Distortion2Panner.xy + u_xlat1.xy;
    u_xlat16_1.xy = texture(_LightningDistortion, u_xlat1.xy).xy;
    u_xlat5.xy = vs_TEXCOORD0.xy * _LightningScroll2Tiling.xy + vec2(_LightningScroll2Offset.x, _LightningScroll2Offset.y);
    u_xlat1.xy = u_xlat16_1.xy * vec2(vec2(_Distortion2Amount, _Distortion2Amount)) + u_xlat5.xy;
    u_xlat1.xy = _Time.yy * vec2(_LightningScroll2Panner.x, _LightningScroll2Panner.y) + u_xlat1.xy;
    u_xlat16_6 = texture(_Lightning2, u_xlat1.xy).w;
    u_xlat0.xyz = vec3(u_xlat16_6) + u_xlat16_0.xyz;
    u_xlat1.xyz = log2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_power, _power, _power));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.x = vs_TEXCOORD0.x + _OpacityGradientOffset.x;
    u_xlat1.y = _OpacityGradientOffset.y * vs_TEXCOORD1.w + vs_TEXCOORD0.y;
    u_xlat16_6 = texture(_ScrollGradient, u_xlat1.xy).x;
    u_xlat6 = u_xlat16_6 * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xyz * _Lightningcolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Brightness);
    u_xlat1.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _LightningScrollTexture_ST.xy + _LightningScrollTexture_ST.zw;
    u_xlat16_0.x = texture(_LightningScrollTexture, u_xlat0.xy).w;
    u_xlat0.x = u_xlat16_0.x * u_xlat6;
    u_xlat2.xy = vs_TEXCOORD0.xy * _TextureSample3_ST.xy + _TextureSample3_ST.zw;
    u_xlat16_2 = texture(_TextureSample3, u_xlat2.xy).x;
    u_xlat2.x = u_xlat16_2 * _maskmult;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _tex4coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _tex4coord_ST.xy + _tex4coord_ST.zw;
    vs_TEXCOORD1.zw = in_TEXCOORD0.zw;
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
uniform 	float _Brightness;
uniform 	vec4 _Lightningcolor;
uniform 	vec2 _LightningScroll1Panner;
uniform 	vec2 _Distortion1Panner;
uniform 	vec2 _Distortion1Tiling;
uniform 	vec2 _Distortion1Offset;
uniform 	float _Distortion1Amount;
uniform 	vec2 _LightningScroll1Tiling;
uniform 	vec2 _LightningScroll1Offset;
uniform 	vec2 _LightningScroll2Panner;
uniform 	vec2 _LightningScroll2Tiling;
uniform 	vec2 _LightningScroll2Offset;
uniform 	vec2 _Distortion2Panner;
uniform 	vec2 _Distortion2Tiling;
uniform 	vec2 _Distortion2Offset;
uniform 	float _Distortion2Amount;
uniform 	float _power;
uniform 	vec2 _OpacityGradientOffset;
uniform 	vec4 _LightningScrollTexture_ST;
uniform 	vec4 _TextureSample3_ST;
uniform 	float _maskmult;
UNITY_LOCATION(0) uniform mediump sampler2D _LightningDistortion;
UNITY_LOCATION(1) uniform mediump sampler2D _LightningScrollTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _Lightning2;
UNITY_LOCATION(3) uniform mediump sampler2D _TextureSample3;
UNITY_LOCATION(4) uniform mediump sampler2D _ScrollGradient;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
mediump float u_xlat16_6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Distortion1Tiling.xy + vec2(_Distortion1Offset.x, _Distortion1Offset.y);
    u_xlat0.xy = _Time.yy * vec2(_Distortion1Panner.x, _Distortion1Panner.y) + u_xlat0.xy;
    u_xlat16_0.xy = texture(_LightningDistortion, u_xlat0.xy).xy;
    u_xlat4.xy = vs_TEXCOORD0.xy * vec2(_LightningScroll1Tiling.x, _LightningScroll1Tiling.y) + _LightningScroll1Offset.xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(_Distortion1Amount) + u_xlat4.xy;
    u_xlat0.xy = _Time.yy * _LightningScroll1Panner.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_LightningScrollTexture, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_Distortion2Tiling.x, _Distortion2Tiling.y) + _Distortion2Offset.xy;
    u_xlat1.xy = _Time.yy * _Distortion2Panner.xy + u_xlat1.xy;
    u_xlat16_1.xy = texture(_LightningDistortion, u_xlat1.xy).xy;
    u_xlat5.xy = vs_TEXCOORD0.xy * _LightningScroll2Tiling.xy + vec2(_LightningScroll2Offset.x, _LightningScroll2Offset.y);
    u_xlat1.xy = u_xlat16_1.xy * vec2(vec2(_Distortion2Amount, _Distortion2Amount)) + u_xlat5.xy;
    u_xlat1.xy = _Time.yy * vec2(_LightningScroll2Panner.x, _LightningScroll2Panner.y) + u_xlat1.xy;
    u_xlat16_6 = texture(_Lightning2, u_xlat1.xy).w;
    u_xlat0.xyz = vec3(u_xlat16_6) + u_xlat16_0.xyz;
    u_xlat1.xyz = log2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_power, _power, _power));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = min(u_xlat1.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.x = vs_TEXCOORD0.x + _OpacityGradientOffset.x;
    u_xlat1.y = _OpacityGradientOffset.y * vs_TEXCOORD1.w + vs_TEXCOORD0.y;
    u_xlat16_6 = texture(_ScrollGradient, u_xlat1.xy).x;
    u_xlat6 = u_xlat16_6 * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xyz * _Lightningcolor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Brightness);
    u_xlat1.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _LightningScrollTexture_ST.xy + _LightningScrollTexture_ST.zw;
    u_xlat16_0.x = texture(_LightningScrollTexture, u_xlat0.xy).w;
    u_xlat0.x = u_xlat16_0.x * u_xlat6;
    u_xlat2.xy = vs_TEXCOORD0.xy * _TextureSample3_ST.xy + _TextureSample3_ST.zw;
    u_xlat16_2 = texture(_TextureSample3, u_xlat2.xy).x;
    u_xlat2.x = u_xlat16_2 * _maskmult;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
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