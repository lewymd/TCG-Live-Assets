//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/S_Colorless_FOV_Bend" {
Properties {
_HexTiling ("Hex Tiling", Vector) = (1,1,0,0)
_HexDensity ("Hex Density", Range(-64, 64)) = 2
_MainTex ("Main Tex", 2D) = "white" { }
_HexTex ("HexTex", 2D) = "white" { }
_MaskTiling ("Mask Tiling", Vector) = (1,1,0,0)
_HexRedirTex ("HexRedirTex", 2D) = "white" { }
_GroutVisibility ("Grout Visibility", Range(0, 1)) = 0
_EffectTex ("Effect Tex", 2D) = "white" { }
_GroutColor ("Grout Color", Color) = (1,1,1,0)
_RadialGradientSmoothstepMin ("Radial Gradient Smoothstep Min", Float) = 0.5
_RadialGradientSmoothstepMax ("Radial Gradient Smoothstep Max", Float) = 0.93
_RedColor ("Red Color", Color) = (1,0,0,0)
_GreenColor ("Green Color", Color) = (0.1191268,0.6603774,0,0)
_MaskTex ("Mask Tex", 2D) = "black" { }
_HexOffset ("Hex Offset", Vector) = (0,0,0,0)
_effecttextureoffset ("effect texture offset", Vector) = (1,0,0,0)
_maintextureoffset ("main texture offset", Vector) = (1,0,0,0)
_effecttexturetiling ("effect texture tiling", Vector) = (1,1,0,0)
_maintexturetiling ("main texture tiling", Vector) = (1,1,0,0)
_hexmasktilingmult ("hex mask tiling mult", Float) = 3.2
_hexmaskoffset ("hex mask offset", Vector) = (-0.3,0.09,0,0)
_TextureSample1 ("Texture Sample 1", 2D) = "white" { }
_hexmasktiling ("hex mask tiling ", Vector) = (2,1,0,0)
_T_VFX_Shared_BrushedMetal ("T_VFX_Shared_BrushedMetal", 2D) = "white" { }
_Brightness ("Brightness", Float) = 1
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  Cull Off
  GpuProgramID 62248
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	vec2 _hexmasktiling;
uniform 	float _hexmasktilingmult;
uniform 	vec2 _hexmaskoffset;
uniform 	vec2 _HexTiling;
uniform 	vec2 _HexOffset;
uniform 	float _HexDensity;
uniform 	vec2 _MaskTiling;
uniform 	vec4 _GroutColor;
uniform 	vec2 _maintexturetiling;
uniform 	vec2 _maintextureoffset;
uniform 	vec2 _effecttexturetiling;
uniform 	vec2 _effecttextureoffset;
uniform 	float _Brightness;
uniform 	float _GroutVisibility;
uniform 	vec4 _RedColor;
uniform 	vec4 _GreenColor;
UNITY_LOCATION(0) uniform mediump sampler2D _HexRedirTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EffectTex;
UNITY_LOCATION(4) uniform mediump sampler2D _T_VFX_Shared_BrushedMetal;
UNITY_LOCATION(5) uniform mediump sampler2D _TextureSample1;
UNITY_LOCATION(6) uniform mediump sampler2D _HexTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat6;
vec2 u_xlat11;
vec2 u_xlat12;
mediump vec2 u_xlat16_12;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.0500000007, 0.0);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(4.0, 4.0) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_T_VFX_Shared_BrushedMetal, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _effecttexturetiling.xy + vec2(_effecttextureoffset.x, _effecttextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(0.0500000007, 0.0) + u_xlat1.xy;
    u_xlat11.xy = vs_TEXCOORD0.xy * _HexTiling.xy + vec2(_HexOffset.x, _HexOffset.y);
    u_xlat2.xy = u_xlat11.xy * vec2(_HexDensity);
    u_xlat12.xy = fract(u_xlat2.xy);
    u_xlat11.xy = u_xlat11.xy * vec2(_HexDensity) + (-u_xlat12.xy);
    u_xlat16_12.xy = texture(_HexRedirTex, u_xlat2.xy).xy;
    u_xlat11.xy = u_xlat11.xy + u_xlat16_12.xy;
    u_xlat11.xy = u_xlat11.xy / vec2(_HexDensity);
    u_xlat12.xy = vec2(_MaskTiling.x, _MaskTiling.y) / _HexTiling.xy;
    u_xlat3.xy = u_xlat11.xy * u_xlat12.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_4.xyz = texture(_EffectTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(-0.5, -0.5, -0.5) + u_xlat16_4.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _maintexturetiling.xy + vec2(_maintextureoffset.x, _maintextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(-0.0250000004, 0.0) + u_xlat1.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_3.xyz);
    u_xlat16_15 = texture(_TextureSample1, u_xlat2.xy).z;
    u_xlat16_1.xy = texture(_HexTex, u_xlat2.xy).yz;
    u_xlat0.xyz = vec3(u_xlat16_15) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Brightness);
    u_xlat4.xyz = u_xlat3.xyz * vec3(4.0, 4.0, 4.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + (-_GroutColor.xyz);
    u_xlat2.xy = vec2(_hexmasktiling.x, _hexmasktiling.y) * vec2(_hexmasktilingmult);
    u_xlat2.xy = vs_TEXCOORD0.xy * u_xlat2.xy + vec2(_hexmaskoffset.x, _hexmaskoffset.y);
    u_xlat11.xy = u_xlat11.xy * u_xlat12.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_MaskTex, u_xlat11.xy).xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat4.xyz + _GroutColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_GroutVisibility, _GroutVisibility, _GroutVisibility));
    u_xlat15 = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat15 = u_xlat15 * vs_TEXCOORD0.x;
    u_xlat15 = u_xlat15 * 4.13000011;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat15 = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + (-_RadialGradientSmoothstepMin);
    u_xlat11.x = (-_RadialGradientSmoothstepMin) + _RadialGradientSmoothstepMax;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat15 = u_xlat15 * u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat11.x * u_xlat15 + -1.0;
    u_xlat15 = u_xlat16_2.z * u_xlat15 + 1.0;
    u_xlat1.xz = u_xlat16_1.xx * u_xlat16_2.xy;
    u_xlat6.x = (-u_xlat16_1.y) + 1.0;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Brightness) + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat6.xyz = u_xlat1.zzz * _GreenColor.xyz;
    u_xlat1.xyz = _RedColor.xyz * u_xlat1.xxx + u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD3.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	vec2 _hexmasktiling;
