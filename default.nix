{ mkDerivation, axiom, base, hpack, stdenv, transient
, transient-universe
}:
mkDerivation {
  pname = "eswf-buzz";
  version = "0.0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  libraryToolDepends = [ hpack ];
  executableHaskellDepends = [
    axiom base transient transient-universe
  ];
  jailbreak = true;
  prePatch = "hpack";
  license = stdenv.lib.licenses.bsd3;
}
