//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/Center_RT_LavaRock" {
Properties {
_Diffuse ("Diffuse", 2D) = "white" { }
_Emissive ("Emissive", 2D) = "white" { }
_Normals ("Normals", 2D) = "bump" { }
_Tiling ("Tiling", Vector) = (2,2,0,0)
_Offset ("Offset", Vector) = (0,0,0,0)
_Panning ("Panning", Vector) = (0,0,0,0)
_EmissiveIntensityOverall ("Emissive Intensity Overall", Float) = 0.3
_Metallic ("Metallic", Float) = 0
_Smoothness ("Smoothness", Float) = 0
_Rotation ("Rotation", Float) = 45
_EmissiveVariationIntensity ("Emissive Variation Intensity", Float) = 4
_EmissiveVariation ("Emissive Variation", 2D) = "white" { }
_EmisiveIntensityBase ("Emisive Intensity Base", Float) = 1
_EmissiveVariationTiling ("Emissive Variation Tiling", Vector) = (1,1,0,0)
_EmissiveVariationOffset ("Emissive Variation Offset", Vector) = (0,0,0,0)
_EmissiveVariationPanning ("Emissive Variation Panning", Vector) = (0,0,0,0)
_EmissiveVariationPower ("Emissive Variation Power", Float) = 3
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 3323
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
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
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.w;
    u_xlat16_4 = u_xlat2.y * u_xlat2.y;
    u_xlat16_4 = u_xlat2.x * u_xlat2.x + (-u_xlat16_4);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD4.xyz = unity_SHC.xyz * vec3(u_xlat16_4) + u_xlat16_5.xyz;
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
uniform 	vec2 _Panning;
uniform 	vec2 _Tiling;
uniform 	vec2 _Offset;
uniform 	float _Rotation;
uniform 	float _EmisiveIntensityBase;
uniform 	vec2 _EmissiveVariationPanning;
uniform 	vec2 _EmissiveVariationTiling;
uniform 	vec2 _EmissiveVariationOffset;
uniform 	float _EmissiveVariationPower;
uniform 	float _EmissiveVariationIntensity;
uniform 	float _EmissiveIntensityOverall;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normals;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissiveVariation;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(5) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
float u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
mediump float u_xlat16_11;
bvec3 u_xlatb12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
float u_xlat18;
vec3 u_xlat28;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_32;
float u_xlat34;
float u_xlat35;
float u_xlat51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_58;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat51 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * vec2(_Tiling.x, _Tiling.y) + _Offset.xy;
    u_xlat3.xy = _Time.yy * _Panning.xy + u_xlat3.xy;
    u_xlat52 = _Rotation * 0.0174532924;
    u_xlat4.x = sin(u_xlat52);
    u_xlat5 = cos(u_xlat52);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5;
    u_xlat6.z = u_xlat4.x;
    u_xlat4.x = dot(u_xlat3.xy, u_xlat6.yz);
    u_xlat4.y = dot(u_xlat3.xy, u_xlat6.xy);
    u_xlat16_3.xyz = texture(_Normals, u_xlat4.xy).xyz;
    u_xlat16_5.xyz = texture(_Diffuse, u_xlat4.xy).xyz;
    u_xlat16_4.xyz = texture(_Emissive, u_xlat4.xy).xyz;
    u_xlat4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat6.xy = vs_TEXCOORD0.xy * vec2(_EmissiveVariationTiling.x, _EmissiveVariationTiling.y) + _EmissiveVariationOffset.xy;
    u_xlat6.xy = _Time.yy * _EmissiveVariationPanning.xy + u_xlat6.xy;
    u_xlat16_6.xyz = texture(_EmissiveVariation, u_xlat6.xy).xyz;
    u_xlat6.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = log2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_EmissiveVariationPower, _EmissiveVariationPower, _EmissiveVariationPower));
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = min(u_xlat6.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat6.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_EmissiveVariationIntensity, _EmissiveVariationIntensity, _EmissiveVariationIntensity));
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_EmisiveIntensityBase, _EmisiveIntensityBase, _EmisiveIntensityBase)) + u_xlat6.xyz;
    u_xlat6.x = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat6.y = dot(vs_TEXCOORD2.xyz, u_xlat16_3.xyz);
    u_xlat6.z = dot(vs_TEXCOORD3.xyz, u_xlat16_3.xyz);
    u_xlat52 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat3.xyz = vec3(u_xlat52) * u_xlat6.xyz;
    u_xlat52 = (-_Smoothness) + 1.0;
    u_xlat16_7.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat16_7.xyz = u_xlat3.xyz * (-u_xlat16_7.xxx) + (-u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb53 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb53){
        u_xlat53 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
        u_xlat53 = inversesqrt(u_xlat53);
        u_xlat6.xyz = vec3(u_xlat53) * u_xlat16_7.xyz;
        u_xlat8.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat6.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat53 = min(u_xlat8.y, u_xlat8.x);
        u_xlat53 = min(u_xlat8.z, u_xlat53);
        u_xlat8.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat53) + u_xlat8.xyz;
    } else {
        u_xlat6.xyz = u_xlat16_7.xyz;
    }
    u_xlat16_58 = (-u_xlat52) * 0.699999988 + 1.70000005;
    u_xlat16_58 = u_xlat52 * u_xlat16_58;
    u_xlat16_58 = u_xlat16_58 * 6.0;
    u_xlat16_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, u_xlat16_58);
    u_xlat16_11 = u_xlat16_6.w + -1.0;
    u_xlat16_11 = unity_SpecCube0_HDR.w * u_xlat16_11 + 1.0;
    u_xlat16_11 = log2(u_xlat16_11);
    u_xlat16_11 = u_xlat16_11 * unity_SpecCube0_HDR.y;
    u_xlat16_11 = exp2(u_xlat16_11);
    u_xlat16_11 = u_xlat16_11 * unity_SpecCube0_HDR.x;
    u_xlat16_28.xyz = u_xlat16_6.xyz * vec3(u_xlat16_11);
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb53 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb53){
#ifdef UNITY_ADRENO_ES3
        u_xlatb53 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb53 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb53){
            u_xlat53 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
            u_xlat53 = inversesqrt(u_xlat53);
            u_xlat8.xyz = vec3(u_xlat53) * u_xlat16_7.xyz;
            u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
            u_xlat10.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat9;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat9.x : u_xlat10.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat9.y : u_xlat10.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat9.z : u_xlat10.z;
                u_xlat9 = hlslcc_movcTemp;
            }
            u_xlat53 = min(u_xlat9.y, u_xlat9.x);
            u_xlat53 = min(u_xlat9.z, u_xlat53);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat8.xyz * vec3(u_xlat53) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_7.xyz;
        }
        u_xlat16_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat16_58);
        u_xlat16_13.x = u_xlat16_7.w + -1.0;
        u_xlat16_13.x = unity_SpecCube1_HDR.w * u_xlat16_13.x + 1.0;
        u_xlat16_13.x = log2(u_xlat16_13.x);
        u_xlat16_13.x = u_xlat16_13.x * unity_SpecCube1_HDR.y;
        u_xlat16_13.x = exp2(u_xlat16_13.x);
        u_xlat16_13.x = u_xlat16_13.x * unity_SpecCube1_HDR.x;
        u_xlat16_13.xyz = u_xlat16_7.xyz * u_xlat16_13.xxx;
        u_xlat0.xyz = vec3(u_xlat16_11) * u_xlat16_6.xyz + (-u_xlat16_13.xyz);
        u_xlat28.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_13.xyz;
        u_xlat16_28.xyz = u_xlat28.xyz;
    }
    u_xlat16_13.xyz = u_xlat16_5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_11 = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_14.xyz = u_xlat16_5.xyz * vec3(u_xlat16_11);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat51) + _WorldSpaceLightPos0.xyz;
    u_xlat51 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat51 = max(u_xlat51, 0.00100000005);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat0.xyz;
    u_xlat51 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat18 = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat0.x + u_xlat0.x;
    u_xlat16_64 = u_xlat0.x * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * u_xlat52 + -0.5;
    u_xlat16_65 = (-u_xlat1.x) + 1.0;
    u_xlat16_15 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_15;
    u_xlat16_65 = u_xlat16_64 * u_xlat16_65 + 1.0;
    u_xlat16_15 = -abs(u_xlat51) + 1.0;
    u_xlat16_32.x = u_xlat16_15 * u_xlat16_15;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_32.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_15 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat17 = u_xlat1.x * u_xlat16_64;
    u_xlat34 = u_xlat52 * u_xlat52;
    u_xlat34 = max(u_xlat34, 0.00200000009);
    u_xlat35 = (-u_xlat34) + 1.0;
    u_xlat52 = abs(u_xlat51) * u_xlat35 + u_xlat34;
    u_xlat35 = u_xlat1.x * u_xlat35 + u_xlat34;
    u_xlat51 = abs(u_xlat51) * u_xlat35;
    u_xlat51 = u_xlat1.x * u_xlat52 + u_xlat51;
    u_xlat51 = u_xlat51 + 9.99999975e-06;
    u_xlat51 = 0.5 / u_xlat51;
    u_xlat35 = u_xlat34 * u_xlat34;
    u_xlat52 = u_xlat18 * u_xlat35 + (-u_xlat18);
    u_xlat18 = u_xlat52 * u_xlat18 + 1.0;
    u_xlat35 = u_xlat35 * 0.318309873;
    u_xlat18 = u_xlat18 * u_xlat18 + 1.00000001e-07;
    u_xlat18 = u_xlat35 / u_xlat18;
    u_xlat51 = u_xlat51 * u_xlat18;
    u_xlat51 = u_xlat1.x * u_xlat51;
    u_xlat51 = u_xlat51 * 3.14159274;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat34 = u_xlat34 * u_xlat34 + 1.0;
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat16_64 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_64!=0.0);
#else
    u_xlatb1 = u_xlat16_64!=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat51 = u_xlat51 * u_xlat1.x;
    u_xlat16_11 = (-u_xlat16_11) + 1.0;
    u_xlat16_11 = u_xlat16_11 + _Smoothness;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11 = min(max(u_xlat16_11, 0.0), 1.0);