uniform 	float _hexmasktilingmult;
uniform 	vec2 _hexmaskoffset;
uniform 	vec2 _HexTiling;
uniform 	vec2 _HexOffset;
uniform 	float _HexDensity;
uniform 	vec2 _MaskTiling;
uniform 	vec4 _GroutColor;
uniform 	vec2 _maintexturetiling;
uniform 	vec2 _maintextureoffset;
uniform 	vec2 _effecttexturetiling;
uniform 	vec2 _effecttextureoffset;
uniform 	float _Brightness;
uniform 	float _GroutVisibility;
uniform 	vec4 _RedColor;
uniform 	vec4 _GreenColor;
UNITY_LOCATION(0) uniform mediump sampler2D _HexRedirTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EffectTex;
UNITY_LOCATION(4) uniform mediump sampler2D _T_VFX_Shared_BrushedMetal;
UNITY_LOCATION(5) uniform mediump sampler2D _TextureSample1;
UNITY_LOCATION(6) uniform mediump sampler2D _HexTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat6;
vec2 u_xlat11;
vec2 u_xlat12;
mediump vec2 u_xlat16_12;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.0500000007, 0.0);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(4.0, 4.0) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_T_VFX_Shared_BrushedMetal, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _effecttexturetiling.xy + vec2(_effecttextureoffset.x, _effecttextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(0.0500000007, 0.0) + u_xlat1.xy;
    u_xlat11.xy = vs_TEXCOORD0.xy * _HexTiling.xy + vec2(_HexOffset.x, _HexOffset.y);
    u_xlat2.xy = u_xlat11.xy * vec2(_HexDensity);
    u_xlat12.xy = fract(u_xlat2.xy);
    u_xlat11.xy = u_xlat11.xy * vec2(_HexDensity) + (-u_xlat12.xy);
    u_xlat16_12.xy = texture(_HexRedirTex, u_xlat2.xy).xy;
    u_xlat11.xy = u_xlat11.xy + u_xlat16_12.xy;
    u_xlat11.xy = u_xlat11.xy / vec2(_HexDensity);
    u_xlat12.xy = vec2(_MaskTiling.x, _MaskTiling.y) / _HexTiling.xy;
    u_xlat3.xy = u_xlat11.xy * u_xlat12.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_4.xyz = texture(_EffectTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(-0.5, -0.5, -0.5) + u_xlat16_4.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _maintexturetiling.xy + vec2(_maintextureoffset.x, _maintextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(-0.0250000004, 0.0) + u_xlat1.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_3.xyz);
    u_xlat16_15 = texture(_TextureSample1, u_xlat2.xy).z;
    u_xlat16_1.xy = texture(_HexTex, u_xlat2.xy).yz;
    u_xlat0.xyz = vec3(u_xlat16_15) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Brightness);
    u_xlat4.xyz = u_xlat3.xyz * vec3(4.0, 4.0, 4.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + (-_GroutColor.xyz);
    u_xlat2.xy = vec2(_hexmasktiling.x, _hexmasktiling.y) * vec2(_hexmasktilingmult);
    u_xlat2.xy = vs_TEXCOORD0.xy * u_xlat2.xy + vec2(_hexmaskoffset.x, _hexmaskoffset.y);
    u_xlat11.xy = u_xlat11.xy * u_xlat12.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_MaskTex, u_xlat11.xy).xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat4.xyz + _GroutColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_GroutVisibility, _GroutVisibility, _GroutVisibility));
    u_xlat15 = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat15 = u_xlat15 * vs_TEXCOORD0.x;
    u_xlat15 = u_xlat15 * 4.13000011;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat15 = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + (-_RadialGradientSmoothstepMin);
    u_xlat11.x = (-_RadialGradientSmoothstepMin) + _RadialGradientSmoothstepMax;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat15 = u_xlat15 * u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat11.x * u_xlat15 + -1.0;
    u_xlat15 = u_xlat16_2.z * u_xlat15 + 1.0;
    u_xlat1.xz = u_xlat16_1.xx * u_xlat16_2.xy;
    u_xlat6.x = (-u_xlat16_1.y) + 1.0;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Brightness) + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat6.xyz = u_xlat1.zzz * _GreenColor.xyz;
    u_xlat1.xyz = _RedColor.xyz * u_xlat1.xxx + u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	vec2 _hexmasktiling;
