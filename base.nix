# Packages and configuration settings that are shared among all environments.

{ pkgs ? import <nixpkgs> {} }:
{
	buildInputs =
	[
		pkgs.shellcheck
		pkgs.cloc
		pkgs.strace
	];

	shellHooks = ''
		PS1="┏ (nix-shell: $NIX_ENV_NAME) [\w]\n┗ $ "
		alias ls='ls --color'
	'';
}
