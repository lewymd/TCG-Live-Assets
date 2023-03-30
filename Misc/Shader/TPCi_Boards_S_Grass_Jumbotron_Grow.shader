//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/S_Grass_Jumbotron_Grow" {
Properties {
_Cutoff ("Mask Clip Value", Float) = 0.5
_GroundTexture ("Ground Texture", 2D) = "white" { }
_GrassTexture ("Grass Texture", 2D) = "white" { }
_DistortionTexture ("Distortion Texture", 2D) = "bump" { }
_SmoothRoughMaskTexture ("SmoothRough Mask Texture", 2D) = "white" { }
_DissolveDebugReturnto0 ("Dissolve Debug (Return to 0)", Range(0, 1)) = 0
_edgeintensity ("edge intensity", Float) = 10
_EdgeColor ("Edge Color", Color) = (0.7028302,1,0.9623851,0)
_EdgeColorGround ("Edge Color Ground", Color) = (0.8773585,0.5603327,0.08690815,0)
_tex4coord ("", 2D) = "white" { }
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "TransparentCutout" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "TransparentCutout" }
  ZWrite Off
  GpuProgramID 31271
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
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD7;
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
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _GroundTexture_ST;
uniform 	float _DissolveDebugReturnto0;
uniform 	vec4 _SmoothRoughMaskTexture_ST;
uniform 	float _edgeintensity;
uniform 	vec4 _EdgeColorGround;
uniform 	vec4 _EdgeColor;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _GroundTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GrassTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _SmoothRoughMaskTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
bool u_xlatb8;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 1.0) + vec2(-0.5, 0.0);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat5.x = vs_TEXCOORD1.z + _DissolveDebugReturnto0;
    u_xlat5.x = u_xlat5.x * 15.0;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat5.x) * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat5.xy = _Time.yy * vec2(-0.100000001, -0.100000001) + vs_TEXCOORD0.xy;
    u_xlat16_5.xy = texture(_DistortionTexture, u_xlat5.xy).xy;
    u_xlat16_1.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat5.xy = vs_TEXCOORD0.xy * vec2(8.0, 4.0);
    u_xlat16_15 = texture(_GrassTexture, u_xlat5.xy).w;
    u_xlat15 = (-u_xlat16_15) + 1.0;
    u_xlat5.xy = vec2(u_xlat15) * u_xlat16_1.xy + u_xlat5.xy;
    u_xlat16_1 = texture(_GrassTexture, u_xlat5.xy);
    u_xlat5.xy = vs_TEXCOORD0.xy * _SmoothRoughMaskTexture_ST.xy + _SmoothRoughMaskTexture_ST.zw;
    u_xlat16_5.xy = texture(_SmoothRoughMaskTexture, u_xlat5.xy).xz;
    u_xlat15 = (-u_xlat16_5.x) + u_xlat16_1.w;
    u_xlat2.xy = vs_TEXCOORD0.xy * _GroundTexture_ST.xy + _GroundTexture_ST.zw;
    u_xlat16_2 = texture(_GroundTexture, u_xlat2.xy);
    u_xlat5.x = u_xlat16_2.w * u_xlat15 + u_xlat16_5.x;
    u_xlat5.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 10.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat3 = u_xlat15 * u_xlat5.x + u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat3 = min(u_xlat3, 1.0);
    u_xlat8.x = u_xlat3 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x<0.0);
#else
    u_xlatb8 = u_xlat8.x<0.0;