uniform 	float _hexmasktilingmult;
uniform 	vec2 _hexmaskoffset;
uniform 	vec2 _HexTiling;
uniform 	vec2 _HexOffset;
uniform 	float _HexDensity;
uniform 	vec2 _MaskTiling;
uniform 	vec4 _GroutColor;
uniform 	vec2 _maintexturetiling;
uniform 	vec2 _maintextureoffset;
uniform 	vec2 _effecttexturetiling;
uniform 	vec2 _effecttextureoffset;
uniform 	float _Brightness;
uniform 	float _GroutVisibility;
uniform 	vec4 _RedColor;
uniform 	vec4 _GreenColor;
UNITY_LOCATION(0) uniform mediump sampler2D _HexRedirTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EffectTex;
UNITY_LOCATION(4) uniform mediump sampler2D _T_VFX_Shared_BrushedMetal;
UNITY_LOCATION(5) uniform mediump sampler2D _TextureSample1;
UNITY_LOCATION(6) uniform mediump sampler2D _HexTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat6;
vec2 u_xlat11;
vec2 u_xlat12;
mediump vec2 u_xlat16_12;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.0500000007, 0.0);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(4.0, 4.0) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_T_VFX_Shared_BrushedMetal, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _effecttexturetiling.xy + vec2(_effecttextureoffset.x, _effecttextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(0.0500000007, 0.0) + u_xlat1.xy;
    u_xlat11.xy = vs_TEXCOORD0.xy * _HexTiling.xy + vec2(_HexOffset.x, _HexOffset.y);
    u_xlat2.xy = u_xlat11.xy * vec2(_HexDensity);
    u_xlat12.xy = fract(u_xlat2.xy);
    u_xlat11.xy = u_xlat11.xy * vec2(_HexDensity) + (-u_xlat12.xy);
    u_xlat16_12.xy = texture(_HexRedirTex, u_xlat2.xy).xy;
    u_xlat11.xy = u_xlat11.xy + u_xlat16_12.xy;
    u_xlat11.xy = u_xlat11.xy / vec2(_HexDensity);
    u_xlat12.xy = vec2(_MaskTiling.x, _MaskTiling.y) / _HexTiling.xy;
    u_xlat3.xy = u_xlat11.xy * u_xlat12.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_4.xyz = texture(_EffectTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(-0.5, -0.5, -0.5) + u_xlat16_4.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _maintexturetiling.xy + vec2(_maintextureoffset.x, _maintextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(-0.0250000004, 0.0) + u_xlat1.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_3.xyz);
    u_xlat16_15 = texture(_TextureSample1, u_xlat2.xy).z;
    u_xlat16_1.xy = texture(_HexTex, u_xlat2.xy).yz;
    u_xlat0.xyz = vec3(u_xlat16_15) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Brightness);
    u_xlat4.xyz = u_xlat3.xyz * vec3(4.0, 4.0, 4.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + (-_GroutColor.xyz);
    u_xlat2.xy = vec2(_hexmasktiling.x, _hexmasktiling.y) * vec2(_hexmasktilingmult);
    u_xlat2.xy = vs_TEXCOORD0.xy * u_xlat2.xy + vec2(_hexmaskoffset.x, _hexmaskoffset.y);
    u_xlat11.xy = u_xlat11.xy * u_xlat12.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_MaskTex, u_xlat11.xy).xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat4.xyz + _GroutColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_GroutVisibility, _GroutVisibility, _GroutVisibility));
    u_xlat15 = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat15 = u_xlat15 * vs_TEXCOORD0.x;
    u_xlat15 = u_xlat15 * 4.13000011;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat15 = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + (-_RadialGradientSmoothstepMin);
    u_xlat11.x = (-_RadialGradientSmoothstepMin) + _RadialGradientSmoothstepMax;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat15 = u_xlat15 * u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat11.x * u_xlat15 + -1.0;
    u_xlat15 = u_xlat16_2.z * u_xlat15 + 1.0;
    u_xlat1.xz = u_xlat16_1.xx * u_xlat16_2.xy;
    u_xlat6.x = (-u_xlat16_1.y) + 1.0;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Brightness) + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat6.xyz = u_xlat1.zzz * _GreenColor.xyz;
    u_xlat1.xyz = _RedColor.xyz * u_xlat1.xxx + u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD3.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	vec2 _hexmasktiling;
