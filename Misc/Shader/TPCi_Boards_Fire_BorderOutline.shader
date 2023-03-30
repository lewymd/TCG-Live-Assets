//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards_Fire_BorderOutline" {
Properties {
_T_VFX_Shared_RenderClouds_Minimize_2 ("T_VFX_Shared_RenderClouds_Minimize_2", 2D) = "white" { }
_TextureSample0 ("Texture Sample 0", 2D) = "white" { }
_cloudstiling ("clouds tiling", Vector) = (3,1.5,0,0)
_clouds2tiling ("clouds 2 tiling", Vector) = (9,1.3,0,0)
_cloudspanning ("clouds panning", Vector) = (0,-0.2,0,0)
_clouds2panning ("clouds 2 panning", Vector) = (0,-0.15,0,0)
_ExteriorfireColor2 ("Exterior fire Color 2", Color) = (1,0.1558442,0,0)
_ExteriorfireColor1 ("Exterior fire Color 1", Color) = (0.6039216,0.09411765,0,0)
_InteriorFireColor ("Interior Fire Color", Color) = (1,0.3544242,0,0)
_colorlerppower ("color lerp power", Float) = 2
_colorlerpmult ("color lerp mult", Float) = 2
_smoothstepmin ("smoothstep min", Float) = 0
_smoothstepmax ("smoothstep max", Float) = 0.025
_vertexcolormultiplier ("vertex color multiplier", Float) = 1
_cloudsadd ("clouds add", Float) = 0.1
_emissivebrightness ("emissive brightness", Float) = 1
_colorlerpsmoothstepmin ("color lerp smoothstep min", Float) = 0
_colorlerpsmoothstepmax ("color lerp smoothstep max", Float) = 0.01
_emissiveedgefollowintensity ("emissive edge follow intensity", Float) = 12
_FireEdgeTravelColor ("Fire Edge Travel Color", Color) = (1,0.8753488,0.08962262,0)
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
  GpuProgramID 55691
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
uniform 	vec4 _ExteriorfireColor1;
uniform 	vec4 _ExteriorfireColor2;
uniform 	vec4 _InteriorFireColor;
uniform 	float _colorlerpsmoothstepmin;
uniform 	float _colorlerpsmoothstepmax;
uniform 	float _vertexcolormultiplier;
uniform 	vec2 _cloudspanning;
uniform 	vec2 _cloudstiling;
uniform 	vec2 _clouds2panning;
uniform 	vec2 _clouds2tiling;
uniform 	float _cloudsadd;
uniform 	float _colorlerppower;
uniform 	float _colorlerpmult;
uniform 	float _emissivebrightness;
uniform 	vec4 _FireEdgeTravelColor;
uniform 	float _emissiveedgefollowintensity;
uniform 	float _smoothstepmin;
uniform 	float _smoothstepmax;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_Shared_RenderClouds_Minimize_2;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bvec3 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bvec3 u_xlatb9;
float u_xlat10;
float u_xlat13;
mediump vec3 u_xlat16_16;
mediump float u_xlat16_18;
float u_xlat23;
float u_xlat30;
float u_xlat31;
float u_xlat32;
bool u_xlatb32;
float u_xlat33;
mediump float u_xlat16_36;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xyz = (-_ExteriorfireColor1.xyz) + _ExteriorfireColor2.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.yyy * u_xlat2.xyz + _ExteriorfireColor1.xyz;
    u_xlat3.xy = (-vs_TEXCOORD0.yx) + vec2(1.0, 1.0);
    u_xlat31 = u_xlat3.x * _vertexcolormultiplier;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat3.xz = vs_TEXCOORD0.xy * vec2(_cloudstiling.x, _cloudstiling.y);
    u_xlat3.xz = _Time.yy * _cloudspanning.xy + u_xlat3.xz;
    u_xlat4.xy = vs_TEXCOORD0.xy * vec2(_clouds2tiling.x, _clouds2tiling.y);
    u_xlat4.xy = _Time.yy * _clouds2panning.xy + u_xlat4.xy;
    u_xlat16_3.xzw = texture(_T_VFX_Shared_RenderClouds_Minimize_2, u_xlat3.xz).xyz;
    u_xlat16_4.xyz = texture(_TextureSample0, u_xlat4.xy).xyz;
    u_xlat3.xzw = u_xlat16_3.xzw * u_xlat16_4.xyz + vec3(_cloudsadd);
    u_xlat3.xzw = vec3(u_xlat31) * u_xlat3.xzw;
    u_xlat4.xyz = log2(u_xlat3.xzw);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_colorlerppower, _colorlerppower, _colorlerppower));
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_colorlerpmult, _colorlerpmult, _colorlerpmult)) + (-vec3(_colorlerpsmoothstepmin));
    u_xlat31 = float(1.0) / _colorlerpsmoothstepmax;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = min(u_xlat4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat5.xyz = (-u_xlat2.xyz) + _InteriorFireColor.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat31 = vs_TEXCOORD1.z * _emissivebrightness;
    u_xlat32 = vs_TEXCOORD1.w * 15.0;
    u_xlat23 = log2(vs_TEXCOORD0.x);
    u_xlat23 = u_xlat32 * u_xlat23;
    u_xlat23 = exp2(u_xlat23);
    u_xlat13 = log2(u_xlat3.y);
    u_xlat32 = u_xlat32 * u_xlat13;
    u_xlat32 = exp2(u_xlat32);
    u_xlat32 = u_xlat32 + u_xlat23;
    u_xlat32 = (-u_xlat32) * 4.0 + 1.0;
    u_xlat13 = max(u_xlat32, 0.0);
    u_xlat23 = u_xlat13 * -2.0 + 3.0;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat33 = u_xlat13 * u_xlat23;
    u_xlat32 = u_xlat23 * u_xlat13 + (-u_xlat32);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat13 = u_xlat32 * u_xlat32;
    u_xlat32 = u_xlat32 * u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlat32 = min(max(u_xlat32, 0.0), 1.0);
#else
    u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
#endif
    u_xlat32 = u_xlat32 * _emissiveedgefollowintensity;
    u_xlat4.xyz = vec3(u_xlat32) * _FireEdgeTravelColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat31) + u_xlat4.xyz;
    u_xlat31 = min(u_xlat33, 1.0);
    u_xlat31 = u_xlat3.x * u_xlat31 + (-_smoothstepmin);
    u_xlat32 = float(1.0) / _smoothstepmax;
    u_xlat31 = u_xlat31 * u_xlat32;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat32 = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat32;
    u_xlat16_6.x = dot((-u_xlat1.xyz), vs_TEXCOORD2.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_6.xyz = vs_TEXCOORD2.xyz * (-u_xlat16_6.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb32 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb32){
        u_xlat32 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
        u_xlat32 = inversesqrt(u_xlat32);
        u_xlat3.xyz = vec3(u_xlat32) * u_xlat16_6.xyz;
        u_xlat4.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat4.xyz = u_xlat4.xyz / u_xlat3.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat3.xyz;
        u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat4;
            hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat4.x : u_xlat5.x;
            hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat4.y : u_xlat5.y;
            hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat4.z : u_xlat5.z;
            u_xlat4 = hlslcc_movcTemp;
        }
        u_xlat32 = min(u_xlat4.y, u_xlat4.x);
        u_xlat32 = min(u_xlat4.z, u_xlat32);
        u_xlat4.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat32) + u_xlat4.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_6.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 6.0);
    u_xlat16_36 = u_xlat16_3.w + -1.0;
    u_xlat16_36 = unity_SpecCube0_HDR.w * u_xlat16_36 + 1.0;
    u_xlat16_36 = log2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * unity_SpecCube0_HDR.y;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * unity_SpecCube0_HDR.x;
    u_xlat16_8.xyz = u_xlat16_3.xyz * vec3(u_xlat16_36);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb32 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb32){
#ifdef UNITY_ADRENO_ES3
        u_xlatb32 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb32 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb32){
            u_xlat32 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
            u_xlat32 = inversesqrt(u_xlat32);
            u_xlat4.xyz = vec3(u_xlat32) * u_xlat16_6.xyz;
            u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat5.xyz = u_xlat5.xyz / u_xlat4.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat4.xyz;
            u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat5;
                hlslcc_movcTemp.x = (u_xlatb9.x) ? u_xlat5.x : u_xlat7.x;
                hlslcc_movcTemp.y = (u_xlatb9.y) ? u_xlat5.y : u_xlat7.y;
                hlslcc_movcTemp.z = (u_xlatb9.z) ? u_xlat5.z : u_xlat7.z;
                u_xlat5 = hlslcc_movcTemp;
            }
            u_xlat32 = min(u_xlat5.y, u_xlat5.x);
            u_xlat32 = min(u_xlat5.z, u_xlat32);
            u_xlat5.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat32) + u_xlat5.xyz;
        } else {
            u_xlat4.xyz = u_xlat16_6.xyz;
        }
        u_xlat16_4 = textureLod(unity_SpecCube1, u_xlat4.xyz, 6.0);
        u_xlat16_6.x = u_xlat16_4.w + -1.0;
        u_xlat16_6.x = unity_SpecCube1_HDR.w * u_xlat16_6.x + 1.0;
        u_xlat16_6.x = log2(u_xlat16_6.x);
        u_xlat16_6.x = u_xlat16_6.x * unity_SpecCube1_HDR.y;
        u_xlat16_6.x = exp2(u_xlat16_6.x);
        u_xlat16_6.x = u_xlat16_6.x * unity_SpecCube1_HDR.x;
        u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xxx;
        u_xlat3.xyz = vec3(u_xlat16_36) * u_xlat16_3.xyz + (-u_xlat16_6.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_6.xyz;
        u_xlat16_8.xyz = u_xlat8.xyz;
    }
    u_xlat32 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * vs_TEXCOORD2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 0.00100000005);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat30 = dot(u_xlat3.xyz, u_xlat1.xyz);
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
    u_xlat10 = abs(u_xlat30) + u_xlat1.x;
    u_xlat10 = u_xlat10 + 9.99999975e-06;
    u_xlat10 = 0.5 / u_xlat10;
    u_xlat10 = u_xlat1.x * u_xlat10;
    u_xlat10 = u_xlat10 * 0.999999881;
    u_xlat1.xyz = vec3(u_xlat10) * _LightColor0.xyz;
    u_xlat16_6.x = (-u_xlat0.x) + 1.0;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_16.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_16.x;
    u_xlat16_6.x = u_xlat16_6.x * 0.959999979 + 0.0399999991;
    u_xlat16_16.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_8.x = -abs(u_xlat30) + 1.0;
    u_xlat16_18 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_18;
    u_xlat16_8.x = u_xlat16_8.x * 2.23517418e-08 + 0.0399999991;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_8.xxx;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_6.xxx + u_xlat16_16.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat31;
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
uniform 	vec4 _ExteriorfireColor1;
uniform 	vec4 _ExteriorfireColor2;
uniform 	vec4 _InteriorFireColor;
uniform 	float _colorlerpsmoothstepmin;
uniform 	float _colorlerpsmoothstepmax;
uniform 	float _vertexcolormultiplier;
uniform 	vec2 _cloudspanning;
uniform 	vec2 _cloudstiling;
uniform 	vec2 _clouds2panning;
uniform 	vec2 _clouds2tiling;
uniform 	float _cloudsadd;
uniform 	float _colorlerppower;
uniform 	float _colorlerpmult;
uniform 	float _emissivebrightness;
uniform 	vec4 _FireEdgeTravelColor;
uniform 	float _emissiveedgefollowintensity;
uniform 	float _smoothstepmin;
uniform 	float _smoothstepmax;
UNITY_LOCATION(0) uniform mediump sampler2D _T_VFX_Shared_RenderClouds_Minimize_2;
UNITY_LOCATION(1) uniform mediump sampler2D _TextureSample0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bvec3 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bvec3 u_xlatb9;
float u_xlat10;
float u_xlat13;
mediump vec3 u_xlat16_16;
mediump float u_xlat16_18;
float u_xlat23;
float u_xlat30;
float u_xlat31;
float u_xlat32;
bool u_xlatb32;
float u_xlat33;
mediump float u_xlat16_36;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xyz = (-_ExteriorfireColor1.xyz) + _ExteriorfireColor2.xyz;
    u_xlat2.xyz = vs_TEXCOORD0.yyy * u_xlat2.xyz + _ExteriorfireColor1.xyz;
    u_xlat3.xy = (-vs_TEXCOORD0.yx) + vec2(1.0, 1.0);
    u_xlat31 = u_xlat3.x * _vertexcolormultiplier;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat3.xz = vs_TEXCOORD0.xy * vec2(_cloudstiling.x, _cloudstiling.y);
    u_xlat3.xz = _Time.yy * _cloudspanning.xy + u_xlat3.xz;
    u_xlat4.xy = vs_TEXCOORD0.xy * vec2(_clouds2tiling.x, _clouds2tiling.y);
    u_xlat4.xy = _Time.yy * _clouds2panning.xy + u_xlat4.xy;
    u_xlat16_3.xzw = texture(_T_VFX_Shared_RenderClouds_Minimize_2, u_xlat3.xz).xyz;
    u_xlat16_4.xyz = texture(_TextureSample0, u_xlat4.xy).xyz;
    u_xlat3.xzw = u_xlat16_3.xzw * u_xlat16_4.xyz + vec3(_cloudsadd);
    u_xlat3.xzw = vec3(u_xlat31) * u_xlat3.xzw;
    u_xlat4.xyz = log2(u_xlat3.xzw);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_colorlerppower, _colorlerppower, _colorlerppower));
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_colorlerpmult, _colorlerpmult, _colorlerpmult)) + (-vec3(_colorlerpsmoothstepmin));
    u_xlat31 = float(1.0) / _colorlerpsmoothstepmax;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = min(u_xlat4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat5.xyz = (-u_xlat2.xyz) + _InteriorFireColor.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat31 = vs_TEXCOORD1.z * _emissivebrightness;
    u_xlat32 = vs_TEXCOORD1.w * 15.0;
    u_xlat23 = log2(vs_TEXCOORD0.x);
    u_xlat23 = u_xlat32 * u_xlat23;
    u_xlat23 = exp2(u_xlat23);
    u_xlat13 = log2(u_xlat3.y);
    u_xlat32 = u_xlat32 * u_xlat13;
    u_xlat32 = exp2(u_xlat32);
    u_xlat32 = u_xlat32 + u_xlat23;
    u_xlat32 = (-u_xlat32) * 4.0 + 1.0;
    u_xlat13 = max(u_xlat32, 0.0);
    u_xlat23 = u_xlat13 * -2.0 + 3.0;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat33 = u_xlat13 * u_xlat23;
    u_xlat32 = u_xlat23 * u_xlat13 + (-u_xlat32);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat13 = u_xlat32 * u_xlat32;
    u_xlat32 = u_xlat32 * u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlat32 = min(max(u_xlat32, 0.0), 1.0);
#else
    u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
#endif
    u_xlat32 = u_xlat32 * _emissiveedgefollowintensity;
    u_xlat4.xyz = vec3(u_xlat32) * _FireEdgeTravelColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat31) + u_xlat4.xyz;
    u_xlat31 = min(u_xlat33, 1.0);
    u_xlat31 = u_xlat3.x * u_xlat31 + (-_smoothstepmin);
    u_xlat32 = float(1.0) / _smoothstepmax;
    u_xlat31 = u_xlat31 * u_xlat32;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat32 = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat32;
    u_xlat16_6.x = dot((-u_xlat1.xyz), vs_TEXCOORD2.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_6.xyz = vs_TEXCOORD2.xyz * (-u_xlat16_6.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb32 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb32){
        u_xlat32 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
        u_xlat32 = inversesqrt(u_xlat32);
        u_xlat3.xyz = vec3(u_xlat32) * u_xlat16_6.xyz;
        u_xlat4.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat4.xyz = u_xlat4.xyz / u_xlat3.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat3.xyz;
        u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat4;
            hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat4.x : u_xlat5.x;
            hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat4.y : u_xlat5.y;
            hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat4.z : u_xlat5.z;
            u_xlat4 = hlslcc_movcTemp;
        }
        u_xlat32 = min(u_xlat4.y, u_xlat4.x);
        u_xlat32 = min(u_xlat4.z, u_xlat32);
        u_xlat4.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat32) + u_xlat4.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_6.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 6.0);
    u_xlat16_36 = u_xlat16_3.w + -1.0;
    u_xlat16_36 = unity_SpecCube0_HDR.w * u_xlat16_36 + 1.0;
    u_xlat16_36 = log2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * unity_SpecCube0_HDR.y;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * unity_SpecCube0_HDR.x;
    u_xlat16_8.xyz = u_xlat16_3.xyz * vec3(u_xlat16_36);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb32 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb32){
#ifdef UNITY_ADRENO_ES3
        u_xlatb32 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb32 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb32){
            u_xlat32 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
            u_xlat32 = inversesqrt(u_xlat32);
            u_xlat4.xyz = vec3(u_xlat32) * u_xlat16_6.xyz;
            u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat5.xyz = u_xlat5.xyz / u_xlat4.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat4.xyz;
            u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat5;
                hlslcc_movcTemp.x = (u_xlatb9.x) ? u_xlat5.x : u_xlat7.x;
                hlslcc_movcTemp.y = (u_xlatb9.y) ? u_xlat5.y : u_xlat7.y;
                hlslcc_movcTemp.z = (u_xlatb9.z) ? u_xlat5.z : u_xlat7.z;
                u_xlat5 = hlslcc_movcTemp;
            }
            u_xlat32 = min(u_xlat5.y, u_xlat5.x);
            u_xlat32 = min(u_xlat5.z, u_xlat32);
            u_xlat5.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat32) + u_xlat5.xyz;
        } else {
            u_xlat4.xyz = u_xlat16_6.xyz;
        }
        u_xlat16_4 = textureLod(unity_SpecCube1, u_xlat4.xyz, 6.0);
        u_xlat16_6.x = u_xlat16_4.w + -1.0;
        u_xlat16_6.x = unity_SpecCube1_HDR.w * u_xlat16_6.x + 1.0;
        u_xlat16_6.x = log2(u_xlat16_6.x);
        u_xlat16_6.x = u_xlat16_6.x * unity_SpecCube1_HDR.y;
        u_xlat16_6.x = exp2(u_xlat16_6.x);
        u_xlat16_6.x = u_xlat16_6.x * unity_SpecCube1_HDR.x;
        u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xxx;
        u_xlat3.xyz = vec3(u_xlat16_36) * u_xlat16_3.xyz + (-u_xlat16_6.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_6.xyz;
        u_xlat16_8.xyz = u_xlat8.xyz;
    }
    u_xlat32 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * vs_TEXCOORD2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 0.00100000005);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat30 = dot(u_xlat3.xyz, u_xlat1.xyz);
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
    u_xlat10 = abs(u_xlat30) + u_xlat1.x;
    u_xlat10 = u_xlat10 + 9.99999975e-06;
    u_xlat10 = 0.5 / u_xlat10;
    u_xlat10 = u_xlat1.x * u_xlat10;
    u_xlat10 = u_xlat10 * 0.999999881;
    u_xlat1.xyz = vec3(u_xlat10) * _LightColor0.xyz;
    u_xlat16_6.x = (-u_xlat0.x) + 1.0;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_16.x = u_xlat16_16.x * u_xlat16_16.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_16.x;
    u_xlat16_6.x = u_xlat16_6.x * 0.959999979 + 0.0399999991;
    u_xlat16_16.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_8.x = -abs(u_xlat30) + 1.0;
    u_xlat16_18 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_18;
    u_xlat16_8.x = u_xlat16_8.x * 2.23517418e-08 + 0.0399999991;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_8.xxx;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_6.xxx + u_xlat16_16.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat31;
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