#endif
    if(u_xlatb8){discard;}
    u_xlat8.x = u_xlat5.x * u_xlat15;
    u_xlat5.x = (-u_xlat15) * u_xlat5.x + 1.0;
    u_xlat5.x = u_xlat8.x * u_xlat5.x;
    u_xlat5.x = log2(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * 1.20000005;
    u_xlat5.x = exp2(u_xlat5.x);
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat8.xyz = vec3(_edgeintensity) * _EdgeColorGround.xyz;
    u_xlat8.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat4.xyz = vec3(_edgeintensity) * _EdgeColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat4.xyz + (-u_xlat8.xyz);
    u_xlat0.xyw = u_xlat16_2.www * u_xlat0.xyw + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat8.xyz = u_xlat16_2.www * u_xlat8.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat8.xyz + u_xlat16_2.xyz;
    u_xlat0.xyw = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw * u_xlat16_5.yyy;
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
uniform 	vec4 _tex4coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
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
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    vs_TEXCOORD4.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _GroundTexture_ST;
uniform 	float _DissolveDebugReturnto0;
uniform 	vec4 _SmoothRoughMaskTexture_ST;
uniform 	float _edgeintensity;
uniform 	vec4 _EdgeColorGround;
uniform 	vec4 _EdgeColor;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _GroundTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GrassTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _SmoothRoughMaskTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
bool u_xlatb8;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 1.0) + vec2(-0.5, 0.0);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat5.x = vs_TEXCOORD1.z + _DissolveDebugReturnto0;
    u_xlat5.x = u_xlat5.x * 15.0;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat5.x) * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat5.xy = _Time.yy * vec2(-0.100000001, -0.100000001) + vs_TEXCOORD0.xy;
    u_xlat16_5.xy = texture(_DistortionTexture, u_xlat5.xy).xy;
    u_xlat16_1.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat5.xy = vs_TEXCOORD0.xy * vec2(8.0, 4.0);
    u_xlat16_15 = texture(_GrassTexture, u_xlat5.xy).w;
    u_xlat15 = (-u_xlat16_15) + 1.0;
    u_xlat5.xy = vec2(u_xlat15) * u_xlat16_1.xy + u_xlat5.xy;
    u_xlat16_1 = texture(_GrassTexture, u_xlat5.xy);
    u_xlat5.xy = vs_TEXCOORD0.xy * _SmoothRoughMaskTexture_ST.xy + _SmoothRoughMaskTexture_ST.zw;
    u_xlat16_5.xy = texture(_SmoothRoughMaskTexture, u_xlat5.xy).xz;
    u_xlat15 = (-u_xlat16_5.x) + u_xlat16_1.w;
    u_xlat2.xy = vs_TEXCOORD0.xy * _GroundTexture_ST.xy + _GroundTexture_ST.zw;
    u_xlat16_2 = texture(_GroundTexture, u_xlat2.xy);
    u_xlat5.x = u_xlat16_2.w * u_xlat15 + u_xlat16_5.x;
    u_xlat5.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 10.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat3 = u_xlat15 * u_xlat5.x + u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat3 = min(u_xlat3, 1.0);
    u_xlat8.x = u_xlat3 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x<0.0);
#else
    u_xlatb8 = u_xlat8.x<0.0;