uniform 	float _hexmasktilingmult;
uniform 	vec2 _hexmaskoffset;
uniform 	vec2 _HexTiling;
uniform 	vec2 _HexOffset;
uniform 	float _HexDensity;
uniform 	vec2 _MaskTiling;
uniform 	vec4 _GroutColor;
uniform 	vec2 _maintexturetiling;
uniform 	vec2 _maintextureoffset;
uniform 	vec2 _effecttexturetiling;
uniform 	vec2 _effecttextureoffset;
uniform 	float _Brightness;
uniform 	float _GroutVisibility;
uniform 	vec4 _RedColor;
uniform 	vec4 _GreenColor;
UNITY_LOCATION(0) uniform mediump sampler2D _HexRedirTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EffectTex;
UNITY_LOCATION(4) uniform mediump sampler2D _T_VFX_Shared_BrushedMetal;
UNITY_LOCATION(5) uniform mediump sampler2D _TextureSample1;
UNITY_LOCATION(6) uniform mediump sampler2D _HexTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat6;
vec2 u_xlat11;
vec2 u_xlat12;
mediump vec2 u_xlat16_12;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.0500000007, 0.0);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(4.0, 4.0) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_T_VFX_Shared_BrushedMetal, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _effecttexturetiling.xy + vec2(_effecttextureoffset.x, _effecttextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(0.0500000007, 0.0) + u_xlat1.xy;
    u_xlat11.xy = vs_TEXCOORD0.xy * _HexTiling.xy + vec2(_HexOffset.x, _HexOffset.y);
    u_xlat2.xy = u_xlat11.xy * vec2(_HexDensity);
    u_xlat12.xy = fract(u_xlat2.xy);
    u_xlat11.xy = u_xlat11.xy * vec2(_HexDensity) + (-u_xlat12.xy);
    u_xlat16_12.xy = texture(_HexRedirTex, u_xlat2.xy).xy;
    u_xlat11.xy = u_xlat11.xy + u_xlat16_12.xy;
    u_xlat11.xy = u_xlat11.xy / vec2(_HexDensity);
    u_xlat12.xy = vec2(_MaskTiling.x, _MaskTiling.y) / _HexTiling.xy;
    u_xlat3.xy = u_xlat11.xy * u_xlat12.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_4.xyz = texture(_EffectTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(-0.5, -0.5, -0.5) + u_xlat16_4.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _maintexturetiling.xy + vec2(_maintextureoffset.x, _maintextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(-0.0250000004, 0.0) + u_xlat1.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_3.xyz);
    u_xlat16_15 = texture(_TextureSample1, u_xlat2.xy).z;
    u_xlat16_1.xy = texture(_HexTex, u_xlat2.xy).yz;
    u_xlat0.xyz = vec3(u_xlat16_15) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Brightness);
    u_xlat4.xyz = u_xlat3.xyz * vec3(4.0, 4.0, 4.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + (-_GroutColor.xyz);
    u_xlat2.xy = vec2(_hexmasktiling.x, _hexmasktiling.y) * vec2(_hexmasktilingmult);
    u_xlat2.xy = vs_TEXCOORD0.xy * u_xlat2.xy + vec2(_hexmaskoffset.x, _hexmaskoffset.y);
    u_xlat11.xy = u_xlat11.xy * u_xlat12.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_MaskTex, u_xlat11.xy).xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat4.xyz + _GroutColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_GroutVisibility, _GroutVisibility, _GroutVisibility));
    u_xlat15 = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat15 = u_xlat15 * vs_TEXCOORD0.x;
    u_xlat15 = u_xlat15 * 4.13000011;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat15 = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + (-_RadialGradientSmoothstepMin);
    u_xlat11.x = (-_RadialGradientSmoothstepMin) + _RadialGradientSmoothstepMax;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat15 = u_xlat15 * u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat11.x * u_xlat15 + -1.0;
    u_xlat15 = u_xlat16_2.z * u_xlat15 + 1.0;
    u_xlat1.xz = u_xlat16_1.xx * u_xlat16_2.xy;
    u_xlat6.x = (-u_xlat16_1.y) + 1.0;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Brightness) + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat6.xyz = u_xlat1.zzz * _GreenColor.xyz;
    u_xlat1.xyz = _RedColor.xyz * u_xlat1.xxx + u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	vec2 _hexmasktiling;
