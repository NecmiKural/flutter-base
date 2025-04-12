part of 'app_constants.dart';

const bool allowInsecureConnections = true;
const String redirectUrl = '$packageName:/oauthredirect';
const String postLogoutRedirectUrl = '$packageName:/';
const List<String> scopes = <String>[
  "openid",
  "roles",
  "address",
  "profile",
  "acr",
  "offline_access",
  "phone",
  "microprofile-jwt",
  "email",
  "web-origins",
];

const String keycloakUrl = "https://auth.example.com/realms/example";
const String clientId = "my-resource-server";
const String issuer = '$keycloakUrl/protocol/openid-connect';
const String discoveryUrl = '$keycloakUrl/.well-known/openid-configuration';
const String authEndpoint = "$keycloakUrl/protocol/openid-connect/auth";
const String tokenEndpoint = "$keycloakUrl/protocol/openid-connect/token";
const String endSessionEndpoint = "$keycloakUrl/protocol/openid-connect/logout";
const String userInfoUrl = "$keycloakUrl/protocol/openid-connect/userinfo";
