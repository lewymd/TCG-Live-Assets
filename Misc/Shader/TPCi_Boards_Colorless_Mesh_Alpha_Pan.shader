//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/Colorless_Mesh_Alpha_Pan" {
Properties {
_DiffuseTex ("Diffuse Tex", 2D) = "white" { }
_DiffuseIntensity ("Diffuse Intensity", Range(-1, 1)) = 0
_DiffuseTxTile ("Diffuse Tx Tile", Vector) = (1,1,0,0)
_DiffuseTxPan ("Diffuse Tx Pan", Vector) = (-1,0.5,0,0)
_AlphaTxMask ("Alpha Tx Mask", 2D) = "white" { }
_SecondaryTx ("Secondary Tx", 2D) = "white" { }
_SecondaryTxIntensity ("Secondary Tx Intensity", Range(0, 1)) = 0
_SecondaryTxTile ("Secondary Tx Tile", Vector) = (1,1,0,0)
_SecondaryTxPan ("Secondary Tx Pan", Vector) = (1,-0.5,0,0)
_FresnelColor ("Fresnel Color", Color) = (0.8254717,0.9483842,1,1)
_FresnelPower ("Fresnel Power", Range(0, 10)) = 2.76
_FresnelScale ("Fresnel Scale", Range(0, 10)) = 3.5
_Color0 ("Color 0", Color) = (1,0,0,0.4901961)
_Metallic ("Metallic", Float) = 1.35
_Smoothness ("Smoothness", Float) = 0.05
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  Cull Off
  GpuProgramID 18535
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
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Color0;
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	vec4 _FresnelColor;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(1) uniform mediump sampler2D _DiffuseTex;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
bvec3 u_xlatb9;
mediump float u_xlat16_10;
bvec3 u_xlatb11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
float u_xlat17;
vec3 u_xlat26;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_30;
float u_xlat32;
float u_xlat33;
vec2 u_xlat34;
float u_xlat48;
float u_xlat49;
float u_xlat50;
bool u_xlatb50;
mediump float u_xlat16_53;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat48 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat2.xy;
    u_xlat34.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat34.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat34.xy;
    u_xlat16_3.xyz = texture(_SecondaryTx, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_DiffuseTex, u_xlat34.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat2.xyz = vec3(_SecondaryTxIntensity) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xyz * _Color0.xyz;
    u_xlat49 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 9.99999975e-05);
    u_xlat49 = log2(u_xlat49);
    u_xlat49 = u_xlat49 * _FresnelPower;
    u_xlat49 = exp2(u_xlat49);
    u_xlat49 = u_xlat49 * _FresnelScale;
    u_xlat4.xyz = vec3(u_xlat49) * _FresnelColor.xyz + u_xlat2.xyz;
    u_xlat49 = (-_Smoothness) + 1.0;
    u_xlat16_5.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_5.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_5.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb50 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb50){
        u_xlat50 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
        u_xlat50 = inversesqrt(u_xlat50);
        u_xlat6.xyz = vec3(u_xlat50) * u_xlat16_5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
        u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat7;
            hlslcc_movcTemp.x = (u_xlatb9.x) ? u_xlat7.x : u_xlat8.x;
            hlslcc_movcTemp.y = (u_xlatb9.y) ? u_xlat7.y : u_xlat8.y;
            hlslcc_movcTemp.z = (u_xlatb9.z) ? u_xlat7.z : u_xlat8.z;
            u_xlat7 = hlslcc_movcTemp;
        }
        u_xlat50 = min(u_xlat7.y, u_xlat7.x);
        u_xlat50 = min(u_xlat7.z, u_xlat50);
        u_xlat7.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat50) + u_xlat7.xyz;
    } else {
        u_xlat6.xyz = u_xlat16_5.xyz;
    }
    u_xlat16_53 = (-u_xlat49) * 0.699999988 + 1.70000005;
    u_xlat16_53 = u_xlat49 * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 6.0;
    u_xlat16_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, u_xlat16_53);
    u_xlat16_10 = u_xlat16_6.w + -1.0;
    u_xlat16_10 = unity_SpecCube0_HDR.w * u_xlat16_10 + 1.0;
    u_xlat16_10 = log2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * unity_SpecCube0_HDR.y;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * unity_SpecCube0_HDR.x;
    u_xlat16_26.xyz = u_xlat16_6.xyz * vec3(u_xlat16_10);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb50 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb50){
#ifdef UNITY_ADRENO_ES3
        u_xlatb50 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb50 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb50){
            u_xlat50 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
            u_xlat50 = inversesqrt(u_xlat50);
            u_xlat7.xyz = vec3(u_xlat50) * u_xlat16_5.xyz;
            u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb11.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat8;
                hlslcc_movcTemp.x = (u_xlatb11.x) ? u_xlat8.x : u_xlat9.x;
                hlslcc_movcTemp.y = (u_xlatb11.y) ? u_xlat8.y : u_xlat9.y;
                hlslcc_movcTemp.z = (u_xlatb11.z) ? u_xlat8.z : u_xlat9.z;
                u_xlat8 = hlslcc_movcTemp;
            }
            u_xlat50 = min(u_xlat8.y, u_xlat8.x);
            u_xlat50 = min(u_xlat8.z, u_xlat50);
            u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat50) + u_xlat8.xyz;
        } else {
            u_xlat7.xyz = u_xlat16_5.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat7.xyz, u_xlat16_53);
        u_xlat16_12.x = u_xlat16_5.w + -1.0;
        u_xlat16_12.x = unity_SpecCube1_HDR.w * u_xlat16_12.x + 1.0;
        u_xlat16_12.x = log2(u_xlat16_12.x);
        u_xlat16_12.x = u_xlat16_12.x * unity_SpecCube1_HDR.y;
        u_xlat16_12.x = exp2(u_xlat16_12.x);
        u_xlat16_12.x = u_xlat16_12.x * unity_SpecCube1_HDR.x;
        u_xlat16_12.xyz = u_xlat16_5.xyz * u_xlat16_12.xxx;
        u_xlat6.xyz = vec3(u_xlat16_10) * u_xlat16_6.xyz + (-u_xlat16_12.xyz);
        u_xlat26.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat16_12.xyz;
        u_xlat16_26.xyz = u_xlat26.xyz;
    }
    u_xlat50 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat6.xyz = vec3(u_xlat50) * vs_TEXCOORD1.xyz;
    u_xlat16_12.xyz = _Color0.xyz * u_xlat2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = vec3(_Metallic) * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10 = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_10);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat48) + _WorldSpaceLightPos0.xyz;
    u_xlat48 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat48 = max(u_xlat48, 0.00100000005);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat0.xyz = vec3(u_xlat48) * u_xlat0.xyz;
    u_xlat48 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat6.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat17 = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat0.x + u_xlat0.x;
    u_xlat16_60 = u_xlat0.x * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat49 + -0.5;
    u_xlat16_61 = (-u_xlat1.x) + 1.0;
    u_xlat16_14 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_14;
    u_xlat16_61 = u_xlat16_60 * u_xlat16_61 + 1.0;
    u_xlat16_14 = -abs(u_xlat48) + 1.0;
    u_xlat16_30.x = u_xlat16_14 * u_xlat16_14;
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_30.x;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_14 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_61;
    u_xlat16 = u_xlat1.x * u_xlat16_60;
    u_xlat32 = u_xlat49 * u_xlat49;
    u_xlat32 = max(u_xlat32, 0.00200000009);
    u_xlat33 = (-u_xlat32) + 1.0;
    u_xlat49 = abs(u_xlat48) * u_xlat33 + u_xlat32;
    u_xlat33 = u_xlat1.x * u_xlat33 + u_xlat32;
    u_xlat48 = abs(u_xlat48) * u_xlat33;
    u_xlat48 = u_xlat1.x * u_xlat49 + u_xlat48;
    u_xlat48 = u_xlat48 + 9.99999975e-06;
    u_xlat48 = 0.5 / u_xlat48;
    u_xlat33 = u_xlat32 * u_xlat32;
    u_xlat49 = u_xlat17 * u_xlat33 + (-u_xlat17);
    u_xlat17 = u_xlat49 * u_xlat17 + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat17 = u_xlat17 * u_xlat17 + 1.00000001e-07;
    u_xlat17 = u_xlat33 / u_xlat17;
    u_xlat48 = u_xlat48 * u_xlat17;
    u_xlat48 = u_xlat1.x * u_xlat48;
    u_xlat48 = u_xlat48 * 3.14159274;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat32 = u_xlat32 * u_xlat32 + 1.0;
    u_xlat32 = float(1.0) / u_xlat32;
    u_xlat16_60 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_60!=0.0);