uniform 	float _hexmasktilingmult;
uniform 	vec2 _hexmaskoffset;
uniform 	vec2 _HexTiling;
uniform 	vec2 _HexOffset;
uniform 	float _HexDensity;
uniform 	vec2 _MaskTiling;
uniform 	vec4 _GroutColor;
uniform 	vec2 _maintexturetiling;
uniform 	vec2 _maintextureoffset;
uniform 	vec2 _effecttexturetiling;
uniform 	vec2 _effecttextureoffset;
uniform 	float _Brightness;
uniform 	float _GroutVisibility;
uniform 	vec4 _RedColor;
uniform 	vec4 _GreenColor;
UNITY_LOCATION(0) uniform mediump sampler2D _HexRedirTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EffectTex;
UNITY_LOCATION(4) uniform mediump sampler2D _T_VFX_Shared_BrushedMetal;
UNITY_LOCATION(5) uniform mediump sampler2D _TextureSample1;
UNITY_LOCATION(6) uniform mediump sampler2D _HexTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat6;
vec2 u_xlat11;
vec2 u_xlat12;
mediump vec2 u_xlat16_12;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.0500000007, 0.0);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(4.0, 4.0) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_T_VFX_Shared_BrushedMetal, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _effecttexturetiling.xy + vec2(_effecttextureoffset.x, _effecttextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(0.0500000007, 0.0) + u_xlat1.xy;
    u_xlat11.xy = vs_TEXCOORD0.xy * _HexTiling.xy + vec2(_HexOffset.x, _HexOffset.y);
    u_xlat2.xy = u_xlat11.xy * vec2(_HexDensity);
    u_xlat12.xy = fract(u_xlat2.xy);
    u_xlat11.xy = u_xlat11.xy * vec2(_HexDensity) + (-u_xlat12.xy);
    u_xlat16_12.xy = texture(_HexRedirTex, u_xlat2.xy).xy;
    u_xlat11.xy = u_xlat11.xy + u_xlat16_12.xy;
    u_xlat11.xy = u_xlat11.xy / vec2(_HexDensity);
    u_xlat12.xy = vec2(_MaskTiling.x, _MaskTiling.y) / _HexTiling.xy;
    u_xlat3.xy = u_xlat11.xy * u_xlat12.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_4.xyz = texture(_EffectTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(-0.5, -0.5, -0.5) + u_xlat16_4.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _maintexturetiling.xy + vec2(_maintextureoffset.x, _maintextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(-0.0250000004, 0.0) + u_xlat1.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_3.xyz);
    u_xlat16_15 = texture(_TextureSample1, u_xlat2.xy).z;
    u_xlat16_1.xy = texture(_HexTex, u_xlat2.xy).yz;
    u_xlat0.xyz = vec3(u_xlat16_15) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Brightness);
    u_xlat4.xyz = u_xlat3.xyz * vec3(4.0, 4.0, 4.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + (-_GroutColor.xyz);
    u_xlat2.xy = vec2(_hexmasktiling.x, _hexmasktiling.y) * vec2(_hexmasktilingmult);
    u_xlat2.xy = vs_TEXCOORD0.xy * u_xlat2.xy + vec2(_hexmaskoffset.x, _hexmaskoffset.y);
    u_xlat11.xy = u_xlat11.xy * u_xlat12.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_MaskTex, u_xlat11.xy).xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat4.xyz + _GroutColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_GroutVisibility, _GroutVisibility, _GroutVisibility));
    u_xlat15 = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat15 = u_xlat15 * vs_TEXCOORD0.x;
    u_xlat15 = u_xlat15 * 4.13000011;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat15 = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + (-_RadialGradientSmoothstepMin);
    u_xlat11.x = (-_RadialGradientSmoothstepMin) + _RadialGradientSmoothstepMax;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat15 = u_xlat15 * u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat11.x * u_xlat15 + -1.0;
    u_xlat15 = u_xlat16_2.z * u_xlat15 + 1.0;
    u_xlat1.xz = u_xlat16_1.xx * u_xlat16_2.xy;
    u_xlat6.x = (-u_xlat16_1.y) + 1.0;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Brightness) + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat6.xyz = u_xlat1.zzz * _GreenColor.xyz;
    u_xlat1.xyz = _RedColor.xyz * u_xlat1.xxx + u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	vec2 _hexmasktiling;