#endif
    if(u_xlatb8){discard;}
    u_xlat8.x = u_xlat5.x * u_xlat15;
    u_xlat5.x = (-u_xlat15) * u_xlat5.x + 1.0;
    u_xlat5.x = u_xlat8.x * u_xlat5.x;
    u_xlat5.x = log2(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * 1.20000005;
    u_xlat5.x = exp2(u_xlat5.x);
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat8.xyz = vec3(_edgeintensity) * _EdgeColorGround.xyz;
    u_xlat8.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat4.xyz = vec3(_edgeintensity) * _EdgeColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat4.xyz + (-u_xlat8.xyz);
    u_xlat0.xyw = u_xlat16_2.www * u_xlat0.xyw + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat8.xyz = u_xlat16_2.www * u_xlat8.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat8.xyz + u_xlat16_2.xyz;
    u_xlat0.xyw = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw * u_xlat16_5.yyy;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
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
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
uniform 	vec4 _tex4coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _tex4coord_ST.xy + _tex4coord_ST.zw;
    vs_TEXCOORD1.zw = in_TEXCOORD0.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _GroundTexture_ST;
uniform 	float _DissolveDebugReturnto0;
uniform 	vec4 _SmoothRoughMaskTexture_ST;
uniform 	float _edgeintensity;
uniform 	vec4 _EdgeColorGround;
uniform 	vec4 _EdgeColor;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _GroundTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GrassTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _SmoothRoughMaskTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
bool u_xlatb8;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 1.0) + vec2(-0.5, 0.0);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat5.x = vs_TEXCOORD1.z + _DissolveDebugReturnto0;
    u_xlat5.x = u_xlat5.x * 15.0;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat5.x) * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat5.xy = _Time.yy * vec2(-0.100000001, -0.100000001) + vs_TEXCOORD0.xy;
    u_xlat16_5.xy = texture(_DistortionTexture, u_xlat5.xy).xy;
    u_xlat16_1.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat5.xy = vs_TEXCOORD0.xy * vec2(8.0, 4.0);
    u_xlat16_15 = texture(_GrassTexture, u_xlat5.xy).w;
    u_xlat15 = (-u_xlat16_15) + 1.0;
    u_xlat5.xy = vec2(u_xlat15) * u_xlat16_1.xy + u_xlat5.xy;
    u_xlat16_1 = texture(_GrassTexture, u_xlat5.xy);
    u_xlat5.xy = vs_TEXCOORD0.xy * _SmoothRoughMaskTexture_ST.xy + _SmoothRoughMaskTexture_ST.zw;
    u_xlat16_5.xy = texture(_SmoothRoughMaskTexture, u_xlat5.xy).xz;
    u_xlat15 = (-u_xlat16_5.x) + u_xlat16_1.w;
    u_xlat2.xy = vs_TEXCOORD0.xy * _GroundTexture_ST.xy + _GroundTexture_ST.zw;
    u_xlat16_2 = texture(_GroundTexture, u_xlat2.xy);
    u_xlat5.x = u_xlat16_2.w * u_xlat15 + u_xlat16_5.x;
    u_xlat5.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 10.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat3 = u_xlat15 * u_xlat5.x + u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat3 = min(u_xlat3, 1.0);
    u_xlat8.x = u_xlat3 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x<0.0);
#else
    u_xlatb8 = u_xlat8.x<0.0;