#else
    u_xlatb1 = u_xlat16_60!=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat48 = u_xlat48 * u_xlat1.x;
    u_xlat16_10 = (-u_xlat16_10) + 1.0;
    u_xlat16_10 = u_xlat16_10 + _Smoothness;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10 = min(max(u_xlat16_10, 0.0), 1.0);
#else
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
#endif
    u_xlat16_30.xyz = vec3(u_xlat16) * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat48) * _LightColor0.xyz;
    u_xlat16_60 = (-u_xlat0.x) + 1.0;
    u_xlat16_61 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_61;
    u_xlat16_15.xyz = (-u_xlat16_12.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_60) + u_xlat16_12.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_15.xyz;
    u_xlat0.xyw = u_xlat16_13.xyz * u_xlat16_30.xyz + u_xlat0.xyw;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(u_xlat32);
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) + vec3(u_xlat16_10);
    u_xlat16_12.xyz = vec3(u_xlat16_14) * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat0.xyz = u_xlat16_26.xyz * u_xlat16_12.xyz + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat4.xyz + u_xlat0.xyz;
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
out highp vec4 vs_TEXCOORD6;
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
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Color0;
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	vec4 _FresnelColor;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(1) uniform mediump sampler2D _DiffuseTex;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
bvec3 u_xlatb12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
float u_xlat17;
float u_xlat32;
float u_xlat33;
vec2 u_xlat34;
float u_xlat48;
float u_xlat49;
float u_xlat50;
bool u_xlatb50;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat48 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat2.xy;
    u_xlat34.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat34.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat34.xy;
    u_xlat16_3.xyz = texture(_SecondaryTx, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_DiffuseTex, u_xlat34.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat2.xyz = vec3(_SecondaryTxIntensity) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xyz * _Color0.xyz;
    u_xlat49 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 9.99999975e-05);
    u_xlat49 = log2(u_xlat49);
    u_xlat49 = u_xlat49 * _FresnelPower;
    u_xlat49 = exp2(u_xlat49);
    u_xlat49 = u_xlat49 * _FresnelScale;
    u_xlat4.xyz = vec3(u_xlat49) * _FresnelColor.xyz + u_xlat2.xyz;
    u_xlat49 = (-_Smoothness) + 1.0;
    u_xlat16_5.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_5.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_5.xxx) + (-u_xlat1.xyz);
    u_xlat6.xyz = vs_TEXCOORD1.xyz;
    u_xlat6.w = 1.0;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat6);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat6);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat6);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb50 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb50){
        u_xlat50 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
        u_xlat50 = inversesqrt(u_xlat50);
        u_xlat6.xyz = vec3(u_xlat50) * u_xlat16_5.xyz;
        u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlat9.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat6.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat50 = min(u_xlat8.y, u_xlat8.x);
        u_xlat50 = min(u_xlat8.z, u_xlat50);
        u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat50) + u_xlat8.xyz;
    } else {
        u_xlat6.xyz = u_xlat16_5.xyz;
    }
    u_xlat16_53 = (-u_xlat49) * 0.699999988 + 1.70000005;
    u_xlat16_53 = u_xlat49 * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 6.0;
    u_xlat16_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, u_xlat16_53);
    u_xlat16_55 = u_xlat16_6.w + -1.0;
    u_xlat16_55 = unity_SpecCube0_HDR.w * u_xlat16_55 + 1.0;
    u_xlat16_55 = log2(u_xlat16_55);
    u_xlat16_55 = u_xlat16_55 * unity_SpecCube0_HDR.y;
    u_xlat16_55 = exp2(u_xlat16_55);
    u_xlat16_55 = u_xlat16_55 * unity_SpecCube0_HDR.x;
    u_xlat16_11.xyz = u_xlat16_6.xyz * vec3(u_xlat16_55);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb50 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb50){
#ifdef UNITY_ADRENO_ES3
        u_xlatb50 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb50 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb50){
            u_xlat50 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
            u_xlat50 = inversesqrt(u_xlat50);
            u_xlat8.xyz = vec3(u_xlat50) * u_xlat16_5.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
            u_xlat10.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat9;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat9.x : u_xlat10.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat9.y : u_xlat10.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat9.z : u_xlat10.z;
                u_xlat9 = hlslcc_movcTemp;
            }
            u_xlat50 = min(u_xlat9.y, u_xlat9.x);
            u_xlat50 = min(u_xlat9.z, u_xlat50);
            u_xlat9.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat50) + u_xlat9.xyz;
        } else {
            u_xlat8.xyz = u_xlat16_5.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat8.xyz, u_xlat16_53);
        u_xlat16_59 = u_xlat16_5.w + -1.0;
        u_xlat16_59 = unity_SpecCube1_HDR.w * u_xlat16_59 + 1.0;
        u_xlat16_59 = log2(u_xlat16_59);
        u_xlat16_59 = u_xlat16_59 * unity_SpecCube1_HDR.y;
        u_xlat16_59 = exp2(u_xlat16_59);
        u_xlat16_59 = u_xlat16_59 * unity_SpecCube1_HDR.x;
        u_xlat16_13.xyz = u_xlat16_5.xyz * vec3(u_xlat16_59);
        u_xlat6.xyz = vec3(u_xlat16_55) * u_xlat16_6.xyz + (-u_xlat16_13.xyz);
        u_xlat11.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat16_13.xyz;
        u_xlat16_11.xyz = u_xlat11.xyz;
    }
    u_xlat50 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat6.xyz = vec3(u_xlat50) * vs_TEXCOORD1.xyz;
    u_xlat16_13.xyz = _Color0.xyz * u_xlat2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = vec3(_Metallic) * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_55 = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_14.xyz = u_xlat3.xyz * vec3(u_xlat16_55);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat48) + _WorldSpaceLightPos0.xyz;
    u_xlat48 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat48 = max(u_xlat48, 0.00100000005);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat0.xyz = vec3(u_xlat48) * u_xlat0.xyz;
    u_xlat48 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat6.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat17 = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat0.x + u_xlat0.x;
    u_xlat16_59 = u_xlat0.x * u_xlat16_59;
    u_xlat16_59 = u_xlat16_59 * u_xlat49 + -0.5;
    u_xlat16_61 = (-u_xlat1.x) + 1.0;
    u_xlat16_62 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_61 = u_xlat16_59 * u_xlat16_61 + 1.0;
    u_xlat16_62 = -abs(u_xlat48) + 1.0;
    u_xlat16_15.x = u_xlat16_62 * u_xlat16_62;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat16_15.x;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_15.x;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_62 + 1.0;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_61;
    u_xlat16 = u_xlat1.x * u_xlat16_59;
    u_xlat32 = u_xlat49 * u_xlat49;
    u_xlat32 = max(u_xlat32, 0.00200000009);
    u_xlat33 = (-u_xlat32) + 1.0;
    u_xlat49 = abs(u_xlat48) * u_xlat33 + u_xlat32;
    u_xlat33 = u_xlat1.x * u_xlat33 + u_xlat32;
    u_xlat48 = abs(u_xlat48) * u_xlat33;
    u_xlat48 = u_xlat1.x * u_xlat49 + u_xlat48;
    u_xlat48 = u_xlat48 + 9.99999975e-06;
    u_xlat48 = 0.5 / u_xlat48;
    u_xlat33 = u_xlat32 * u_xlat32;
    u_xlat49 = u_xlat17 * u_xlat33 + (-u_xlat17);
    u_xlat17 = u_xlat49 * u_xlat17 + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat17 = u_xlat17 * u_xlat17 + 1.00000001e-07;
    u_xlat17 = u_xlat33 / u_xlat17;
    u_xlat48 = u_xlat48 * u_xlat17;
    u_xlat48 = u_xlat1.x * u_xlat48;
    u_xlat48 = u_xlat48 * 3.14159274;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat32 = u_xlat32 * u_xlat32 + 1.0;
    u_xlat32 = float(1.0) / u_xlat32;
    u_xlat16_59 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_59!=0.0);