uniform 	float _hexmasktilingmult;
uniform 	vec2 _hexmaskoffset;
uniform 	vec2 _HexTiling;
uniform 	vec2 _HexOffset;
uniform 	float _HexDensity;
uniform 	vec2 _MaskTiling;
uniform 	vec4 _GroutColor;
uniform 	vec2 _maintexturetiling;
uniform 	vec2 _maintextureoffset;
uniform 	vec2 _effecttexturetiling;
uniform 	vec2 _effecttextureoffset;
uniform 	float _Brightness;
uniform 	float _GroutVisibility;
uniform 	vec4 _RedColor;
uniform 	vec4 _GreenColor;
UNITY_LOCATION(0) uniform mediump sampler2D _HexRedirTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EffectTex;
UNITY_LOCATION(4) uniform mediump sampler2D _T_VFX_Shared_BrushedMetal;
UNITY_LOCATION(5) uniform mediump sampler2D _TextureSample1;
UNITY_LOCATION(6) uniform mediump sampler2D _HexTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat6;
vec2 u_xlat11;
vec2 u_xlat12;
mediump vec2 u_xlat16_12;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.0500000007, 0.0);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(4.0, 4.0) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_T_VFX_Shared_BrushedMetal, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _effecttexturetiling.xy + vec2(_effecttextureoffset.x, _effecttextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(0.0500000007, 0.0) + u_xlat1.xy;
    u_xlat11.xy = vs_TEXCOORD0.xy * _HexTiling.xy + vec2(_HexOffset.x, _HexOffset.y);
    u_xlat2.xy = u_xlat11.xy * vec2(_HexDensity);
    u_xlat12.xy = fract(u_xlat2.xy);
    u_xlat11.xy = u_xlat11.xy * vec2(_HexDensity) + (-u_xlat12.xy);
    u_xlat16_12.xy = texture(_HexRedirTex, u_xlat2.xy).xy;
    u_xlat11.xy = u_xlat11.xy + u_xlat16_12.xy;
    u_xlat11.xy = u_xlat11.xy / vec2(_HexDensity);
    u_xlat12.xy = vec2(_MaskTiling.x, _MaskTiling.y) / _HexTiling.xy;
    u_xlat3.xy = u_xlat11.xy * u_xlat12.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_4.xyz = texture(_EffectTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(-0.5, -0.5, -0.5) + u_xlat16_4.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _maintexturetiling.xy + vec2(_maintextureoffset.x, _maintextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(-0.0250000004, 0.0) + u_xlat1.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_3.xyz);
    u_xlat16_15 = texture(_TextureSample1, u_xlat2.xy).z;
    u_xlat16_1.xy = texture(_HexTex, u_xlat2.xy).yz;
    u_xlat0.xyz = vec3(u_xlat16_15) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Brightness);
    u_xlat4.xyz = u_xlat3.xyz * vec3(4.0, 4.0, 4.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + (-_GroutColor.xyz);
    u_xlat2.xy = vec2(_hexmasktiling.x, _hexmasktiling.y) * vec2(_hexmasktilingmult);
    u_xlat2.xy = vs_TEXCOORD0.xy * u_xlat2.xy + vec2(_hexmaskoffset.x, _hexmaskoffset.y);
    u_xlat11.xy = u_xlat11.xy * u_xlat12.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_MaskTex, u_xlat11.xy).xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat4.xyz + _GroutColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_GroutVisibility, _GroutVisibility, _GroutVisibility));
    u_xlat15 = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat15 = u_xlat15 * vs_TEXCOORD0.x;
    u_xlat15 = u_xlat15 * 4.13000011;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat15 = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + (-_RadialGradientSmoothstepMin);
    u_xlat11.x = (-_RadialGradientSmoothstepMin) + _RadialGradientSmoothstepMax;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat15 = u_xlat15 * u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat11.x * u_xlat15 + -1.0;
    u_xlat15 = u_xlat16_2.z * u_xlat15 + 1.0;
    u_xlat1.xz = u_xlat16_1.xx * u_xlat16_2.xy;
    u_xlat6.x = (-u_xlat16_1.y) + 1.0;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Brightness) + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat6.xyz = u_xlat1.zzz * _GreenColor.xyz;
    u_xlat1.xyz = _RedColor.xyz * u_xlat1.xxx + u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	vec2 _hexmasktiling;
