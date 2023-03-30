//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards_Grass_Plains_Grow" {
Properties {
_T_VFX_Fire_Gradient_BurnExpansion ("T_VFX_Fire_Gradient_BurnExpansion", 2D) = "white" { }
_Max ("Max", Float) = 0.01
_EdgePower ("Edge Power", Float) = 3
_EdgeColor ("Edge Color", Color) = (1,0.6002574,0.004716992,0)
_EdgeColorBrightness ("Edge Color Brightness", Float) = 46.23
_T_VFX_Shared_RenderClouds_Minimize ("T_VFX_Shared_RenderClouds_Minimize", 2D) = "white" { }
_add ("add", Float) = 0.3
_tiling ("tiling", Vector) = (1,1,0,0)
_pannerspeed ("panner speed", Vector) = (0,-0.1,0,0)
_opacitypower ("opacity power", Float) = 1
_undercolorbrightness ("under color brightness", Float) = 0.25
_GrassTiling ("Grass Tiling", Vector) = (3,3,0,0)
_DistortionTexture ("Distortion Texture", 2D) = "white" { }
_GrassTexture ("Grass Texture", 2D) = "white" { }
_GustsTexture ("Gusts Texture", 2D) = "white" { }
_grassalphaadd ("grass alpha add", Float) = 0.3
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
_GustsHighlightPower ("Gusts Highlight Power", Float) = 1
_GustsHighlightColor ("Gusts Highlight Color", Color) = (0.7173371,0.9811321,0.9075927,0)
_GustsHighlightIntensity ("Gusts Highlight Intensity", Float) = 1
_ExtraGlowTexture ("Extra Glow Texture", 2D) = "white" { }
_ExtraGlow1Tiling ("Extra Glow 1 Tiling ", Vector) = (1,1.2,0,0)
_ExtraGlow1Offset ("Extra Glow 1 Offset", Vector) = (0,0,0,0)
_ExtraGlow2Tiling ("Extra Glow 2 Tiling", Vector) = (0.5,2,0,0)
_ExtraGlow2Offset ("Extra Glow 2 Offset", Vector) = (0,0,0,0)
_ExtraGlow1Panning ("Extra Glow 1 Panning", Vector) = (-0.05,-0.25,0,0)
_ExtraGlow2Panning ("Extra Glow 2 Panning", Vector) = (0.05,-0.4,0,0)
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
  GpuProgramID 65506
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
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
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
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD4.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec2 _GrassTiling;
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
uniform 	float _undercolorbrightness;
uniform 	vec2 _ExtraGlow1Panning;
uniform 	vec2 _ExtraGlow1Tiling;
uniform 	vec2 _ExtraGlow1Offset;
uniform 	vec2 _ExtraGlow2Panning;
uniform 	vec2 _ExtraGlow2Tiling;
uniform 	vec2 _ExtraGlow2Offset;
uniform 	float _Max;
uniform 	float _grassalphaadd;
uniform 	vec4 _T_VFX_Fire_Gradient_BurnExpansion_ST;
uniform 	vec2 _pannerspeed;
uniform 	vec2 _tiling;
uniform 	float _add;
uniform 	float _EdgePower;
uniform 	vec4 _EdgeColor;
uniform 	float _EdgeColorBrightness;
uniform 	float _GustsHighlightPower;
uniform 	vec4 _GustsHighlightColor;
uniform 	float _GustsHighlightIntensity;
uniform 	float _opacitypower;
UNITY_LOCATION(0) uniform mediump sampler2D _GustsMask;
UNITY_LOCATION(1) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _GustsTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GrassTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _T_VFX_Fire_Gradient_BurnExpansion;
UNITY_LOCATION(5) uniform mediump sampler2D _T_VFX_Shared_RenderClouds_Minimize;
UNITY_LOCATION(6) uniform mediump sampler2D _ExtraGlowTexture;
UNITY_LOCATION(7) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(8) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
bvec3 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
float u_xlat11;
vec3 u_xlat17;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
vec2 u_xlat24;
mediump vec2 u_xlat16_24;
vec2 u_xlat26;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat35;
bool u_xlatb35;
mediump float u_xlat16_42;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DistortionTiling.xy + vec2(_DistortionOffset.x, _DistortionOffset.y);
    u_xlat2.xy = _Time.yy * vec2(_DistortionPanning.x, _DistortionPanning.y) + u_xlat2.xy;
    u_xlat24.xy = vs_TEXCOORD0.xy * _GustDistortionTiling.xy + vec2(_GustDistortionOffset.x, _GustDistortionOffset.y);
    u_xlat24.xy = _Time.yy * vec2(_GustDistortionPanning.x, _GustDistortionPanning.y) + u_xlat24.xy;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GustsMaskTiling.xx + vec2(_GustsMaskOffset.x, _GustsMaskOffset.y);
    u_xlat3.xy = _Time.yy * vec2(_GustsMaskPanning.x, _GustsMaskPanning.y) + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_GustsMask, u_xlat3.xy).xyz;
    u_xlat16_2.xy = texture(_DistortionTexture, u_xlat2.xy).xy;
    u_xlat2.xy = u_xlat16_2.xy * vec2(_GrassWavyAmount);
    u_xlat16_24.xy = texture(_GustsTexture, u_xlat24.xy).xy;
    u_xlat4.xy = log2(u_xlat16_3.xy);
    u_xlat4.xy = u_xlat4.xy * vec2(_GustsMaskPower);
    u_xlat4.xy = exp2(u_xlat4.xy);
    u_xlat24.xy = u_xlat16_24.xy * vec2(_GrassGustsIntensity) + (-u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy * u_xlat24.xy + u_xlat2.xy;
    u_xlat2.xy = vs_TEXCOORD0.xy * _GrassTiling.xy + u_xlat2.xy;
    u_xlat24.xy = vs_TEXCOORD0.xy * _ExtraGlow1Tiling.xy + vec2(_ExtraGlow1Offset.x, _ExtraGlow1Offset.y);
    u_xlat24.xy = _Time.yy * vec2(_ExtraGlow1Panning.x, _ExtraGlow1Panning.y) + u_xlat24.xy;
    u_xlat4.xy = vs_TEXCOORD0.xy * vec2(_ExtraGlow2Tiling.x, _ExtraGlow2Tiling.y) + _ExtraGlow2Offset.xy;
    u_xlat4.xy = _Time.yy * _ExtraGlow2Panning.xy + u_xlat4.xy;
    u_xlat16_5 = texture(_GrassTexture, u_xlat2.xy);
    u_xlat2.xy = vs_TEXCOORD0.xy * _T_VFX_Fire_Gradient_BurnExpansion_ST.xy + _T_VFX_Fire_Gradient_BurnExpansion_ST.zw;
    u_xlat26.xy = vs_TEXCOORD0.xy * vec2(_tiling.x, _tiling.y);
    u_xlat26.xy = _Time.yy * _pannerspeed.xy + u_xlat26.xy;
    u_xlat34 = u_xlat16_5.w + _grassalphaadd;
    u_xlat16_6.xyz = texture(_T_VFX_Fire_Gradient_BurnExpansion, u_xlat2.xy).xyz;
    u_xlat16_7.xyz = texture(_T_VFX_Shared_RenderClouds_Minimize, u_xlat26.xy).xyz;
    u_xlat7.xyz = u_xlat16_7.xyz + vec3(_add);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat7.xyz;
    u_xlat6.xyz = vec3(u_xlat34) * u_xlat6.xyz + (-vs_TEXCOORD1.zzz);
    u_xlat34 = float(1.0) / _Max;
    u_xlat6.xyz = vec3(u_xlat34) * u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat6.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat8.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat6.xyz = (-u_xlat7.xyz) * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = u_xlat6.xyz * u_xlat8.xyz;
    u_xlat17.xyz = log2(u_xlat17.xyz);
    u_xlat17.xyz = u_xlat17.xyz * vec3(vec3(_EdgePower, _EdgePower, _EdgePower));
    u_xlat17.xyz = exp2(u_xlat17.xyz);
    u_xlat17.xyz = min(u_xlat17.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat7.xyz = u_xlat17.xyz * _EdgeColor.xyz;
    u_xlat16_34 = texture(_ExtraGlowTexture, u_xlat24.xy).x;
    u_xlat16_2.x = texture(_ExtraGlowTexture, u_xlat4.xy).x;
    u_xlat34 = u_xlat16_34 * u_xlat16_2.x;
    u_xlat34 = u_xlat34 * 0.318471313;
    u_xlat34 = log2(u_xlat34);
    u_xlat34 = u_xlat34 * 4.19999981;
    u_xlat34 = exp2(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * vec3(128.0, 128.0, 128.0) + u_xlat17.xyz;
    u_xlat34 = u_xlat16_5.w * u_xlat16_5.w;
    u_xlat34 = u_xlat34 * u_xlat16_5.w;
    u_xlat2.xyz = vec3(u_xlat34) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _EdgeColor.xyz + u_xlat7.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_EdgeColorBrightness);
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(vec3(_undercolorbrightness, _undercolorbrightness, _undercolorbrightness)) + u_xlat2.xyz;
    u_xlat3.xyz = log2(u_xlat16_3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_GustsHighlightPower, _GustsHighlightPower, _GustsHighlightPower));
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * _GustsHighlightColor.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_GustsHighlightIntensity);
    u_xlat2.xyz = u_xlat16_5.www * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat7.xyz * vec3(_EdgeColorBrightness);
    u_xlat34 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat35 = log2(u_xlat6.x);
    u_xlat35 = u_xlat35 * _opacitypower;
    u_xlat35 = exp2(u_xlat35);
    u_xlat34 = u_xlat34 + u_xlat35;
    u_xlat34 = min(u_xlat34, 1.0);
    u_xlat16_9.x = dot((-u_xlat1.xyz), vs_TEXCOORD2.xyz);
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_9.xyz = vs_TEXCOORD2.xyz * (-u_xlat16_9.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat3.xyz = vec3(u_xlat35) * u_xlat16_9.xyz;
        u_xlat4.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat4.xyz = u_xlat4.xyz / u_xlat3.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat3.xyz;
        u_xlatb6.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat4;
            hlslcc_movcTemp.x = (u_xlatb6.x) ? u_xlat4.x : u_xlat5.x;
            hlslcc_movcTemp.y = (u_xlatb6.y) ? u_xlat4.y : u_xlat5.y;
            hlslcc_movcTemp.z = (u_xlatb6.z) ? u_xlat4.z : u_xlat5.z;
            u_xlat4 = hlslcc_movcTemp;
        }
        u_xlat35 = min(u_xlat4.y, u_xlat4.x);
        u_xlat35 = min(u_xlat4.z, u_xlat35);
        u_xlat4.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat35) + u_xlat4.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_9.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 6.0);
    u_xlat16_42 = u_xlat16_3.w + -1.0;
    u_xlat16_42 = unity_SpecCube0_HDR.w * u_xlat16_42 + 1.0;
    u_xlat16_42 = log2(u_xlat16_42);
    u_xlat16_42 = u_xlat16_42 * unity_SpecCube0_HDR.y;
    u_xlat16_42 = exp2(u_xlat16_42);
    u_xlat16_42 = u_xlat16_42 * unity_SpecCube0_HDR.x;
    u_xlat16_10.xyz = u_xlat16_3.xyz * vec3(u_xlat16_42);
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb35 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb35){
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb35 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb35){
            u_xlat35 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
            u_xlat35 = inversesqrt(u_xlat35);
            u_xlat4.xyz = vec3(u_xlat35) * u_xlat16_9.xyz;
            u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat5.xyz = u_xlat5.xyz / u_xlat4.xyz;
            u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat6.xyz = u_xlat6.xyz / u_xlat4.xyz;
            u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat5;
                hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat5.x : u_xlat6.x;
                hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat5.y : u_xlat6.y;
                hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat5.z : u_xlat6.z;
                u_xlat5 = hlslcc_movcTemp;
            }
            u_xlat35 = min(u_xlat5.y, u_xlat5.x);
            u_xlat35 = min(u_xlat5.z, u_xlat35);
            u_xlat5.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat35) + u_xlat5.xyz;
        } else {
            u_xlat4.xyz = u_xlat16_9.xyz;
        }
        u_xlat16_4 = textureLod(unity_SpecCube1, u_xlat4.xyz, 6.0);
        u_xlat16_9.x = u_xlat16_4.w + -1.0;
        u_xlat16_9.x = unity_SpecCube1_HDR.w * u_xlat16_9.x + 1.0;
        u_xlat16_9.x = log2(u_xlat16_9.x);
        u_xlat16_9.x = u_xlat16_9.x * unity_SpecCube1_HDR.y;
        u_xlat16_9.x = exp2(u_xlat16_9.x);
        u_xlat16_9.x = u_xlat16_9.x * unity_SpecCube1_HDR.x;
        u_xlat16_9.xyz = u_xlat16_4.xyz * u_xlat16_9.xxx;
        u_xlat3.xyz = vec3(u_xlat16_42) * u_xlat16_3.xyz + (-u_xlat16_9.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_9.xyz;
        u_xlat16_10.xyz = u_xlat10.xyz;
    }
    u_xlat35 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat3.xyz = vec3(u_xlat35) * vs_TEXCOORD2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33) + _WorldSpaceLightPos0.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = max(u_xlat33, 0.00100000005);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat11 = abs(u_xlat33) + u_xlat1.x;
    u_xlat11 = u_xlat11 + 9.99999975e-06;
    u_xlat11 = 0.5 / u_xlat11;
    u_xlat11 = u_xlat1.x * u_xlat11;
    u_xlat11 = u_xlat11 * 0.999999881;
    u_xlat1.xyz = vec3(u_xlat11) * _LightColor0.xyz;
    u_xlat16_9.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_20.x;
    u_xlat16_9.x = u_xlat16_9.x * 0.959999979 + 0.0399999991;
    u_xlat16_20.xyz = u_xlat16_10.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_10.x = -abs(u_xlat33) + 1.0;
    u_xlat16_21 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_21;
    u_xlat16_10.x = u_xlat16_10.x * 2.23517418e-08 + 0.0399999991;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_10.xxx;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_9.xxx + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat34;
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
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
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
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD4.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec2 _GrassTiling;
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
uniform 	float _undercolorbrightness;
uniform 	vec2 _ExtraGlow1Panning;
uniform 	vec2 _ExtraGlow1Tiling;
uniform 	vec2 _ExtraGlow1Offset;
uniform 	vec2 _ExtraGlow2Panning;
uniform 	vec2 _ExtraGlow2Tiling;
uniform 	vec2 _ExtraGlow2Offset;
uniform 	float _Max;
uniform 	float _grassalphaadd;
uniform 	vec4 _T_VFX_Fire_Gradient_BurnExpansion_ST;
uniform 	vec2 _pannerspeed;
uniform 	vec2 _tiling;
uniform 	float _add;
uniform 	float _EdgePower;
uniform 	vec4 _EdgeColor;
uniform 	float _EdgeColorBrightness;
uniform 	float _GustsHighlightPower;
uniform 	vec4 _GustsHighlightColor;
uniform 	float _GustsHighlightIntensity;
uniform 	float _opacitypower;
UNITY_LOCATION(0) uniform mediump sampler2D _GustsMask;
UNITY_LOCATION(1) uniform mediump sampler2D _DistortionTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _GustsTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _GrassTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _T_VFX_Fire_Gradient_BurnExpansion;
UNITY_LOCATION(5) uniform mediump sampler2D _T_VFX_Shared_RenderClouds_Minimize;
UNITY_LOCATION(6) uniform mediump sampler2D _ExtraGlowTexture;
UNITY_LOCATION(7) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(8) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
bvec3 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
float u_xlat11;
vec3 u_xlat17;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
vec2 u_xlat24;
mediump vec2 u_xlat16_24;
vec2 u_xlat26;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat35;
bool u_xlatb35;
mediump float u_xlat16_42;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _DistortionTiling.xy + vec2(_DistortionOffset.x, _DistortionOffset.y);
    u_xlat2.xy = _Time.yy * vec2(_DistortionPanning.x, _DistortionPanning.y) + u_xlat2.xy;
    u_xlat24.xy = vs_TEXCOORD0.xy * _GustDistortionTiling.xy + vec2(_GustDistortionOffset.x, _GustDistortionOffset.y);
    u_xlat24.xy = _Time.yy * vec2(_GustDistortionPanning.x, _GustDistortionPanning.y) + u_xlat24.xy;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GustsMaskTiling.xx + vec2(_GustsMaskOffset.x, _GustsMaskOffset.y);
    u_xlat3.xy = _Time.yy * vec2(_GustsMaskPanning.x, _GustsMaskPanning.y) + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_GustsMask, u_xlat3.xy).xyz;
    u_xlat16_2.xy = texture(_DistortionTexture, u_xlat2.xy).xy;
    u_xlat2.xy = u_xlat16_2.xy * vec2(_GrassWavyAmount);
    u_xlat16_24.xy = texture(_GustsTexture, u_xlat24.xy).xy;
    u_xlat4.xy = log2(u_xlat16_3.xy);
    u_xlat4.xy = u_xlat4.xy * vec2(_GustsMaskPower);
    u_xlat4.xy = exp2(u_xlat4.xy);
    u_xlat24.xy = u_xlat16_24.xy * vec2(_GrassGustsIntensity) + (-u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy * u_xlat24.xy + u_xlat2.xy;
    u_xlat2.xy = vs_TEXCOORD0.xy * _GrassTiling.xy + u_xlat2.xy;
    u_xlat24.xy = vs_TEXCOORD0.xy * _ExtraGlow1Tiling.xy + vec2(_ExtraGlow1Offset.x, _ExtraGlow1Offset.y);
    u_xlat24.xy = _Time.yy * vec2(_ExtraGlow1Panning.x, _ExtraGlow1Panning.y) + u_xlat24.xy;
    u_xlat4.xy = vs_TEXCOORD0.xy * vec2(_ExtraGlow2Tiling.x, _ExtraGlow2Tiling.y) + _ExtraGlow2Offset.xy;
    u_xlat4.xy = _Time.yy * _ExtraGlow2Panning.xy + u_xlat4.xy;
    u_xlat16_5 = texture(_GrassTexture, u_xlat2.xy);
    u_xlat2.xy = vs_TEXCOORD0.xy * _T_VFX_Fire_Gradient_BurnExpansion_ST.xy + _T_VFX_Fire_Gradient_BurnExpansion_ST.zw;
    u_xlat26.xy = vs_TEXCOORD0.xy * vec2(_tiling.x, _tiling.y);
    u_xlat26.xy = _Time.yy * _pannerspeed.xy + u_xlat26.xy;
    u_xlat34 = u_xlat16_5.w + _grassalphaadd;
    u_xlat16_6.xyz = texture(_T_VFX_Fire_Gradient_BurnExpansion, u_xlat2.xy).xyz;
    u_xlat16_7.xyz = texture(_T_VFX_Shared_RenderClouds_Minimize, u_xlat26.xy).xyz;
    u_xlat7.xyz = u_xlat16_7.xyz + vec3(_add);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat7.xyz;
    u_xlat6.xyz = vec3(u_xlat34) * u_xlat6.xyz + (-vs_TEXCOORD1.zzz);
    u_xlat34 = float(1.0) / _Max;
    u_xlat6.xyz = vec3(u_xlat34) * u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat6.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat6.xyz;
    u_xlat8.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat6.xyz = (-u_xlat7.xyz) * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = u_xlat6.xyz * u_xlat8.xyz;
    u_xlat17.xyz = log2(u_xlat17.xyz);
    u_xlat17.xyz = u_xlat17.xyz * vec3(vec3(_EdgePower, _EdgePower, _EdgePower));
    u_xlat17.xyz = exp2(u_xlat17.xyz);
    u_xlat17.xyz = min(u_xlat17.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat7.xyz = u_xlat17.xyz * _EdgeColor.xyz;
    u_xlat16_34 = texture(_ExtraGlowTexture, u_xlat24.xy).x;
    u_xlat16_2.x = texture(_ExtraGlowTexture, u_xlat4.xy).x;
    u_xlat34 = u_xlat16_34 * u_xlat16_2.x;
    u_xlat34 = u_xlat34 * 0.318471313;
    u_xlat34 = log2(u_xlat34);
    u_xlat34 = u_xlat34 * 4.19999981;
    u_xlat34 = exp2(u_xlat34);
    u_xlat2.xyz = vec3(u_xlat34) * vec3(128.0, 128.0, 128.0) + u_xlat17.xyz;
    u_xlat34 = u_xlat16_5.w * u_xlat16_5.w;
    u_xlat34 = u_xlat34 * u_xlat16_5.w;
    u_xlat2.xyz = vec3(u_xlat34) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _EdgeColor.xyz + u_xlat7.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_EdgeColorBrightness);
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(vec3(_undercolorbrightness, _undercolorbrightness, _undercolorbrightness)) + u_xlat2.xyz;
    u_xlat3.xyz = log2(u_xlat16_3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_GustsHighlightPower, _GustsHighlightPower, _GustsHighlightPower));
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * _GustsHighlightColor.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_GustsHighlightIntensity);
    u_xlat2.xyz = u_xlat16_5.www * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat7.xyz * vec3(_EdgeColorBrightness);
    u_xlat34 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat35 = log2(u_xlat6.x);
    u_xlat35 = u_xlat35 * _opacitypower;
    u_xlat35 = exp2(u_xlat35);
    u_xlat34 = u_xlat34 + u_xlat35;
    u_xlat34 = min(u_xlat34, 1.0);
    u_xlat16_9.x = dot((-u_xlat1.xyz), vs_TEXCOORD2.xyz);
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_9.xyz = vs_TEXCOORD2.xyz * (-u_xlat16_9.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat3.xyz = vec3(u_xlat35) * u_xlat16_9.xyz;
        u_xlat4.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat4.xyz = u_xlat4.xyz / u_xlat3.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat3.xyz;
        u_xlatb6.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat4;
            hlslcc_movcTemp.x = (u_xlatb6.x) ? u_xlat4.x : u_xlat5.x;
            hlslcc_movcTemp.y = (u_xlatb6.y) ? u_xlat4.y : u_xlat5.y;
            hlslcc_movcTemp.z = (u_xlatb6.z) ? u_xlat4.z : u_xlat5.z;
            u_xlat4 = hlslcc_movcTemp;
        }
        u_xlat35 = min(u_xlat4.y, u_xlat4.x);
        u_xlat35 = min(u_xlat4.z, u_xlat35);
        u_xlat4.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat35) + u_xlat4.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_9.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 6.0);
    u_xlat16_42 = u_xlat16_3.w + -1.0;
    u_xlat16_42 = unity_SpecCube0_HDR.w * u_xlat16_42 + 1.0;
    u_xlat16_42 = log2(u_xlat16_42);
    u_xlat16_42 = u_xlat16_42 * unity_SpecCube0_HDR.y;
    u_xlat16_42 = exp2(u_xlat16_42);
    u_xlat16_42 = u_xlat16_42 * unity_SpecCube0_HDR.x;
    u_xlat16_10.xyz = u_xlat16_3.xyz * vec3(u_xlat16_42);
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb35 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb35){
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb35 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb35){
            u_xlat35 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
            u_xlat35 = inversesqrt(u_xlat35);
            u_xlat4.xyz = vec3(u_xlat35) * u_xlat16_9.xyz;
            u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat5.xyz = u_xlat5.xyz / u_xlat4.xyz;
            u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat6.xyz = u_xlat6.xyz / u_xlat4.xyz;
            u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat5;
                hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat5.x : u_xlat6.x;
                hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat5.y : u_xlat6.y;
                hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat5.z : u_xlat6.z;
                u_xlat5 = hlslcc_movcTemp;
            }
            u_xlat35 = min(u_xlat5.y, u_xlat5.x);
            u_xlat35 = min(u_xlat5.z, u_xlat35);
            u_xlat5.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat35) + u_xlat5.xyz;
        } else {
            u_xlat4.xyz = u_xlat16_9.xyz;
        }
        u_xlat16_4 = textureLod(unity_SpecCube1, u_xlat4.xyz, 6.0);
        u_xlat16_9.x = u_xlat16_4.w + -1.0;
        u_xlat16_9.x = unity_SpecCube1_HDR.w * u_xlat16_9.x + 1.0;
        u_xlat16_9.x = log2(u_xlat16_9.x);
        u_xlat16_9.x = u_xlat16_9.x * unity_SpecCube1_HDR.y;
        u_xlat16_9.x = exp2(u_xlat16_9.x);
        u_xlat16_9.x = u_xlat16_9.x * unity_SpecCube1_HDR.x;
        u_xlat16_9.xyz = u_xlat16_4.xyz * u_xlat16_9.xxx;
        u_xlat3.xyz = vec3(u_xlat16_42) * u_xlat16_3.xyz + (-u_xlat16_9.xyz);
        u_xlat10.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_9.xyz;
        u_xlat16_10.xyz = u_xlat10.xyz;
    }
    u_xlat35 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat3.xyz = vec3(u_xlat35) * vs_TEXCOORD2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33) + _WorldSpaceLightPos0.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = max(u_xlat33, 0.00100000005);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat11 = abs(u_xlat33) + u_xlat1.x;
    u_xlat11 = u_xlat11 + 9.99999975e-06;
    u_xlat11 = 0.5 / u_xlat11;
    u_xlat11 = u_xlat1.x * u_xlat11;
    u_xlat11 = u_xlat11 * 0.999999881;
    u_xlat1.xyz = vec3(u_xlat11) * _LightColor0.xyz;
    u_xlat16_9.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_20.x;
    u_xlat16_9.x = u_xlat16_9.x * 0.959999979 + 0.0399999991;
    u_xlat16_20.xyz = u_xlat16_10.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_10.x = -abs(u_xlat33) + 1.0;
    u_xlat16_21 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_21;
    u_xlat16_10.x = u_xlat16_10.x * 2.23517418e-08 + 0.0399999991;
    u_xlat16_20.xyz = u_xlat16_20.xyz * u_xlat16_10.xxx;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_9.xxx + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat34;
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