#else
    u_xlatb1 = u_xlat16_59!=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat48 = u_xlat48 * u_xlat1.x;
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_55 = u_xlat16_55 + _Smoothness;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = _LightColor0.xyz * vec3(u_xlat16) + u_xlat16_7.xyz;
    u_xlat1.xyz = vec3(u_xlat48) * _LightColor0.xyz;
    u_xlat16_59 = (-u_xlat0.x) + 1.0;
    u_xlat16_61 = u_xlat16_59 * u_xlat16_59;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_61;
    u_xlat16_15.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_59) + u_xlat16_13.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_15.xyz;
    u_xlat0.xyw = u_xlat16_14.xyz * u_xlat16_7.xyz + u_xlat0.xyw;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat32);
    u_xlat16_11.xyz = (-u_xlat16_13.xyz) + vec3(u_xlat16_55);
    u_xlat16_11.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz + u_xlat16_13.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * u_xlat16_11.xyz + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat4.xyz + u_xlat0.xyz;
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
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Color0;
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	vec4 _FresnelColor;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(1) uniform mediump sampler2D _DiffuseTex;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
bvec3 u_xlatb9;
mediump float u_xlat16_10;
bvec3 u_xlatb11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
float u_xlat17;
vec3 u_xlat26;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_30;
float u_xlat32;
float u_xlat33;
vec2 u_xlat34;
float u_xlat48;
float u_xlat49;
float u_xlat50;
bool u_xlatb50;
mediump float u_xlat16_53;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat48 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat2.xy;
    u_xlat34.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat34.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat34.xy;
    u_xlat16_3.xyz = texture(_SecondaryTx, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_DiffuseTex, u_xlat34.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat2.xyz = vec3(_SecondaryTxIntensity) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xyz * _Color0.xyz;
    u_xlat49 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 9.99999975e-05);
    u_xlat49 = log2(u_xlat49);
    u_xlat49 = u_xlat49 * _FresnelPower;
    u_xlat49 = exp2(u_xlat49);
    u_xlat49 = u_xlat49 * _FresnelScale;
    u_xlat4.xyz = vec3(u_xlat49) * _FresnelColor.xyz + u_xlat2.xyz;
    u_xlat49 = (-_Smoothness) + 1.0;
    u_xlat16_5.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_5.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_5.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb50 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb50){
        u_xlat50 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
        u_xlat50 = inversesqrt(u_xlat50);
        u_xlat6.xyz = vec3(u_xlat50) * u_xlat16_5.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
        u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat7;
            hlslcc_movcTemp.x = (u_xlatb9.x) ? u_xlat7.x : u_xlat8.x;
            hlslcc_movcTemp.y = (u_xlatb9.y) ? u_xlat7.y : u_xlat8.y;
            hlslcc_movcTemp.z = (u_xlatb9.z) ? u_xlat7.z : u_xlat8.z;
            u_xlat7 = hlslcc_movcTemp;
        }
        u_xlat50 = min(u_xlat7.y, u_xlat7.x);
        u_xlat50 = min(u_xlat7.z, u_xlat50);
        u_xlat7.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat50) + u_xlat7.xyz;
    } else {
        u_xlat6.xyz = u_xlat16_5.xyz;
    }
    u_xlat16_53 = (-u_xlat49) * 0.699999988 + 1.70000005;
    u_xlat16_53 = u_xlat49 * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 6.0;
    u_xlat16_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, u_xlat16_53);
    u_xlat16_10 = u_xlat16_6.w + -1.0;
    u_xlat16_10 = unity_SpecCube0_HDR.w * u_xlat16_10 + 1.0;
    u_xlat16_10 = log2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * unity_SpecCube0_HDR.y;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * unity_SpecCube0_HDR.x;
    u_xlat16_26.xyz = u_xlat16_6.xyz * vec3(u_xlat16_10);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb50 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb50){
#ifdef UNITY_ADRENO_ES3
        u_xlatb50 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb50 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb50){
            u_xlat50 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
            u_xlat50 = inversesqrt(u_xlat50);
            u_xlat7.xyz = vec3(u_xlat50) * u_xlat16_5.xyz;
            u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
            u_xlatb11.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat8;
                hlslcc_movcTemp.x = (u_xlatb11.x) ? u_xlat8.x : u_xlat9.x;
                hlslcc_movcTemp.y = (u_xlatb11.y) ? u_xlat8.y : u_xlat9.y;
                hlslcc_movcTemp.z = (u_xlatb11.z) ? u_xlat8.z : u_xlat9.z;
                u_xlat8 = hlslcc_movcTemp;
            }
            u_xlat50 = min(u_xlat8.y, u_xlat8.x);
            u_xlat50 = min(u_xlat8.z, u_xlat50);
            u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat50) + u_xlat8.xyz;
        } else {
            u_xlat7.xyz = u_xlat16_5.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat7.xyz, u_xlat16_53);
        u_xlat16_12.x = u_xlat16_5.w + -1.0;
        u_xlat16_12.x = unity_SpecCube1_HDR.w * u_xlat16_12.x + 1.0;
        u_xlat16_12.x = log2(u_xlat16_12.x);
        u_xlat16_12.x = u_xlat16_12.x * unity_SpecCube1_HDR.y;
        u_xlat16_12.x = exp2(u_xlat16_12.x);
        u_xlat16_12.x = u_xlat16_12.x * unity_SpecCube1_HDR.x;
        u_xlat16_12.xyz = u_xlat16_5.xyz * u_xlat16_12.xxx;
        u_xlat6.xyz = vec3(u_xlat16_10) * u_xlat16_6.xyz + (-u_xlat16_12.xyz);
        u_xlat26.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat16_12.xyz;
        u_xlat16_26.xyz = u_xlat26.xyz;
    }
    u_xlat50 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat6.xyz = vec3(u_xlat50) * vs_TEXCOORD1.xyz;
    u_xlat16_12.xyz = _Color0.xyz * u_xlat2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = vec3(_Metallic) * u_xlat16_12.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10 = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_10);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat48) + _WorldSpaceLightPos0.xyz;
    u_xlat48 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat48 = max(u_xlat48, 0.00100000005);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat0.xyz = vec3(u_xlat48) * u_xlat0.xyz;
    u_xlat48 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat6.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat17 = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat0.x + u_xlat0.x;
    u_xlat16_60 = u_xlat0.x * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat49 + -0.5;
    u_xlat16_61 = (-u_xlat1.x) + 1.0;
    u_xlat16_14 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_14;
    u_xlat16_61 = u_xlat16_60 * u_xlat16_61 + 1.0;
    u_xlat16_14 = -abs(u_xlat48) + 1.0;
    u_xlat16_30.x = u_xlat16_14 * u_xlat16_14;
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_30.x;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_14 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_61;
    u_xlat16 = u_xlat1.x * u_xlat16_60;
    u_xlat32 = u_xlat49 * u_xlat49;
    u_xlat32 = max(u_xlat32, 0.00200000009);
    u_xlat33 = (-u_xlat32) + 1.0;
    u_xlat49 = abs(u_xlat48) * u_xlat33 + u_xlat32;
    u_xlat33 = u_xlat1.x * u_xlat33 + u_xlat32;
    u_xlat48 = abs(u_xlat48) * u_xlat33;
    u_xlat48 = u_xlat1.x * u_xlat49 + u_xlat48;
    u_xlat48 = u_xlat48 + 9.99999975e-06;
    u_xlat48 = 0.5 / u_xlat48;
    u_xlat33 = u_xlat32 * u_xlat32;
    u_xlat49 = u_xlat17 * u_xlat33 + (-u_xlat17);
    u_xlat17 = u_xlat49 * u_xlat17 + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat17 = u_xlat17 * u_xlat17 + 1.00000001e-07;
    u_xlat17 = u_xlat33 / u_xlat17;
    u_xlat48 = u_xlat48 * u_xlat17;
    u_xlat48 = u_xlat1.x * u_xlat48;
    u_xlat48 = u_xlat48 * 3.14159274;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat32 = u_xlat32 * u_xlat32 + 1.0;
    u_xlat32 = float(1.0) / u_xlat32;
    u_xlat16_60 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_60!=0.0);