uniform 	float _hexmasktilingmult;
uniform 	vec2 _hexmaskoffset;
uniform 	vec2 _HexTiling;
uniform 	vec2 _HexOffset;
uniform 	float _HexDensity;
uniform 	vec2 _MaskTiling;
uniform 	vec4 _GroutColor;
uniform 	vec2 _maintexturetiling;
uniform 	vec2 _maintextureoffset;
uniform 	vec2 _effecttexturetiling;
uniform 	vec2 _effecttextureoffset;
uniform 	float _Brightness;
uniform 	float _GroutVisibility;
uniform 	vec4 _RedColor;
uniform 	vec4 _GreenColor;
UNITY_LOCATION(0) uniform mediump sampler2D _HexRedirTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EffectTex;
UNITY_LOCATION(4) uniform mediump sampler2D _T_VFX_Shared_BrushedMetal;
UNITY_LOCATION(5) uniform mediump sampler2D _TextureSample1;
UNITY_LOCATION(6) uniform mediump sampler2D _HexTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat6;
vec2 u_xlat11;
vec2 u_xlat12;
mediump vec2 u_xlat16_12;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.0500000007, 0.0);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(4.0, 4.0) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_T_VFX_Shared_BrushedMetal, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _effecttexturetiling.xy + vec2(_effecttextureoffset.x, _effecttextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(0.0500000007, 0.0) + u_xlat1.xy;
    u_xlat11.xy = vs_TEXCOORD0.xy * _HexTiling.xy + vec2(_HexOffset.x, _HexOffset.y);
    u_xlat2.xy = u_xlat11.xy * vec2(_HexDensity);
    u_xlat12.xy = fract(u_xlat2.xy);
    u_xlat11.xy = u_xlat11.xy * vec2(_HexDensity) + (-u_xlat12.xy);
    u_xlat16_12.xy = texture(_HexRedirTex, u_xlat2.xy).xy;
    u_xlat11.xy = u_xlat11.xy + u_xlat16_12.xy;
    u_xlat11.xy = u_xlat11.xy / vec2(_HexDensity);
    u_xlat12.xy = vec2(_MaskTiling.x, _MaskTiling.y) / _HexTiling.xy;
    u_xlat3.xy = u_xlat11.xy * u_xlat12.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_4.xyz = texture(_EffectTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(-0.5, -0.5, -0.5) + u_xlat16_4.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _maintexturetiling.xy + vec2(_maintextureoffset.x, _maintextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(-0.0250000004, 0.0) + u_xlat1.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_3.xyz);
    u_xlat16_15 = texture(_TextureSample1, u_xlat2.xy).z;
    u_xlat16_1.xy = texture(_HexTex, u_xlat2.xy).yz;
    u_xlat0.xyz = vec3(u_xlat16_15) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Brightness);
    u_xlat4.xyz = u_xlat3.xyz * vec3(4.0, 4.0, 4.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + (-_GroutColor.xyz);
    u_xlat2.xy = vec2(_hexmasktiling.x, _hexmasktiling.y) * vec2(_hexmasktilingmult);
    u_xlat2.xy = vs_TEXCOORD0.xy * u_xlat2.xy + vec2(_hexmaskoffset.x, _hexmaskoffset.y);
    u_xlat11.xy = u_xlat11.xy * u_xlat12.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_MaskTex, u_xlat11.xy).xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat4.xyz + _GroutColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_GroutVisibility, _GroutVisibility, _GroutVisibility));
    u_xlat15 = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat15 = u_xlat15 * vs_TEXCOORD0.x;
    u_xlat15 = u_xlat15 * 4.13000011;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat15 = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + (-_RadialGradientSmoothstepMin);
    u_xlat11.x = (-_RadialGradientSmoothstepMin) + _RadialGradientSmoothstepMax;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat15 = u_xlat15 * u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat11.x * u_xlat15 + -1.0;
    u_xlat15 = u_xlat16_2.z * u_xlat15 + 1.0;
    u_xlat1.xz = u_xlat16_1.xx * u_xlat16_2.xy;
    u_xlat6.x = (-u_xlat16_1.y) + 1.0;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Brightness) + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat6.xyz = u_xlat1.zzz * _GreenColor.xyz;
    u_xlat1.xyz = _RedColor.xyz * u_xlat1.xxx + u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _RadialGradientSmoothstepMin;
