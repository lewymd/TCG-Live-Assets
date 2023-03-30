//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Gameplay/Moves/Dark_Dissolve_Mesh_Cutout" {
Properties {
_EdgeWidth ("Edge Width", Float) = 6
_CoreColor ("Core Color", Color) = (0.2586701,1,0,0)
_EdgeColor ("Edge Color", Color) = (1,0,0.5221448,0)
_FX_T_RenderClouds ("FX_T_RenderClouds", 2D) = "white" { }
_Multiply ("Multiply", Float) = 6
_RadialSpeed ("Radial Speed", Vector) = (0,-0.25,0,0)
_T_Direction_RG_Clouds ("T_Direction_RG_Clouds", 2D) = "white" { }
_distortionamount ("distortion amount", Float) = 0
_RadialTiling ("Radial Tiling", Vector) = (3,1,0,0)
_RadialDistortionTiling ("Radial Distortion Tiling", Vector) = (3,0.5,0,0)
_RadialDistortionSpeed ("Radial Distortion Speed", Vector) = (0,-0.3,0,0)
_Power ("Power", Float) = 1
_CoreGradientPower ("Core Gradient Power", Float) = 3
_GradientPower ("Gradient Power", Float) = 1
_GradientTexture ("Gradient Texture", 2D) = "white" { }
_OverallPower ("Overall Power", Range(0, 1)) = 1
_OverallEmissiveIntensity ("Overall Emissive Intensity", Float) = 1
_CoreVertexColorLerp ("Core - Vertex Color Lerp", Range(0, 1)) = 0
_EdgeVertexColorLerp ("Edge - Vertex Color Lerp", Range(0, 1)) = 0
_LERPHardEdgedNoSoftTransparancy ("LERP - Hard Edged (No Soft Transparancy)", Range(0, 1)) = 0
_tex4coord ("", 2D) = "white" { }
_texcoord ("", 2D) = "white" { }
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
  Cull Off
  GpuProgramID 17150
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
uniform 	vec4 _tex4coord_ST;
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex4coord_ST.xy + _tex4coord_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _CoreColor;
uniform 	float _CoreVertexColorLerp;
uniform 	vec4 _EdgeColor;
uniform 	float _EdgeVertexColorLerp;
uniform 	float _OverallPower;
uniform 	vec4 _GradientTexture_ST;
uniform 	float _GradientPower;
uniform 	vec2 _RadialTiling;
uniform 	vec2 _RadialSpeed;
uniform 	vec2 _RadialDistortionTiling;
uniform 	vec2 _RadialDistortionSpeed;
uniform 	float _distortionamount;
uniform 	float _Power;
uniform 	float _Multiply;
uniform 	float _CoreGradientPower;
uniform 	float _EdgeWidth;
uniform 	float _OverallEmissiveIntensity;
uniform 	float _LERPHardEdgedNoSoftTransparancy;
UNITY_LOCATION(0) uniform mediump sampler2D _GradientTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _Sampler6060;
UNITY_LOCATION(2) uniform mediump sampler2D _Sampler6062;
UNITY_LOCATION(3) uniform mediump sampler2D _T_Direction_RG_Clouds;
UNITY_LOCATION(4) uniform mediump sampler2D _FX_T_RenderClouds;
UNITY_LOCATION(5) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(6) uniform mediump samplerCube unity_SpecCube1;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bvec3 u_xlatb10;
mediump float u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat17;
mediump vec3 u_xlat16_23;
float u_xlat24;
vec2 u_xlat28;
mediump vec2 u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
float u_xlat36;
float u_xlat37;
float u_xlat38;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_45;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz + (-_CoreColor.xyz);
    u_xlat2.xyz = vec3(_CoreVertexColorLerp) * u_xlat2.xyz + _CoreColor.xyz;
    u_xlat3.xyz = vs_COLOR0.xyz + (-_EdgeColor.xyz);
    u_xlat3.xyz = vec3(_EdgeVertexColorLerp) * u_xlat3.xyz + _EdgeColor.xyz;
    u_xlat37 = vs_TEXCOORD0.z * _OverallPower;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
    u_xlat4.xy = vs_TEXCOORD1.xy * _GradientTexture_ST.xy + _GradientTexture_ST.zw;
    u_xlat28.xy = vs_TEXCOORD1.xy + vs_TEXCOORD1.xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat38 = min(abs(u_xlat5.y), abs(u_xlat5.x));
    u_xlat39 = max(abs(u_xlat5.y), abs(u_xlat5.x));
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat38 = u_xlat38 * u_xlat39;
    u_xlat39 = u_xlat38 * u_xlat38;
    u_xlat29 = u_xlat39 * 0.0208350997 + -0.0851330012;
    u_xlat29 = u_xlat39 * u_xlat29 + 0.180141002;
    u_xlat29 = u_xlat39 * u_xlat29 + -0.330299497;
    u_xlat39 = u_xlat39 * u_xlat29 + 0.999866009;
    u_xlat29 = u_xlat38 * u_xlat39;
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(abs(u_xlat5.y)<abs(u_xlat5.x));
#else
    u_xlatb41 = abs(u_xlat5.y)<abs(u_xlat5.x);
#endif
    u_xlat29 = u_xlat29 * -2.0 + 1.57079637;
    u_xlat29 = u_xlatb41 ? u_xlat29 : float(0.0);
    u_xlat38 = u_xlat38 * u_xlat39 + u_xlat29;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(u_xlat5.y<(-u_xlat5.y));
#else
    u_xlatb39 = u_xlat5.y<(-u_xlat5.y);
#endif
    u_xlat39 = u_xlatb39 ? -3.14159274 : float(0.0);
    u_xlat38 = u_xlat38 + u_xlat39;
    u_xlat39 = min(u_xlat5.y, u_xlat5.x);
    u_xlat29 = max(u_xlat5.y, u_xlat5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(u_xlat39<(-u_xlat39));
#else
    u_xlatb39 = u_xlat39<(-u_xlat39);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(u_xlat29>=(-u_xlat29));
#else
    u_xlatb29 = u_xlat29>=(-u_xlat29);
#endif
    u_xlatb39 = u_xlatb39 && u_xlatb29;
    u_xlat38 = (u_xlatb39) ? (-u_xlat38) : u_xlat38;
    u_xlat38 = u_xlat38 * 0.159154937;
    u_xlat38 = fract(u_xlat38);
    u_xlat39 = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat39 = sqrt(u_xlat39);
    u_xlat5.x = _RadialSpeed.x * _Time.y + u_xlat38;
    u_xlat5.y = _RadialSpeed.y * _Time.y + u_xlat39;
    u_xlat6.x = _RadialDistortionSpeed.x * _Time.y + u_xlat38;
    u_xlat6.y = _RadialDistortionSpeed.y * _Time.y + u_xlat39;
    u_xlat16_38 = texture(_GradientTexture, u_xlat4.xy).z;
    u_xlat38 = log2(u_xlat16_38);
    u_xlat39 = u_xlat38 * _GradientPower;
    u_xlat39 = exp2(u_xlat39);
    u_xlat16_4.xy = texture(_Sampler6060, u_xlat28.xy).xy;
    u_xlat4.xy = vec2(_RadialTiling.x, _RadialTiling.y) * u_xlat5.xy + u_xlat16_4.xy;
    u_xlat16_28.xy = texture(_Sampler6062, u_xlat28.xy).xy;
    u_xlat28.xy = vec2(_RadialDistortionTiling.x, _RadialDistortionTiling.y) * u_xlat6.xy + u_xlat16_28.xy;
    u_xlat16_28.xy = texture(_T_Direction_RG_Clouds, u_xlat28.xy).xy;
    u_xlat4.xy = u_xlat16_28.xy * vec2(vec2(_distortionamount, _distortionamount)) + u_xlat4.xy;
    u_xlat16_4.xyz = texture(_FX_T_RenderClouds, u_xlat4.xy).xyz;
    u_xlat4.xyz = vec3(u_xlat39) * u_xlat16_4.xyz;
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Power, _Power, _Power));
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat38 = u_xlat38 * _CoreGradientPower;
    u_xlat38 = exp2(u_xlat38);
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Multiply) + vec3(u_xlat38);
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz + (-u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = log2(u_xlat4.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_EdgeWidth, _EdgeWidth, _EdgeWidth));
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = log2(u_xlat5.xyz);
    u_xlat17.xyz = u_xlat17.xyz * vec3(vec3(_EdgeWidth, _EdgeWidth, _EdgeWidth));
    u_xlat17.xyz = exp2(u_xlat17.xyz);
    u_xlat17.xyz = (-u_xlat17.xyz) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat17.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat37 = vs_TEXCOORD0.w * _OverallEmissiveIntensity;
    u_xlat38 = (-u_xlat5.x) + 1.0;
    u_xlat39 = u_xlat38 * vs_COLOR0.w;
    u_xlat38 = (-u_xlat38) * vs_COLOR0.w + u_xlat38;
    u_xlat38 = _LERPHardEdgedNoSoftTransparancy * u_xlat38 + u_xlat39;
    u_xlat16_7.x = dot((-u_xlat1.xyz), vs_TEXCOORD2.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat16_7.xyz = vs_TEXCOORD2.xyz * (-u_xlat16_7.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb39 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb39){
        u_xlat39 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat4.xyz = vec3(u_xlat39) * u_xlat16_7.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat4.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat4.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat5;
            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat5.x : u_xlat6.x;
            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat5.y : u_xlat6.y;
            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat5.z : u_xlat6.z;
            u_xlat5 = hlslcc_movcTemp;
        }
        u_xlat39 = min(u_xlat5.y, u_xlat5.x);
        u_xlat39 = min(u_xlat5.z, u_xlat39);
        u_xlat5.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat39) + u_xlat5.xyz;
    } else {
        u_xlat4.xyz = u_xlat16_7.xyz;
    }
    u_xlat16_4 = textureLod(unity_SpecCube0, u_xlat4.xyz, 6.0);
    u_xlat16_43 = u_xlat16_4.w + -1.0;
    u_xlat16_43 = unity_SpecCube0_HDR.w * u_xlat16_43 + 1.0;
    u_xlat16_43 = log2(u_xlat16_43);
    u_xlat16_43 = u_xlat16_43 * unity_SpecCube0_HDR.y;
    u_xlat16_43 = exp2(u_xlat16_43);
    u_xlat16_43 = u_xlat16_43 * unity_SpecCube0_HDR.x;
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(u_xlat16_43);
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb39 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb39){
#ifdef UNITY_ADRENO_ES3
        u_xlatb39 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb39 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb39){
            u_xlat39 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
            u_xlat39 = inversesqrt(u_xlat39);
            u_xlat5.xyz = vec3(u_xlat39) * u_xlat16_7.xyz;
            u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
            u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat5.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat6;
                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat6.x : u_xlat8.x;
                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat6.y : u_xlat8.y;
                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat6.z : u_xlat8.z;
                u_xlat6 = hlslcc_movcTemp;
            }
            u_xlat39 = min(u_xlat6.y, u_xlat6.x);
            u_xlat39 = min(u_xlat6.z, u_xlat39);
            u_xlat6.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat39) + u_xlat6.xyz;
        } else {
            u_xlat5.xyz = u_xlat16_7.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, 6.0);
        u_xlat16_7.x = u_xlat16_5.w + -1.0;
        u_xlat16_7.x = unity_SpecCube1_HDR.w * u_xlat16_7.x + 1.0;
        u_xlat16_7.x = log2(u_xlat16_7.x);
        u_xlat16_7.x = u_xlat16_7.x * unity_SpecCube1_HDR.y;
        u_xlat16_7.x = exp2(u_xlat16_7.x);
        u_xlat16_7.x = u_xlat16_7.x * unity_SpecCube1_HDR.x;
        u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xxx;
        u_xlat4.xyz = vec3(u_xlat16_43) * u_xlat16_4.xyz + (-u_xlat16_7.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat4.xyz + u_xlat16_7.xyz;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat39 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat4.xyz = vec3(u_xlat39) * vs_TEXCOORD2.xyz;
    u_xlat16_7.xyz = u_xlat3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 0.00100000005);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat16_43 = u_xlat0.x + u_xlat0.x;
    u_xlat16_43 = u_xlat16_43 * u_xlat0.x + -0.5;
    u_xlat16_45 = (-u_xlat1.x) + 1.0;
    u_xlat16_11 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_43 * u_xlat16_45 + 1.0;
    u_xlat16_11 = -abs(u_xlat36) + 1.0;
    u_xlat16_23.x = u_xlat16_11 * u_xlat16_11;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_23.x;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_11 + 1.0;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_45;
    u_xlat12.x = u_xlat1.x * u_xlat16_43;
    u_xlat24 = abs(u_xlat36) + u_xlat1.x;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat24 = u_xlat1.x * u_xlat24;
    u_xlat24 = u_xlat24 * 0.999999881;
    u_xlat16_23.xyz = u_xlat12.xxx * _LightColor0.xyz;
    u_xlat12.xyz = vec3(u_xlat24) * _LightColor0.xyz;
    u_xlat16_43 = (-u_xlat0.x) + 1.0;
    u_xlat16_45 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_45;
    u_xlat16_43 = u_xlat16_43 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat16_43);
    u_xlat0.xyz = u_xlat16_7.xyz * u_xlat16_23.xyz + u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_43 = u_xlat16_11 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_43) + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat37) * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat38;
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
uniform 	vec4 _tex4coord_ST;
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _tex4coord_ST.xy + _tex4coord_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _CoreColor;
uniform 	float _CoreVertexColorLerp;
uniform 	vec4 _EdgeColor;
uniform 	float _EdgeVertexColorLerp;
uniform 	float _OverallPower;
uniform 	vec4 _GradientTexture_ST;
uniform 	float _GradientPower;
uniform 	vec2 _RadialTiling;
uniform 	vec2 _RadialSpeed;
uniform 	vec2 _RadialDistortionTiling;
uniform 	vec2 _RadialDistortionSpeed;
uniform 	float _distortionamount;
uniform 	float _Power;
uniform 	float _Multiply;
uniform 	float _CoreGradientPower;
uniform 	float _EdgeWidth;
uniform 	float _OverallEmissiveIntensity;
uniform 	float _LERPHardEdgedNoSoftTransparancy;
UNITY_LOCATION(0) uniform mediump sampler2D _GradientTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _Sampler6060;
UNITY_LOCATION(2) uniform mediump sampler2D _Sampler6062;
UNITY_LOCATION(3) uniform mediump sampler2D _T_Direction_RG_Clouds;
UNITY_LOCATION(4) uniform mediump sampler2D _FX_T_RenderClouds;
UNITY_LOCATION(5) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(6) uniform mediump samplerCube unity_SpecCube1;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bvec3 u_xlatb10;
mediump float u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat17;
mediump vec3 u_xlat16_23;
float u_xlat24;
vec2 u_xlat28;
mediump vec2 u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
float u_xlat36;
float u_xlat37;
float u_xlat38;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_45;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz + (-_CoreColor.xyz);
    u_xlat2.xyz = vec3(_CoreVertexColorLerp) * u_xlat2.xyz + _CoreColor.xyz;
    u_xlat3.xyz = vs_COLOR0.xyz + (-_EdgeColor.xyz);
    u_xlat3.xyz = vec3(_EdgeVertexColorLerp) * u_xlat3.xyz + _EdgeColor.xyz;
    u_xlat37 = vs_TEXCOORD0.z * _OverallPower;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
    u_xlat4.xy = vs_TEXCOORD1.xy * _GradientTexture_ST.xy + _GradientTexture_ST.zw;
    u_xlat28.xy = vs_TEXCOORD1.xy + vs_TEXCOORD1.xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat38 = min(abs(u_xlat5.y), abs(u_xlat5.x));
    u_xlat39 = max(abs(u_xlat5.y), abs(u_xlat5.x));
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat38 = u_xlat38 * u_xlat39;
    u_xlat39 = u_xlat38 * u_xlat38;
    u_xlat29 = u_xlat39 * 0.0208350997 + -0.0851330012;
    u_xlat29 = u_xlat39 * u_xlat29 + 0.180141002;
    u_xlat29 = u_xlat39 * u_xlat29 + -0.330299497;
    u_xlat39 = u_xlat39 * u_xlat29 + 0.999866009;
    u_xlat29 = u_xlat38 * u_xlat39;
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(abs(u_xlat5.y)<abs(u_xlat5.x));
#else
    u_xlatb41 = abs(u_xlat5.y)<abs(u_xlat5.x);
