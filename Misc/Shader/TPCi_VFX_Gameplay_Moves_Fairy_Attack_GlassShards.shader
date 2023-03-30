//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/VFX/Gameplay/Moves/Fairy_Attack_GlassShards" {
Properties {
_T_VFX_Fairy_Cubemap ("T_VFX_Fairy_Cubemap", Cube) = "white" { }
_vertexcoloramount ("vertex color amount", Float) = 0.25
_cubemapamount ("cubemap amount", Float) = 0.5
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 GrabPass {
}
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  Cull Off
  GpuProgramID 45716
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat2.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat2.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat2.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	float _cubemapamount;
uniform 	float _vertexcoloramount;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump samplerCube _T_VFX_Fairy_Cubemap;
in mediump vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD0.xyz;
    u_xlat16_0.xyz = texture(_T_VFX_Fairy_Cubemap, u_xlat0.xyz).xyz;
    u_xlat1.xyz = vs_COLOR0.xyz * vec3(vec3(_vertexcoloramount, _vertexcoloramount, _vertexcoloramount));
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_cubemapamount) + u_xlat1.xyz;
    u_xlat1 = vs_TEXCOORD3.wxyw + vec4(9.99999996e-12, 0.0, 0.0, 9.99999996e-12);
    u_xlat1.xyz = u_xlat1.yzw / u_xlat1.xxx;
    u_xlat1.xyz = u_xlat1.xyz + vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat16_1.xyz = texture(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat2.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat2.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat2.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat1.zw;
    vs_TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	float _cubemapamount;
uniform 	float _vertexcoloramount;
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump samplerCube _T_VFX_Fairy_Cubemap;
in mediump vec3 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD0.xyz;
    u_xlat16_0.xyz = texture(_T_VFX_Fairy_Cubemap, u_xlat0.xyz).xyz;
    u_xlat1.xyz = vs_COLOR0.xyz * vec3(vec3(_vertexcoloramount, _vertexcoloramount, _vertexcoloramount));
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_cubemapamount) + u_xlat1.xyz;
    u_xlat1 = vs_TEXCOORD3.wxyw + vec4(9.99999996e-12, 0.0, 0.0, 9.99999996e-12);
    u_xlat1.xyz = u_xlat1.yzw / u_xlat1.xxx;
    u_xlat1.xyz = u_xlat1.xyz + vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat16_1.xyz = texture(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
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
}
CustomEditor "ASEMaterialInspector"
}