uniform 	float _RadialGradientSmoothstepMax;
uniform 	vec2 _hexmasktiling;
uniform 	float _hexmasktilingmult;
uniform 	vec2 _hexmaskoffset;
uniform 	vec2 _HexTiling;
uniform 	vec2 _HexOffset;
uniform 	float _HexDensity;
uniform 	vec2 _MaskTiling;
uniform 	vec4 _GroutColor;
uniform 	vec2 _maintexturetiling;
uniform 	vec2 _maintextureoffset;
uniform 	vec2 _effecttexturetiling;
uniform 	vec2 _effecttextureoffset;
uniform 	float _Brightness;
uniform 	float _GroutVisibility;
uniform 	vec4 _RedColor;
uniform 	vec4 _GreenColor;
UNITY_LOCATION(0) uniform mediump sampler2D _HexRedirTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EffectTex;
UNITY_LOCATION(4) uniform mediump sampler2D _T_VFX_Shared_BrushedMetal;
UNITY_LOCATION(5) uniform mediump sampler2D _TextureSample1;
UNITY_LOCATION(6) uniform mediump sampler2D _HexTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat6;
vec2 u_xlat11;
vec2 u_xlat12;
mediump vec2 u_xlat16_12;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.0500000007, 0.0);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(4.0, 4.0) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_T_VFX_Shared_BrushedMetal, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _effecttexturetiling.xy + vec2(_effecttextureoffset.x, _effecttextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(0.0500000007, 0.0) + u_xlat1.xy;
    u_xlat11.xy = vs_TEXCOORD0.xy * _HexTiling.xy + vec2(_HexOffset.x, _HexOffset.y);
    u_xlat2.xy = u_xlat11.xy * vec2(_HexDensity);
    u_xlat12.xy = fract(u_xlat2.xy);
    u_xlat11.xy = u_xlat11.xy * vec2(_HexDensity) + (-u_xlat12.xy);
    u_xlat16_12.xy = texture(_HexRedirTex, u_xlat2.xy).xy;
    u_xlat11.xy = u_xlat11.xy + u_xlat16_12.xy;
    u_xlat11.xy = u_xlat11.xy / vec2(_HexDensity);
    u_xlat12.xy = vec2(_MaskTiling.x, _MaskTiling.y) / _HexTiling.xy;
    u_xlat3.xy = u_xlat11.xy * u_xlat12.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_4.xyz = texture(_EffectTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(-0.5, -0.5, -0.5) + u_xlat16_4.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _maintexturetiling.xy + vec2(_maintextureoffset.x, _maintextureoffset.y);
    u_xlat1.xy = _Time.yy * vec2(-0.0250000004, 0.0) + u_xlat1.xy;
    u_xlat1.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006) + u_xlat1.xy;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_3.xyz);
    u_xlat16_15 = texture(_TextureSample1, u_xlat2.xy).z;
    u_xlat16_1.xy = texture(_HexTex, u_xlat2.xy).yz;
    u_xlat0.xyz = vec3(u_xlat16_15) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Brightness);
    u_xlat4.xyz = u_xlat3.xyz * vec3(4.0, 4.0, 4.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + (-_GroutColor.xyz);
    u_xlat2.xy = vec2(_hexmasktiling.x, _hexmasktiling.y) * vec2(_hexmasktilingmult);
    u_xlat2.xy = vs_TEXCOORD0.xy * u_xlat2.xy + vec2(_hexmaskoffset.x, _hexmaskoffset.y);
    u_xlat11.xy = u_xlat11.xy * u_xlat12.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_MaskTex, u_xlat11.xy).xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat4.xyz + _GroutColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_GroutVisibility, _GroutVisibility, _GroutVisibility));
    u_xlat15 = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat15 = u_xlat15 * vs_TEXCOORD0.x;
    u_xlat15 = u_xlat15 * 4.13000011;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat15 = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + (-_RadialGradientSmoothstepMin);
    u_xlat11.x = (-_RadialGradientSmoothstepMin) + _RadialGradientSmoothstepMax;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat15 = u_xlat15 * u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat11.x * u_xlat15 + -1.0;
    u_xlat15 = u_xlat16_2.z * u_xlat15 + 1.0;
    u_xlat1.xz = u_xlat16_1.xx * u_xlat16_2.xy;
    u_xlat6.x = (-u_xlat16_1.y) + 1.0;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat4.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Brightness) + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat6.xyz = u_xlat1.zzz * _GreenColor.xyz;
    u_xlat1.xyz = _RedColor.xyz * u_xlat1.xxx + u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
""
}
}
}
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  Blend One One, One One
  ZWrite Off
  Cull Off
  GpuProgramID 94709
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD2.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" "SPOT" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" "SHADOWS_SOFT" "SPOT" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD2.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD0.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
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
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" "SPOT" }
""
}
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" "SHADOWS_SOFT" "SPOT" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
""
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
""
}
}
}
 Pass {
  Name "ShadowCaster"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  Cull Off
  GpuProgramID 181761
Program "vp" {
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SHADOWS_CUBE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 " {
Keywords { "SHADOWS_CUBE" }
""
}
}
}
}
Fallback "Diffuse"
CustomEditor "ASEMaterialInspector"
}