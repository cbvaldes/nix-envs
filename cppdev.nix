# An environment intended for C and C++ development

with import <nixpkgs> {};

let
	inputs =
	[
		binutils gcc13 gdb
		llvm_16 lld_16 clang_16
		cppcheck
	];

	hooks = ''
		export NIX_ENV_NAME=cppdev
		export CC=gcc
		export AS=as
		export LD=ld
	'';

	localPath = ./base.nix;

	buildInputs = inputs ++
		lib.optional (builtins.pathExists localPath) (import localPath {}).buildInputs;

	shellHooks = hooks +
		lib.optionalString (builtins.pathExists localPath) (import localPath {}).shellHooks;

in mkShell
{
	buildInputs = buildInputs;
	shellHooks = shellHooks;
}