#endif
    u_xlat29 = u_xlat29 * -2.0 + 1.57079637;
    u_xlat29 = u_xlatb41 ? u_xlat29 : float(0.0);
    u_xlat38 = u_xlat38 * u_xlat39 + u_xlat29;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(u_xlat5.y<(-u_xlat5.y));
#else
    u_xlatb39 = u_xlat5.y<(-u_xlat5.y);
#endif
    u_xlat39 = u_xlatb39 ? -3.14159274 : float(0.0);
    u_xlat38 = u_xlat38 + u_xlat39;
    u_xlat39 = min(u_xlat5.y, u_xlat5.x);
    u_xlat29 = max(u_xlat5.y, u_xlat5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(u_xlat39<(-u_xlat39));
#else
    u_xlatb39 = u_xlat39<(-u_xlat39);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(u_xlat29>=(-u_xlat29));
#else
    u_xlatb29 = u_xlat29>=(-u_xlat29);
#endif
    u_xlatb39 = u_xlatb39 && u_xlatb29;
    u_xlat38 = (u_xlatb39) ? (-u_xlat38) : u_xlat38;
    u_xlat38 = u_xlat38 * 0.159154937;
    u_xlat38 = fract(u_xlat38);
    u_xlat39 = dot(u_xlat5.xy, u_xlat5.xy);
    u_xlat39 = sqrt(u_xlat39);
    u_xlat5.x = _RadialSpeed.x * _Time.y + u_xlat38;
    u_xlat5.y = _RadialSpeed.y * _Time.y + u_xlat39;
    u_xlat6.x = _RadialDistortionSpeed.x * _Time.y + u_xlat38;
    u_xlat6.y = _RadialDistortionSpeed.y * _Time.y + u_xlat39;
    u_xlat16_38 = texture(_GradientTexture, u_xlat4.xy).z;
    u_xlat38 = log2(u_xlat16_38);
    u_xlat39 = u_xlat38 * _GradientPower;
    u_xlat39 = exp2(u_xlat39);
    u_xlat16_4.xy = texture(_Sampler6060, u_xlat28.xy).xy;
    u_xlat4.xy = vec2(_RadialTiling.x, _RadialTiling.y) * u_xlat5.xy + u_xlat16_4.xy;
    u_xlat16_28.xy = texture(_Sampler6062, u_xlat28.xy).xy;
    u_xlat28.xy = vec2(_RadialDistortionTiling.x, _RadialDistortionTiling.y) * u_xlat6.xy + u_xlat16_28.xy;
    u_xlat16_28.xy = texture(_T_Direction_RG_Clouds, u_xlat28.xy).xy;
    u_xlat4.xy = u_xlat16_28.xy * vec2(vec2(_distortionamount, _distortionamount)) + u_xlat4.xy;
    u_xlat16_4.xyz = texture(_FX_T_RenderClouds, u_xlat4.xy).xyz;
    u_xlat4.xyz = vec3(u_xlat39) * u_xlat16_4.xyz;
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Power, _Power, _Power));
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat38 = u_xlat38 * _CoreGradientPower;
    u_xlat38 = exp2(u_xlat38);
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Multiply) + vec3(u_xlat38);
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat5.xyz;
    u_xlat6.xyz = (-u_xlat4.xyz) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz + (-u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = log2(u_xlat4.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_EdgeWidth, _EdgeWidth, _EdgeWidth));
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat17.xyz = log2(u_xlat5.xyz);
    u_xlat17.xyz = u_xlat17.xyz * vec3(vec3(_EdgeWidth, _EdgeWidth, _EdgeWidth));
    u_xlat17.xyz = exp2(u_xlat17.xyz);
    u_xlat17.xyz = (-u_xlat17.xyz) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat17.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat37 = vs_TEXCOORD0.w * _OverallEmissiveIntensity;
    u_xlat38 = (-u_xlat5.x) + 1.0;
    u_xlat39 = u_xlat38 * vs_COLOR0.w;
    u_xlat38 = (-u_xlat38) * vs_COLOR0.w + u_xlat38;
    u_xlat38 = _LERPHardEdgedNoSoftTransparancy * u_xlat38 + u_xlat39;
    u_xlat16_7.x = dot((-u_xlat1.xyz), vs_TEXCOORD2.xyz);
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_7.x;
    u_xlat16_7.xyz = vs_TEXCOORD2.xyz * (-u_xlat16_7.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb39 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb39){
        u_xlat39 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat4.xyz = vec3(u_xlat39) * u_xlat16_7.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat4.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat4.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat5;
            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat5.x : u_xlat6.x;
            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat5.y : u_xlat6.y;
            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat5.z : u_xlat6.z;
            u_xlat5 = hlslcc_movcTemp;
        }
        u_xlat39 = min(u_xlat5.y, u_xlat5.x);
        u_xlat39 = min(u_xlat5.z, u_xlat39);
        u_xlat5.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat39) + u_xlat5.xyz;
    } else {
        u_xlat4.xyz = u_xlat16_7.xyz;
    }
    u_xlat16_4 = textureLod(unity_SpecCube0, u_xlat4.xyz, 6.0);
    u_xlat16_43 = u_xlat16_4.w + -1.0;
    u_xlat16_43 = unity_SpecCube0_HDR.w * u_xlat16_43 + 1.0;
    u_xlat16_43 = log2(u_xlat16_43);
    u_xlat16_43 = u_xlat16_43 * unity_SpecCube0_HDR.y;
    u_xlat16_43 = exp2(u_xlat16_43);
    u_xlat16_43 = u_xlat16_43 * unity_SpecCube0_HDR.x;
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(u_xlat16_43);
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb39 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb39){
#ifdef UNITY_ADRENO_ES3
        u_xlatb39 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb39 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb39){
            u_xlat39 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
            u_xlat39 = inversesqrt(u_xlat39);
            u_xlat5.xyz = vec3(u_xlat39) * u_xlat16_7.xyz;
            u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
            u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat5.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat6;
                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat6.x : u_xlat8.x;
                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat6.y : u_xlat8.y;
                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat6.z : u_xlat8.z;
                u_xlat6 = hlslcc_movcTemp;
            }
            u_xlat39 = min(u_xlat6.y, u_xlat6.x);
            u_xlat39 = min(u_xlat6.z, u_xlat39);
            u_xlat6.xyz = vs_TEXCOORD3.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat39) + u_xlat6.xyz;
        } else {
            u_xlat5.xyz = u_xlat16_7.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, 6.0);
        u_xlat16_7.x = u_xlat16_5.w + -1.0;
        u_xlat16_7.x = unity_SpecCube1_HDR.w * u_xlat16_7.x + 1.0;
        u_xlat16_7.x = log2(u_xlat16_7.x);
        u_xlat16_7.x = u_xlat16_7.x * unity_SpecCube1_HDR.y;
        u_xlat16_7.x = exp2(u_xlat16_7.x);
        u_xlat16_7.x = u_xlat16_7.x * unity_SpecCube1_HDR.x;
        u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xxx;
        u_xlat4.xyz = vec3(u_xlat16_43) * u_xlat16_4.xyz + (-u_xlat16_7.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat4.xyz + u_xlat16_7.xyz;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat39 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat4.xyz = vec3(u_xlat39) * vs_TEXCOORD2.xyz;
    u_xlat16_7.xyz = u_xlat3.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 0.00100000005);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
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
    u_xlat16_43 = u_xlat0.x + u_xlat0.x;
    u_xlat16_43 = u_xlat16_43 * u_xlat0.x + -0.5;
    u_xlat16_45 = (-u_xlat1.x) + 1.0;
    u_xlat16_11 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_43 * u_xlat16_45 + 1.0;
    u_xlat16_11 = -abs(u_xlat36) + 1.0;
    u_xlat16_23.x = u_xlat16_11 * u_xlat16_11;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_23.x;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_11 + 1.0;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_45;
    u_xlat12.x = u_xlat1.x * u_xlat16_43;
    u_xlat24 = abs(u_xlat36) + u_xlat1.x;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat24 = u_xlat1.x * u_xlat24;
    u_xlat24 = u_xlat24 * 0.999999881;
    u_xlat16_23.xyz = u_xlat12.xxx * _LightColor0.xyz;
    u_xlat12.xyz = vec3(u_xlat24) * _LightColor0.xyz;
    u_xlat16_43 = (-u_xlat0.x) + 1.0;
    u_xlat16_45 = u_xlat16_43 * u_xlat16_43;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_43 = u_xlat16_43 * u_xlat16_45;
    u_xlat16_43 = u_xlat16_43 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat16_43);
    u_xlat0.xyz = u_xlat16_7.xyz * u_xlat16_23.xyz + u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_43 = u_xlat16_11 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(u_xlat16_43) + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat37) * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat38;
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