#else
    u_xlatb1 = u_xlat16_60!=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat48 = u_xlat48 * u_xlat1.x;
    u_xlat16_10 = (-u_xlat16_10) + 1.0;
    u_xlat16_10 = u_xlat16_10 + _Smoothness;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10 = min(max(u_xlat16_10, 0.0), 1.0);
#else
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
#endif
    u_xlat16_30.xyz = vec3(u_xlat16) * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat48) * _LightColor0.xyz;
    u_xlat16_60 = (-u_xlat0.x) + 1.0;
    u_xlat16_61 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_61;
    u_xlat16_15.xyz = (-u_xlat16_12.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_60) + u_xlat16_12.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_15.xyz;
    u_xlat0.xyw = u_xlat16_13.xyz * u_xlat16_30.xyz + u_xlat0.xyw;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(u_xlat32);
    u_xlat16_13.xyz = (-u_xlat16_12.xyz) + vec3(u_xlat16_10);
    u_xlat16_12.xyz = vec3(u_xlat16_14) * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat0.xyz = u_xlat16_26.xyz * u_xlat16_12.xyz + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat4.xyz + u_xlat0.xyz;
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
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
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
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz + u_xlat16_5.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Color0;
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	vec4 _FresnelColor;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(1) uniform mediump sampler2D _DiffuseTex;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
bvec3 u_xlatb12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
float u_xlat17;
float u_xlat32;
float u_xlat33;
vec2 u_xlat34;
float u_xlat48;
float u_xlat49;
float u_xlat50;
bool u_xlatb50;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
mediump float u_xlat16_59;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat48 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat1.xyz = vec3(u_xlat48) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat2.xy;
    u_xlat34.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat34.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat34.xy;
    u_xlat16_3.xyz = texture(_SecondaryTx, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_DiffuseTex, u_xlat34.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat2.xyz = vec3(_SecondaryTxIntensity) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xyz * _Color0.xyz;
    u_xlat49 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 9.99999975e-05);
    u_xlat49 = log2(u_xlat49);
    u_xlat49 = u_xlat49 * _FresnelPower;
    u_xlat49 = exp2(u_xlat49);
    u_xlat49 = u_xlat49 * _FresnelScale;
    u_xlat4.xyz = vec3(u_xlat49) * _FresnelColor.xyz + u_xlat2.xyz;
    u_xlat49 = (-_Smoothness) + 1.0;
    u_xlat16_5.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_5.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_5.xxx) + (-u_xlat1.xyz);
    u_xlat6.xyz = vs_TEXCOORD1.xyz;
    u_xlat6.w = 1.0;
    u_xlat16_7.x = dot(unity_SHAr, u_xlat6);
    u_xlat16_7.y = dot(unity_SHAg, u_xlat6);
    u_xlat16_7.z = dot(unity_SHAb, u_xlat6);
    u_xlat16_7.xyz = u_xlat16_7.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb50 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb50){
        u_xlat50 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
        u_xlat50 = inversesqrt(u_xlat50);
        u_xlat6.xyz = vec3(u_xlat50) * u_xlat16_5.xyz;
        u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlat9.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat6.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat50 = min(u_xlat8.y, u_xlat8.x);
        u_xlat50 = min(u_xlat8.z, u_xlat50);
        u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat50) + u_xlat8.xyz;
    } else {
        u_xlat6.xyz = u_xlat16_5.xyz;
    }
    u_xlat16_53 = (-u_xlat49) * 0.699999988 + 1.70000005;
    u_xlat16_53 = u_xlat49 * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 6.0;
    u_xlat16_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, u_xlat16_53);
    u_xlat16_55 = u_xlat16_6.w + -1.0;
    u_xlat16_55 = unity_SpecCube0_HDR.w * u_xlat16_55 + 1.0;
    u_xlat16_55 = log2(u_xlat16_55);
    u_xlat16_55 = u_xlat16_55 * unity_SpecCube0_HDR.y;
    u_xlat16_55 = exp2(u_xlat16_55);
    u_xlat16_55 = u_xlat16_55 * unity_SpecCube0_HDR.x;
    u_xlat16_11.xyz = u_xlat16_6.xyz * vec3(u_xlat16_55);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb50 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb50){
#ifdef UNITY_ADRENO_ES3
        u_xlatb50 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb50 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb50){
            u_xlat50 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
            u_xlat50 = inversesqrt(u_xlat50);
            u_xlat8.xyz = vec3(u_xlat50) * u_xlat16_5.xyz;
            u_xlat9.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
            u_xlat10.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat9;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat9.x : u_xlat10.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat9.y : u_xlat10.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat9.z : u_xlat10.z;
                u_xlat9 = hlslcc_movcTemp;
            }
            u_xlat50 = min(u_xlat9.y, u_xlat9.x);
            u_xlat50 = min(u_xlat9.z, u_xlat50);
            u_xlat9.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat50) + u_xlat9.xyz;
        } else {
            u_xlat8.xyz = u_xlat16_5.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat8.xyz, u_xlat16_53);
        u_xlat16_59 = u_xlat16_5.w + -1.0;
        u_xlat16_59 = unity_SpecCube1_HDR.w * u_xlat16_59 + 1.0;
        u_xlat16_59 = log2(u_xlat16_59);
        u_xlat16_59 = u_xlat16_59 * unity_SpecCube1_HDR.y;
        u_xlat16_59 = exp2(u_xlat16_59);
        u_xlat16_59 = u_xlat16_59 * unity_SpecCube1_HDR.x;
        u_xlat16_13.xyz = u_xlat16_5.xyz * vec3(u_xlat16_59);
        u_xlat6.xyz = vec3(u_xlat16_55) * u_xlat16_6.xyz + (-u_xlat16_13.xyz);
        u_xlat11.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat16_13.xyz;
        u_xlat16_11.xyz = u_xlat11.xyz;
    }
    u_xlat50 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat6.xyz = vec3(u_xlat50) * vs_TEXCOORD1.xyz;
    u_xlat16_13.xyz = _Color0.xyz * u_xlat2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = vec3(_Metallic) * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_55 = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_14.xyz = u_xlat3.xyz * vec3(u_xlat16_55);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat48) + _WorldSpaceLightPos0.xyz;
    u_xlat48 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat48 = max(u_xlat48, 0.00100000005);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat0.xyz = vec3(u_xlat48) * u_xlat0.xyz;
    u_xlat48 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat6.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat17 = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat0.x + u_xlat0.x;
    u_xlat16_59 = u_xlat0.x * u_xlat16_59;
    u_xlat16_59 = u_xlat16_59 * u_xlat49 + -0.5;
    u_xlat16_61 = (-u_xlat1.x) + 1.0;
    u_xlat16_62 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_61 = u_xlat16_59 * u_xlat16_61 + 1.0;
    u_xlat16_62 = -abs(u_xlat48) + 1.0;
    u_xlat16_15.x = u_xlat16_62 * u_xlat16_62;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat16_15.x;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_15.x;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_62 + 1.0;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_61;
    u_xlat16 = u_xlat1.x * u_xlat16_59;
    u_xlat32 = u_xlat49 * u_xlat49;
    u_xlat32 = max(u_xlat32, 0.00200000009);
    u_xlat33 = (-u_xlat32) + 1.0;
    u_xlat49 = abs(u_xlat48) * u_xlat33 + u_xlat32;
    u_xlat33 = u_xlat1.x * u_xlat33 + u_xlat32;
    u_xlat48 = abs(u_xlat48) * u_xlat33;
    u_xlat48 = u_xlat1.x * u_xlat49 + u_xlat48;
    u_xlat48 = u_xlat48 + 9.99999975e-06;
    u_xlat48 = 0.5 / u_xlat48;
    u_xlat33 = u_xlat32 * u_xlat32;
    u_xlat49 = u_xlat17 * u_xlat33 + (-u_xlat17);
    u_xlat17 = u_xlat49 * u_xlat17 + 1.0;
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat17 = u_xlat17 * u_xlat17 + 1.00000001e-07;
    u_xlat17 = u_xlat33 / u_xlat17;
    u_xlat48 = u_xlat48 * u_xlat17;
    u_xlat48 = u_xlat1.x * u_xlat48;
    u_xlat48 = u_xlat48 * 3.14159274;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat32 = u_xlat32 * u_xlat32 + 1.0;
    u_xlat32 = float(1.0) / u_xlat32;
    u_xlat16_59 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_59!=0.0);
