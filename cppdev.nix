# An environment intended for C and C++ development

with import <nixpkgs> {};

let
	inputs =
	[
		binutils gcc13 gdb
		llvm_17 lld_17 clang_17
		cppcheck
	];

	hooks = ''
		export NIX_ENV_NAME=cppdev
		unset CC
		unset AS
		unset LD
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