#else
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
#endif
    u_xlat16_32.xyz = vec3(u_xlat17) * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat51) * _LightColor0.xyz;
    u_xlat16_64 = (-u_xlat0.x) + 1.0;
    u_xlat16_65 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_16.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_64) + u_xlat16_13.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_16.xyz;
    u_xlat0.xyw = u_xlat16_14.xyz * u_xlat16_32.xyz + u_xlat0.xyw;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(u_xlat34);
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + vec3(u_xlat16_11);
    u_xlat16_13.xyz = vec3(u_xlat16_15) * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat0.xyz = u_xlat16_28.xyz * u_xlat16_13.xyz + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat4.xyz * vec3(_EmissiveIntensityOverall) + u_xlat0.xyz;
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
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
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.w;
    u_xlat16_4 = u_xlat2.y * u_xlat2.y;
    u_xlat16_4 = u_xlat2.x * u_xlat2.x + (-u_xlat16_4);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD4.xyz = unity_SHC.xyz * vec3(u_xlat16_4) + u_xlat16_5.xyz;
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
uniform 	vec2 _Panning;
uniform 	vec2 _Tiling;
uniform 	vec2 _Offset;
uniform 	float _Rotation;
uniform 	float _EmisiveIntensityBase;
uniform 	vec2 _EmissiveVariationPanning;
uniform 	vec2 _EmissiveVariationTiling;
uniform 	vec2 _EmissiveVariationOffset;
uniform 	float _EmissiveVariationPower;
uniform 	float _EmissiveVariationIntensity;
uniform 	float _EmissiveIntensityOverall;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normals;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissiveVariation;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(5) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
float u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
mediump float u_xlat16_11;
bvec3 u_xlatb12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
float u_xlat18;
vec3 u_xlat28;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_32;
float u_xlat34;
float u_xlat35;
float u_xlat51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_58;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat51 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * vec2(_Tiling.x, _Tiling.y) + _Offset.xy;
    u_xlat3.xy = _Time.yy * _Panning.xy + u_xlat3.xy;
    u_xlat52 = _Rotation * 0.0174532924;
    u_xlat4.x = sin(u_xlat52);
    u_xlat5 = cos(u_xlat52);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5;
    u_xlat6.z = u_xlat4.x;
    u_xlat4.x = dot(u_xlat3.xy, u_xlat6.yz);
    u_xlat4.y = dot(u_xlat3.xy, u_xlat6.xy);
    u_xlat16_3.xyz = texture(_Normals, u_xlat4.xy).xyz;
    u_xlat16_5.xyz = texture(_Diffuse, u_xlat4.xy).xyz;
    u_xlat16_4.xyz = texture(_Emissive, u_xlat4.xy).xyz;
    u_xlat4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat6.xy = vs_TEXCOORD0.xy * vec2(_EmissiveVariationTiling.x, _EmissiveVariationTiling.y) + _EmissiveVariationOffset.xy;
    u_xlat6.xy = _Time.yy * _EmissiveVariationPanning.xy + u_xlat6.xy;
    u_xlat16_6.xyz = texture(_EmissiveVariation, u_xlat6.xy).xyz;
    u_xlat6.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = log2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_EmissiveVariationPower, _EmissiveVariationPower, _EmissiveVariationPower));
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = min(u_xlat6.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat6.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_EmissiveVariationIntensity, _EmissiveVariationIntensity, _EmissiveVariationIntensity));
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_EmisiveIntensityBase, _EmisiveIntensityBase, _EmisiveIntensityBase)) + u_xlat6.xyz;
    u_xlat6.x = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat6.y = dot(vs_TEXCOORD2.xyz, u_xlat16_3.xyz);
    u_xlat6.z = dot(vs_TEXCOORD3.xyz, u_xlat16_3.xyz);
    u_xlat52 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat3.xyz = vec3(u_xlat52) * u_xlat6.xyz;
    u_xlat52 = (-_Smoothness) + 1.0;
    u_xlat16_7.x = dot((-u_xlat2.xyz), u_xlat3.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat16_7.xyz = u_xlat3.xyz * (-u_xlat16_7.xxx) + (-u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb53 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb53){
        u_xlat53 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
        u_xlat53 = inversesqrt(u_xlat53);
        u_xlat6.xyz = vec3(u_xlat53) * u_xlat16_7.xyz;
        u_xlat8.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat6.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat53 = min(u_xlat8.y, u_xlat8.x);
        u_xlat53 = min(u_xlat8.z, u_xlat53);
        u_xlat8.xyz = u_xlat0.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat53) + u_xlat8.xyz;
    } else {
        u_xlat6.xyz = u_xlat16_7.xyz;
    }
    u_xlat16_58 = (-u_xlat52) * 0.699999988 + 1.70000005;
    u_xlat16_58 = u_xlat52 * u_xlat16_58;
    u_xlat16_58 = u_xlat16_58 * 6.0;
    u_xlat16_6 = textureLod(unity_SpecCube0, u_xlat6.xyz, u_xlat16_58);
    u_xlat16_11 = u_xlat16_6.w + -1.0;
    u_xlat16_11 = unity_SpecCube0_HDR.w * u_xlat16_11 + 1.0;
    u_xlat16_11 = log2(u_xlat16_11);
    u_xlat16_11 = u_xlat16_11 * unity_SpecCube0_HDR.y;
    u_xlat16_11 = exp2(u_xlat16_11);
    u_xlat16_11 = u_xlat16_11 * unity_SpecCube0_HDR.x;
    u_xlat16_28.xyz = u_xlat16_6.xyz * vec3(u_xlat16_11);
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb53 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb53){
#ifdef UNITY_ADRENO_ES3
        u_xlatb53 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb53 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb53){
            u_xlat53 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
            u_xlat53 = inversesqrt(u_xlat53);
            u_xlat8.xyz = vec3(u_xlat53) * u_xlat16_7.xyz;
            u_xlat9.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
            u_xlat10.xyz = (-u_xlat0.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat9;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat9.x : u_xlat10.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat9.y : u_xlat10.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat9.z : u_xlat10.z;
                u_xlat9 = hlslcc_movcTemp;
            }
            u_xlat53 = min(u_xlat9.y, u_xlat9.x);
            u_xlat53 = min(u_xlat9.z, u_xlat53);
            u_xlat0.xyz = u_xlat0.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat0.xyz = u_xlat8.xyz * vec3(u_xlat53) + u_xlat0.xyz;
        } else {
            u_xlat0.xyz = u_xlat16_7.xyz;
        }
        u_xlat16_7 = textureLod(unity_SpecCube1, u_xlat0.xyz, u_xlat16_58);
        u_xlat16_13.x = u_xlat16_7.w + -1.0;
        u_xlat16_13.x = unity_SpecCube1_HDR.w * u_xlat16_13.x + 1.0;
        u_xlat16_13.x = log2(u_xlat16_13.x);
        u_xlat16_13.x = u_xlat16_13.x * unity_SpecCube1_HDR.y;
        u_xlat16_13.x = exp2(u_xlat16_13.x);
        u_xlat16_13.x = u_xlat16_13.x * unity_SpecCube1_HDR.x;
        u_xlat16_13.xyz = u_xlat16_7.xyz * u_xlat16_13.xxx;
        u_xlat0.xyz = vec3(u_xlat16_11) * u_xlat16_6.xyz + (-u_xlat16_13.xyz);
        u_xlat28.xyz = unity_SpecCube0_BoxMin.www * u_xlat0.xyz + u_xlat16_13.xyz;
        u_xlat16_28.xyz = u_xlat28.xyz;
    }
    u_xlat16_13.xyz = u_xlat16_5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_11 = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat16_14.xyz = u_xlat16_5.xyz * vec3(u_xlat16_11);
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat51) + _WorldSpaceLightPos0.xyz;
    u_xlat51 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat51 = max(u_xlat51, 0.00100000005);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat0.xyz;
    u_xlat51 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat18 = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat0.x + u_xlat0.x;
    u_xlat16_64 = u_xlat0.x * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * u_xlat52 + -0.5;
    u_xlat16_65 = (-u_xlat1.x) + 1.0;
    u_xlat16_15 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_15;
    u_xlat16_65 = u_xlat16_64 * u_xlat16_65 + 1.0;
    u_xlat16_15 = -abs(u_xlat51) + 1.0;
    u_xlat16_32.x = u_xlat16_15 * u_xlat16_15;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_32.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_15 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat17 = u_xlat1.x * u_xlat16_64;
    u_xlat34 = u_xlat52 * u_xlat52;
    u_xlat34 = max(u_xlat34, 0.00200000009);
    u_xlat35 = (-u_xlat34) + 1.0;
    u_xlat52 = abs(u_xlat51) * u_xlat35 + u_xlat34;
    u_xlat35 = u_xlat1.x * u_xlat35 + u_xlat34;
    u_xlat51 = abs(u_xlat51) * u_xlat35;
    u_xlat51 = u_xlat1.x * u_xlat52 + u_xlat51;
    u_xlat51 = u_xlat51 + 9.99999975e-06;
    u_xlat51 = 0.5 / u_xlat51;
    u_xlat35 = u_xlat34 * u_xlat34;
    u_xlat52 = u_xlat18 * u_xlat35 + (-u_xlat18);
    u_xlat18 = u_xlat52 * u_xlat18 + 1.0;
    u_xlat35 = u_xlat35 * 0.318309873;
    u_xlat18 = u_xlat18 * u_xlat18 + 1.00000001e-07;
    u_xlat18 = u_xlat35 / u_xlat18;
    u_xlat51 = u_xlat51 * u_xlat18;
    u_xlat51 = u_xlat1.x * u_xlat51;
    u_xlat51 = u_xlat51 * 3.14159274;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat34 = u_xlat34 * u_xlat34 + 1.0;
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat16_64 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_64!=0.0);
#else
    u_xlatb1 = u_xlat16_64!=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat51 = u_xlat51 * u_xlat1.x;
    u_xlat16_11 = (-u_xlat16_11) + 1.0;
    u_xlat16_11 = u_xlat16_11 + _Smoothness;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11 = min(max(u_xlat16_11, 0.0), 1.0);
