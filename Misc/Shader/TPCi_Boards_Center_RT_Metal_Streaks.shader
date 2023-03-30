//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/Center_RT_Metal_Streaks" {
Properties {
_CenterGradientMin ("Center Gradient Min", Float) = -0.25
_CenterGradientMax ("Center Gradient Max", Float) = 1.25
_CenterGradientRotationAngle ("Center Gradient Rotation Angle", Float) = -45
_CenterGradientColor1 ("Center Gradient Color 1", Color) = (0.08201315,0.6198304,0.9150943,0)
_CenterGradientColor2 ("Center Gradient Color 2", Color) = (0.06759523,0.06775679,0.4622642,0)
_CenterGradientEmissionAmount ("Center Gradient Emission Amount", Float) = 1
_CenterGradientColor1Emission ("Center Gradient Color 1 Emission", Float) = 1
_CenterGradientColor2Emission ("Center Gradient Color 2 Emission", Float) = 0.5
_Streaks ("Streaks", 2D) = "white" { }
_StreaksBrightnessLerp1 ("Streaks Brightness Lerp 1", Float) = 0.81
_StreaksBrightnessLerp2 ("Streaks Brightness Lerp 2", Float) = 0.1
_StreaksBrightnessOverall ("Streaks Brightness Overall", Float) = 0.25
_CenterGradientPower ("Center Gradient Power", Float) = 3
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 59207
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
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
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
uniform 	float _StreaksBrightnessLerp2;
uniform 	float _StreaksBrightnessLerp1;
uniform 	float _CenterGradientMin;
uniform 	float _CenterGradientMax;
uniform 	float _CenterGradientRotationAngle;
uniform 	float _CenterGradientPower;
uniform 	float _StreaksBrightnessOverall;
uniform 	vec4 _CenterGradientColor2;
uniform 	vec4 _CenterGradientColor1;
uniform 	float _CenterGradientColor2Emission;
uniform 	float _CenterGradientColor1Emission;
uniform 	float _CenterGradientEmissionAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Streaks;
UNITY_LOCATION(1) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bvec3 u_xlatb10;
mediump float u_xlat16_11;
vec3 u_xlat12;
vec2 u_xlat14;
mediump float u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_23;
float u_xlat24;
vec2 u_xlat26;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_37;
bool u_xlatb37;
float u_xlat39;
mediump float u_xlat16_41;
mediump float u_xlat16_45;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat2.x = dot(vs_TEXCOORD0.xy, vec2(0.814621985, -0.579992294));
    u_xlat2.y = dot(vs_TEXCOORD0.xy, vec2(0.579992294, 0.814621985));
    u_xlat2.xy = _Time.yy * vec2(0.0, 0.5) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_37 = texture(_Streaks, u_xlat2.xy).x;
    u_xlat37 = u_xlat16_37 * 1.66666663;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat3 = vs_TEXCOORD0.xyxy + vec4(0.800000012, -0.340000004, -0.5, -0.5);
    u_xlat4.x = dot(u_xlat3.xy, vec2(0.814621985, -0.579992294));
    u_xlat4.y = dot(u_xlat3.xy, vec2(0.579992294, 0.814621985));
    u_xlat14.xy = _Time.yy * vec2(0.0, 1.5) + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy + vec2(0.5, 0.5);
    u_xlat16_14 = texture(_Streaks, u_xlat14.xy).x;
    u_xlat14.x = u_xlat16_14 + -0.150000006;
    u_xlat14.x = u_xlat14.x * 1.53846157;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat26.x = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat26.x;
    u_xlat26.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(0.349999994, 0.349999994);
    u_xlat3.x = dot(u_xlat26.xy, vec2(0.814621985, -0.579992294));
    u_xlat3.y = dot(u_xlat26.xy, vec2(0.579992294, 0.814621985));
    u_xlat26.xy = _Time.yy * vec2(0.0, 2.0) + u_xlat3.xy;
    u_xlat26.xy = u_xlat26.xy + vec2(0.5, 0.5);
    u_xlat3.x = _CenterGradientRotationAngle * 0.0174532924;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat3.zw, u_xlat4.xy);
    u_xlat3.x = u_xlat3.x + 0.5;
    u_xlat15.xy = (-vec2(_CenterGradientMin, _StreaksBrightnessLerp2)) + vec2(_CenterGradientMax, _StreaksBrightnessLerp1);
    u_xlat3.x = u_xlat3.x + (-_CenterGradientMin);
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat3.x = u_xlat15.x * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat39 = u_xlat3.x * u_xlat15.x;
    u_xlat3.x = (-u_xlat15.x) * u_xlat3.x + 1.0;
    u_xlat15.x = u_xlat3.x * u_xlat39;
    u_xlat15.x = u_xlat15.x * 4.0;
    u_xlat15.x = log2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _CenterGradientPower;
    u_xlat15.x = exp2(u_xlat15.x);
    u_xlat3.x = u_xlat39 * u_xlat3.x + u_xlat15.x;
    u_xlat15.x = u_xlat3.x * u_xlat15.y + _StreaksBrightnessLerp2;
    u_xlat37 = u_xlat2.x * u_xlat37 + u_xlat14.x;
    u_xlat16_2.xyz = texture(_Streaks, u_xlat26.xy).xyz;
    u_xlat2.xyz = vec3(u_xlat37) + u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat15.xxx * u_xlat2.xyz;
    u_xlat15.xyz = (-_CenterGradientColor2.xyz) + _CenterGradientColor1.xyz;
    u_xlat15.xyz = u_xlat3.xxx * u_xlat15.xyz + _CenterGradientColor2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(vec3(_StreaksBrightnessOverall, _StreaksBrightnessOverall, _StreaksBrightnessOverall)) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat4.xyz = u_xlat15.xyz / u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat37 = (-_CenterGradientColor2Emission) + _CenterGradientColor1Emission;
    u_xlat37 = u_xlat3.x * u_xlat37 + _CenterGradientColor2Emission;
    u_xlat3.xyz = vec3(u_xlat37) * u_xlat15.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_CenterGradientEmissionAmount, _CenterGradientEmissionAmount, _CenterGradientEmissionAmount));
    u_xlat2.xyz = u_xlat3.xyz / u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_5.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_5.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb37 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb37){
        u_xlat37 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
        u_xlat37 = inversesqrt(u_xlat37);
        u_xlat3.xyz = vec3(u_xlat37) * u_xlat16_5.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat3.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat3.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat6;
            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
            u_xlat6 = hlslcc_movcTemp;
        }
        u_xlat37 = min(u_xlat6.y, u_xlat6.x);
        u_xlat37 = min(u_xlat6.z, u_xlat37);
        u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat37) + u_xlat6.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_5.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 6.0);
    u_xlat16_41 = u_xlat16_3.w + -1.0;
    u_xlat16_41 = unity_SpecCube0_HDR.w * u_xlat16_41 + 1.0;
    u_xlat16_41 = log2(u_xlat16_41);
    u_xlat16_41 = u_xlat16_41 * unity_SpecCube0_HDR.y;
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_41 = u_xlat16_41 * unity_SpecCube0_HDR.x;
    u_xlat16_9.xyz = u_xlat16_3.xyz * vec3(u_xlat16_41);
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb37 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb37){
#ifdef UNITY_ADRENO_ES3
        u_xlatb37 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb37 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb37){
            u_xlat37 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
            u_xlat37 = inversesqrt(u_xlat37);
            u_xlat6.xyz = vec3(u_xlat37) * u_xlat16_5.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
            u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat7;
                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat7.x : u_xlat8.x;
                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat7.y : u_xlat8.y;
                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat7.z : u_xlat8.z;
                u_xlat7 = hlslcc_movcTemp;
            }
            u_xlat37 = min(u_xlat7.y, u_xlat7.x);
            u_xlat37 = min(u_xlat7.z, u_xlat37);
            u_xlat7.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat37) + u_xlat7.xyz;
        } else {
            u_xlat6.xyz = u_xlat16_5.xyz;
        }
        u_xlat16_6 = textureLod(unity_SpecCube1, u_xlat6.xyz, 6.0);
        u_xlat16_5.x = u_xlat16_6.w + -1.0;
        u_xlat16_5.x = unity_SpecCube1_HDR.w * u_xlat16_5.x + 1.0;
        u_xlat16_5.x = log2(u_xlat16_5.x);
        u_xlat16_5.x = u_xlat16_5.x * unity_SpecCube1_HDR.y;
        u_xlat16_5.x = exp2(u_xlat16_5.x);
        u_xlat16_5.x = u_xlat16_5.x * unity_SpecCube1_HDR.x;
        u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_5.xxx;
        u_xlat3.xyz = vec3(u_xlat16_41) * u_xlat16_3.xyz + (-u_xlat16_5.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_5.xyz;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = vec3(u_xlat37) * vs_TEXCOORD1.xyz;
    u_xlat16_5.xyz = u_xlat4.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 0.00100000005);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat3.xyz, u_xlat1.xyz);
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
    u_xlat16_41 = u_xlat0.x + u_xlat0.x;
    u_xlat16_41 = u_xlat16_41 * u_xlat0.x + -0.5;
    u_xlat16_45 = (-u_xlat1.x) + 1.0;
    u_xlat16_11 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_41 * u_xlat16_45 + 1.0;
    u_xlat16_11 = -abs(u_xlat36) + 1.0;
    u_xlat16_23.x = u_xlat16_11 * u_xlat16_11;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_23.x;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_11 + 1.0;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_45;
    u_xlat12.x = u_xlat1.x * u_xlat16_41;
    u_xlat24 = abs(u_xlat36) + u_xlat1.x;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat24 = u_xlat1.x * u_xlat24;
    u_xlat24 = u_xlat24 * 0.999999881;
    u_xlat16_23.xyz = u_xlat12.xxx * _LightColor0.xyz;
    u_xlat12.xyz = vec3(u_xlat24) * _LightColor0.xyz;
    u_xlat16_41 = (-u_xlat0.x) + 1.0;
    u_xlat16_45 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_45;
    u_xlat16_41 = u_xlat16_41 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat16_41);
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_23.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_41 = u_xlat16_11 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(u_xlat16_41) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
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
uniform 	float _StreaksBrightnessLerp2;
uniform 	float _StreaksBrightnessLerp1;
uniform 	float _CenterGradientMin;
uniform 	float _CenterGradientMax;
uniform 	float _CenterGradientRotationAngle;
uniform 	float _CenterGradientPower;
uniform 	float _StreaksBrightnessOverall;
uniform 	vec4 _CenterGradientColor2;
uniform 	vec4 _CenterGradientColor1;
uniform 	float _CenterGradientColor2Emission;
uniform 	float _CenterGradientColor1Emission;
uniform 	float _CenterGradientEmissionAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Streaks;
UNITY_LOCATION(1) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube1;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec3 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bvec3 u_xlatb10;
mediump float u_xlat16_11;
vec3 u_xlat12;
vec2 u_xlat14;
mediump float u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_23;
float u_xlat24;
vec2 u_xlat26;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_37;
bool u_xlatb37;
float u_xlat39;
mediump float u_xlat16_41;
mediump float u_xlat16_45;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat2.x = dot(vs_TEXCOORD0.xy, vec2(0.814621985, -0.579992294));
    u_xlat2.y = dot(vs_TEXCOORD0.xy, vec2(0.579992294, 0.814621985));
    u_xlat2.xy = _Time.yy * vec2(0.0, 0.5) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_37 = texture(_Streaks, u_xlat2.xy).x;
    u_xlat37 = u_xlat16_37 * 1.66666663;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat3 = vs_TEXCOORD0.xyxy + vec4(0.800000012, -0.340000004, -0.5, -0.5);
    u_xlat4.x = dot(u_xlat3.xy, vec2(0.814621985, -0.579992294));
    u_xlat4.y = dot(u_xlat3.xy, vec2(0.579992294, 0.814621985));
    u_xlat14.xy = _Time.yy * vec2(0.0, 1.5) + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy + vec2(0.5, 0.5);
    u_xlat16_14 = texture(_Streaks, u_xlat14.xy).x;
    u_xlat14.x = u_xlat16_14 + -0.150000006;
    u_xlat14.x = u_xlat14.x * 1.53846157;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat26.x = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat26.x;
    u_xlat26.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(0.349999994, 0.349999994);
    u_xlat3.x = dot(u_xlat26.xy, vec2(0.814621985, -0.579992294));
    u_xlat3.y = dot(u_xlat26.xy, vec2(0.579992294, 0.814621985));
    u_xlat26.xy = _Time.yy * vec2(0.0, 2.0) + u_xlat3.xy;
    u_xlat26.xy = u_xlat26.xy + vec2(0.5, 0.5);
    u_xlat3.x = _CenterGradientRotationAngle * 0.0174532924;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat3.zw, u_xlat4.xy);
    u_xlat3.x = u_xlat3.x + 0.5;
    u_xlat15.xy = (-vec2(_CenterGradientMin, _StreaksBrightnessLerp2)) + vec2(_CenterGradientMax, _StreaksBrightnessLerp1);
    u_xlat3.x = u_xlat3.x + (-_CenterGradientMin);
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat3.x = u_xlat15.x * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat39 = u_xlat3.x * u_xlat15.x;
    u_xlat3.x = (-u_xlat15.x) * u_xlat3.x + 1.0;
    u_xlat15.x = u_xlat3.x * u_xlat39;
    u_xlat15.x = u_xlat15.x * 4.0;
    u_xlat15.x = log2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _CenterGradientPower;
    u_xlat15.x = exp2(u_xlat15.x);
    u_xlat3.x = u_xlat39 * u_xlat3.x + u_xlat15.x;
    u_xlat15.x = u_xlat3.x * u_xlat15.y + _StreaksBrightnessLerp2;
    u_xlat37 = u_xlat2.x * u_xlat37 + u_xlat14.x;
    u_xlat16_2.xyz = texture(_Streaks, u_xlat26.xy).xyz;
    u_xlat2.xyz = vec3(u_xlat37) + u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat15.xxx * u_xlat2.xyz;
    u_xlat15.xyz = (-_CenterGradientColor2.xyz) + _CenterGradientColor1.xyz;
    u_xlat15.xyz = u_xlat3.xxx * u_xlat15.xyz + _CenterGradientColor2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(vec3(_StreaksBrightnessOverall, _StreaksBrightnessOverall, _StreaksBrightnessOverall)) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat4.xyz = u_xlat15.xyz / u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat37 = (-_CenterGradientColor2Emission) + _CenterGradientColor1Emission;
    u_xlat37 = u_xlat3.x * u_xlat37 + _CenterGradientColor2Emission;
    u_xlat3.xyz = vec3(u_xlat37) * u_xlat15.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_CenterGradientEmissionAmount, _CenterGradientEmissionAmount, _CenterGradientEmissionAmount));
    u_xlat2.xyz = u_xlat3.xyz / u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_5.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_5.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb37 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb37){
        u_xlat37 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
        u_xlat37 = inversesqrt(u_xlat37);
        u_xlat3.xyz = vec3(u_xlat37) * u_xlat16_5.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat3.xyz;
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat7.xyz = u_xlat7.xyz / u_xlat3.xyz;
        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat6;
            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
            u_xlat6 = hlslcc_movcTemp;
        }
        u_xlat37 = min(u_xlat6.y, u_xlat6.x);
        u_xlat37 = min(u_xlat6.z, u_xlat37);
        u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat37) + u_xlat6.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_5.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 6.0);
    u_xlat16_41 = u_xlat16_3.w + -1.0;
    u_xlat16_41 = unity_SpecCube0_HDR.w * u_xlat16_41 + 1.0;
    u_xlat16_41 = log2(u_xlat16_41);
    u_xlat16_41 = u_xlat16_41 * unity_SpecCube0_HDR.y;
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_41 = u_xlat16_41 * unity_SpecCube0_HDR.x;
    u_xlat16_9.xyz = u_xlat16_3.xyz * vec3(u_xlat16_41);
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb37 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb37){
#ifdef UNITY_ADRENO_ES3
        u_xlatb37 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb37 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb37){
            u_xlat37 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
            u_xlat37 = inversesqrt(u_xlat37);
            u_xlat6.xyz = vec3(u_xlat37) * u_xlat16_5.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
            u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat7;
                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat7.x : u_xlat8.x;
                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat7.y : u_xlat8.y;
                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat7.z : u_xlat8.z;
                u_xlat7 = hlslcc_movcTemp;
            }
            u_xlat37 = min(u_xlat7.y, u_xlat7.x);
            u_xlat37 = min(u_xlat7.z, u_xlat37);
            u_xlat7.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat37) + u_xlat7.xyz;
        } else {
            u_xlat6.xyz = u_xlat16_5.xyz;
        }
        u_xlat16_6 = textureLod(unity_SpecCube1, u_xlat6.xyz, 6.0);
        u_xlat16_5.x = u_xlat16_6.w + -1.0;
        u_xlat16_5.x = unity_SpecCube1_HDR.w * u_xlat16_5.x + 1.0;
        u_xlat16_5.x = log2(u_xlat16_5.x);
        u_xlat16_5.x = u_xlat16_5.x * unity_SpecCube1_HDR.y;
        u_xlat16_5.x = exp2(u_xlat16_5.x);
        u_xlat16_5.x = u_xlat16_5.x * unity_SpecCube1_HDR.x;
        u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_5.xxx;
        u_xlat3.xyz = vec3(u_xlat16_41) * u_xlat16_3.xyz + (-u_xlat16_5.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_5.xyz;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = vec3(u_xlat37) * vs_TEXCOORD1.xyz;
    u_xlat16_5.xyz = u_xlat4.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 0.00100000005);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat3.xyz, u_xlat1.xyz);
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
    u_xlat16_41 = u_xlat0.x + u_xlat0.x;
    u_xlat16_41 = u_xlat16_41 * u_xlat0.x + -0.5;
    u_xlat16_45 = (-u_xlat1.x) + 1.0;
    u_xlat16_11 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_11;
    u_xlat16_45 = u_xlat16_41 * u_xlat16_45 + 1.0;
    u_xlat16_11 = -abs(u_xlat36) + 1.0;
    u_xlat16_23.x = u_xlat16_11 * u_xlat16_11;
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_23.x;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_11 + 1.0;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_45;
    u_xlat12.x = u_xlat1.x * u_xlat16_41;
    u_xlat24 = abs(u_xlat36) + u_xlat1.x;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat24 = u_xlat1.x * u_xlat24;
    u_xlat24 = u_xlat24 * 0.999999881;
    u_xlat16_23.xyz = u_xlat12.xxx * _LightColor0.xyz;
    u_xlat12.xyz = vec3(u_xlat24) * _LightColor0.xyz;
    u_xlat16_41 = (-u_xlat0.x) + 1.0;
    u_xlat16_45 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_45;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_45;
    u_xlat16_41 = u_xlat16_41 * 0.959999979 + 0.0399999991;
    u_xlat0.xyz = u_xlat12.xyz * vec3(u_xlat16_41);
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat16_23.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_41 = u_xlat16_11 * 2.23517418e-08 + 0.0399999991;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(u_xlat16_41) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
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
  GpuProgramID 120683
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
uniform 	float _StreaksBrightnessLerp2;
uniform 	float _StreaksBrightnessLerp1;
uniform 	float _CenterGradientMin;
uniform 	float _CenterGradientMax;
uniform 	float _CenterGradientRotationAngle;
uniform 	float _CenterGradientPower;
uniform 	float _StreaksBrightnessOverall;
uniform 	vec4 _CenterGradientColor2;
uniform 	vec4 _CenterGradientColor1;
uniform 	float _CenterGradientColor2Emission;
uniform 	float _CenterGradientColor1Emission;
uniform 	float _CenterGradientEmissionAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Streaks;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy + vec4(0.800000012, -0.340000004, -0.5, -0.5);
    u_xlat1.x = dot(u_xlat0.xy, vec2(0.814621985, -0.579992294));
    u_xlat1.y = dot(u_xlat0.xy, vec2(0.579992294, 0.814621985));
    u_xlat0.xy = _Time.yy * vec2(0.0, 1.5) + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_Streaks, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 + -0.150000006;
    u_xlat0.x = u_xlat0.x * 1.53846157;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat1.x = dot(vs_TEXCOORD0.xy, vec2(0.814621985, -0.579992294));
    u_xlat1.y = dot(vs_TEXCOORD0.xy, vec2(0.579992294, 0.814621985));
    u_xlat1.xy = _Time.yy * vec2(0.0, 0.5) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_3 = texture(_Streaks, u_xlat1.xy).x;
    u_xlat3.x = u_xlat16_3 * 1.66666663;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat0.x = u_xlat1.x * u_xlat3.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(0.349999994, 0.349999994);
    u_xlat2.x = dot(u_xlat1.xy, vec2(0.814621985, -0.579992294));
    u_xlat2.y = dot(u_xlat1.xy, vec2(0.579992294, 0.814621985));
    u_xlat1.xy = _Time.yy * vec2(0.0, 2.0) + u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_Streaks, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat0.xxx + u_xlat16_1.xyz;
    u_xlat0.x = _CenterGradientRotationAngle * 0.0174532924;
    u_xlat2.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.y = u_xlat0.x;
    u_xlat0.x = dot(u_xlat0.zw, u_xlat2.xy);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = u_xlat0.x + (-_CenterGradientMin);
    u_xlat3.xy = (-vec2(_CenterGradientMin, _StreaksBrightnessLerp2)) + vec2(_CenterGradientMax, _StreaksBrightnessLerp1);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat9 = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = (-u_xlat3.x) * u_xlat0.x + 1.0;
    u_xlat3.x = u_xlat0.x * u_xlat9;
    u_xlat3.x = u_xlat3.x * 4.0;
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * _CenterGradientPower;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat0.x = u_xlat9 * u_xlat0.x + u_xlat3.x;
    u_xlat3.x = u_xlat0.x * u_xlat3.y + _StreaksBrightnessLerp2;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat1.xyz;
    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(vec3(_StreaksBrightnessOverall, _StreaksBrightnessOverall, _StreaksBrightnessOverall)) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat1.xyz = (-_CenterGradientColor2.xyz) + _CenterGradientColor1.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz + _CenterGradientColor2.xyz;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = 1.0;
    SV_Target2 = u_xlat2;
    u_xlat10 = (-_CenterGradientColor2Emission) + _CenterGradientColor1Emission;
    u_xlat0.x = u_xlat0.x * u_xlat10 + _CenterGradientColor2Emission;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_CenterGradientEmissionAmount, _CenterGradientEmissionAmount, _CenterGradientEmissionAmount));
    u_xlat0.xyz = u_xlat1.xyz / u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
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
uniform 	float _StreaksBrightnessLerp2;
uniform 	float _StreaksBrightnessLerp1;
uniform 	float _CenterGradientMin;
uniform 	float _CenterGradientMax;
uniform 	float _CenterGradientRotationAngle;
uniform 	float _CenterGradientPower;
uniform 	float _StreaksBrightnessOverall;
uniform 	vec4 _CenterGradientColor2;
uniform 	vec4 _CenterGradientColor1;
uniform 	float _CenterGradientColor2Emission;
uniform 	float _CenterGradientColor1Emission;
uniform 	float _CenterGradientEmissionAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Streaks;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy + vec4(0.800000012, -0.340000004, -0.5, -0.5);
    u_xlat1.x = dot(u_xlat0.xy, vec2(0.814621985, -0.579992294));
    u_xlat1.y = dot(u_xlat0.xy, vec2(0.579992294, 0.814621985));
    u_xlat0.xy = _Time.yy * vec2(0.0, 1.5) + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_Streaks, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 + -0.150000006;
    u_xlat0.x = u_xlat0.x * 1.53846157;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat1.x = dot(vs_TEXCOORD0.xy, vec2(0.814621985, -0.579992294));
    u_xlat1.y = dot(vs_TEXCOORD0.xy, vec2(0.579992294, 0.814621985));
    u_xlat1.xy = _Time.yy * vec2(0.0, 0.5) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_3 = texture(_Streaks, u_xlat1.xy).x;
    u_xlat3.x = u_xlat16_3 * 1.66666663;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat0.x = u_xlat1.x * u_xlat3.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(0.349999994, 0.349999994);
    u_xlat2.x = dot(u_xlat1.xy, vec2(0.814621985, -0.579992294));
    u_xlat2.y = dot(u_xlat1.xy, vec2(0.579992294, 0.814621985));
    u_xlat1.xy = _Time.yy * vec2(0.0, 2.0) + u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_Streaks, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat0.xxx + u_xlat16_1.xyz;
    u_xlat0.x = _CenterGradientRotationAngle * 0.0174532924;
    u_xlat2.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.y = u_xlat0.x;
    u_xlat0.x = dot(u_xlat0.zw, u_xlat2.xy);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = u_xlat0.x + (-_CenterGradientMin);
    u_xlat3.xy = (-vec2(_CenterGradientMin, _StreaksBrightnessLerp2)) + vec2(_CenterGradientMax, _StreaksBrightnessLerp1);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat9 = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = (-u_xlat3.x) * u_xlat0.x + 1.0;
    u_xlat3.x = u_xlat0.x * u_xlat9;
    u_xlat3.x = u_xlat3.x * 4.0;
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * _CenterGradientPower;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat0.x = u_xlat9 * u_xlat0.x + u_xlat3.x;
    u_xlat3.x = u_xlat0.x * u_xlat3.y + _StreaksBrightnessLerp2;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat1.xyz;
    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(vec3(_StreaksBrightnessOverall, _StreaksBrightnessOverall, _StreaksBrightnessOverall)) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat1.xyz = (-_CenterGradientColor2.xyz) + _CenterGradientColor1.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz + _CenterGradientColor2.xyz;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = 1.0;
    SV_Target2 = u_xlat2;
    u_xlat10 = (-_CenterGradientColor2Emission) + _CenterGradientColor1Emission;
    u_xlat0.x = u_xlat0.x * u_xlat10 + _CenterGradientColor2Emission;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_CenterGradientEmissionAmount, _CenterGradientEmissionAmount, _CenterGradientEmissionAmount));
    u_xlat0.xyz = u_xlat1.xyz / u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
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
uniform 	float _StreaksBrightnessLerp2;
uniform 	float _StreaksBrightnessLerp1;
uniform 	float _CenterGradientMin;
uniform 	float _CenterGradientMax;
uniform 	float _CenterGradientRotationAngle;
uniform 	float _CenterGradientPower;
uniform 	float _StreaksBrightnessOverall;
uniform 	vec4 _CenterGradientColor2;
uniform 	vec4 _CenterGradientColor1;
uniform 	float _CenterGradientColor2Emission;
uniform 	float _CenterGradientColor1Emission;
uniform 	float _CenterGradientEmissionAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Streaks;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy + vec4(0.800000012, -0.340000004, -0.5, -0.5);
    u_xlat1.x = dot(u_xlat0.xy, vec2(0.814621985, -0.579992294));
    u_xlat1.y = dot(u_xlat0.xy, vec2(0.579992294, 0.814621985));
    u_xlat0.xy = _Time.yy * vec2(0.0, 1.5) + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_Streaks, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 + -0.150000006;
    u_xlat0.x = u_xlat0.x * 1.53846157;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat1.x = dot(vs_TEXCOORD0.xy, vec2(0.814621985, -0.579992294));
    u_xlat1.y = dot(vs_TEXCOORD0.xy, vec2(0.579992294, 0.814621985));
    u_xlat1.xy = _Time.yy * vec2(0.0, 0.5) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_3 = texture(_Streaks, u_xlat1.xy).x;
    u_xlat3.x = u_xlat16_3 * 1.66666663;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat0.x = u_xlat1.x * u_xlat3.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(0.349999994, 0.349999994);
    u_xlat2.x = dot(u_xlat1.xy, vec2(0.814621985, -0.579992294));
    u_xlat2.y = dot(u_xlat1.xy, vec2(0.579992294, 0.814621985));
    u_xlat1.xy = _Time.yy * vec2(0.0, 2.0) + u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_Streaks, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat0.xxx + u_xlat16_1.xyz;
    u_xlat0.x = _CenterGradientRotationAngle * 0.0174532924;
    u_xlat2.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.y = u_xlat0.x;
    u_xlat0.x = dot(u_xlat0.zw, u_xlat2.xy);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = u_xlat0.x + (-_CenterGradientMin);
    u_xlat3.xy = (-vec2(_CenterGradientMin, _StreaksBrightnessLerp2)) + vec2(_CenterGradientMax, _StreaksBrightnessLerp1);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat9 = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = (-u_xlat3.x) * u_xlat0.x + 1.0;
    u_xlat3.x = u_xlat0.x * u_xlat9;
    u_xlat3.x = u_xlat3.x * 4.0;
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * _CenterGradientPower;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat0.x = u_xlat9 * u_xlat0.x + u_xlat3.x;
    u_xlat3.x = u_xlat0.x * u_xlat3.y + _StreaksBrightnessLerp2;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat1.xyz;
    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(vec3(_StreaksBrightnessOverall, _StreaksBrightnessOverall, _StreaksBrightnessOverall)) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat1.xyz = (-_CenterGradientColor2.xyz) + _CenterGradientColor1.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz + _CenterGradientColor2.xyz;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = 1.0;
    SV_Target2 = u_xlat2;
    u_xlat10 = (-_CenterGradientColor2Emission) + _CenterGradientColor1Emission;
    u_xlat0.x = u_xlat0.x * u_xlat10 + _CenterGradientColor2Emission;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_CenterGradientEmissionAmount, _CenterGradientEmissionAmount, _CenterGradientEmissionAmount));
    u_xlat0.xyz = u_xlat1.xyz / u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
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
uniform 	float _StreaksBrightnessLerp2;
uniform 	float _StreaksBrightnessLerp1;
uniform 	float _CenterGradientMin;
uniform 	float _CenterGradientMax;
uniform 	float _CenterGradientRotationAngle;
uniform 	float _CenterGradientPower;
uniform 	float _StreaksBrightnessOverall;
uniform 	vec4 _CenterGradientColor2;
uniform 	vec4 _CenterGradientColor1;
uniform 	float _CenterGradientColor2Emission;
uniform 	float _CenterGradientColor1Emission;
uniform 	float _CenterGradientEmissionAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Streaks;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0 = vs_TEXCOORD0.xyxy + vec4(0.800000012, -0.340000004, -0.5, -0.5);
    u_xlat1.x = dot(u_xlat0.xy, vec2(0.814621985, -0.579992294));
    u_xlat1.y = dot(u_xlat0.xy, vec2(0.579992294, 0.814621985));
    u_xlat0.xy = _Time.yy * vec2(0.0, 1.5) + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_Streaks, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 + -0.150000006;
    u_xlat0.x = u_xlat0.x * 1.53846157;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat1.x = dot(vs_TEXCOORD0.xy, vec2(0.814621985, -0.579992294));
    u_xlat1.y = dot(vs_TEXCOORD0.xy, vec2(0.579992294, 0.814621985));
    u_xlat1.xy = _Time.yy * vec2(0.0, 0.5) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_3 = texture(_Streaks, u_xlat1.xy).x;
    u_xlat3.x = u_xlat16_3 * 1.66666663;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat0.x = u_xlat1.x * u_xlat3.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(0.349999994, 0.349999994);
    u_xlat2.x = dot(u_xlat1.xy, vec2(0.814621985, -0.579992294));
    u_xlat2.y = dot(u_xlat1.xy, vec2(0.579992294, 0.814621985));
    u_xlat1.xy = _Time.yy * vec2(0.0, 2.0) + u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_Streaks, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat0.xxx + u_xlat16_1.xyz;
    u_xlat0.x = _CenterGradientRotationAngle * 0.0174532924;
    u_xlat2.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.y = u_xlat0.x;
    u_xlat0.x = dot(u_xlat0.zw, u_xlat2.xy);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = u_xlat0.x + (-_CenterGradientMin);
    u_xlat3.xy = (-vec2(_CenterGradientMin, _StreaksBrightnessLerp2)) + vec2(_CenterGradientMax, _StreaksBrightnessLerp1);
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat9 = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = (-u_xlat3.x) * u_xlat0.x + 1.0;
    u_xlat3.x = u_xlat0.x * u_xlat9;
    u_xlat3.x = u_xlat3.x * 4.0;
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * _CenterGradientPower;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat0.x = u_xlat9 * u_xlat0.x + u_xlat3.x;
    u_xlat3.x = u_xlat0.x * u_xlat3.y + _StreaksBrightnessLerp2;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat1.xyz;
    u_xlat3.xyz = (-u_xlat3.xyz) * vec3(vec3(_StreaksBrightnessOverall, _StreaksBrightnessOverall, _StreaksBrightnessOverall)) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat1.xyz = (-_CenterGradientColor2.xyz) + _CenterGradientColor1.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz + _CenterGradientColor2.xyz;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat2.xyz * vec3(0.959999979, 0.959999979, 0.959999979);
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = 1.0;
    SV_Target2 = u_xlat2;
    u_xlat10 = (-_CenterGradientColor2Emission) + _CenterGradientColor1Emission;
    u_xlat0.x = u_xlat0.x * u_xlat10 + _CenterGradientColor2Emission;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_CenterGradientEmissionAmount, _CenterGradientEmissionAmount, _CenterGradientEmissionAmount));
    u_xlat0.xyz = u_xlat1.xyz / u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target3.xyz = u_xlat0.xyz;
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