#endif
    if(u_xlatb8){discard;}
    u_xlat8.x = u_xlat5.x * u_xlat15;
    u_xlat5.x = (-u_xlat15) * u_xlat5.x + 1.0;
    u_xlat5.x = u_xlat8.x * u_xlat5.x;
    u_xlat5.x = log2(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * 1.20000005;
    u_xlat5.x = exp2(u_xlat5.x);
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat8.xyz = vec3(_edgeintensity) * _EdgeColorGround.xyz;
    u_xlat8.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat4.xyz = vec3(_edgeintensity) * _EdgeColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat4.xyz + (-u_xlat8.xyz);
    u_xlat0.xyw = u_xlat16_2.www * u_xlat0.xyw + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat8.xyz = u_xlat16_2.www * u_xlat8.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat8.xyz + u_xlat16_2.xyz;
    u_xlat0.xyw = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw * u_xlat16_5.yyy;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
uniform 	vec4 _tex4coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _tex4coord_ST.xy + _tex4coord_ST.zw;
    vs_TEXCOORD1.zw = in_TEXCOORD0.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat4;
    u_xlat2 = u_xlat5 * u_xlat5 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_3.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _GroundTexture_ST;
uniform 	float _DissolveDebugReturnto0;
uniform 	vec4 _SmoothRoughMaskTexture_ST;
uniform 	float _edgeintensity;
uniform 	vec4 _EdgeColorGround;
uniform 	vec4 _EdgeColor;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _GroundTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GrassTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _SmoothRoughMaskTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
bool u_xlatb8;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 1.0) + vec2(-0.5, 0.0);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat5.x = vs_TEXCOORD1.z + _DissolveDebugReturnto0;
    u_xlat5.x = u_xlat5.x * 15.0;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat5.x) * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat5.xy = _Time.yy * vec2(-0.100000001, -0.100000001) + vs_TEXCOORD0.xy;
    u_xlat16_5.xy = texture(_DistortionTexture, u_xlat5.xy).xy;
    u_xlat16_1.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat5.xy = vs_TEXCOORD0.xy * vec2(8.0, 4.0);
    u_xlat16_15 = texture(_GrassTexture, u_xlat5.xy).w;
    u_xlat15 = (-u_xlat16_15) + 1.0;
    u_xlat5.xy = vec2(u_xlat15) * u_xlat16_1.xy + u_xlat5.xy;
    u_xlat16_1 = texture(_GrassTexture, u_xlat5.xy);
    u_xlat5.xy = vs_TEXCOORD0.xy * _SmoothRoughMaskTexture_ST.xy + _SmoothRoughMaskTexture_ST.zw;
    u_xlat16_5.xy = texture(_SmoothRoughMaskTexture, u_xlat5.xy).xz;
    u_xlat15 = (-u_xlat16_5.x) + u_xlat16_1.w;
    u_xlat2.xy = vs_TEXCOORD0.xy * _GroundTexture_ST.xy + _GroundTexture_ST.zw;
    u_xlat16_2 = texture(_GroundTexture, u_xlat2.xy);
    u_xlat5.x = u_xlat16_2.w * u_xlat15 + u_xlat16_5.x;
    u_xlat5.x = u_xlat0.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 10.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat3 = u_xlat15 * u_xlat5.x + u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat3 = min(u_xlat3, 1.0);
    u_xlat8.x = u_xlat3 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x<0.0);
#else
    u_xlatb8 = u_xlat8.x<0.0;