#else
    u_xlatb1 = u_xlat16_59!=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat48 = u_xlat48 * u_xlat1.x;
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_55 = u_xlat16_55 + _Smoothness;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = _LightColor0.xyz * vec3(u_xlat16) + u_xlat16_7.xyz;
    u_xlat1.xyz = vec3(u_xlat48) * _LightColor0.xyz;
    u_xlat16_59 = (-u_xlat0.x) + 1.0;
    u_xlat16_61 = u_xlat16_59 * u_xlat16_59;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_59 = u_xlat16_59 * u_xlat16_61;
    u_xlat16_15.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_59) + u_xlat16_13.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_15.xyz;
    u_xlat0.xyw = u_xlat16_14.xyz * u_xlat16_7.xyz + u_xlat0.xyw;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(u_xlat32);
    u_xlat16_11.xyz = (-u_xlat16_13.xyz) + vec3(u_xlat16_55);
    u_xlat16_11.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz + u_xlat16_13.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * u_xlat16_11.xyz + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat4.xyz + u_xlat0.xyz;
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
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Geometry+0" "RenderType" = "Transparent" }
  Blend One One, One One
  ZWrite Off
  Cull Off
  GpuProgramID 104979
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color0;
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(1) uniform mediump sampler2D _DiffuseTex;
UNITY_LOCATION(2) uniform highp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_11;
mediump float u_xlat16_13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
float u_xlat22;
mediump float u_xlat16_26;
mediump float u_xlat16_27;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat1.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat7 = (-_Smoothness) + 1.0;
    u_xlat14.x = u_xlat7 * u_xlat7;
    u_xlat14.x = max(u_xlat14.x, 0.00200000009);
    u_xlat8 = u_xlat14.x * u_xlat14.x;
    u_xlat15 = u_xlat21 * u_xlat8 + (-u_xlat21);
    u_xlat21 = u_xlat15 * u_xlat21 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21 + 1.00000001e-07;
    u_xlat8 = u_xlat8 * 0.318309873;
    u_xlat21 = u_xlat8 / u_xlat21;
    u_xlat8 = (-u_xlat14.x) + 1.0;
    u_xlat15 = abs(u_xlat0.x) * u_xlat8 + u_xlat14.x;
    u_xlat14.x = u_xlat1.x * u_xlat8 + u_xlat14.x;
    u_xlat14.x = u_xlat14.x * abs(u_xlat0.x);
    u_xlat16_4 = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat1.x * u_xlat15 + u_xlat14.x;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.x = 0.5 / u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat14.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat14.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat14.xy;
    u_xlat16_2.xyz = texture(_DiffuseTex, u_xlat14.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat14.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat14.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat14.xy;
    u_xlat16_3.xyz = texture(_SecondaryTx, u_xlat14.xy).xyz;
    u_xlat2.xyz = vec3(_SecondaryTxIntensity) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat16_11.xyz = _Color0.xyz * u_xlat2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat2.xyz * _Color0.xyz;
    u_xlat16_11.xyz = vec3(_Metallic) * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_5.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat16_5.x!=0.0);