#else
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
#endif
    u_xlat16_32.xyz = vec3(u_xlat17) * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat51) * _LightColor0.xyz;
    u_xlat16_64 = (-u_xlat0.x) + 1.0;
    u_xlat16_65 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_16.xyz = (-u_xlat16_13.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_64) + u_xlat16_13.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat16_16.xyz;
    u_xlat0.xyw = u_xlat16_14.xyz * u_xlat16_32.xyz + u_xlat0.xyw;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(u_xlat34);
    u_xlat16_14.xyz = (-u_xlat16_13.xyz) + vec3(u_xlat16_11);
    u_xlat16_13.xyz = vec3(u_xlat16_15) * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat0.xyz = u_xlat16_28.xyz * u_xlat16_13.xyz + u_xlat0.xyw;
    SV_Target0.xyz = u_xlat4.xyz * vec3(_EmissiveIntensityOverall) + u_xlat0.xyz;
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
  Name "DEFERRED"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "DEFERRED" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 79953
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
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
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.w;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_4 = u_xlat2.y * u_xlat2.y;
    u_xlat16_4 = u_xlat2.x * u_xlat2.x + (-u_xlat16_4);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD6.xyz = unity_SHC.xyz * vec3(u_xlat16_4) + u_xlat16_5.xyz;
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
uniform 	vec2 _Panning;
uniform 	vec2 _Tiling;
uniform 	vec2 _Offset;
uniform 	float _Rotation;
uniform 	float _EmisiveIntensityBase;
uniform 	vec2 _EmissiveVariationPanning;
uniform 	vec2 _EmissiveVariationTiling;
uniform 	vec2 _EmissiveVariationOffset;
uniform 	float _EmissiveVariationPower;
uniform 	float _EmissiveVariationIntensity;
uniform 	float _EmissiveIntensityOverall;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normals;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissiveVariation;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat11;
float u_xlat16;
void main()
{
    SV_Target0.w = 1.0;
    u_xlat16_0.x = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_Tiling.x, _Tiling.y) + _Offset.xy;
    u_xlat1.xy = _Time.yy * _Panning.xy + u_xlat1.xy;
    u_xlat11 = _Rotation * 0.0174532924;
    u_xlat2.x = sin(u_xlat11);
    u_xlat3 = cos(u_xlat11);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat16_1.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat16_0.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target1.w = _Smoothness;
    u_xlat16_3.xyz = texture(_Normals, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_Emissive, u_xlat2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat2.y = dot(vs_TEXCOORD2.xyz, u_xlat16_3.xyz);
    u_xlat2.z = dot(vs_TEXCOORD3.xyz, u_xlat16_3.xyz);
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.xyz = u_xlat2.xyz;
    SV_Target2.w = 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_EmissiveVariationTiling.x, _EmissiveVariationTiling.y) + _EmissiveVariationOffset.xy;
    u_xlat2.xy = _Time.yy * _EmissiveVariationPanning.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_EmissiveVariation, u_xlat2.xy).xyz;
    u_xlat2.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveVariationPower, _EmissiveVariationPower, _EmissiveVariationPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = min(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveVariationIntensity, _EmissiveVariationIntensity, _EmissiveVariationIntensity));
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmisiveIntensityBase, _EmisiveIntensityBase, _EmisiveIntensityBase)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_EmissiveIntensityOverall);
    SV_Target3.xyz = exp2((-u_xlat1.xyz));
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
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
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.w;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_4 = u_xlat2.y * u_xlat2.y;
    u_xlat16_4 = u_xlat2.x * u_xlat2.x + (-u_xlat16_4);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD6.xyz = unity_SHC.xyz * vec3(u_xlat16_4) + u_xlat16_5.xyz;
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
uniform 	vec2 _Panning;
uniform 	vec2 _Tiling;
uniform 	vec2 _Offset;
uniform 	float _Rotation;
uniform 	float _EmisiveIntensityBase;
uniform 	vec2 _EmissiveVariationPanning;
uniform 	vec2 _EmissiveVariationTiling;
uniform 	vec2 _EmissiveVariationOffset;
uniform 	float _EmissiveVariationPower;
uniform 	float _EmissiveVariationIntensity;
uniform 	float _EmissiveIntensityOverall;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normals;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissiveVariation;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat11;
float u_xlat16;
void main()
{
    SV_Target0.w = 1.0;
    u_xlat16_0.x = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_Tiling.x, _Tiling.y) + _Offset.xy;
    u_xlat1.xy = _Time.yy * _Panning.xy + u_xlat1.xy;
    u_xlat11 = _Rotation * 0.0174532924;
    u_xlat2.x = sin(u_xlat11);
    u_xlat3 = cos(u_xlat11);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat16_1.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat16_0.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target1.w = _Smoothness;
    u_xlat16_3.xyz = texture(_Normals, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_Emissive, u_xlat2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat2.y = dot(vs_TEXCOORD2.xyz, u_xlat16_3.xyz);
    u_xlat2.z = dot(vs_TEXCOORD3.xyz, u_xlat16_3.xyz);
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.xyz = u_xlat2.xyz;
    SV_Target2.w = 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_EmissiveVariationTiling.x, _EmissiveVariationTiling.y) + _EmissiveVariationOffset.xy;
    u_xlat2.xy = _Time.yy * _EmissiveVariationPanning.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_EmissiveVariation, u_xlat2.xy).xyz;
    u_xlat2.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveVariationPower, _EmissiveVariationPower, _EmissiveVariationPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = min(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveVariationIntensity, _EmissiveVariationIntensity, _EmissiveVariationIntensity));
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmisiveIntensityBase, _EmisiveIntensityBase, _EmisiveIntensityBase)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_EmissiveIntensityOverall);
    SV_Target3.xyz = exp2((-u_xlat1.xyz));
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
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
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.w;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_4 = u_xlat2.y * u_xlat2.y;
    u_xlat16_4 = u_xlat2.x * u_xlat2.x + (-u_xlat16_4);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD6.xyz = unity_SHC.xyz * vec3(u_xlat16_4) + u_xlat16_5.xyz;
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
uniform 	vec2 _Panning;
uniform 	vec2 _Tiling;
uniform 	vec2 _Offset;
uniform 	float _Rotation;
uniform 	float _EmisiveIntensityBase;
uniform 	vec2 _EmissiveVariationPanning;
uniform 	vec2 _EmissiveVariationTiling;
uniform 	vec2 _EmissiveVariationOffset;
uniform 	float _EmissiveVariationPower;
uniform 	float _EmissiveVariationIntensity;
uniform 	float _EmissiveIntensityOverall;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normals;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissiveVariation;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat11;
float u_xlat16;
void main()
{
    SV_Target0.w = 1.0;
    u_xlat16_0.x = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_Tiling.x, _Tiling.y) + _Offset.xy;
    u_xlat1.xy = _Time.yy * _Panning.xy + u_xlat1.xy;
    u_xlat11 = _Rotation * 0.0174532924;
    u_xlat2.x = sin(u_xlat11);
    u_xlat3 = cos(u_xlat11);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat16_1.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat16_0.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target1.w = _Smoothness;
    u_xlat16_3.xyz = texture(_Normals, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_Emissive, u_xlat2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat2.y = dot(vs_TEXCOORD2.xyz, u_xlat16_3.xyz);
    u_xlat2.z = dot(vs_TEXCOORD3.xyz, u_xlat16_3.xyz);
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.xyz = u_xlat2.xyz;
    SV_Target2.w = 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_EmissiveVariationTiling.x, _EmissiveVariationTiling.y) + _EmissiveVariationOffset.xy;
    u_xlat2.xy = _Time.yy * _EmissiveVariationPanning.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_EmissiveVariation, u_xlat2.xy).xyz;
    u_xlat2.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveVariationPower, _EmissiveVariationPower, _EmissiveVariationPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = min(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveVariationIntensity, _EmissiveVariationIntensity, _EmissiveVariationIntensity));
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmisiveIntensityBase, _EmisiveIntensityBase, _EmisiveIntensityBase)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_EmissiveIntensityOverall);
    SV_Target3.xyz = u_xlat1.xyz;
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
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
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.w;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_4 = u_xlat2.y * u_xlat2.y;
    u_xlat16_4 = u_xlat2.x * u_xlat2.x + (-u_xlat16_4);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD6.xyz = unity_SHC.xyz * vec3(u_xlat16_4) + u_xlat16_5.xyz;
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
uniform 	vec2 _Panning;
uniform 	vec2 _Tiling;
uniform 	vec2 _Offset;
uniform 	float _Rotation;
uniform 	float _EmisiveIntensityBase;
uniform 	vec2 _EmissiveVariationPanning;
uniform 	vec2 _EmissiveVariationTiling;
uniform 	vec2 _EmissiveVariationOffset;
uniform 	float _EmissiveVariationPower;
uniform 	float _EmissiveVariationIntensity;
uniform 	float _EmissiveIntensityOverall;
uniform 	float _Metallic;
uniform 	float _Smoothness;
UNITY_LOCATION(0) uniform mediump sampler2D _Normals;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissiveVariation;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat11;
float u_xlat16;
void main()
{
    SV_Target0.w = 1.0;
    u_xlat16_0.x = (-_Metallic) * 0.959999979 + 0.959999979;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(_Tiling.x, _Tiling.y) + _Offset.xy;
    u_xlat1.xy = _Time.yy * _Panning.xy + u_xlat1.xy;
    u_xlat11 = _Rotation * 0.0174532924;
    u_xlat2.x = sin(u_xlat11);
    u_xlat3 = cos(u_xlat11);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat16_1.xyz = texture(_Diffuse, u_xlat2.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat16_0.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    SV_Target1.w = _Smoothness;
    u_xlat16_3.xyz = texture(_Normals, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_Emissive, u_xlat2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat2.y = dot(vs_TEXCOORD2.xyz, u_xlat16_3.xyz);
    u_xlat2.z = dot(vs_TEXCOORD3.xyz, u_xlat16_3.xyz);
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.xyz = u_xlat2.xyz;
    SV_Target2.w = 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(_EmissiveVariationTiling.x, _EmissiveVariationTiling.y) + _EmissiveVariationOffset.xy;
    u_xlat2.xy = _Time.yy * _EmissiveVariationPanning.xy + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_EmissiveVariation, u_xlat2.xy).xyz;
    u_xlat2.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveVariationPower, _EmissiveVariationPower, _EmissiveVariationPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = min(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveVariationIntensity, _EmissiveVariationIntensity, _EmissiveVariationIntensity));
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmisiveIntensityBase, _EmisiveIntensityBase, _EmisiveIntensityBase)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_EmissiveIntensityOverall);
    SV_Target3.xyz = u_xlat1.xyz;
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