#endif
    if(u_xlatb8){discard;}
    u_xlat8.x = u_xlat5.x * u_xlat15;
    u_xlat5.x = (-u_xlat15) * u_xlat5.x + 1.0;
    u_xlat5.x = u_xlat8.x * u_xlat5.x;
    u_xlat5.x = log2(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * 1.20000005;
    u_xlat5.x = exp2(u_xlat5.x);
    u_xlat0.x = u_xlat0.x * u_xlat5.x;
    u_xlat8.xyz = vec3(_edgeintensity) * _EdgeColorGround.xyz;
    u_xlat8.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat4.xyz = vec3(_edgeintensity) * _EdgeColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat4.xyz + (-u_xlat8.xyz);
    u_xlat0.xyw = u_xlat16_2.www * u_xlat0.xyw + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat8.xyz = u_xlat16_2.www * u_xlat8.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat8.xyz + u_xlat16_2.xyz;
    u_xlat0.xyw = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw * u_xlat16_5.yyy;
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
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Geometry+0" "RenderType" = "TransparentCutout" }
  Blend One One, One One
  ZWrite Off
  GpuProgramID 95442
Program "vp" {
SubProgram "gles3 " {
Keywords { "POINT" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
uniform 	vec4 _tex4coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _tex4coord_ST.xy + _tex4coord_ST.zw;
    vs_TEXCOORD1.zw = in_TEXCOORD0.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec4 _GroundTexture_ST;
uniform 	float _DissolveDebugReturnto0;
uniform 	vec4 _SmoothRoughMaskTexture_ST;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _GroundTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GrassTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _SmoothRoughMaskTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
vec2 u_xlat4;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(-0.100000001, -0.100000001) + vs_TEXCOORD0.xy;
    u_xlat16_0.xy = texture(_DistortionTexture, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(8.0, 4.0);
    u_xlat16_4 = texture(_GrassTexture, u_xlat0.xy).w;
    u_xlat4.x = (-u_xlat16_4) + 1.0;
    u_xlat0.xy = u_xlat4.xx * u_xlat16_1.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_GrassTexture, u_xlat0.xy).w;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SmoothRoughMaskTexture_ST.xy + _SmoothRoughMaskTexture_ST.zw;
    u_xlat16_2 = texture(_SmoothRoughMaskTexture, u_xlat2.xy).x;
    u_xlat0.x = (-u_xlat16_2) + u_xlat16_0.x;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GroundTexture_ST.xy + _GroundTexture_ST.zw;
    u_xlat16_4 = texture(_GroundTexture, u_xlat4.xy).w;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x + u_xlat16_2;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(2.0, 1.0) + vec2(-0.5, 0.0);
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat4.x = vs_TEXCOORD1.z + _DissolveDebugReturnto0;
    u_xlat4.x = u_xlat4.x * 15.0;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = u_xlat4.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) * u_xlat2.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 10.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat4.x * u_xlat0.x + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
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
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
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
uniform 	vec4 _GroundTexture_ST;
uniform 	float _DissolveDebugReturnto0;
uniform 	vec4 _SmoothRoughMaskTexture_ST;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _GroundTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GrassTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _SmoothRoughMaskTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
vec2 u_xlat4;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(-0.100000001, -0.100000001) + vs_TEXCOORD0.xy;
    u_xlat16_0.xy = texture(_DistortionTexture, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(8.0, 4.0);
    u_xlat16_4 = texture(_GrassTexture, u_xlat0.xy).w;
    u_xlat4.x = (-u_xlat16_4) + 1.0;
    u_xlat0.xy = u_xlat4.xx * u_xlat16_1.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_GrassTexture, u_xlat0.xy).w;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SmoothRoughMaskTexture_ST.xy + _SmoothRoughMaskTexture_ST.zw;
    u_xlat16_2 = texture(_SmoothRoughMaskTexture, u_xlat2.xy).x;
    u_xlat0.x = (-u_xlat16_2) + u_xlat16_0.x;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GroundTexture_ST.xy + _GroundTexture_ST.zw;
    u_xlat16_4 = texture(_GroundTexture, u_xlat4.xy).w;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x + u_xlat16_2;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(2.0, 1.0) + vec2(-0.5, 0.0);
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat4.x = vs_TEXCOORD1.z + _DissolveDebugReturnto0;
    u_xlat4.x = u_xlat4.x * 15.0;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = u_xlat4.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) * u_xlat2.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 10.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat4.x * u_xlat0.x + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SPOT" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
uniform 	vec4 _tex4coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _tex4coord_ST.xy + _tex4coord_ST.zw;
    vs_TEXCOORD1.zw = in_TEXCOORD0.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD4 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _GroundTexture_ST;
uniform 	float _DissolveDebugReturnto0;
uniform 	vec4 _SmoothRoughMaskTexture_ST;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _GroundTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GrassTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _SmoothRoughMaskTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
vec2 u_xlat4;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(-0.100000001, -0.100000001) + vs_TEXCOORD0.xy;
    u_xlat16_0.xy = texture(_DistortionTexture, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(8.0, 4.0);
    u_xlat16_4 = texture(_GrassTexture, u_xlat0.xy).w;
    u_xlat4.x = (-u_xlat16_4) + 1.0;
    u_xlat0.xy = u_xlat4.xx * u_xlat16_1.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_GrassTexture, u_xlat0.xy).w;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SmoothRoughMaskTexture_ST.xy + _SmoothRoughMaskTexture_ST.zw;
    u_xlat16_2 = texture(_SmoothRoughMaskTexture, u_xlat2.xy).x;
    u_xlat0.x = (-u_xlat16_2) + u_xlat16_0.x;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GroundTexture_ST.xy + _GroundTexture_ST.zw;
    u_xlat16_4 = texture(_GroundTexture, u_xlat4.xy).w;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x + u_xlat16_2;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(2.0, 1.0) + vec2(-0.5, 0.0);
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat4.x = vs_TEXCOORD1.z + _DissolveDebugReturnto0;
    u_xlat4.x = u_xlat4.x * 15.0;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = u_xlat4.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) * u_xlat2.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 10.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat4.x * u_xlat0.x + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
uniform 	vec4 _tex4coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _tex4coord_ST.xy + _tex4coord_ST.zw;
    vs_TEXCOORD1.zw = in_TEXCOORD0.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec4 _GroundTexture_ST;
uniform 	float _DissolveDebugReturnto0;
uniform 	vec4 _SmoothRoughMaskTexture_ST;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _GroundTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GrassTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _SmoothRoughMaskTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
vec2 u_xlat4;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(-0.100000001, -0.100000001) + vs_TEXCOORD0.xy;
    u_xlat16_0.xy = texture(_DistortionTexture, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(8.0, 4.0);
    u_xlat16_4 = texture(_GrassTexture, u_xlat0.xy).w;
    u_xlat4.x = (-u_xlat16_4) + 1.0;
    u_xlat0.xy = u_xlat4.xx * u_xlat16_1.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_GrassTexture, u_xlat0.xy).w;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SmoothRoughMaskTexture_ST.xy + _SmoothRoughMaskTexture_ST.zw;
    u_xlat16_2 = texture(_SmoothRoughMaskTexture, u_xlat2.xy).x;
    u_xlat0.x = (-u_xlat16_2) + u_xlat16_0.x;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GroundTexture_ST.xy + _GroundTexture_ST.zw;
    u_xlat16_4 = texture(_GroundTexture, u_xlat4.xy).w;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x + u_xlat16_2;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(2.0, 1.0) + vec2(-0.5, 0.0);
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat4.x = vs_TEXCOORD1.z + _DissolveDebugReturnto0;
    u_xlat4.x = u_xlat4.x * 15.0;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = u_xlat4.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) * u_xlat2.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 10.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat4.x * u_xlat0.x + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _texcoord_ST;