#else
    u_xlatb14 = u_xlat16_5.x!=0.0;
#endif
    u_xlat14.x = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat14.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat14.x = texture(_LightTexture0, u_xlat14.xx).x;
    u_xlat16_5.xyz = u_xlat14.xxx * _LightColor0.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_26 = (-u_xlat22) + 1.0;
    u_xlat16_27 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_27 = u_xlat16_27 * u_xlat16_27;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_27;
    u_xlat16_11.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_11.xyz;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat16_11.xyz;
    u_xlat16_11.x = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_11.xyz = u_xlat2.xyz * u_xlat16_11.xxx;
    u_xlat16_26 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_26;
    u_xlat16_26 = u_xlat22 + u_xlat22;
    u_xlat16_26 = u_xlat22 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat7 + -0.5;
    u_xlat16_4 = u_xlat16_26 * u_xlat16_4 + 1.0;
    u_xlat16_6.x = (-u_xlat1.x) + 1.0;
    u_xlat16_13 = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_13;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x + 1.0;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_26;
    u_xlat7 = u_xlat1.x * u_xlat16_4;
    u_xlat16_5.xyz = vec3(u_xlat7) * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * u_xlat16_5.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Color0;
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(1) uniform mediump sampler2D _DiffuseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_12;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
mediump float u_xlat16_19;
float u_xlat21;
float u_xlat22;
float u_xlat23;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = u_xlat0.xyz * vec3(u_xlat21) + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat8 = (-_Smoothness) + 1.0;
    u_xlat15 = u_xlat8 * u_xlat8;
    u_xlat15 = max(u_xlat15, 0.00200000009);
    u_xlat22 = u_xlat15 * u_xlat15;
    u_xlat23 = u_xlat21 * u_xlat22 + (-u_xlat21);
    u_xlat21 = u_xlat23 * u_xlat21 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21 + 1.00000001e-07;
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat7 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat14.x = (-u_xlat15) + 1.0;
    u_xlat22 = abs(u_xlat0.x) * u_xlat14.x + u_xlat15;
    u_xlat14.x = u_xlat7 * u_xlat14.x + u_xlat15;
    u_xlat14.x = u_xlat14.x * abs(u_xlat0.x);
    u_xlat16_3 = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat7 * u_xlat22 + u_xlat14.x;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.x = 0.5 / u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat14.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat14.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat14.xy;
    u_xlat16_2.xyz = texture(_DiffuseTex, u_xlat14.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat14.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat14.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat14.xy;
    u_xlat16_4.xyz = texture(_SecondaryTx, u_xlat14.xy).xyz;
    u_xlat2.xyz = vec3(_SecondaryTxIntensity) * u_xlat16_4.xyz + u_xlat2.xyz;
    u_xlat16_10.xyz = _Color0.xyz * u_xlat2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat2.xyz * _Color0.xyz;
    u_xlat16_10.xyz = vec3(_Metallic) * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_5.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat16_5.x!=0.0);
#else
    u_xlatb14 = u_xlat16_5.x!=0.0;
