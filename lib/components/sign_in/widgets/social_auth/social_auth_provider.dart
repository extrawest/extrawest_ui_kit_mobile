enum SocialAuthProvider {
  google,
  appleId,
  facebook,
  x,
}

class SocialAuthProviderElement {
  final SocialAuthProvider socialAuthProvider;
  final void Function() onTap;

  const SocialAuthProviderElement({required this.socialAuthProvider, required this.onTap});
}