uniform 	vec4 _tex4coord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat1.zz + u_xlat0.xy;
    vs_TEXCOORD4.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat1.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _tex4coord_ST.xy + _tex4coord_ST.zw;
    vs_TEXCOORD1.zw = in_TEXCOORD0.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
uniform 	vec4 _GroundTexture_ST;
uniform 	float _DissolveDebugReturnto0;
uniform 	vec4 _SmoothRoughMaskTexture_ST;
uniform 	float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _GroundTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _GrassTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _SmoothRoughMaskTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
vec2 u_xlat4;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(-0.100000001, -0.100000001) + vs_TEXCOORD0.xy;
    u_xlat16_0.xy = texture(_DistortionTexture, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(8.0, 4.0);
    u_xlat16_4 = texture(_GrassTexture, u_xlat0.xy).w;
    u_xlat4.x = (-u_xlat16_4) + 1.0;
    u_xlat0.xy = u_xlat4.xx * u_xlat16_1.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_GrassTexture, u_xlat0.xy).w;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SmoothRoughMaskTexture_ST.xy + _SmoothRoughMaskTexture_ST.zw;
    u_xlat16_2 = texture(_SmoothRoughMaskTexture, u_xlat2.xy).x;
    u_xlat0.x = (-u_xlat16_2) + u_xlat16_0.x;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GroundTexture_ST.xy + _GroundTexture_ST.zw;
    u_xlat16_4 = texture(_GroundTexture, u_xlat4.xy).w;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x + u_xlat16_2;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(2.0, 1.0) + vec2(-0.5, 0.0);
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat4.x = vs_TEXCOORD1.z + _DissolveDebugReturnto0;
    u_xlat4.x = u_xlat4.x * 15.0;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2.x = u_xlat4.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) * u_xlat2.x + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 10.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat4.x * u_xlat0.x + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
}
}
}
CustomEditor "ASEMaterialInspector"
}