#endif
    u_xlat14.x = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat0.xzw = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat16_5.xyz = (-u_xlat16_10.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_26 = (-u_xlat1.x) + 1.0;
    u_xlat16_6 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6;
    u_xlat16_10.xyz = u_xlat16_5.xyz * vec3(u_xlat16_26) + u_xlat16_10.xyz;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat16_10.xyz;
    u_xlat16_10.x = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_10.xyz = u_xlat2.xyz * u_xlat16_10.xxx;
    u_xlat16_5.x = u_xlat16_3 * u_xlat16_3;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat1.x + u_xlat1.x;
    u_xlat16_5.x = u_xlat1.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat8 + -0.5;
    u_xlat16_3 = u_xlat16_5.x * u_xlat16_3 + 1.0;
    u_xlat16_12 = (-u_xlat7) + 1.0;
    u_xlat16_19 = u_xlat16_12 * u_xlat16_12;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
    u_xlat16_12 = u_xlat16_12 * u_xlat16_19;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_12 + 1.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_5.x;
    u_xlat7 = u_xlat7 * u_xlat16_3;
    u_xlat16_5.xyz = vec3(u_xlat7) * _LightColor0.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * u_xlat16_5.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color0;
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(1) uniform mediump sampler2D _DiffuseTex;
UNITY_LOCATION(2) uniform highp sampler2D _LightTexture0;
UNITY_LOCATION(3) uniform highp sampler2D _LightTextureB0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
float u_xlat8;
mediump float u_xlat16_13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
float u_xlat22;
mediump float u_xlat16_23;
mediump float u_xlat16_26;
mediump float u_xlat16_27;
void main()
{
    u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat21 = texture(_LightTexture0, u_xlat1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<u_xlat0.z);
#else
    u_xlatb1 = 0.0<u_xlat0.z;
#endif
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).x;
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = u_xlat21 * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _LightColor0.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat4.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat1.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat7 = (-_Smoothness) + 1.0;
    u_xlat14.x = u_xlat7 * u_xlat7;
    u_xlat14.x = max(u_xlat14.x, 0.00200000009);
    u_xlat8 = u_xlat14.x * u_xlat14.x;
    u_xlat15 = u_xlat21 * u_xlat8 + (-u_xlat21);
    u_xlat21 = u_xlat15 * u_xlat21 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21 + 1.00000001e-07;
    u_xlat8 = u_xlat8 * 0.318309873;
    u_xlat21 = u_xlat8 / u_xlat21;
    u_xlat8 = (-u_xlat14.x) + 1.0;
    u_xlat15 = abs(u_xlat0.x) * u_xlat8 + u_xlat14.x;
    u_xlat14.x = u_xlat1.x * u_xlat8 + u_xlat14.x;
    u_xlat14.x = u_xlat14.x * abs(u_xlat0.x);
    u_xlat16_23 = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat1.x * u_xlat15 + u_xlat14.x;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.x = 0.5 / u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat14.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat14.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat14.xy;
    u_xlat16_3.xyz = texture(_DiffuseTex, u_xlat14.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat14.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat14.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat14.xy;
    u_xlat16_4.xyz = texture(_SecondaryTx, u_xlat14.xy).xyz;
    u_xlat3.xyz = vec3(_SecondaryTxIntensity) * u_xlat16_4.xyz + u_xlat3.xyz;
    u_xlat16_5.xyz = _Color0.xyz * u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat3.xyz = u_xlat3.xyz * _Color0.xyz;
    u_xlat16_5.xyz = vec3(_Metallic) * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_26 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat16_26!=0.0);
#else
    u_xlatb14 = u_xlat16_26!=0.0;
#endif
    u_xlat14.x = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat0.xzw = u_xlat16_2.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_26 = (-u_xlat22) + 1.0;
    u_xlat16_27 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_27 = u_xlat16_27 * u_xlat16_27;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_27;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_5.xyz;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat16_5.xyz;
    u_xlat16_5.x = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_5.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat16_26 = u_xlat16_23 * u_xlat16_23;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_23 = u_xlat16_23 * u_xlat16_26;
    u_xlat16_26 = u_xlat22 + u_xlat22;
    u_xlat16_26 = u_xlat22 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat7 + -0.5;
    u_xlat16_23 = u_xlat16_26 * u_xlat16_23 + 1.0;
    u_xlat16_6.x = (-u_xlat1.x) + 1.0;
    u_xlat16_13 = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_13;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x + 1.0;
    u_xlat16_23 = u_xlat16_23 * u_xlat16_26;
    u_xlat7 = u_xlat1.x * u_xlat16_23;
    u_xlat16_2.xyz = vec3(u_xlat7) * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
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
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color0;
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(1) uniform mediump sampler2D _DiffuseTex;
UNITY_LOCATION(2) uniform highp sampler2D _LightTextureB0;
UNITY_LOCATION(3) uniform highp samplerCube _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_11;
mediump float u_xlat16_13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
float u_xlat22;
mediump float u_xlat16_26;
mediump float u_xlat16_27;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat1.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat7 = (-_Smoothness) + 1.0;
    u_xlat14.x = u_xlat7 * u_xlat7;
    u_xlat14.x = max(u_xlat14.x, 0.00200000009);
    u_xlat8 = u_xlat14.x * u_xlat14.x;
    u_xlat15 = u_xlat21 * u_xlat8 + (-u_xlat21);
    u_xlat21 = u_xlat15 * u_xlat21 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21 + 1.00000001e-07;
    u_xlat8 = u_xlat8 * 0.318309873;
    u_xlat21 = u_xlat8 / u_xlat21;
    u_xlat8 = (-u_xlat14.x) + 1.0;
    u_xlat15 = abs(u_xlat0.x) * u_xlat8 + u_xlat14.x;
    u_xlat14.x = u_xlat1.x * u_xlat8 + u_xlat14.x;
    u_xlat14.x = u_xlat14.x * abs(u_xlat0.x);
    u_xlat16_4 = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat1.x * u_xlat15 + u_xlat14.x;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.x = 0.5 / u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = u_xlat1.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat14.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat14.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat14.xy;
    u_xlat16_2.xyz = texture(_DiffuseTex, u_xlat14.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat14.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat14.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat14.xy;
    u_xlat16_3.xyz = texture(_SecondaryTx, u_xlat14.xy).xyz;
    u_xlat2.xyz = vec3(_SecondaryTxIntensity) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat16_11.xyz = _Color0.xyz * u_xlat2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat2.xyz * _Color0.xyz;
    u_xlat16_11.xyz = vec3(_Metallic) * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_5.x = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat16_5.x!=0.0);
#else
    u_xlatb14 = u_xlat16_5.x!=0.0;
#endif
    u_xlat14.x = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat14.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = texture(_LightTexture0, u_xlat3.xyz).w;
    u_xlat14.x = texture(_LightTextureB0, u_xlat14.xx).x;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
    u_xlat16_5.xyz = u_xlat14.xxx * _LightColor0.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_26 = (-u_xlat22) + 1.0;
    u_xlat16_27 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_27 = u_xlat16_27 * u_xlat16_27;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_27;
    u_xlat16_11.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_11.xyz;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat16_11.xyz;
    u_xlat16_11.x = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_11.xyz = u_xlat2.xyz * u_xlat16_11.xxx;
    u_xlat16_26 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_26;
    u_xlat16_26 = u_xlat22 + u_xlat22;
    u_xlat16_26 = u_xlat22 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat7 + -0.5;
    u_xlat16_4 = u_xlat16_26 * u_xlat16_4 + 1.0;
    u_xlat16_6.x = (-u_xlat1.x) + 1.0;
    u_xlat16_13 = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_13;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x + 1.0;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_26;
    u_xlat7 = u_xlat1.x * u_xlat16_4;
    u_xlat16_5.xyz = vec3(u_xlat7) * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * u_xlat16_5.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
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
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat1.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat1.zz + u_xlat0.xy;
    vs_TEXCOORD3.xy = hlslcc_mtx4x4unity_WorldToLight[3].xy * u_xlat1.ww + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD1.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _Color0;
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(1) uniform mediump sampler2D _DiffuseTex;
UNITY_LOCATION(2) uniform highp sampler2D _LightTexture0;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
float u_xlat22;
float u_xlat23;
mediump float u_xlat16_26;
mediump float u_xlat16_27;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = u_xlat0.xyz * vec3(u_xlat21) + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * vs_TEXCOORD1.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat8 = (-_Smoothness) + 1.0;
    u_xlat15 = u_xlat8 * u_xlat8;
    u_xlat15 = max(u_xlat15, 0.00200000009);
    u_xlat22 = u_xlat15 * u_xlat15;
    u_xlat23 = u_xlat21 * u_xlat22 + (-u_xlat21);
    u_xlat21 = u_xlat23 * u_xlat21 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21 + 1.00000001e-07;
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat7 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat14.x = (-u_xlat15) + 1.0;
    u_xlat22 = abs(u_xlat0.x) * u_xlat14.x + u_xlat15;
    u_xlat14.x = u_xlat7 * u_xlat14.x + u_xlat15;
    u_xlat14.x = u_xlat14.x * abs(u_xlat0.x);
    u_xlat16_3 = -abs(u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat7 * u_xlat22 + u_xlat14.x;
    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
    u_xlat0.x = 0.5 / u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3.14159274;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat14.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat14.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat14.xy;
    u_xlat16_2.xyz = texture(_DiffuseTex, u_xlat14.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat14.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat14.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat14.xy;
    u_xlat16_4.xyz = texture(_SecondaryTx, u_xlat14.xy).xyz;
    u_xlat2.xyz = vec3(_SecondaryTxIntensity) * u_xlat16_4.xyz + u_xlat2.xyz;
    u_xlat16_10.xyz = _Color0.xyz * u_xlat2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat2.xyz * _Color0.xyz;
    u_xlat16_10.xyz = vec3(_Metallic) * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_5.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat16_5.x!=0.0);
#else
    u_xlatb14 = u_xlat16_5.x!=0.0;
#endif
    u_xlat14.x = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat14.xy = vs_TEXCOORD2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat14.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat14.xy;
    u_xlat14.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat14.xy;
    u_xlat14.xy = u_xlat14.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat14.x = texture(_LightTexture0, u_xlat14.xy).w;
    u_xlat16_5.xyz = u_xlat14.xxx * _LightColor0.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat16_6.xyz = (-u_xlat16_10.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_26 = (-u_xlat1.x) + 1.0;
    u_xlat16_27 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_27 = u_xlat16_27 * u_xlat16_27;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_27;
    u_xlat16_10.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_10.xyz;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat16_10.xyz;
    u_xlat16_10.x = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_10.xyz = u_xlat2.xyz * u_xlat16_10.xxx;
    u_xlat16_26 = u_xlat16_3 * u_xlat16_3;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_26;
    u_xlat16_26 = u_xlat1.x + u_xlat1.x;
    u_xlat16_26 = u_xlat1.x * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat8 + -0.5;
    u_xlat16_3 = u_xlat16_26 * u_xlat16_3 + 1.0;
    u_xlat16_6.x = (-u_xlat7) + 1.0;
    u_xlat16_13 = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_13;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x + 1.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_26;
    u_xlat7 = u_xlat7 * u_xlat16_3;
    u_xlat16_5.xyz = vec3(u_xlat7) * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * u_xlat16_5.xyz + u_xlat0.xzw;
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
 Pass {
  Name "DEFERRED"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "DEFERRED" "QUEUE" = "Geometry+0" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  Cull Off
  GpuProgramID 136742
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
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD4;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Color0;
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	vec4 _FresnelColor;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(1) uniform mediump sampler2D _DiffuseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_DiffuseTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat1.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_SecondaryTx, u_xlat1.xy).xyz;
    u_xlat0.xyz = vec3(_SecondaryTxIntensity) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _Color0.xyz;
    u_xlat16_2.x = (-_Metallic) * 0.959999979 + 0.959999979;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    SV_Target0.w = 1.0;
    u_xlat16_2.xyz = _Color0.xyz * u_xlat0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    SV_Target1.xyz = vec3(_Metallic) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target1.w = _Smoothness;
    u_xlat1.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat9 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = max(u_xlat9, 9.99999975e-05);
    u_xlat9 = log2(u_xlat9);
    u_xlat9 = u_xlat9 * _FresnelPower;
    u_xlat9 = exp2(u_xlat9);
    u_xlat9 = u_xlat9 * _FresnelScale;
    u_xlat0.xyz = vec3(u_xlat9) * _FresnelColor.xyz + u_xlat0.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "LIGHTPROBE_SH" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 _Color0;
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	vec4 _FresnelColor;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(1) uniform mediump sampler2D _DiffuseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_DiffuseTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat1.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_SecondaryTx, u_xlat1.xy).xyz;
    u_xlat0.xyz = vec3(_SecondaryTxIntensity) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _Color0.xyz;
    u_xlat16_2.x = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    SV_Target0.xyz = u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    u_xlat16_3.xyz = _Color0.xyz * u_xlat0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    SV_Target1.xyz = vec3(_Metallic) * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target1.w = _Smoothness;
    u_xlat1.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _FresnelPower;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * _FresnelScale;
    u_xlat0.xyz = vec3(u_xlat12) * _FresnelColor.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vs_TEXCOORD1.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + vs_TEXCOORD5.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat0.xyz;
    SV_Target3.xyz = exp2((-u_xlat16_2.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "UNITY_HDR_ON" }
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
out highp vec4 vs_TEXCOORD4;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Color0;
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	vec4 _FresnelColor;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(1) uniform mediump sampler2D _DiffuseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_DiffuseTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat1.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_SecondaryTx, u_xlat1.xy).xyz;
    u_xlat0.xyz = vec3(_SecondaryTxIntensity) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _Color0.xyz;
    u_xlat16_2.x = (-_Metallic) * 0.959999979 + 0.959999979;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    SV_Target0.w = 1.0;
    u_xlat16_2.xyz = _Color0.xyz * u_xlat0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    SV_Target1.xyz = vec3(_Metallic) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target1.w = _Smoothness;
    u_xlat1.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat9 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = max(u_xlat9, 9.99999975e-05);
    u_xlat9 = log2(u_xlat9);
    u_xlat9 = u_xlat9 * _FresnelPower;
    u_xlat9 = exp2(u_xlat9);
    u_xlat9 = u_xlat9 * _FresnelScale;
    u_xlat0.xyz = vec3(u_xlat9) * _FresnelColor.xyz + u_xlat0.xyz;
    SV_Target3.xyz = u_xlat0.xyz;
    SV_Target3.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 _Color0;
uniform 	float _SecondaryTxIntensity;
uniform 	vec2 _SecondaryTxTile;
uniform 	vec2 _SecondaryTxPan;
uniform 	float _DiffuseIntensity;
uniform 	vec2 _DiffuseTxTile;
uniform 	vec2 _DiffuseTxPan;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	vec4 _FresnelColor;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _SecondaryTx;
UNITY_LOCATION(1) uniform mediump sampler2D _DiffuseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(_DiffuseTxPan.x, _DiffuseTxPan.y);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DiffuseTxTile.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_DiffuseTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseIntensity, _DiffuseIntensity, _DiffuseIntensity));
    u_xlat1.xy = _Time.yy * _SecondaryTxPan.xy;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_SecondaryTxTile.x, _SecondaryTxTile.y) + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_SecondaryTx, u_xlat1.xy).xyz;
    u_xlat0.xyz = vec3(_SecondaryTxIntensity) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _Color0.xyz;
    u_xlat16_2.x = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    SV_Target0.xyz = u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    u_xlat16_3.xyz = _Color0.xyz * u_xlat0.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    SV_Target1.xyz = vec3(_Metallic) * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target1.w = _Smoothness;
    u_xlat1.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _FresnelPower;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * _FresnelScale;
    u_xlat0.xyz = vec3(u_xlat12) * _FresnelColor.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vs_TEXCOORD1.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + vs_TEXCOORD5.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat0.xyz;
    SV_Target3.w = 1.0;
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
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "gles3 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
}
}
}
CustomEditor "ASEMaterialInspector"
}