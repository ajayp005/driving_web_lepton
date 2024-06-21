import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_project_driving/constant/const.dart';

void handleFirebaseError(FirebaseAuthException error) {
  switch (error.code) {
    case 'invalid-email':
      showToast(msg: 'Invalid email format.');
      break;
    case 'user-disabled':
      showToast(msg: 'This user has been disabled.');
      break;
    case 'user-not-found':
      showToast(msg: 'No user found with this email.');
      break;
    case 'wrong-password':
      showToast(msg: 'Incorrect password.');
      break;
    case 'email-already-in-use':
      showToast(msg: 'This email is already in use.');
      break;
    case 'operation-not-allowed':
      showToast(msg: 'This operation is not allowed.');
      break;
    case 'weak-password':
      showToast(msg: 'The password is too weak.');
      break;
    case 'invalid-credential':
      showToast(msg: 'Invalid credential.');
      break; 
    case 'credential-already-in-use':
      showToast(msg: 'This credential is already in use.');
      break;
    case 'provider-already-linked':
      showToast(msg: 'This provider is already linked to an account.');
      break;   
    case 'timeout':
      showToast(msg: 'Operation timed out.');
      break;
    case 'network-request-failed':
      showToast(msg: 'Network request failed.');
      break;
    case 'too-many-requests':
      showToast(msg: 'Too many requests. Please try again later.');
      break;
    case 'unauthorized-domain':
      showToast(msg: 'Unauthorized domain.');
      break;
    case 'user-token-expired':
      showToast(msg: 'User token expired.');
      break;
    case 'user-mismatch':
      showToast(msg: 'User mismatch.');
      break; 
    case 'invalid-api-key':
      showToast(msg: 'Invalid API key.');
      break;
    case 'invalid-user-token':
      showToast(msg: 'Invalid user token.');
      break;
    case 'user-not-verified':
      showToast(msg: 'User not verified.');
      break;
    case 'web-storage-unsupported':
      showToast(msg: 'Web storage is unsupported.');
      break;
    case 'auth-domain-config-required':
      showToast(msg: 'Auth domain configuration is required.');
      break;
    case 'cancelled-popup-request':
      showToast(msg: 'Popup request cancelled.');
      break;
    case 'popup-blocked':
      showToast(msg: 'Popup blocked.');
      break;
    case 'popup-closed-by-user':
      showToast(msg: 'Popup closed by user.');
      break;
    case 'redirect-cancelled-by-user':
      showToast(msg: 'Redirect cancelled by user.');
      break;
    case 'redirect-operation-pending':
      showToast(msg: 'Redirect operation pending.');
      break;
    case 'web-context-cancelled':
      showToast(msg: 'Web context cancelled.');
      break;
    case 'web-operation-not-supported-in-this-environment':
      showToast(msg: 'Web operation not supported in this environment.');
      break;

    default:
      showToast(msg: 'Something went wrong. Please try again.');
      break;
  }
}

const circularProgressIndicatotWidget = Center(
  child: CircularProgressIndicator(),
);
