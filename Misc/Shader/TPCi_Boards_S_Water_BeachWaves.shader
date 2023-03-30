//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/S_Water_BeachWaves" {
Properties {
_WaterPattern_Dark ("WaterPattern_Dark", Color) = (0.2196078,0.4470588,0.8627451,0)
_WaterPatternTexture ("Water Pattern Texture", 2D) = "white" { }
_WaterPattern_Base ("WaterPattern_Base", Color) = (0.1098039,0.2862745,1,1)
_T_VFX_Shared_Tile_Cell_Soft ("T_VFX_Shared_Tile_Cell_Soft", 2D) = "bump" { }
_distortionamount ("distortion amount", Float) = 0.05
_waterpatterntiling ("water pattern tiling", Float) = 1
_waterpanning ("water panning", Vector) = (0,0,0,0)
_waterpatternoffset ("water pattern offset", Vector) = (0.1,0.1,0,0)
_waterpatternoffsetadd ("water pattern offset add", Vector) = (0.01,0.01,0,0)
_waterpatternparallax ("water pattern parallax", Float) = 0.1
_wateredgepower ("water edge power", Float) = 1.96
_Float0 ("Float 0", Float) = 2.29
_waterlineoffset ("waterline offset", Vector) = (0,0,0,0)
_WaterPattern_Light ("WaterPattern_Light", Color) = (0.6541474,0.9168904,0.9433962,0)
_T_VFX_Shared_Gradient_Dots_RG ("T_VFX_Shared_Gradient_Dots_RG", 2D) = "white" { }
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "QUEUE" = "Transparent+0" "RenderType" = "Custom" }
 GrabPass {
}
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+0" "RenderType" = "Custom" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  GpuProgramID 1644
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
uniform 	vec4 _ProjectionParams;
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
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat16_3 = u_xlat1.y * u_xlat1.y;
    u_xlat16_3 = u_xlat1.x * u_xlat1.x + (-u_xlat16_3);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD4.xyz = unity_SHC.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
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
uniform 	vec4 _ProjectionParams;
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
uniform 	vec4 _WaterPattern_Base;
uniform 	vec4 _WaterPattern_Dark;
uniform 	vec2 _waterpanning;
uniform 	float _waterpatternparallax;
uniform 	float _distortionamount;
uniform 	float _waterpatterntiling;
uniform 	vec2 _waterpatternoffset;
uniform 	vec4 _WaterPattern_Light;
uniform 	vec2 _waterpatternoffsetadd;
uniform 	vec2 _waterlineoffset;
uniform 	float _Float0;
uniform 	float _wateredgepower;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _T_VFX_Shared_Tile_Cell_Soft;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterPatternTexture;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
bvec3 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bvec3 u_xlatb9;
mediump float u_xlat16_10;
float u_xlat11;
vec3 u_xlat12;
float u_xlat14;
mediump vec2 u_xlat16_15;
mediump vec3 u_xlat16_21;
float u_xlat22;
vec2 u_xlat25;
mediump vec2 u_xlat16_25;
mediump vec2 u_xlat16_26;
float u_xlat33;
mediump float u_xlat16_33;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
mediump float u_xlat16_37;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat33);
    u_xlat12.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat2.xyw = vs_TEXCOORD3.wxw + vec3(9.99999996e-12, 0.0, 9.99999996e-12);
    u_xlat3.x = u_xlat2.x * 0.5;
    u_xlat14 = (-u_xlat2.x) * 0.5 + vs_TEXCOORD3.y;
    u_xlat2.z = u_xlat14 * _ProjectionParams.x + u_xlat3.x;
    u_xlat2.xyz = u_xlat2.yzw / u_xlat2.xxx;
    u_xlat2.xy = u_xlat2.xy / u_xlat2.zz;
    u_xlat16_2.xyz = texture(_GrabTexture, u_xlat2.xy).xyz;
    u_xlat33 = max(u_xlat33, 0.00100000005);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat16_4.x = _waterpatternparallax * 0.5;
    u_xlat16_15.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_26.xy = u_xlat3.xy * u_xlat16_15.xx;
    u_xlat33 = u_xlat3.z * u_xlat16_15.x + 0.419999987;
    u_xlat3.xy = u_xlat16_26.xy / vec2(u_xlat33);
    u_xlat25.xy = vs_TEXCOORD0.xy * vec2(4.0, 4.0);
    u_xlat25.xy = _Time.yy * vec2(0.0, -0.100000001) + u_xlat25.xy;
    u_xlat16_25.xy = texture(_T_VFX_Shared_Tile_Cell_Soft, u_xlat25.xy).xy;
    u_xlat16_15.xy = u_xlat16_25.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat5.xw = vs_TEXCOORD0.xy;
    u_xlat5.y = float(1.0);
    u_xlat5.z = float(3.0);
    u_xlat25.xy = u_xlat5.xy * vec2(_waterpatterntiling);
    u_xlat33 = sin(_Time.y);
    u_xlat33 = u_xlat33 + 1.0;
    u_xlat33 = u_xlat33 * _waterpatternoffset.xxyx.z;
    u_xlat5.y = u_xlat33 * 0.0250000004;
    u_xlat5.x = _waterpatternoffset.xxyx.y;
    u_xlat6.xy = u_xlat5.zw * u_xlat25.xy + u_xlat5.xy;
    u_xlat6.xy = u_xlat16_15.xy * vec2(vec2(_distortionamount, _distortionamount)) + u_xlat6.xy;
    u_xlat3.xy = (-u_xlat16_4.xx) * u_xlat3.xy + u_xlat6.xy;
    u_xlat3.xy = _Time.yy * _waterpanning.xy + u_xlat3.xy;
    u_xlat16_33 = texture(_WaterPatternTexture, u_xlat3.xy).w;
    u_xlat6.xyz = (-_WaterPattern_Base.xyz) + _WaterPattern_Dark.xyz;
    u_xlat6.xyz = vec3(u_xlat16_33) * u_xlat6.xyz + _WaterPattern_Base.xyz;
    u_xlat3.xy = u_xlat5.xy + _waterpatternoffsetadd.xy;
    u_xlat3.xy = u_xlat5.zw * u_xlat25.xy + u_xlat3.xy;
    u_xlat3.xy = _Time.yy * _waterpanning.xy + u_xlat3.xy;
    u_xlat3.xy = u_xlat16_15.xy * vec2(vec2(_distortionamount, _distortionamount)) + u_xlat3.xy;
    u_xlat16_35 = texture(_WaterPatternTexture, u_xlat3.xy).w;
    u_xlat3.xyz = (-u_xlat6.xyz) + _WaterPattern_Light.xyz;
    u_xlat3.xyz = vec3(u_xlat16_35) * u_xlat3.xyz + u_xlat6.xyz;
    u_xlat33 = u_xlat16_33 + u_xlat16_35;
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat33 = u_xlat33 * vs_TEXCOORD0.y;
    u_xlat3.xyz = u_xlat3.xyz + (-_WaterPattern_Base.xyz);
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat3.xyz;
    u_xlat33 = vs_TEXCOORD0.y + _waterlineoffset.xxxy.w;
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = u_xlat33 * _Float0;
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * _wateredgepower;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat3.xyz + _WaterPattern_Base.xyz;
    u_xlat3.xyz = (-u_xlat16_2.xyz) + u_xlat3.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat3.xyz + u_xlat16_2.xyz;
    u_xlat16_4.x = dot((-u_xlat12.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_4.xxx) + (-u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat3.xyz = vec3(u_xlat35) * u_xlat16_4.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat3.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat3.xyz;
        u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec4 hlslcc_movcTemp = u_xlat5;
            hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat5.x : u_xlat6.x;
            hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat5.y : u_xlat6.y;
            hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat5.z : u_xlat6.z;
            u_xlat5 = hlslcc_movcTemp;
        }
        u_xlat35 = min(u_xlat5.y, u_xlat5.x);
        u_xlat35 = min(u_xlat5.z, u_xlat35);
        u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat35) + u_xlat5.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_4.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 6.0);
    u_xlat16_37 = u_xlat16_3.w + -1.0;
    u_xlat16_37 = unity_SpecCube0_HDR.w * u_xlat16_37 + 1.0;
    u_xlat16_37 = log2(u_xlat16_37);
    u_xlat16_37 = u_xlat16_37 * unity_SpecCube0_HDR.y;
    u_xlat16_37 = exp2(u_xlat16_37);
    u_xlat16_37 = u_xlat16_37 * unity_SpecCube0_HDR.x;
    u_xlat16_8.xyz = u_xlat16_3.xyz * vec3(u_xlat16_37);
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
            u_xlat35 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
            u_xlat35 = inversesqrt(u_xlat35);
            u_xlat5.xyz = vec3(u_xlat35) * u_xlat16_4.xyz;
            u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
            u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat6;
                hlslcc_movcTemp.x = (u_xlatb9.x) ? u_xlat6.x : u_xlat7.x;
                hlslcc_movcTemp.y = (u_xlatb9.y) ? u_xlat6.y : u_xlat7.y;
                hlslcc_movcTemp.z = (u_xlatb9.z) ? u_xlat6.z : u_xlat7.z;
                u_xlat6 = hlslcc_movcTemp;
            }
            u_xlat35 = min(u_xlat6.y, u_xlat6.x);
            u_xlat35 = min(u_xlat6.z, u_xlat35);
            u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
        } else {
            u_xlat5.xyz = u_xlat16_4.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, 6.0);
        u_xlat16_4.x = u_xlat16_5.w + -1.0;
        u_xlat16_4.x = unity_SpecCube1_HDR.w * u_xlat16_4.x + 1.0;
        u_xlat16_4.x = log2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.y;
        u_xlat16_4.x = exp2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.x;
        u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat16_4.xxx;
        u_xlat3.xyz = vec3(u_xlat16_37) * u_xlat16_3.xyz + (-u_xlat16_4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_4.xyz;
        u_xlat16_8.xyz = u_xlat8.xyz;
    }
    u_xlat35 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat3.xyz = vec3(u_xlat35) * vs_TEXCOORD1.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx + _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.00100000005);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat12.xyz);
    u_xlat12.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_37 = u_xlat0.x + u_xlat0.x;
    u_xlat16_37 = u_xlat16_37 * u_xlat0.x + -0.5;
    u_xlat16_41 = (-u_xlat12.x) + 1.0;
    u_xlat16_10 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_10 = u_xlat16_10 * u_xlat16_10;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_10;
    u_xlat16_41 = u_xlat16_37 * u_xlat16_41 + 1.0;
    u_xlat16_10 = -abs(u_xlat1.x) + 1.0;
    u_xlat16_21.x = u_xlat16_10 * u_xlat16_10;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_10 = u_xlat16_10 * u_xlat16_21.x;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_10 + 1.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_41;
    u_xlat11 = u_xlat12.x * u_xlat16_37;
    u_xlat22 = abs(u_xlat1.x) + u_xlat12.x;
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat22 = u_xlat12.x * u_xlat22;
    u_xlat22 = u_xlat22 * 0.999999881;
    u_xlat16_21.xyz = vec3(u_xlat11) * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat16_37 = (-u_xlat0.x) + 1.0;
    u_xlat16_41 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_41;
    u_xlat16_37 = u_xlat16_37 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat16_37);
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_37 = u_xlat16_10 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(u_xlat16_37) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat33;
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
uniform 	vec4 _ProjectionParams;
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
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat16_3 = u_xlat1.y * u_xlat1.y;
    u_xlat16_3 = u_xlat1.x * u_xlat1.x + (-u_xlat16_3);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD4.xyz = unity_SHC.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
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
uniform 	vec4 _ProjectionParams;
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
uniform 	vec4 _WaterPattern_Base;
uniform 	vec4 _WaterPattern_Dark;
uniform 	vec2 _waterpanning;
uniform 	float _waterpatternparallax;
uniform 	float _distortionamount;
uniform 	float _waterpatterntiling;
uniform 	vec2 _waterpatternoffset;
uniform 	vec4 _WaterPattern_Light;
uniform 	vec2 _waterpatternoffsetadd;
uniform 	vec2 _waterlineoffset;
uniform 	float _Float0;
uniform 	float _wateredgepower;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _T_VFX_Shared_Tile_Cell_Soft;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterPatternTexture;
UNITY_LOCATION(3) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
bvec3 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bvec3 u_xlatb9;
mediump float u_xlat16_10;
float u_xlat11;
vec3 u_xlat12;
float u_xlat14;
mediump vec2 u_xlat16_15;
mediump vec3 u_xlat16_21;
float u_xlat22;
vec2 u_xlat25;
mediump vec2 u_xlat16_25;
mediump vec2 u_xlat16_26;
float u_xlat33;
mediump float u_xlat16_33;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
mediump float u_xlat16_37;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat33);
    u_xlat12.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat2.xyw = vs_TEXCOORD3.wxw + vec3(9.99999996e-12, 0.0, 9.99999996e-12);
    u_xlat3.x = u_xlat2.x * 0.5;
    u_xlat14 = (-u_xlat2.x) * 0.5 + vs_TEXCOORD3.y;
    u_xlat2.z = u_xlat14 * _ProjectionParams.x + u_xlat3.x;
    u_xlat2.xyz = u_xlat2.yzw / u_xlat2.xxx;
    u_xlat2.xy = u_xlat2.xy / u_xlat2.zz;
    u_xlat16_2.xyz = texture(_GrabTexture, u_xlat2.xy).xyz;
    u_xlat33 = max(u_xlat33, 0.00100000005);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat16_4.x = _waterpatternparallax * 0.5;
    u_xlat16_15.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_26.xy = u_xlat3.xy * u_xlat16_15.xx;
    u_xlat33 = u_xlat3.z * u_xlat16_15.x + 0.419999987;
    u_xlat3.xy = u_xlat16_26.xy / vec2(u_xlat33);
    u_xlat25.xy = vs_TEXCOORD0.xy * vec2(4.0, 4.0);
    u_xlat25.xy = _Time.yy * vec2(0.0, -0.100000001) + u_xlat25.xy;
    u_xlat16_25.xy = texture(_T_VFX_Shared_Tile_Cell_Soft, u_xlat25.xy).xy;
    u_xlat16_15.xy = u_xlat16_25.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat5.xw = vs_TEXCOORD0.xy;
    u_xlat5.y = float(1.0);
    u_xlat5.z = float(3.0);
    u_xlat25.xy = u_xlat5.xy * vec2(_waterpatterntiling);
    u_xlat33 = sin(_Time.y);
    u_xlat33 = u_xlat33 + 1.0;
    u_xlat33 = u_xlat33 * _waterpatternoffset.xxyx.z;
    u_xlat5.y = u_xlat33 * 0.0250000004;
    u_xlat5.x = _waterpatternoffset.xxyx.y;
    u_xlat6.xy = u_xlat5.zw * u_xlat25.xy + u_xlat5.xy;
    u_xlat6.xy = u_xlat16_15.xy * vec2(vec2(_distortionamount, _distortionamount)) + u_xlat6.xy;
    u_xlat3.xy = (-u_xlat16_4.xx) * u_xlat3.xy + u_xlat6.xy;
    u_xlat3.xy = _Time.yy * _waterpanning.xy + u_xlat3.xy;
    u_xlat16_33 = texture(_WaterPatternTexture, u_xlat3.xy).w;
    u_xlat6.xyz = (-_WaterPattern_Base.xyz) + _WaterPattern_Dark.xyz;
    u_xlat6.xyz = vec3(u_xlat16_33) * u_xlat6.xyz + _WaterPattern_Base.xyz;
    u_xlat3.xy = u_xlat5.xy + _waterpatternoffsetadd.xy;
    u_xlat3.xy = u_xlat5.zw * u_xlat25.xy + u_xlat3.xy;
    u_xlat3.xy = _Time.yy * _waterpanning.xy + u_xlat3.xy;
    u_xlat3.xy = u_xlat16_15.xy * vec2(vec2(_distortionamount, _distortionamount)) + u_xlat3.xy;
    u_xlat16_35 = texture(_WaterPatternTexture, u_xlat3.xy).w;
    u_xlat3.xyz = (-u_xlat6.xyz) + _WaterPattern_Light.xyz;
    u_xlat3.xyz = vec3(u_xlat16_35) * u_xlat3.xyz + u_xlat6.xyz;
    u_xlat33 = u_xlat16_33 + u_xlat16_35;
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat33 = u_xlat33 * vs_TEXCOORD0.y;
    u_xlat3.xyz = u_xlat3.xyz + (-_WaterPattern_Base.xyz);
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat3.xyz;
    u_xlat33 = vs_TEXCOORD0.y + _waterlineoffset.xxxy.w;
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = u_xlat33 * _Float0;
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * _wateredgepower;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat3.xyz + _WaterPattern_Base.xyz;
    u_xlat3.xyz = (-u_xlat16_2.xyz) + u_xlat3.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat3.xyz + u_xlat16_2.xyz;
    u_xlat16_4.x = dot((-u_xlat12.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_4.xxx) + (-u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb35 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat3.xyz = vec3(u_xlat35) * u_xlat16_4.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat3.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat3.xyz;
        u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec4 hlslcc_movcTemp = u_xlat5;
            hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat5.x : u_xlat6.x;
            hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat5.y : u_xlat6.y;
            hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat5.z : u_xlat6.z;
            u_xlat5 = hlslcc_movcTemp;
        }
        u_xlat35 = min(u_xlat5.y, u_xlat5.x);
        u_xlat35 = min(u_xlat5.z, u_xlat35);
        u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat35) + u_xlat5.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_4.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 6.0);
    u_xlat16_37 = u_xlat16_3.w + -1.0;
    u_xlat16_37 = unity_SpecCube0_HDR.w * u_xlat16_37 + 1.0;
    u_xlat16_37 = log2(u_xlat16_37);
    u_xlat16_37 = u_xlat16_37 * unity_SpecCube0_HDR.y;
    u_xlat16_37 = exp2(u_xlat16_37);
    u_xlat16_37 = u_xlat16_37 * unity_SpecCube0_HDR.x;
    u_xlat16_8.xyz = u_xlat16_3.xyz * vec3(u_xlat16_37);
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
            u_xlat35 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
            u_xlat35 = inversesqrt(u_xlat35);
            u_xlat5.xyz = vec3(u_xlat35) * u_xlat16_4.xyz;
            u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
            u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat6;
                hlslcc_movcTemp.x = (u_xlatb9.x) ? u_xlat6.x : u_xlat7.x;
                hlslcc_movcTemp.y = (u_xlatb9.y) ? u_xlat6.y : u_xlat7.y;
                hlslcc_movcTemp.z = (u_xlatb9.z) ? u_xlat6.z : u_xlat7.z;
                u_xlat6 = hlslcc_movcTemp;
            }
            u_xlat35 = min(u_xlat6.y, u_xlat6.x);
            u_xlat35 = min(u_xlat6.z, u_xlat35);
            u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat35) + u_xlat6.xyz;
        } else {
            u_xlat5.xyz = u_xlat16_4.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, 6.0);
        u_xlat16_4.x = u_xlat16_5.w + -1.0;
        u_xlat16_4.x = unity_SpecCube1_HDR.w * u_xlat16_4.x + 1.0;
        u_xlat16_4.x = log2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.y;
        u_xlat16_4.x = exp2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.x;
        u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat16_4.xxx;
        u_xlat3.xyz = vec3(u_xlat16_37) * u_xlat16_3.xyz + (-u_xlat16_4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_4.xyz;
        u_xlat16_8.xyz = u_xlat8.xyz;
    }
    u_xlat35 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat35 = inversesqrt(u_xlat35);
    u_xlat3.xyz = vec3(u_xlat35) * vs_TEXCOORD1.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx + _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.00100000005);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat12.xyz);
    u_xlat12.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_37 = u_xlat0.x + u_xlat0.x;
    u_xlat16_37 = u_xlat16_37 * u_xlat0.x + -0.5;
    u_xlat16_41 = (-u_xlat12.x) + 1.0;
    u_xlat16_10 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_10 = u_xlat16_10 * u_xlat16_10;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_10;
    u_xlat16_41 = u_xlat16_37 * u_xlat16_41 + 1.0;
    u_xlat16_10 = -abs(u_xlat1.x) + 1.0;
    u_xlat16_21.x = u_xlat16_10 * u_xlat16_10;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_10 = u_xlat16_10 * u_xlat16_21.x;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_10 + 1.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_41;
    u_xlat11 = u_xlat12.x * u_xlat16_37;
    u_xlat22 = abs(u_xlat1.x) + u_xlat12.x;
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat22 = u_xlat12.x * u_xlat22;
    u_xlat22 = u_xlat22 * 0.999999881;
    u_xlat16_21.xyz = vec3(u_xlat11) * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat16_37 = (-u_xlat0.x) + 1.0;
    u_xlat16_41 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_41;
    u_xlat16_37 = u_xlat16_37 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat16_37);
    u_xlat0.xyz = u_xlat16_4.xyz * u_xlat16_21.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_37 = u_xlat16_10 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(u_xlat16_37) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat33;
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
  Tags { "IGNOREPROJECTOR" = "true" "IsEmissive" = "true" "LIGHTMODE" = "DEFERRED" "QUEUE" = "Transparent+0" "RenderType" = "Custom" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  GpuProgramID 122025
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
uniform 	vec4 _ProjectionParams;
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
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3 = u_xlat1.y * u_xlat1.y;
    u_xlat16_3 = u_xlat1.x * u_xlat1.x + (-u_xlat16_3);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD6.xyz = unity_SHC.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
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
uniform 	vec4 _WaterPattern_Base;
uniform 	vec4 _WaterPattern_Dark;
uniform 	vec2 _waterpanning;
uniform 	float _waterpatternparallax;
uniform 	float _distortionamount;
uniform 	float _waterpatterntiling;
uniform 	vec2 _waterpatternoffset;
uniform 	vec4 _WaterPattern_Light;
uniform 	vec2 _waterpatternoffsetadd;
uniform 	vec2 _waterlineoffset;
uniform 	float _Float0;
uniform 	float _wateredgepower;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _T_VFX_Shared_Tile_Cell_Soft;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterPatternTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
float u_xlat6;
vec2 u_xlat8;
mediump vec2 u_xlat16_8;
vec2 u_xlat10;
float u_xlat12;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 0.00100000005);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_5.xy = u_xlat0.xy * u_xlat16_1.xx;
    u_xlat0.x = u_xlat0.z * u_xlat16_1.x + 0.419999987;
    u_xlat0.xy = u_xlat16_5.xy / u_xlat0.xx;
    u_xlat8.xy = vs_TEXCOORD0.xy * vec2(4.0, 4.0);
    u_xlat8.xy = _Time.yy * vec2(0.0, -0.100000001) + u_xlat8.xy;
    u_xlat16_8.xy = texture(_T_VFX_Shared_Tile_Cell_Soft, u_xlat8.xy).xy;
    u_xlat16_1.xy = u_xlat16_8.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat8.x = sin(_Time.y);
    u_xlat8.x = u_xlat8.x + 1.0;
    u_xlat8.x = u_xlat8.x * _waterpatternoffset.xxyx.z;
    u_xlat2.y = u_xlat8.x * 0.0250000004;
    u_xlat2.x = _waterpatternoffset.xxyx.y;
    u_xlat3.xw = vs_TEXCOORD0.xy;
    u_xlat3.y = float(1.0);
    u_xlat3.z = float(3.0);
    u_xlat8.xy = u_xlat3.xy * vec2(_waterpatterntiling);
    u_xlat10.xy = u_xlat3.zw * u_xlat8.xy + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + _waterpatternoffsetadd.xy;
    u_xlat8.xy = u_xlat3.zw * u_xlat8.xy + u_xlat2.xy;
    u_xlat8.xy = _Time.yy * _waterpanning.xy + u_xlat8.xy;
    u_xlat8.xy = u_xlat16_1.xy * vec2(vec2(_distortionamount, _distortionamount)) + u_xlat8.xy;
    u_xlat2.xy = u_xlat16_1.xy * vec2(vec2(_distortionamount, _distortionamount)) + u_xlat10.xy;
    u_xlat16_8.x = texture(_WaterPatternTexture, u_xlat8.xy).w;
    u_xlat16_1.x = _waterpatternparallax * 0.5;
    u_xlat0.xy = (-u_xlat16_1.xx) * u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = _Time.yy * _waterpanning.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_WaterPatternTexture, u_xlat0.xy).w;
    u_xlat2.xyz = (-_WaterPattern_Base.xyz) + _WaterPattern_Dark.xyz;
    u_xlat2.xyz = vec3(u_xlat16_0) * u_xlat2.xyz + _WaterPattern_Base.xyz;
    u_xlat0.x = u_xlat16_8.x + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD0.y;
    u_xlat3.xyz = (-u_xlat2.xyz) + _WaterPattern_Light.xyz;
    u_xlat4.xyz = u_xlat16_8.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + (-_WaterPattern_Base.xyz);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat12 = vs_TEXCOORD0.y + _waterlineoffset.xxxy.w;
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = u_xlat12 * _Float0;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _wateredgepower;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + _WaterPattern_Base.xyz;
    u_xlat1.xyw = vs_TEXCOORD3.wxw + vec3(9.99999996e-12, 0.0, 9.99999996e-12);
    u_xlat2.x = u_xlat1.x * 0.5;
    u_xlat6 = (-u_xlat1.x) * 0.5 + vs_TEXCOORD3.y;
    u_xlat1.z = u_xlat6 * _ProjectionParams.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat1.yzw / u_xlat1.xxx;
    u_xlat2.xy = u_xlat2.xy / u_xlat2.zz;
    u_xlat16_2.xyz = texture(_GrabTexture, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_2.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
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
uniform 	vec4 _ProjectionParams;
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
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3 = u_xlat1.y * u_xlat1.y;
    u_xlat16_3 = u_xlat1.x * u_xlat1.x + (-u_xlat16_3);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD6.xyz = unity_SHC.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
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
uniform 	vec4 _WaterPattern_Base;
uniform 	vec4 _WaterPattern_Dark;
uniform 	vec2 _waterpanning;
uniform 	float _waterpatternparallax;
uniform 	float _distortionamount;
uniform 	float _waterpatterntiling;
uniform 	vec2 _waterpatternoffset;
uniform 	vec4 _WaterPattern_Light;
uniform 	vec2 _waterpatternoffsetadd;
uniform 	vec2 _waterlineoffset;
uniform 	float _Float0;
uniform 	float _wateredgepower;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _T_VFX_Shared_Tile_Cell_Soft;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterPatternTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
float u_xlat6;
vec2 u_xlat8;
mediump vec2 u_xlat16_8;
vec2 u_xlat10;
float u_xlat12;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 0.00100000005);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_5.xy = u_xlat0.xy * u_xlat16_1.xx;
    u_xlat0.x = u_xlat0.z * u_xlat16_1.x + 0.419999987;
    u_xlat0.xy = u_xlat16_5.xy / u_xlat0.xx;
    u_xlat8.xy = vs_TEXCOORD0.xy * vec2(4.0, 4.0);
    u_xlat8.xy = _Time.yy * vec2(0.0, -0.100000001) + u_xlat8.xy;
    u_xlat16_8.xy = texture(_T_VFX_Shared_Tile_Cell_Soft, u_xlat8.xy).xy;
    u_xlat16_1.xy = u_xlat16_8.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat8.x = sin(_Time.y);
    u_xlat8.x = u_xlat8.x + 1.0;
    u_xlat8.x = u_xlat8.x * _waterpatternoffset.xxyx.z;
    u_xlat2.y = u_xlat8.x * 0.0250000004;
    u_xlat2.x = _waterpatternoffset.xxyx.y;
    u_xlat3.xw = vs_TEXCOORD0.xy;
    u_xlat3.y = float(1.0);
    u_xlat3.z = float(3.0);
    u_xlat8.xy = u_xlat3.xy * vec2(_waterpatterntiling);
    u_xlat10.xy = u_xlat3.zw * u_xlat8.xy + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + _waterpatternoffsetadd.xy;
    u_xlat8.xy = u_xlat3.zw * u_xlat8.xy + u_xlat2.xy;
    u_xlat8.xy = _Time.yy * _waterpanning.xy + u_xlat8.xy;
    u_xlat8.xy = u_xlat16_1.xy * vec2(vec2(_distortionamount, _distortionamount)) + u_xlat8.xy;
    u_xlat2.xy = u_xlat16_1.xy * vec2(vec2(_distortionamount, _distortionamount)) + u_xlat10.xy;
    u_xlat16_8.x = texture(_WaterPatternTexture, u_xlat8.xy).w;
    u_xlat16_1.x = _waterpatternparallax * 0.5;
    u_xlat0.xy = (-u_xlat16_1.xx) * u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = _Time.yy * _waterpanning.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_WaterPatternTexture, u_xlat0.xy).w;
    u_xlat2.xyz = (-_WaterPattern_Base.xyz) + _WaterPattern_Dark.xyz;
    u_xlat2.xyz = vec3(u_xlat16_0) * u_xlat2.xyz + _WaterPattern_Base.xyz;
    u_xlat0.x = u_xlat16_8.x + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD0.y;
    u_xlat3.xyz = (-u_xlat2.xyz) + _WaterPattern_Light.xyz;
    u_xlat4.xyz = u_xlat16_8.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + (-_WaterPattern_Base.xyz);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat12 = vs_TEXCOORD0.y + _waterlineoffset.xxxy.w;
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = u_xlat12 * _Float0;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _wateredgepower;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + _WaterPattern_Base.xyz;
    u_xlat1.xyw = vs_TEXCOORD3.wxw + vec3(9.99999996e-12, 0.0, 9.99999996e-12);
    u_xlat2.x = u_xlat1.x * 0.5;
    u_xlat6 = (-u_xlat1.x) * 0.5 + vs_TEXCOORD3.y;
    u_xlat1.z = u_xlat6 * _ProjectionParams.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat1.yzw / u_xlat1.xxx;
    u_xlat2.xy = u_xlat2.xy / u_xlat2.zz;
    u_xlat16_2.xyz = texture(_GrabTexture, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_2.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
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
uniform 	vec4 _ProjectionParams;
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
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3 = u_xlat1.y * u_xlat1.y;
    u_xlat16_3 = u_xlat1.x * u_xlat1.x + (-u_xlat16_3);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD6.xyz = unity_SHC.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
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
uniform 	vec4 _WaterPattern_Base;
uniform 	vec4 _WaterPattern_Dark;
uniform 	vec2 _waterpanning;
uniform 	float _waterpatternparallax;
uniform 	float _distortionamount;
uniform 	float _waterpatterntiling;
uniform 	vec2 _waterpatternoffset;
uniform 	vec4 _WaterPattern_Light;
uniform 	vec2 _waterpatternoffsetadd;
uniform 	vec2 _waterlineoffset;
uniform 	float _Float0;
uniform 	float _wateredgepower;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _T_VFX_Shared_Tile_Cell_Soft;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterPatternTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
float u_xlat6;
vec2 u_xlat8;
mediump vec2 u_xlat16_8;
vec2 u_xlat10;
float u_xlat12;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 0.00100000005);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_5.xy = u_xlat0.xy * u_xlat16_1.xx;
    u_xlat0.x = u_xlat0.z * u_xlat16_1.x + 0.419999987;
    u_xlat0.xy = u_xlat16_5.xy / u_xlat0.xx;
    u_xlat8.xy = vs_TEXCOORD0.xy * vec2(4.0, 4.0);
    u_xlat8.xy = _Time.yy * vec2(0.0, -0.100000001) + u_xlat8.xy;
    u_xlat16_8.xy = texture(_T_VFX_Shared_Tile_Cell_Soft, u_xlat8.xy).xy;
    u_xlat16_1.xy = u_xlat16_8.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat8.x = sin(_Time.y);
    u_xlat8.x = u_xlat8.x + 1.0;
    u_xlat8.x = u_xlat8.x * _waterpatternoffset.xxyx.z;
    u_xlat2.y = u_xlat8.x * 0.0250000004;
    u_xlat2.x = _waterpatternoffset.xxyx.y;
    u_xlat3.xw = vs_TEXCOORD0.xy;
    u_xlat3.y = float(1.0);
    u_xlat3.z = float(3.0);
    u_xlat8.xy = u_xlat3.xy * vec2(_waterpatterntiling);
    u_xlat10.xy = u_xlat3.zw * u_xlat8.xy + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + _waterpatternoffsetadd.xy;
    u_xlat8.xy = u_xlat3.zw * u_xlat8.xy + u_xlat2.xy;
    u_xlat8.xy = _Time.yy * _waterpanning.xy + u_xlat8.xy;
    u_xlat8.xy = u_xlat16_1.xy * vec2(vec2(_distortionamount, _distortionamount)) + u_xlat8.xy;
    u_xlat2.xy = u_xlat16_1.xy * vec2(vec2(_distortionamount, _distortionamount)) + u_xlat10.xy;
    u_xlat16_8.x = texture(_WaterPatternTexture, u_xlat8.xy).w;
    u_xlat16_1.x = _waterpatternparallax * 0.5;
    u_xlat0.xy = (-u_xlat16_1.xx) * u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = _Time.yy * _waterpanning.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_WaterPatternTexture, u_xlat0.xy).w;
    u_xlat2.xyz = (-_WaterPattern_Base.xyz) + _WaterPattern_Dark.xyz;
    u_xlat2.xyz = vec3(u_xlat16_0) * u_xlat2.xyz + _WaterPattern_Base.xyz;
    u_xlat0.x = u_xlat16_8.x + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD0.y;
    u_xlat3.xyz = (-u_xlat2.xyz) + _WaterPattern_Light.xyz;
    u_xlat4.xyz = u_xlat16_8.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + (-_WaterPattern_Base.xyz);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat12 = vs_TEXCOORD0.y + _waterlineoffset.xxxy.w;
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = u_xlat12 * _Float0;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _wateredgepower;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + _WaterPattern_Base.xyz;
    u_xlat1.xyw = vs_TEXCOORD3.wxw + vec3(9.99999996e-12, 0.0, 9.99999996e-12);
    u_xlat2.x = u_xlat1.x * 0.5;
    u_xlat6 = (-u_xlat1.x) * 0.5 + vs_TEXCOORD3.y;
    u_xlat1.z = u_xlat6 * _ProjectionParams.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat1.yzw / u_xlat1.xxx;
    u_xlat2.xy = u_xlat2.xy / u_xlat2.zz;
    u_xlat16_2.xyz = texture(_GrabTexture, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_2.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target3.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
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
uniform 	vec4 _ProjectionParams;
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
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3 = u_xlat1.y * u_xlat1.y;
    u_xlat16_3 = u_xlat1.x * u_xlat1.x + (-u_xlat16_3);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD6.xyz = unity_SHC.xyz * vec3(u_xlat16_3) + u_xlat16_4.xyz;
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
uniform 	vec4 _WaterPattern_Base;
uniform 	vec4 _WaterPattern_Dark;
uniform 	vec2 _waterpanning;
uniform 	float _waterpatternparallax;
uniform 	float _distortionamount;
uniform 	float _waterpatterntiling;
uniform 	vec2 _waterpatternoffset;
uniform 	vec4 _WaterPattern_Light;
uniform 	vec2 _waterpatternoffsetadd;
uniform 	vec2 _waterlineoffset;
uniform 	float _Float0;
uniform 	float _wateredgepower;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _T_VFX_Shared_Tile_Cell_Soft;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterPatternTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
float u_xlat6;
vec2 u_xlat8;
mediump vec2 u_xlat16_8;
vec2 u_xlat10;
float u_xlat12;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 0.00100000005);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_5.xy = u_xlat0.xy * u_xlat16_1.xx;
    u_xlat0.x = u_xlat0.z * u_xlat16_1.x + 0.419999987;
    u_xlat0.xy = u_xlat16_5.xy / u_xlat0.xx;
    u_xlat8.xy = vs_TEXCOORD0.xy * vec2(4.0, 4.0);
    u_xlat8.xy = _Time.yy * vec2(0.0, -0.100000001) + u_xlat8.xy;
    u_xlat16_8.xy = texture(_T_VFX_Shared_Tile_Cell_Soft, u_xlat8.xy).xy;
    u_xlat16_1.xy = u_xlat16_8.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat8.x = sin(_Time.y);
    u_xlat8.x = u_xlat8.x + 1.0;
    u_xlat8.x = u_xlat8.x * _waterpatternoffset.xxyx.z;
    u_xlat2.y = u_xlat8.x * 0.0250000004;
    u_xlat2.x = _waterpatternoffset.xxyx.y;
    u_xlat3.xw = vs_TEXCOORD0.xy;
    u_xlat3.y = float(1.0);
    u_xlat3.z = float(3.0);
    u_xlat8.xy = u_xlat3.xy * vec2(_waterpatterntiling);
    u_xlat10.xy = u_xlat3.zw * u_xlat8.xy + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + _waterpatternoffsetadd.xy;
    u_xlat8.xy = u_xlat3.zw * u_xlat8.xy + u_xlat2.xy;
    u_xlat8.xy = _Time.yy * _waterpanning.xy + u_xlat8.xy;
    u_xlat8.xy = u_xlat16_1.xy * vec2(vec2(_distortionamount, _distortionamount)) + u_xlat8.xy;
    u_xlat2.xy = u_xlat16_1.xy * vec2(vec2(_distortionamount, _distortionamount)) + u_xlat10.xy;
    u_xlat16_8.x = texture(_WaterPatternTexture, u_xlat8.xy).w;
    u_xlat16_1.x = _waterpatternparallax * 0.5;
    u_xlat0.xy = (-u_xlat16_1.xx) * u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = _Time.yy * _waterpanning.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_WaterPatternTexture, u_xlat0.xy).w;
    u_xlat2.xyz = (-_WaterPattern_Base.xyz) + _WaterPattern_Dark.xyz;
    u_xlat2.xyz = vec3(u_xlat16_0) * u_xlat2.xyz + _WaterPattern_Base.xyz;
    u_xlat0.x = u_xlat16_8.x + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD0.y;
    u_xlat3.xyz = (-u_xlat2.xyz) + _WaterPattern_Light.xyz;
    u_xlat4.xyz = u_xlat16_8.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xyz + (-_WaterPattern_Base.xyz);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat12 = vs_TEXCOORD0.y + _waterlineoffset.xxxy.w;
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = u_xlat12 * _Float0;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _wateredgepower;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + _WaterPattern_Base.xyz;
    u_xlat1.xyw = vs_TEXCOORD3.wxw + vec3(9.99999996e-12, 0.0, 9.99999996e-12);
    u_xlat2.x = u_xlat1.x * 0.5;
    u_xlat6 = (-u_xlat1.x) * 0.5 + vs_TEXCOORD3.y;
    u_xlat1.z = u_xlat6 * _ProjectionParams.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat1.yzw / u_xlat1.xxx;
    u_xlat2.xy = u_xlat2.xy / u_xlat2.zz;
    u_xlat16_2.xyz = texture(_GrabTexture, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat16_2.xyz);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target3.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
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